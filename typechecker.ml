open Ast
type ident = string
type typ = 
  |TInt 
  |TBool
  |TString 
  |TArrow of typ list * full_type
  |TList of typ 
  |Tvar of var
  |TMaybe of typ
  |TUnit

and var = 
  {id: ident; mutable typ : typ option} (*non si c'est une variables libre*)
  (* Atomes *) 

and effect= 
  |Div 
  |Console
  |Full
  |NoEffect
and full_type = 
  {typ: typ; effect : effect}
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
    | ETild of tbexpr *loc * typ
    | ENot of tbexpr *loc * typ
    | EBinop of binop * tbexpr * tbexpr *loc * typ
    | EAsign of ident * tbexpr *loc * typ
    |EIf of tbexpr*tbexpr * tbexpr * loc * typ
    | EFn of tfunbody *loc * typ
    | EReturn of tbexpr *loc * typ
    | ATrue of loc * typ| AFalse of loc * typ | Int of int*loc * typ | String of string *loc * typ | Empty of loc * typ
    | Ident of ident * loc * typ
    | Eval of tbexpr * (tbexpr list) * loc * typ
    | Dot of tbexpr * ident * loc * typ
    | Fn of tbexpr * tfunbody * loc * typ
    | AtomBlock of tbexpr * (tstmt list) * loc * typ
    | Brac of tbexpr list * loc * typ 
  
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
  exception Type_Error of string * loc

  let rec head t = 
    match t with 
    |Tvar({typ = Some(ty)})  -> head ty
    |_ -> t
  
let rec kokatype_to_type kty = match kty with  
    |AEmpty(_) -> TUnit
    |TAType(t,_) |AType(t, _) -> kokatype_to_type t 
    |TMulFun(lst, res, _) -> TArrow( (List.fold_left (fun acc x -> (kokatype_to_type x)::acc) [] (List.rev lst)), result_to_type res)
    |TFun(typ, res, _) -> TArrow([kokatype_to_type typ],  result_to_type res)
    |AVar(id, typ_opt, loc) -> (match typ_opt  with
                            | None -> (match id with 
                                      |"unit" -> TUnit
                                      |"bool" -> TBool
                                      |"string" -> TString
                                      |"int" -> TInt
                                      |_ -> raise (Type_Error(("Erreur de typage: "^id^" n'est pas un mot de type!"), loc)) )
                            |Some(v) -> (match  id with
                                        | "maybe" -> TMaybe((kokatype_to_type v))
                                        | "list" -> TList((kokatype_to_type v))
                                        | _ -> raise(Type_Error("Erreur de typage: "^id^"n'est pas un mot de type!", loc)))
                            )
and param_list_to_type lst = 
  match List.rev lst with 
    |[] -> []
    | [(id,typ,_)] ->  [(kokatype_to_type typ)]
    |_-> List.fold_left (fun acc (id, x, _) -> (kokatype_to_type x)::acc) ([]) (List.rev lst)
and result_to_type res : full_type = let (lst, typ, loc) = res in 
  let effet=(
  if (List.mem "console" lst && List.mem "div" lst) then NoEffect
   else
     if (List.mem "console" lst ) then Console
     else if (List.mem "div" lst) then Div 
     else NoEffect)
    in 
  {typ = (kokatype_to_type typ); effect = effet}



let rec find_type (b : bexpr) : typ= 
  TString

let type_decl (decl: decl)  funs= (*funs est la table qui a une fonction associe son type*)
    let body = decl.body in 
    let fun_type = TInt in fun_type


