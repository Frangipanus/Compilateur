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
  {id: int; mutable typ : full_type option} (*non si c'est une variables libre*)
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
  
 
  
  (* statement *)
  and tstmt =
    | SBexpr of tbexpr *loc
    | SDecl of ident * tbexpr *loc
    | SVar of ident * tbexpr *loc
  
  (* expression *)
  
  
  and tbexpr =
    | EBlock of tstmt list *loc*full_type (*Fait*)
    | ETild of tbexpr *loc * full_type (*Fait*)
    | ENot of tbexpr *loc * full_type (*Fait*)
    | EBinop of binop * tbexpr * tbexpr *loc * full_type (*Fait*)
    | EAsign of ident * tbexpr *loc * full_type (*Fit*)
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

  module Env = Map.Make(String) (*C'st l'environnement de variable.*)
  module V = struct
    type t = var
    let compare v1 v2 = Stdlib.compare v1.id v2.id
    let equal v1 v2 = v1.id = v2.id
    let create = let r = ref 0 in fun () -> incr r; { id = !r; typ = None }
  end

  let rec head (t: full_type) = 
    match t.typ with 
    |Tvar({typ = Some(ty)})  -> head ty
    |_ -> t
  let  head2 t = 
    head {typ = t; effect = NoEffect}
let rec meme_type (t1: typ) (t2:typ): bool = 
  if true then (
    let h1 = head2 t1 in 
    let h2 = head2 t2 in 
    match h1.typ, h2.typ with 
    |TInt, TInt -> true
    |TBool, TBool-> true
    |TString, TString -> true
    |TArrow(lst, typ), TArrow(lst2, typ2)-> (List.for_all (fun (x,y) -> meme_type (x) y) (List.combine lst lst2)) && (meme_type typ2 typ)
    |TList(typ), TList(typ2) -> meme_type typ typ2
    |TMaybe(typ), TMaybe(typ2)-> true
    |TUnit, TUnit-> true
    |Tvar(v1), Tvar(v2) -> v1.id = v2.id
    |_ -> false
    
  )
else false

let add_effect effect add = match effect, add with
  |Full, _ -> Full
  |_, Full -> Full
  |Div, Console -> Full
  |Console, Div -> Full
  |Console, _ -> Full
  |Div, _ -> Div
  |_, Console -> Console
  |_, Div -> Div
  |_ -> NoEffect

let op_to_typ op = match op with 
|Eq   -> TBool
| Neq -> TBool  
| Lt  -> TBool
| Lte -> TBool 
| Gt  -> TBool
| Gte -> TBool  
| Add   -> TInt
| Sub   -> TInt
| Mul -> TInt
| Div  -> TInt
| Mod -> TInt
| Concat ->TString
| And -> TBool 
| Or  -> TBool

let op_to_typ_need op t = match op with 
|Eq   -> List.mem t [TBool; TInt; TBool]
| Neq ->List.mem t [TBool; TInt; TBool]  
| Lt  ->List.mem t [TBool; TInt]
| Lte ->List.mem t [TBool; TInt] 
| Gt  ->List.mem t [TBool; TInt]
| Gte ->List.mem t [TBool; TInt]  
| Add   ->List.mem t [TInt]
| Sub   ->List.mem t [TInt]
| Mul ->List.mem t [TInt]
| Div  ->List.mem t [TInt]
| Mod ->List.mem t [ TInt]
| Concat ->(match t with 
            |TList(_)-> true
            |TString -> true
            |_ -> false)
| And ->List.mem t [TBool] 
| Or  ->List.mem t [TBool]

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



let rec typeur (b : bexpr)  vars foncs   = match b with (*Env donne SBle full_type. Comme la fonction en fait*)
    |ATrue(loc) ->   ATrue(loc,{typ = TBool; effect = NoEffect})
    |AFalse(loc) ->AFalse(loc,{typ = TBool; effect = NoEffect})
    |Int(n,loc) -> Int(n,loc,{typ = TInt; effect = NoEffect})
    |String(s,loc) -> String(s,loc,{typ = TString; effect = NoEffect})
    |Empty(loc) -> Empty(loc,{typ = TUnit; effect = NoEffect})
    |ETild(ex, loc) -> ETild(typeur ex  vars foncs , loc, tbexpr_to_type (typeur ex  vars foncs ))
    |ENot(ex, loc) -> ENot(typeur ex  vars foncs , loc, tbexpr_to_type (typeur ex  vars foncs ))
    |EBlock(lst, loc) -> (let acc = List.map (fun (x : stmt) : tstmt -> match x with 
                                                      |SBexpr(ex, loc) ->  SBexpr(typeur ex  vars foncs , loc)
                                                      |SVar(id, ex, loc) ->SBexpr(typeur ex  vars foncs , loc)
                                                      |SDecl(id, ex, loc) -> SBexpr(typeur ex  vars foncs , loc) ) lst in 
                                                      EBlock(acc, loc, list_to_type lst  vars foncs  NoEffect))
    | EBinop(op, b1, b2, loc) -> (let acc = typeur b1  vars foncs  in 
                                  let acc2 = typeur b2  vars foncs  in  
                                  if not((meme_type ((tbexpr_to_type acc).typ) ((tbexpr_to_type acc2)).typ && op_to_typ_need op (tbexpr_to_type acc).typ)) then raise (Error2("Erreur: opération sur 2 éléments de type différent"))
                                  else(
                                      EBinop(op, acc, acc2, loc, {typ = op_to_typ op; effect = add_effect (tbexpr_to_type acc).effect (tbexpr_to_type acc2).effect})
                                  )
                                    )
    |EAsign(id, exp, loc) -> EAsign(id, typeur exp  vars foncs , loc, {typ = TUnit; effect = NoEffect})
    
    |_ -> failwith "not yet"
  
and list_to_type (st : stmt list)  vars foncs effet = 
  match st with 
  |[h] -> (match h with 
          |SBexpr(ex, _) -> (let acc = tbexpr_to_type (typeur ex  vars foncs ) in {typ = acc.typ; effect = add_effect effet acc.effect})
          |_ -> failwith "Var ne peut jamais etre la")
  |h::q -> (match h with 
          |SBexpr(ex, _) -> (let acc = tbexpr_to_type (typeur ex  vars foncs ) in list_to_type q vars foncs   (add_effect effet acc.effect) )
          |SVar(id, ex, loc) -> (let acc = tbexpr_to_type (typeur ex  vars foncs ) in if (Env.mem id  vars ) then raise (Error2("Erreur de typage: "^id^" n'a pas le bon type\n" )) else  list_to_type q (Env.add id acc vars)  foncs (add_effect effet acc.effect) )
          |SDecl(id, ex, loc) -> (let acc = tbexpr_to_type (typeur ex  vars foncs ) in if (Env.mem id  vars ) then raise (Error2("Erreur de typage: "^id^" n'a pas le bon type\n" )) else  list_to_type q (Env.add id acc vars) foncs  (add_effect effet acc.effect) ))
  |_ -> {typ = TUnit; effect = NoEffect}




let type_decl (decl: decl)  funs= (*funs est la table qui a une fonction associe son type*)
    let body = decl.body in 
    let fun_type = TInt in fun_type


