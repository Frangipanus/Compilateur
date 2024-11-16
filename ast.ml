type ident = string
exception Error2 of string

(* Atomes *)
type loc = (Lexing.position * Lexing.position)




(* type *)
and kokaType =
  | TAType of kokaType*loc
  | TFun of kokaType * result*loc
  | TMulFun of kokaType list * result *loc
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
  | SDecl of ident * bexpr *loc
  | SVar of ident * bexpr *loc

(* expression *)


and bexpr =
  | EBlock of stmt list *loc
  | ETild of bexpr *loc
  | ENot of bexpr *loc
  | EBinop of binop * bexpr * bexpr *loc
  | EAsign of ident * bexpr *loc
  |EIf of bexpr*bexpr * bexpr * loc
  | EFn of funbody *loc
  | EReturn of bexpr *loc
  | ATrue of loc| AFalse of loc | Int of int*loc | String of string *loc | Empty of loc
  | Eval of bexpr * (bexpr list) * loc
  | Fn of bexpr * funbody * loc (*Devrait jamais arriver. Planter si ca arrive?*)
  | AtomBlock of bexpr * (stmt list) * loc
  | Brac of bexpr list * loc 

(* corps d'une fonction *)
and funbody = {
  formal : param list; (* arguments *)
  annot  : result; (* annotation *)
  body   : bexpr;
}

(* declaration de fonctions *)
and decl = {
  name : string;
  body : funbody;
}

(* fichier *)
and file = decl list