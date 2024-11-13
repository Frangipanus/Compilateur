type ident = string

type typ = 
  |TInt 
  |TString 
  |TArrow of typ list * typ 
  |TTuple of typ * typ 
  |TList of typ 
  |TList_vide 

(* tatomes *)
type loc = (Lexing.position * Lexing.position)


and tatom = 
  | ATrue of  loc * typ| AFalse of  loc * typ | Int of int* loc * typ | String of string * loc * typ | Empty of  loc * typ
  | Ident of ident *  loc * typ
  | Expr of texpr *  loc * typ
  | Eval of tatom * (texpr list) *  loc * typ
  | Dot of tatom * ident *  loc * typ
  | Fn of tatom * funbody *  loc * typ
  | AtomBlock of tatom * tblock *  loc * typ
  | Brac of texpr list *  loc * typ 

(* type *)
and tkokatype =
  | TAType of tatype* loc * typ
  | TFun of tatype * tresult* loc * typ
  | TMulFun of tkokatype list * tresult * loc * typ

and tatype =
  | AVar of ident * (tkokatype option) * loc * typ
  | AType of tkokatype * loc * typ
  | AEmpty of  loc * typ

and tresult = ident list * tkokatype*  loc * typ

and tparam = ident * tkokatype * loc * typ

(* operations *)
and binop = Eq   | Neq   | Lt  | Lte  | Gt  | Gte   | Add   | Sub   
| Mul | Div  | Mod  | Concat  | And  | Or  

(* statement *)
and tstmt =
  | SBexpr of tbexpr * loc * typ
  | SDecl of ident * texpr * loc * typ
  | SVar of ident * texpr * loc * typ

(* expression *)
and texpr =
  | EBlock of tblock * loc * typ
  | EBexpr of tbexpr * loc * typ

and tblock = tstmt list 

and tbexpr =
  | Eatom of tatom * loc * typ
  | ETild of tbexpr * loc * typ
  | ENot of tbexpr * loc * typ
  | EBinop of binop * tbexpr * tbexpr * loc * typ
  | EAsign of ident * tbexpr * loc * typ
  | EIfElse of tbexpr * texpr * ( (tbexpr * texpr) list ) * texpr * loc * typ
  | EIfReturn of tbexpr * texpr * loc * typ
  | EFn of funbody * loc * typ
  | EReturn of texpr * loc * typ

(* corps d'une fonction *)
and funbody = {
  formal : tparam list; (* arguments *)
  annot  : tresult; (* annotation *)
  body   : texpr;
}

(* declaration de fonctions *)
and decl = {
  name : string;
  body : funbody;
}

(* fichier *)
and file = decl list



let request_type 


