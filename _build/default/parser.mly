%{
  open Ast

%}

/* Déclaration des tokens */
%token EOF
%token IF
%token THEN
%token ELSE
%token ELIF
%token FN
%token FUN
%token RETURN
%token TRUE
%token FALSE
%token VAL
%token VAR
%token PLUS MINUS MUL DIV MOD CONCAT LT LTE  GTE EQ NEQ AND OR LPAR RPAR LBRAC RBRAC  GT LSPAR RSPAR COMMA ARROW DEF DOT ASSIGN SEMICOLON COLON TILD EXCLAM
%token <string> IDENT
%token <int> INT
%token <string> STRING

/* Priorités et associativités des tokens du plus faible au plus fort */ 
%nonassoc precedence_regle
%nonassoc THEN
%nonassoc IF ELSE ELIF
%left OR
%left AND
%nonassoc ASSIGN EQ NEQ GT GTE LT LTE
%left PLUS MINUS CONCAT
%left MUL DIV MOD
%nonassoc TILD EXCLAM
%nonassoc DOT LBRAC RBRAC FN LPAR RPAR
%nonassoc ARROW
/* Point d'entrée de la grammaire */
%start file

/* Type des valeurs renvoyées par l'analyseur syntaxique */
%type <file> file

%%

/* Règles de grammaire */

file:
  | SEMICOLON* ; dl = list( d = decl ; SEMICOLON+ {d}) ; EOF
    {  dl }
;

decl:
  | FUN ; i = IDENT ; body = funbody
    { { name = i ; body = body } }
;

funbody:
  | LPAR  ; pl = separated_list(COMMA, param) ; RPAR ; a = annot ; e = expr 
   { { formal = pl ; annot = a ; body = e } }
   
  | LPAR  ; pl = separated_list(COMMA, param) ; RPAR  ; e = expr %prec precedence_regle
   { { formal = pl ; annot = ([], TAType(AEmpty(($startpos,$endpos)), ($startpos,$endpos)), ($startpos,$endpos)) ; body = e } }
;

param:
  | s = IDENT ; COLON ; ty = kokatype { (s, ty, ($startpos,$endpos)) } 
;

annot:
  | COLON ; res = result { res } 
;

result:
  | LT  lst = separated_list(COMMA, IDENT)  GT   t = kokatype
    { (lst, t, ($startpos,$endpos)) }
  | t = kokatype { ([], t, ($startpos,$endpos))}
;
     
kokatype:
  | at = atype { TAType(at, ($startpos,$endpos)) } %prec precedence_regle
  | at = atype ; ARROW ; res = result { TFun(at, res, ($startpos,$endpos)) }
  | LPAR ; tl1 = kokatype; COMMA; tl = separated_nonempty_list(COMMA,kokatype) ; RPAR; ARROW ; res = result { TMulFun(tl1::tl, res, ($startpos,$endpos)) } 
  | LPAR ; tl = kokatype ; RPAR; ARROW ; res = result { TMulFun([tl], res, ($startpos,$endpos)) } 
  | LPAR; RPAR; ARROW; res = result {TMulFun([], res, ($startpos,$endpos))}
;
  
atype : 
| s = IDENT LPAR ;LT; ty = kokatype; GT  RPAR  {AVar(s, Some(ty), ($startpos,$endpos))} 
| s= IDENT {AVar(s, None, ($startpos,$endpos))} %prec precedence_regle
| LPAR ty = kokatype RPAR {AType(ty, ($startpos,$endpos))} 
| LPAR RPAR {AEmpty ($startpos,$endpos)} %prec precedence_regle
;

atom:
  | TRUE { ATrue ($startpos,$endpos) }
  | FALSE { AFalse ($startpos,$endpos)}
  | n = INT { Int(n, ($startpos,$endpos)) }
  | id = IDENT { Ident(id, ($startpos,$endpos)) }
  | s = STRING { String(s, ($startpos,$endpos)) }
  | LPAR ; RPAR { Empty(($startpos,$endpos)) }
  | LPAR ; e = expr ; RPAR { e }
  | at = atom ; LPAR ; el = separated_list(COMMA, expr) ; RPAR { Eval(at, el, ($startpos,$endpos)) }
  | at = atom ; DOT ; id = IDENT { Dot(at, id,($startpos,$endpos)) }
  | at = atom ; FN ; fb = funbody { Fn(at, fb, ($startpos,$endpos)) }
  | at = atom ; b = block { AtomBlock(at, b,($startpos,$endpos)) }
  | LSPAR ; el = separated_list(COMMA, expr) ; RSPAR { Brac(el, ($startpos,$endpos)) }
;

expr:
  |s = bexpr { EBexpr(s, ($startpos,$endpos)) } %prec precedence_regle
  |s = block {EBlock(s, ($startpos,$endpos)) } 
;

bexpr:
  | a = atom { Eatom(a, ($startpos,$endpos)) } %prec precedence_regle
  | TILD b = bexpr { ETild (b,($startpos,$endpos)) }
  | EXCLAM b = bexpr { ENot(b,($startpos,$endpos)) }
  | b1 = bexpr b2 = binop b3 = bexpr  { EBinop(b2,b1,b3, ($startpos,$endpos)) }
  | IF b1 = bexpr THEN b2 = expr lst = elifs { EIf(b1, b2,lst, ($startpos,$endpos)) }
  | IF b1 = bexpr RETURN b2 = expr { EIfReturn (b1, b2, ($startpos,$endpos)) }
  | FN f = funbody { EFn(f, ($startpos,$endpos)) }
  | RETURN e = expr { EReturn(e, ($startpos,$endpos)) } 
;

elifs: 
  |%prec precedence_regle {EBlock([], ($startpos,$endpos))}
  | ELIF b2 = bexpr THEN b3 = bexpr s = elifs {EIf(b2, b3, s, ($startpos,$endpos))}
  |ELSE b3 = bexpr {b3}

block:
  |LBRAC SEMICOLON* lst = list(s = stmt SEMICOLON+ {s})  RBRAC { lst }
;

stmt: 
  | b = bexpr { SBexpr(b, ($startpos,$endpos)) }
  | VAL s = IDENT DEF e = expr { SDecl(s, e, ($startpos,$endpos)) }
  | VAR s = IDENT ASSIGN e =expr { SVar(s,e, ($startpos,$endpos)) }
;

%inline binop:
  | EQ { Eq }
  | NEQ { Neq }
  | LT { Lt }
  | LTE { Lte }
  | GT { Gt }
  | GTE { Gte }
  | PLUS { Add }
  | MINUS { Sub }
  | MUL { Mul }
  | DIV { Div }
  | MOD { Mod }
  | CONCAT { Concat }
  | AND { And }
  | OR { Or }