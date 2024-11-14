open Ast
type ident = string

type typ = 
  |TInt 
  |TBool
  |TString 
  |TArrow of typ list * typ 
  |TList of typ 
  |Tvar of var
  |TMaybe of typ
  |TUnit

and var = 
  {id: ident; mutable typ : typ option} (*non si c'est une variables libre*)
  (* Atomes *) 
type loc = (Lexing.position * Lexing.position)
  
  
  
  
  (* type *)
  and tkokaType =
    | TAType of tkokaType*loc
    | TFun of tkokaType * tresult*loc
    | TMulFun of tkokaType list * tresult *loc
    | AVar of ident * (tkokaType option) *loc (*Reste a traité*)
    | AType of tkokaType *loc
    | AEmpty of loc
  
  and tresult = ident list *tkokaType* loc
  
  and param = ident * tkokaType *loc
  
  (* operations *)
  and binop = Eq   | Neq   | Lt  | Lte  | Gt  | Gte   | Add   | Sub   
  | Mul | Div  | Mod  | Concat  | And  | Or  
  
  (* statement *)
  and tstmt =
    | SBexpr of tbexpr *loc
    | SDecl of ident * tbexpr *loc
    | SVar of ident * tbexpr *loc
  
  (* expression *)
  
  
  and tbexpr =
    | EBlock of tstmt list *loc
    | EBexpr of tbexpr *loc
    | Eatom of tbexpr *loc
    | ETild of tbexpr *loc
    | ENot of tbexpr *loc
    | EBinop of binop * tbexpr * tbexpr *loc
    | EAsign of ident * tbexpr *loc
    |EIf of tbexpr*tbexpr * tbexpr * loc
    | EFn of tfunbody *loc
    | EReturn of tbexpr *loc
    | ATrue of loc| AFalse of loc | Int of int*loc | String of string *loc | Empty of loc
    | Ident of ident * loc
    | Eval of tbexpr * (tbexpr list) * loc
    | Dot of tbexpr * ident * loc
    | Fn of tbexpr * tfunbody * loc
    | AtomBlock of tbexpr * (tstmt list) * loc
    | Brac of tbexpr list * loc 
  
  (* corps d'une fonction *)
  and tfunbody = {
    formal : param list; (* arguments *)
    annot  : tresult; (* annotation *)
    body   : tbexpr;
    typ : typ;
  }
  
  (* declaration de fonctions *)
  and tdecl = {
    name : string;
    body : tfunbody;
  }
  
  (* fichier *)
  and tfile = tdecl list

  let rec head t = 
    match t with 
    |Tvar({typ = Some(ty)})  -> head ty
    |_ -> t
  
let rec kokatype_to_type kty = match kty with  
    |AEmpty(_) -> TUnit
    |TAType(t,_) |AType(t, _) -> kokatype_to_type t 
    |TMulFun(lst, res, _) -> TArrow( (List.fold_left (fun acc x -> (kokatype_to_type x)::acc) [] (List.rev lst)), result_to_type res)
    |TFun(typ, res, _) -> TArrow([kokatype_to_type typ], result_to_type res)
    |AVar(id, typ_opt, _) -> TInt
and param_list_to_type lst = 
  match List.rev lst with 
    |[] -> []
    | [(id,typ,_)] ->  [(kokatype_to_type typ)]
    |_-> List.fold_left (fun acc (id, x, _) -> (kokatype_to_type x)::acc) ([]) (List.rev lst)
and result_to_type res = TInt

let rec find_type (b : bexpr) : typ= 
  TString

let type_decl (decl: decl)  funs= (*funs est la table qui a une fonction associe son type*)
    let body = decl.body in 
    let fun_type = TInt in fun_type


