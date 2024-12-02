open Ast

type ident = string

type typ = 
  | Tint 
  | Tbool
  | Tstring 
  | Tunit
  | Tarrow of typ list * full_type
  | Tlist of typ 
  | Tmaybe of typ
  | Tvar of var

and var = 
  {id: int; mutable typ : full_type option} (*None si c'est une variables libre*)
  
and effect= 
  | Div 
  | Console
  | Full
  | NoEffect

and full_type = 
  {typ: typ; effect : effect}

type loc = (Lexing.position * Lexing.position)
  
(* type *)
(*and tkokaType =
  | TAType of tkokaType * loc
  | TFun of tkokaType * tresult * loc
  | TMulFun of tkokaType list * tresult * loc
  | AVar of ident * (tkokaType option) * loc
  | AType of tkokaType *loc
  | AEmpty of loc*)
  
and tparam = ident * typ * loc
  
(* statement *)
and tstmt = {
  stmt  : tstmt1;
  loc   : loc;
  typ   : full_type;
}

and tstmt1 =
  | SBexpr of tbexpr * loc
  | SDecl of ident * tbexpr * loc
  | SVar of ident * tbexpr * loc
  
(* expression *)
and tbexpr = {
  bexpr : tbexpr1;
  loc   : loc;
  typ   : full_type
}

and tbexpr1 = 
  | EBlock of tstmt list
  | ETild of tbexpr
  | ENot of tbexpr
  | EBinop of binop * tbexpr * tbexpr
  | EAsign of ident * tbexpr
  | EIf of tbexpr * tbexpr * tbexpr 
  | EFn of tfunbody 
  | EReturn of tbexpr
  | ATrue
  | AFalse
  | Int of int
  | String of string 
  | Empty 
  | Ident of ident
  | Eval of tbexpr * (tbexpr list)
  | Fn of tbexpr * tfunbody
  | AtomBlock of tbexpr * (tstmt list)
  | List of tbexpr list
  | Println of tbexpr
  | Default of tbexpr * tbexpr
  | Head of tbexpr
  | Tail of tbexpr
  | For of tbexpr * tbexpr * tbexpr
  | Repeat of tbexpr * tbexpr
  | While of tbexpr * tbexpr
  
(* corps d'une fonction *)
and tfunbody = {
  formal : param list; (* arguments *)
  body   : tbexpr;
  typ    : full_type;
}
  
(* declaration de fonctions *)
and tdecl = {
  name : string;
  body : tfunbody;
}
  
(* fichier *)
and tfile = tdecl list

exception Type_Error of string * loc

module Env = Map.Make(String) (*C'est l'environnement de variable.*)
module V = struct
  type t = var
  let compare v1 v2 = Stdlib.compare v1.id v2.id
  let equal v1 v2 = v1.id = v2.id
  let create = let r = ref 0 in fun () -> incr r; { id = !r; typ = None }
end

let rec head t = match t with
  | Tvar { typ = Some(t') } -> head t'.typ
  | _ -> t

let rec canon t = match t with
  | Tint -> Tint
  | Tbool -> Tbool
  | Tstring -> Tstring
  | Tarrow(tl, ft) -> 
    Tarrow
      (List.fold_right (fun t' acc -> (canon t')::acc) tl [],
       { typ = canon ft.typ, effect = ft.effect })
  | Tlist(t') -> Tlist(canon t')
  | Tmaybe(t') -> Tmaybe(canon t')
  | Tunit -> Tunit
  | Tvar { def = None } -> t
  | _ -> canon (head t)

exception UnificationFailure of typ * typ

let unification_error t1 t2 = raise (UnificationFailure (canon t1, canon t2))

let rec occur v t = match head t with
  | Tvar { id = n } when n = v.id -> true
  | Tarrow(tl, ft) -> occur ft.typ || (List.exists (fun t' -> occur v t') tl)
  | Tlist(t') | Tmaybe(t') -> occur v t'
  | _ -> false

let rec unify (t1 : full_type) (t2 : full_type) = match (head t1.typ), (head t2.typ) with
  | ta, tb when ta = tb -> ()
  | Tarrow(tl1, ft1), Tarrow(tl2, ft2) ->
      let rec loop l1 l2 = match l1, l2 with
      | [], [] -> ()
      | [], _ | _, [] -> unification_error t1 t2
      | h1::t1, h2::t2 -> loop t1 t2; unify h1 h2
      in loop tl1 tl2; unify ft1.typ ft2.typ
  | Tlist(t1'), Tlist(t2') | Tmaybe(t1'), Tmaybe(t2') -> unify t1' t2'
  | Tvar v, t -> if occur v t then unification_error t1 t2 else v.typ <- Some(t2)
  | t, Tvar v -> if occur v t then unification_error t1 t2 else v.typ <- Some(t1)
  | _ -> unification_error t1 t2

module Vset = Set.Make(V)

let rec fvars t = match head t with
  | Tint | Tbool | Tstring | Tunit -> Vset.empty
  | Tarrow(tl, ft) -> List.fold_left (fun acc t' -> Vset.union acc (fvars t')) Vset.empty (ft.typ::tl)
  | Tvar v -> Vset.singleton v

type schema = { vars : Vset.t; typ : full_type }

module Smap = Map.Make(String)

type env = { bindings : schema Smap.t; fvars : Vset.t }

let empty = { bindings = Smap.empty; fvars = Vset.empty }

let add s (t : full_type) env =
  let fvs = fvars t.typ in
  { bindings = Smap.add s { vars = Vset.empty ; typ = t } env.bindings;
    fvars = Vset.union fvs env.fvars }

let add_gen s (t : full_type) env =
  let fvs = fvars t.typ in
  let nfvars = (Vset.fold 
    (fun v acc -> Vset.union (fvars (Tvar v)) acc )
    env.fvars Vset.empty) in
  { bindings = Smap.add s { vars = Vset.diff fvs nfvars ; typ = t } env.bindings;
    fvars = nfvars }

module Vmap = Map.Make(V)

let find s env =
  let schem = Smap.find s env.bindings in
  let rec aux t vm = match head t with
    | Tint | Tbool | Tstring | Tunit -> t, vm
    | Tarrow(tl, ft) ->
        let tl', vm' = List.fold_right 
          (fun t (acc, vm) ->
            let t', vm' = aux t vm in
            t'::acc, vm')
          tl [] in
        let t', vm'' = aux ft.typ, vm' in
        Tarrow(tl', { typ = t'; effect = ft.effect }), vm''
    | Tlist(t) ->
        let t', vm' = aux t vm in
        Tlist(t'), vm' 
    | Tmaybe(t) ->
      let t', vm' = aux t vm in
      Tmaybe(t'), vm' 
    | Tvar v when Vset.mem v schem.vars -> begin match Vmap.find_opt v vm with
      | Some(v') -> Tvar v', vm
      | None -> 
          let v' = V.create () in
          Tvar v', Vmap.add v v' vm
      end
    | Tvar v -> Tvar v, vm
  in 
  let t = (Smap.find s env.bindings).typ in
  { typ = fst (aux t.typ Vmap.empty); effect = t.effect}

(* Calcule le nouvel effet total après lui avoir rajouté un effet *)
let add_effect effect add = match effect, add with
  | Full, _ | _, Full -> Full
  | e, NoEffect | NoEffect, e -> e
  | e, f when e = f -> e
  | _ -> Full

let effect_of_ident id = match id with
  | "div" -> Div
  | "console" -> Console
  | _ -> failwith "effet inexistant"

type waiting_type = { mutable typ : typ option }

(* Renvoie la tdecl correspondant à la decl, et le nouvel environnement *)
let rec w_decl env decl =
  let fb, tl, ft = w_funbody env Some(decl.name) decl.body in
  { name = decl.name; body = fb}, (add decl.name { typ = Tarrow(tl, ft); effect = ft.effect } env)

(* Renvoie le tfunbody correspondant au funbody, la liste de types des paramètres, et le type de renvoi de la fonction*)
and w_funbody env name fb =
  let env, tl, formal' = List.fold_right 
    (fun (x, t, loc) (env, tl, fl) -> 
      let t' = w_type env t in
      add x { typ = t'; effect = NoEffect } env, t'::l, (x, t', loc)::fl) 
      fb.formal (env, [], []) in
  let ft, tbody = match fb.annot with
  | Some(k) -> 
      let ft = w_result env k in
      let env = match name with
        | Some(f) -> add f { typ = Tarrow(tl, ft) ; effect = NoEffect } env
        | None -> env'
      in let tbody = w_bexpr env fb.body name { typ = Some(ft) } in
      (try unify tbody.typ ft with UnificationFailure _,_ -> failwith "La fonction renvoie le mauvais type");
      tbody
  | None ->
      w_bexpr env fb.body name None
  in { formal = formal' ; annot = (il, ft, loc) ; body = tbody ; typ = { typ = Tarrow(tl, ft); effect = NoEffect }}, tl, ft

(* CHANGER LES COMPARAISONS DE TYPE EN UNIFY ? *)

(* Renvoie le tbexpr correspondant à bexpr et vérifie que les éventuels return sont du bon type *)
and w_bexpr env bexpr fun_name return_type = match bexpr.bexpr with
  | EBlock sl -> 
      let tsl, ft = ( List.fold_left 
        (fun (acc, env, ft) stmt -> 
          let (tstmt, env') = w_stmt env stmt fun_name return_type in
          (acc @ [tstmt], env', { typ = head tstmt.typ.typ; effect = add_effect ft.effect tstmt.typ.effect }))
        ([], env, { typ = Tunit; effect = NoEffect }) sl ) in
      { bexpr = EBlock tsl;
        loc = bexpr.loc;
        typ = ft
      }
  | ETild be ->
      let tbe = w_bexpr env be fun_name return_type in
      match head tbe.typ.typ with
      | Tint -> { bexpr = ETild(be'.bexpr); loc = bexpr.loc; typ = tbe.typ }
      | _ -> failwith "~ doit être utilisée sur un entier"
  | Enot be ->
      let tbe = w_bexpr env be fun_name return_type in
      match head tbe.typ.typ with
      | Tbool -> { bexpr = ETild(be'.bexpr); loc = bexpr.loc; typ = tbe.typ }
      | _ -> failwith "! doit être utilisée sur un booléen"
  | EBinop(op, be1, be2) ->
      let tbe1 = w_bexpr env be1 fun_name return_type in
      let tbe2 = w_bexpr env be2 fun_name return_type in
      begin match op with
      | Add | Sub | Mul | Div | Mod | Lt | Lte | Gt | Gte -> begin match head tbe1.typ.typ, head tbe2.typ.typ with
        | Tint, Tint -> { bexpr = EBinop(op, tbe1, tbe2); loc = bexpr.loc; typ = { typ = Tint; effect = add_effect tbe1.typ.effect tbe2.typ.effect } }
        | _ -> failwith "Opération entre deux objets du mauvais type"
        end
      | Eq | Neq ->
        let t1 = head tbe1.typ.typ in
        let t2 = head tbe2.typ.typ in
        if if t1 <> Tint && t1 <> Tbool && t1 <> Tstring then failwith "Impossible de comparer deux éléments de types autre que int, bool ou string."
        else t1 <> t2 then failwith "Comparaison de deux éléments de types différents"
        else { bexpr = EBinop(op, tbe1, tbe2); loc = bexpr.loc; typ = { typ = t1; effect = add_effect tbe1.typ.effect tbe2.typ.effect } }
      | And | Or -> begin match head tbe1.typ.typ, head tbe2.typ.typ with
        | Tbool, Tbool -> { bexpr = EBinop(op, tbe1, tbe2); loc = bexpr.loc; typ = { typ = Tbool; effect = add_effect tbe1.typ.effect tbe2.typ.effect } }
        | _ -> failwith "Opération entre deux objets du mauvais type"
        end
      | Concat -> begin match head tbe1.typ.typ, head tbe2.typ.typ with
        | Tstring, Tstring -> { bexpr = EBinop(op, tbe1, tbe2); loc = bexpr.loc; typ = { typ = Tstring; effect = add_effect tbe1.typ.effect tbe2.typ.effect } }
        | Tlist(t1), Tlist(t2) ->
            try
              unify t1 t2;
              { bexpr = EBinop(op, tbe1, tbe2); loc = bexpr.loc; typ = { typ = Tlist(t1); effect = add_effect tbe1.typ.effect tbe2.typ.effect } }
            with UnificationFailure _, _ -> failwith "Impossible de concaténer deux listes contenant des types différents"
        | _ -> failwith "Opération entre deux objets du mauvais type"
        end
      end
  | EAsign(id, be) ->
      let tbe = w_bexpr env be fun_name return_type in
      { bexpr = EAsign(id, tbe); loc = bexpr.loc; typ = { typ = Tunit; effect = tbe.typ.effect } }
  | EIf(be1, be2, be3) ->
      let tbe1 = w_bexpr env be1 fun_name return_type in
      let tbe2 = w_bexpr env be2 fun_name return_type in
      let tbe3 = w_bexpr env be2 fun_name return_type in
      let t1 = head tbe1.typ.typ in
      let t2 = head tbe2.typ.typ in
      let t3 = head tbe3.typ.typ in
      if t1 <> Tbool then failwith "'If' attends un booléen"
      else try
        unify t2 t3;
        { bexpr = EIf(tbe1, tbe2, tbe3); loc = bexpr.loc; typ = { typ = t2; effect = add_effect (add_effect tbe1.typ.effect tbe2.typ.effect) tbe3.typ.effect } }
      with UnificationFailure _, _ -> failwith "Les résultats des deux cas de 'If' doivent être du même type"
  | Efn(fb) ->
      let tfb, tl, ft = w_funbody env None fb in
      { bexpr = EFn(tfb); typ = { typ = Tarrow(tl, ft) }; loc = bexpr.loc }
  | EReturn(be) ->
      let tbe = w_bexpr env be fun_name return_type in
      begin match return_type.typ with
      | None -> 
          return_type.typ <- Some(tbe.typ.typ);
          { bexpr = EReturn(tbe); typ = tbe.typ; loc = bexpr.loc }
      | Some(t) -> 
          if t = tbe.typ.typ then { bexpr = EReturn(tbe); typ = tbe.typ; loc = bexpr.loc }
          else failwith "Mauvais type retourné."
      end
  | ATrue -> { bexpr = ATrue; typ = { typ = Tbool; effect = NoEffect }; loc = bexpr.loc }
  | AFalse -> { bexpr = AFalse; typ = { typ = Tbool; effect = NoEffect }; loc = bexpr.loc }
  | Int(n) -> { bexpr = Int(n); typ = { typ = Tint; effect = NoEffect}; loc = bexpr.loc }
  | String(s) -> { bexpr = String(s); typ = { typ = Tstring; effect = NoEffect}; loc = bexpr.loc}
  | Empty -> { bexpr = Empty; typ = { typ = Unit; effect = NoEffect }; loc = be.loc }
  | Ident(id) -> 
      try 
        let t = find id env in
        let eff = if Some(id) = fun_name then add_effect t.effect Div else t.effect in
        { bexpr = Ident(id); typ = { typ = t.typ; effect = eff }; loc = bexpr.loc } 
      with Not_found -> failwith "Variable inconnue"
  | Eval(f, args) ->
      begin match f.bexpr with
      | Ident("println") ->
          begin match args with
          | [be] ->
              let tbe = w_bexpr env be fun_name return_type in
              if List.mem (head tbe.typ.typ) [Tunit; Tbool; Tint; Tstring] then
                { bexpr = Println(tbe); typ = { typ = Tunit; effect = add_effect Console tbe.effect }; loc = bexpr.loc }
              else failwith "Argument du mauvais type pour println"
          | _ -> failwith "Mauvais nombre d'arguments pour println"
          end
      | Ident("default") ->
          begin match args with
          | [be1; be2] ->
              let tbe1 = w_bexpr env be1 fun_name return_type in
              let tbe2 = w_bexpr env be2 fun_name return_type in
              try
                unify tbe1.typ { typ = Tmaybe tbe2.typ.typ; effect = tbe2.typ.effect };
                { bexpr = Ident(tbe1, tbe2); typ = { typ = tbe2.typ.typ; effect = add_effect tbe1.typ.effect tbe2.typ.effect }; loc = bexpr.loc }
              with UnificationFailure _, _ -> failwith "Arguments incompatibles"
          | _ -> failwith "Mauvais nombre d'arguments pour default"
          end
      | Ident("head") ->
          begin match args with
          | [be] ->
              let tbe = w_bexpr env be fun_name return_type in
              try
                unify tbe.typ { typ = Tlist (V.create ()); effect = NoEffect };
                { bexpr = Head(tbe); typ = { typ = Tmaybe tbe.typ.typ; effect = tbe.typ.effect }; loc = bexpr.loc }
              with UnificationFailure _, _ -> failwith "head prend une liste en argument"
          | _ -> failwith "Mauvais nombre d'arguments pour head"
          end
      | Ident("tail") ->
          begin match args with
          | [be] ->
              let tbe = w_bexpr env be fun_name return_type in
              try
                unify tbe.typ { typ = Tlist (V.create ()); effect = NoEffect };
                { bexpr = Tail(tbe); typ = tbe.typ; loc = bexpr.loc }
              with UnificationFailure _, _ -> failwith "tail prend une liste en argument"
          | _ -> failwith "Mauvais nombre d'arguments pour tail"
          end
      | Ident("for") ->
          begin match args with
          | [be1; be2; be3] ->
              let tbe1 = w_bexpr env be1 fun_name return_type in
              let tbe2 = w_bexpr env be2 fun_name return_type in
              let tbe3 = w_bexpr env be3 fun_name return_type in
              begin match head tbe1.typ.typ, head tbe2.typ.typ, head tbe3.typ.typ with
              | Tint, Tint, Tarrow([Tint], { typ = Tunit; effect = eff }) ->
                  { bexpr = For(tbe1, tbe2, tbe3); typ = { typ = Tunit; effect = add_effect tbe1.typ.effect (add_effect tbe2.typ.effect (add_effect tbe3.typ.effect eff)) }, loc = bexpr.loc }
              | _ -> failwith "For attends un entier de début, un entier de fin et un contenu de la forme (int)->unit."
              end
          | _ -> failwith "For attends un entier de début, un entier de fin et un contenu de la forme (int)->unit."
          end
      | Ident("repeat") ->
          begin match args with
          | [be1; be2] ->
              let tbe1 = w_bexpr env be1 fun_name return_type in
              let tbe2 = w_bexpr env be2 fun_name return_type in
              begin match head tbe1.typ.typ, head tbe2.typ.typ with
              | Tint, Tarrow([], { typ = Tunit; effect = eff}) ->
                  { bexpr = Repeat(tbe1, tbe2); typ = { typ = Tunit; effect = add_effect tbe1.typ.effect (add_effect tbe2.typ.effect eff) }; loc = bexpr.loc }
              | _ -> failwith "Repeat attends un nombre de répétitions ainsi qu'un contenu de la forme ()->unit"
              end
          | _ -> failwith "Repeat attends un nombre de répétitions ainsi qu'un contenu de la forme ()->unit"
          end
      | Ident("while") ->
          begin match args with
          | [be1; be2] ->
              let tbe1 = w_bexpr env be1 fun_name return_type in
              let tbe2 = w_bexpr env be2 fun_name return_type in
              begin match head tbe1.typ.typ, head tbe2.typ.typ with
              | Tarrow([], { typ = Tbool; effect = eff1 }), Tarrow([], { typ = Tunit; effect = eff2}) ->
                  { bexpr = While(tbe1, tbe2); typ = { typ = Tunit; effect = add_effect tbe1.typ.effect (add_effect eff1 (add_effect tbe2.typ.effect (add_effect eff2))) }; loc = bexpr.loc }
              | _ -> failwith "While attends ..."
              end
          | _ -> failwith "While attends ..."
          end
      | _ ->
          let tf = w_bexpr env f fun_name return_type in
          let targs = List.map (fun arg -> w_bexpr env arg fun_name return_type) args in
          let tl, rt = match head tf.typ.typ with
          | Tarrow(tl, rt) -> t
          | _ -> failwith "Fonction attendue"
          in let rec loop l1 l2 = match l1, l2 with
          | [], [] -> ()
          | _, [] | [], _ -> failwith "Nombre d'arguments invalide"
          | h1::t1, h2::t2 -> 
              try unify head h1 head h2.typ.typ; loop t1 t2 with UnificationFailure _,_ -> failwith "Arguments de mauvais type"
          in loop tl, targs;
          let eff = add_effect tf.typ.effect (add_effect rt.effect (List.fold_left (fun acc x -> add_effect acc x.typ.effect) NoEffect targs)) in
          { bexpr = Eval(tf, targs); typ = { typ = rt; effect = eff }; loc = bexpr.loc}
      end
  | Fn(be, fb) ->
      let real_be = match be.bexpr with
      | Eval(be', args) -> { bexpr = Eval(be', args@[EFn(fb)]); loc = bexpr.loc } 
      | _ -> { bexpr = Eval(be, [EFn(fb)]); loc = bexpr.loc }
      in w_bexpr env real_be fun_name return_type
  | AtomBlock(be, sl) ->
      let real_be = match be.bexpr with
      | Eval(be', args) -> { bexpr = Eval(be', args@[EFn({ formal = []; annot = None; body = EBlock(sl) })]); loc = bexpr.loc }
      | _ -> { bexpr = Eval(be, [EFn({ formal = []; annot = None; body = EBlock(sl) })]); loc = bexpr.loc }
      in w_bexpr env real_be fun_name return_type
  | Brac(bel) ->
      let tbel = List.map (fun x -> w_bexpr env x fun_name return_type) bel in
      begin match tbel with
      | [] -> { bexpr = List([]); typ = { typ = V.create(); effect = NoEffect }; loc = bexpr.loc}
      | h::t ->
          let t = h.typ in
          let eff = List.fold_left 
            (fun acc x -> 
              try
                unify x.typ t;
                add_effect acc x.typ.effect
              with UnificationFailure _, _ -> failwith "Une file ne peut contenir qu'un seul type")
          in { bexpr = List(tbel); typ = { typ = Tlist(t.typ); effect = eff }; loc = bexpr.loc }
      end

(* Renvoie le tstmt correspondant à stmt ainsi que le nouvel environnement *)
and w_stmt env stmt fun_name return_type = match stmt.stmt with
  | SBexpr(be) ->
      let tbe = w_bexpr env be fun_name return_type in
      { stmt = SBexpr(tbe); typ = tbe.typ; loc = stmt.loc }, env
  | SDecl(id, be) ->
      let tbe = w_bexpr env be fun_name return_type in
      let env' = add id tbe.typ env in
      { stmt = SDecl(id, stmt); typ = { typ = Empty; effect = tbe.effect }; loc = stmt.loc }
  | SVar(id, be) ->
    let tbe = w_bexpr env be fun_name return_type in
    let env' = add id tbe.typ env in
    { stmt = Svar(id, stmt); typ = { typ = Empty; effect = tbe.effect }; loc = stmt.loc }
  
(* Renvoie le full_type correspondant au résulat res *)
and w_result env res = match res.res with
  | idl, t -> 
    { typ = t.typ; 
      effect = add_effect (List.fold_left (fun acc id -> add_effect acc (effect_of_ident id)) [] idl) t.effect }

(* Renvoie le full_type correspondant au kokaType typ *)
and w_type env typ = match typ with
  | TAType(t) -> w_type env t
  | TFun(t, res) ->
      let ft_res = w_result env res in
      let ft_in = w_type env t in
      { typ = Tarrow([ft_int.typ], ft_res); effect = NoEffect }
  | TMulFun(tl, res) ->
      let ft_res = w_result env res in
      let tl_in = List.map (fun t -> (w_type env t).typ) tl in
      { typ = Tarrow(tl_in, ft_res); effect = NoEffect }

let w (file : file)  = 
  fst (List.fold_right 
  (fun decl (acc, env) -> 
    let decl', env' = w_decl env decl in
    decl'::acc, env')
  file ([], empty))