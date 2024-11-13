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
%nonassoc IF THEN ELSE
%left OR
%left AND
%nonassoc ASSIGN EQ NEQ GT GTE LT LTE
%left PLUS MINUS CONCAT
%left MUL DIV MOD
%nonassoc TILD EXCLAM
%nonassoc DOT LBRAC RBRAC FN LPAR
%nonassoc ARROW
%nonassoc tres_prio
/* Point d'entrée de la grammaire */
%start file

/* Type des valeurs renvoyées par l'analyseur syntaxique */
%type <file> file

%%
  
/* Règles de grammaire */

file:
  | SEMICOLON* ; dl = list( d = decl ; SEMICOLON+ {d}) ; EOF
    {dl }
;

decl:
  | FUN ; i = IDENT ; body = funbody
    {{ name = i ; body = body } }
;

funbody:
  | LPAR  ; pl = separated_list(COMMA, param) ; RPAR ; a = annot ; e = expr %prec tres_prio
   { { formal = pl ; annot = a ; body = e } }
  | LPAR  ; pl = separated_list(COMMA, param) ; RPAR  ; e = expr
   { { formal = pl ; annot = ([], TAType(AEmpty)) ; body = e } }
;

param:
  | s = IDENT ; COLON ; ty = kokatype { (s, ty) } 
;

annot:
  | COLON ; res = result { res } 
;

result:
  | LT  lst = separated_list(COMMA, IDENT)  GT   t = kokatype
    { (lst, t) }
  | t = kokatype { ([], t)}
;
     
kokatype:
  | at = atype { TAType(at) } %prec precedence_regle
  | at = atype ; ARROW ; res = result { TFun(at, res) }
  | LPAR ; tl = separated_list(COMMA,kokatype) ; RPAR; ARROW ; res = result { TMulFun(tl, res) }
;
  
atype : 
| s = IDENT LPAR ;LT; ty = kokatype; GT  RPAR  {AVar(s, Some(ty))} 
| s= IDENT {AVar(s, None)} %prec precedence_regle
| LPAR ty = kokatype RPAR {AType(ty)}
| LPAR RPAR {AEmpty}
;

atom:
  | TRUE { ATrue ($startpos, $endpos) }
  | FALSE { AFalse ($startpos, $endpos) }
  | n = INT { Int(n, ($startpos, $endpos)) }
  | id = IDENT { Ident(id, ($startpos, $endpos)) }
  | s = STRING { String(s, ($startpos, $endpos)) }
  | LPAR ; RPAR { Empty ($startpos, $endpos) }
  | LPAR ; e = expr ; RPAR { Expr(e, ($startpos, $endpos)) }
  | at = atom ; LPAR ; el = separated_list(COMMA, expr) ; RPAR { Eval(at, el, ($startpos, $endpos)) }
  | at = atom ; DOT ; id = IDENT { Dot(at, id, ($startpos, $endpos)) }
  | at = atom ; FN ; fb = funbody { Fn(at, fb, ($startpos, $endpos)) }
  | at = atom ; b = block { AtomBlock(at, b, ($startpos, $endpos)) }
  | LSPAR ; el = separated_list(COMMA, expr) ; RSPAR { Brac(el, ($startpos, $endpos)) }
;

expr:
  |s = bexpr { EBexpr(s) } %prec precedence_regle
  |s = block {EBlock(s) } 
;

bexpr:
  | a = atom { Eatom(a) } %prec precedence_regle
  | TILD b = bexpr { ETild (b) }
  | EXCLAM b = bexpr { ENot(b) }
  | b1 = bexpr b2 = binop b3 = bexpr  { EBinop(b2,b1,b3) }
  | IF b1 = bexpr THEN b2 = expr lst = list(ELIF be = bexpr THEN bb = expr { (be, bb) }) ELSE b3 = expr { EIfElse(b1, b2,[] , b3) }
  | IF b1 = bexpr RETURN b2 = expr { EIfReturn (b1, b2) }
  | FN f = funbody { EFn(f) }
  | RETURN e = expr { EReturn(e) } 
;

block:
  |LBRAC SEMICOLON* lst = list(s = stmt SEMICOLON+ {s})  RBRAC { lst }
;

stmt: 
  | b = bexpr { SBexpr(b) }
  | VAL s = IDENT DEF e = expr { SDecl(s, e) }
  | VAR s = IDENT ASSIGN e =expr { SVar(s,e) }
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