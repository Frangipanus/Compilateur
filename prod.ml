open Algow
open Ast
open Format
open X86_64

let nb_string = ref 0  
module V = struct
  type t = string
  let compare v1 v2 = Stdlib.compare v1 v2
  let equal v1 v2 = v1 = v2
  let create = ""
end
module VSet = Set.Make(V)

module Smap = Map.Make(String)

type local_env = ident Smap.t
  

type pparam = {
  name : ident;
  typ : typ;
  loc : loc
}

  
(* statement *)
and pstmt = {
  stmt  : pstmt1;
  loc   : loc;
  typ   : full_type;
}

and pstmt1 =
  | SBexpr of pbexpr
  | SDecl of ident * pbexpr
  | SVar of ident * pbexpr
  
(* expression *)
and pbexpr = {
  bexpr : pbexpr1;
  loc   : loc;
  typ   : full_type
}

and pbexpr1 = 
  | EBlock of tstmt list
  | ETild of pbexpr
  | ENot of pbexpr
  | EBinop of binop * pbexpr * pbexpr
  | EAsign of ident * pbexpr
  | EIf of pbexpr * pbexpr * pbexpr 
  | EFn of tfunbody 
  | EReturn of pbexpr
  | ATrue
  | AFalse
  | Int of int
  | String of string 
  | Empty 
  | Evar of vars
  | Eval of pbexpr * (pbexpr list)
  | List of pbexpr list
  | Println of pbexpr
  | Default of pbexpr * pbexpr
  | Head of pbexpr
  | Tail of pbexpr
  | For of pbexpr * pbexpr * pbexpr
  | Repeat of pbexpr * pbexpr
  | While of pbexpr * pbexpr
  
(* corps d'une fonction *)
and pfunbody = {
  formal : pparam list; (* arguments *)
  body   : pbexpr;
  typ    : full_type;
}
  
(* declaration de fonctions *)
and pdecl = {
  name : string;
  body : pfunbody;
}
  
(* fichier *)
and pfile = pdecl list
and vars = 
  |Vlocal of int 
  |Vclos of int 
  |Varg of int 




let rec freevars (exp : tbexpr) = 
  match  exp.bexpr with
  | ATrue |AFalse |String(_) |Empty -> VSet.empty
  | Ident(s) -> VSet.singleton s
  |EFn(t) -> freevars4 t
  | Head(t)|Tail(t)|Println(t) -> freevars t 
  |Default(e1,e2) -> VSet.union (freevars e1) (freevars e2)
  |For(e1,e2,e3) |EIf(e1,e2,e3)-> VSet.union (freevars e1) (VSet.union (freevars e2) (freevars e3))
  |Repeat(e1, e2)|While(e1,e2) -> VSet.union (freevars e1) (freevars e2)
  |List(lst) -> List.fold_left (fun acc x -> VSet.union acc (freevars x)) VSet.empty lst
  |Eval(e1, lst) -> VSet.union (freevars e1) (List.fold_left (fun acc x -> VSet.union acc (freevars x)) VSet.empty lst)
  |EReturn(t) -> freevars t
  |EAsign(id, t) -> VSet.union (freevars t) (VSet.singleton id)
  |EBinop(_, e1,e2) -> VSet.union (freevars e1) (freevars e2)
  |ENot(t) -> freevars t 
  |ETild(t) -> freevars t 
  |EBlock(lst) -> VSet.empty
  |Int(_) -> VSet.empty
and freevars2 (t : tstmt) = match  t.stmt with
| SBexpr(t) -> freevars t 
| SDecl(id, t)|SVar(id, t) -> VSet.diff (freevars t) (VSet.singleton id)

and freevars3 (t : tdecl) = 
  freevars4 t.body
and freevars4 (t:tfunbody) = 
  (let acc = freevars t.body in let names = VSet.of_list (List.map (fun (x:tparam) -> x.name) t.formal) in VSet.diff acc names  )


let rec closure_exp (env:local_env) (fcpur : int) (e : tbexpr) = 
  let b, fcpur = (match e.bexpr with 
  |ATrue -> ATrue, fcpur
  |AFalse -> AFalse, fcpur
  |Int(n) -> Int(n), fcpur
  |String(s) -> String(s), fcpur
  |Empty -> Empty, fcpur
  |Ident(id) -> failwith "not yemapt"
  |Eval(e, lst) -> failwith "not yet"
  |List(lst) -> let ls, fmax = List.fold_left (fun (lst1, fmax) (exp : tbexpr) ->let e, fmax' =  closure_exp env fcpur exp in (e::lst1, max fmax fmax')) ([], fcpur) lst in List(ls), fmax
  |Println(e) -> let e1, fcpur = closure_exp env fcpur e in Println(e1), fcpur
  |Default(e1, e2) -> let e1, fcmax = closure_exp env fcpur e1 in 
                      let e2, fbax = closure_exp env fcpur e2
                      in Default(e1,e2), max fcmax fbax
  |Head(e) -> Head(fst (closure_exp env fcpur e)), snd (closure_exp env fcpur e)
  |Tail(e) -> Tail(fst (closure_exp env fcpur e)), fcpur
  |For(e1,e2,e3) -> let e1, f1 = closure_exp env fcpur e1 in 
                    let e2, f2 = closure_exp env fcpur e2 in 
                    let e3, f3 = closure_exp env fcpur e3 in 
                    For(e1,e2,e3), (max f1 (max f2 f3))
  |Repeat(e1, e2) -> let e1, f1 = closure_exp env fcpur e1 in 
                     let e2,f2 = closure_exp env fcpur e2 
                    in Repeat(e1,e2), f2
  |While(e1,e2) -> let e1, fm1 =  closure_exp env fcpur e1 in 
                   let e2, fm2 =  closure_exp env fcpur e2
                  in While(e1, e2), max fm1 fm2
  |EBlock(lst) -> failwith "not yet"
  |ETild(e) -> ETild(fst(closure_exp env fcpur e)), snd (closure_exp env fcpur e)
  |ENot(e)-> ENot(fst(closure_exp env fcpur e)), snd (closure_exp env fcpur e)
  |EBinop(o, e1, e2)-> let e1, fm1 =  closure_exp env fcpur e1 in 
                       let e2, fm2 =  closure_exp env fcpur e2 in 
                       EBinop(o, e1, e2), max fm1 fm2
  |EAsign(id, e) -> EAsign(id, fst (closure_exp env fcpur e)), snd (closure_exp env fcpur e) 
  |EIf(e1, e2,e3) -> ( let e1, f1 = closure_exp env fcpur e1 in 
                       let e2, f2 =  closure_exp env fcpur e2 in 
                       let e3, f3 =closure_exp env fcpur e3 in 
                       EIf(e1,e2,e3), max (max f1 f2) f3)
  |EFn(t) -> failwith "not yet"
  |EReturn(e)-> EReturn(fst(closure_exp env fcpur e)), snd (closure_exp env fcpur e))
in 
  
  {bexpr = b; loc = e.loc; typ = e.typ}, fcpur

let compile (f : tfile) = 
  let ofile = "test.s" in
  let p =
    { text =
        globl "main" ++ label "main" ++
        movq !%rsp !%rbp ++
        movq (imm 0) !%rax ++ (* exit *)
        ret ++
        label "print_int" ++
        movq !%rdi !%rsi ++
        movq (ilab ".Sprint_int") !%rdi ++
        movq (imm 0) !%rax ++
        call "printf" ++
        ret 
        ;
      data =
          (label ".Sprint_int" ++ string "%d\n" ++ label ".Sprint_vrai" ++ string "True" ++ label ".Sprint_faux" ++ string "Faux" ++ label ".Sprint_string" ++ string "%s" )
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f