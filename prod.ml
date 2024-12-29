open Algow
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