%{
  open Ast

%}

/* Déclaration des tokens */

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
%token PLUS MINUS MUL DIV MOD CONCAT LT LTE GT GTE EQ NEQ AND OR LPAR RPAR LBRAC RBRAC LHOOK RHOOK LSPAR RSPAR COMMA ARROW DEF DOT ASSIGN SEMICOLON COLON TILD EXCLAM
%token <string> IDENT
%token <int> INT
%token <string> STRING

/* Priorités et associativités des tokens */
%nonassoc precedence_regle
%left prec2
%nonassoc IF THEN ELSE
%left OR
%left AND
%nonassoc ASSIGN EQ NEQ GT GTE LT LTE
%left PLUS MINUS CONCAT
%left MUL DIV MOD
%nonassoc TILD EXCLAM
%nonassoc DOT LBRAC RBRAC FN 


/* Point d'entrée de la grammaire */
%start file

/* Type des valeurs renvoyées par l'analyseur syntaxique */
%type <file> file

%%

/* Règles de grammaire */

file:
  | SEMICOLON* ; dl = list( d = decl ; SEMICOLON+ {d}) ; EOF
    { Printf.printf "hi" ; dl }
;

decl:
  | FUN ; i = IDENT ; body = funbody
    { { name = i ; body = body } }
;

funbody:
  | LPAR  ; pl = separated_list(COMMA, param) ; RPAR ; annot? ; e = expr
   { { formal = [] ; annot = ([], TAType(AEmpty)) ; body = e } }
;

param:
  | s = IDENT ; COLON ; ty = kokatype { (s, ty) } 
;

annot:
  | COLON ; res = result { res } 
;

result:
  | LHOOK  lst = list(COMMA s=IDENT {s})  RHOOK   t = kokatype
    { (lst, t) }
  | t = kokatype { ([], t)}
;

kokatype:
  | at = atype { TAType(at) }
  | at = atype ; ARROW ; res = result { TFun(at, res) }
  | LPAR ; tl = list(COMMA s=  kokatype {s}) ; ARROW ; res = result {TMulFun(tl, res)}
;
   
atype : 
| s = IDENT; ty = option(LPAR ;LHOOK; ty = kokatype; RHOOK ; RPAR {ty}) {AVar(s, ty)}
| LPAR ty = kokatype RPAR {AType(ty)}
| LPAR RPAR {AEmpty}
;

atom:
  | TRUE { ATrue }
  | FALSE { AFalse }
  | n = INT { Int(n) }
  | s = STRING { String(s) }
  | LPAR ; RPAR { Empty }
  | id = IDENT { Ident(id) }
  | LPAR ; e = expr ; RPAR { Expr(e) }
  | at = atom ; LPAR ; el = separated_list(COMMA, expr) ; RPAR { Eval(at, el) }
  | at = atom ; DOT ; id = IDENT { Dot(at, id) }
  | at = atom ; FN ; fb = funbody { Fn(at, fb) }
  | at = atom ; b = block { AtomBlock(at, b) }
  | LSPAR ; el = separated_list(COMMA, expr) ; RSPAR { Brac(el) }
;

expr:
  |s = block {EBlock(s)}
  |s = bexpr {EBexpr(s)} %prec precedence_regle
  
;


bexpr:
  | a = atom {Eatom(a)} %prec precedence_regle
  | TILD b = bexpr {ETild (b)}
  | EXCLAM b = bexpr {ENot(b)}
  | b1 = bexpr b2 = binop b3 = bexpr  {EBinop(b2,b1,b3)}
  | IF b1 = bexpr THEN b2 = expr lst = list(ELIF be = bexpr THEN bb = expr {(be, bb)}) ELSE b3 = expr {EIfElse(b1, b2,[] , b3)}
  | IF b1 = bexpr RETURN b2 = expr {EIfReturn (b1, b2)}
  | FN f = funbody {EFn(f)}
  | RETURN e = expr {EReturn(e)} 
;




block:
  |LBRAC SEMICOLON* lst = list(s = stmt SEMICOLON+ {s}) RBRAC {lst}
;

stmt: 
  | b = bexpr {SBexpr(b)}
  | VAL s = IDENT DEF e = expr {SDecl(s, e)}
  | VAR s = IDENT ASSIGN e =expr {SVar(s,e)}
;

%inline binop:
  | EQ {Eq}
  | NEQ {Neq}
  | LT {Lt}
  | LTE {Lte}
  | GT {Gt}
  | GTE {Gte}
  | PLUS {Add}
  | MINUS {Sub}
  | MUL {Mul}
  | DIV {Div}
  | MOD {Mod}
  | CONCAT {Concat}
  | AND {And}
  | OR {Or}