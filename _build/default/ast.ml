type ident = string

(* Atomes *)
type atom = 
  | ATrue | AFalse | Int of int | String of string | Empty
  | Ident of ident
  | Expr of expr
  | Eval of atom * (expr list)
  | Dot of atom * ident
  | Fn of atom * funbody
  | AtomBlock of atom * block
  | Brac of expr list

(* type *)
and kokaType =
  | TAType of atype
  | TFun of atype * result
  | TMulFun of kokaType list * result

and atype =
  | AVar of ident * (kokaType option)
  | AType of kokaType
  | AEmpty

and result = ident list * kokaType

and param = ident * kokaType

(* operations *)
and binop = Eq | Neq | Lt | Lte | Gt | Gte | Add | Sub | Mul | Div | Mod | Concat | And | Or

(* statement *)
and stmt =
  | SBexpr of bexpr
  | SDecl of ident * expr
  | SVar of ident * expr

(* expression *)
and expr =
  | EBlock of block
  | EBexpr of bexpr

and block = stmt list

and bexpr =
  | Eatom of atom
  | ETild of bexpr
  | ENot of bexpr
  | EBinop of binop * bexpr * bexpr
  | EAsign of ident * bexpr
  | EIfElse of bexpr * expr * ( (bexpr * expr) list ) * expr
  | EIfReturn of bexpr * expr
  | EFn of funbody
  | EReturn of expr

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