type ident = string

(* Atomes *)
type loc = (Lexing.position * Lexing.position)


and atom = 
  | ATrue of loc| AFalse of loc | Int of int*loc | String of string *loc | Empty of loc
  | Ident of ident * loc
  | Expr of expr * loc
  | Eval of atom * (expr list) * loc
  | Dot of atom * ident * loc
  | Fn of atom * funbody * loc
  | AtomBlock of atom * block * loc
  | Brac of expr list * loc

(* type *)
and kokaType =
  | TAType of atype*loc
  | TFun of atype * result*loc
  | TMulFun of kokaType list * result *loc

and atype =
  | AVar of ident * (kokaType option) *loc
  | AType of kokaType *loc
  | AEmpty of loc

and result = ident list * kokaType* loc

and param = ident * kokaType *loc

(* operations *)
and binop = Eq   | Neq   | Lt  | Lte  | Gt  | Gte   | Add   | Sub   
| Mul | Div  | Mod  | Concat  | And  | Or  

(* statement *)
and stmt =
  | SBexpr of bexpr *loc
  | SDecl of ident * expr *loc
  | SVar of ident * expr *loc

(* expression *)
and expr =
  | EBlock of block *loc
  | EBexpr of bexpr *loc

and block = stmt list 

and bexpr =
  | Eatom of atom *loc
  | ETild of bexpr *loc
  | ENot of bexpr *loc
  | EBinop of binop * bexpr * bexpr *loc
  | EAsign of ident * bexpr *loc
  | EIfElse of bexpr * expr * ( (bexpr * expr) list ) * expr *loc
  | EIfReturn of bexpr * expr *loc
  | EFn of funbody *loc
  | EReturn of expr *loc

(* corps d'une fonction *)
and funbody = {
  formal : param list; (* arguments *)
  annot  : result; (* annotation *)
  body   : expr;
}

(* declaration de fonctions *)
and decl = {
  name : string;
  body : funbody;
}

(* fichier *)
and file = decl list