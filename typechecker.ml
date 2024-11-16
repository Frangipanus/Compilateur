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
  {id: ident; mutable typ : full_type option} (*non si c'est une variables libre*)
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
  
  and tparam = ident * tkokaType *loc
  
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
    | EBlock of tstmt list *loc*full_type 
    | ETild of tbexpr *loc * full_type
    | ENot of tbexpr *loc * full_type
    | EBinop of binop * tbexpr * tbexpr *loc * full_type
    | EAsign of ident * tbexpr *loc * full_type
    |EIf of tbexpr*tbexpr * tbexpr * loc * full_type
    | EFn of tfunbody *loc * full_type
    | EReturn of tbexpr *loc * full_type
    | ATrue of loc * full_type (*fait*)
    | AFalse of loc * full_type (*fait*)
    | Int of int*loc * full_type (*Fait*)
    | String of string *loc * full_type  (*Fait*)
    | Empty of loc * full_type (*Fait*)
    | Eval of tbexpr * (tbexpr list) * loc * full_type
    | Fn of tbexpr * tfunbody * loc * full_type
    | AtomBlock of tbexpr * (tstmt list) * loc * full_type
    | Brac of tbexpr list * loc * full_type 
  
  (* corps d'une fonction *)
  and tfunbody = {
    formal : param list; (* arguments *)
    annot  : tresult; (* annotation *)
    body   : tbexpr;
    typ : full_type;
  }
  
  (* declaration de fonctions *)
  and tdecl = {
    name : string;
    body : tfunbody;
  }
  
  (* fichier *)
  and tfile = tdecl list
  exception Type_Error of string * loc

  let rec head (t: full_type) = 
    match t.typ with 
    |Tvar({typ = Some(ty)})  -> head ty
    |_ -> t
  
let rec mem_type (t1: full_type) (t2:full_type): bool = 
  if t1.effect = t2.effect then (
    let h1 = head t1 in 
    let h2 = head t2 in 
    match h1.typ, h2.typ with 

    |_ -> false
    
  )
else false


let tbexpr_to_type expr= match expr with 
  | EBlock( list ,loc,full_type ) -> full_type
  | ETild ( tbexpr ,loc , full_type) -> full_type
  | ENot  ( tbexpr ,loc , full_type) -> full_type
  | EBinop  ( binop , tbexpr , _ ,loc , full_type) -> full_type
  | EAsign  ( ident , tbexpr ,loc , full_type) -> full_type
  |EIf  ( tbexpr,_ , _ , loc , full_type) -> full_type
  | EFn  ( tfunbody ,loc , full_type) -> full_type
  | EReturn  ( tbexpr ,loc , full_type) -> full_type
  | ATrue ( loc , full_type (*fait*)) -> full_type
  | AFalse ( loc , full_type (*fait*)) -> full_type
  | Int  ( _,loc , full_type (*Fait*)) -> full_type
  | String  ( _ ,loc , full_type  (*Fait*)) -> full_type
  | Empty  ( loc , full_type (*Fait*)) -> full_type
  | Eval  ( tbexpr , _ , loc , full_type) -> full_type
  | Fn  ( tbexpr , tfunbody , loc , full_type) -> full_type
  | AtomBlock ( _ , _ , loc , full_type) -> full_type
  | Brac  ( _ , loc , full_type  ) -> full_type

    let rec kokatype_to_type (kty : kokaType) = match kty with  
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
and param_list_to_type (lst : param list) = 
  match List.rev lst with 
    |[] -> []
    | [(id,typ,_)] ->  [(kokatype_to_type typ)]
    |_-> List.fold_left (fun acc (id, x, _) -> (kokatype_to_type x)::acc) ([]) (List.rev lst)
and result_to_type res : typ = let (lst, typ, loc) = res in 
  (kokatype_to_type typ)



let rec typeur (b : bexpr) vars foncs  = match b with (*Env donne le full_type. Comme la fonction en fait*)
    |ATrue(loc) ->   ATrue(loc,{typ = TBool; effect = NoEffect})
    |AFalse(loc) ->AFalse(loc,{typ = TBool; effect = NoEffect})
    |Int(n,loc) -> Int(n,loc,{typ = TInt; effect = NoEffect})
    |String(s,loc) -> String(s,loc,{typ = TString; effect = NoEffect})
    |Empty(loc) -> Empty(loc,{typ = TUnit; effect = NoEffect})
    |ETild(ex, loc) -> ETild(typeur ex vars foncs, loc, tbexpr_to_type (typeur ex vars foncs))
    |_ -> failwith "not yet"
let type_decl (decl: decl)  funs= (*funs est la table qui a une fonction associe son type*)
    let body = decl.body in 
    let fun_type = TInt in fun_type


