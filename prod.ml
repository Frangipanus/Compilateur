open Algow
open Ast
open Format
open X86_64

let nb_anno = ref 0
let nb_str = ref 0
let option_if = ref 0
let variables_str = Hashtbl.create 17
let nb_string = ref 0  
let concat_lst = ref 0 
let default_nb = ref 0 
let nb_boulces = ref 0
let lst_func = Hashtbl.create 17
let division = ref 0
let fin_fonc = ref 0 
let lazy_koka = ref 0
module V = struct
  type t = string
  let compare v1 v2 = Stdlib.compare v1 v2
  let equal v1 v2 = v1 = v2
  let create = ""
end
module VSet = Set.Make(V)

module Smap = Map.Make(String)

type local_env = int Smap.t


  
(* statement *)
and pstmt = {
  stmt  : pstmt1;
  loc   : loc;
  typ   : full_type;
}

and pstmt1 =
  | SBexpr of pbexpr
  | SDecl of int * pbexpr
  | SVar of int * pbexpr
  
(* expression *)
and pbexpr = {
  bexpr : pbexpr1;
  loc   : loc;
  typ   : full_type
}

and pbexpr1 = 
  | EBlock of pstmt list (*ok*)
  | ETild of pbexpr (*OK*)
  | ENot of pbexpr(*OK*)
  | EBinop of binop * pbexpr * pbexpr(*OK*)
  | EAsign of vars * pbexpr(*OK*)
  | EIf of pbexpr * pbexpr * pbexpr (*OK*)
  | EReturn of pbexpr (*OK*)
  | ATrue(*OK*)
  | AFalse(*OK*)
  | Int of int(*OK*)
  | String of string (*OK*)
  | Empty (*OK*)
  | Evar of vars  (*OK*)
  | Eval of pbexpr * (pbexpr list)
  | Lists of pbexpr list (*ok*)
  | Println of pbexpr(*OK*)
  | Default of pbexpr * pbexpr (*OK*)
  | Head of pbexpr(*OK*)
  | Tail of pbexpr(*OK*)
  | For of pbexpr * pbexpr * pbexpr 
  | Repeat of pbexpr * pbexpr  (*OK*)
  | While of pbexpr * pbexpr (*OK*)
  |EClos of ident * vars list (*OK*)
  
(* corps d'une fonction *)
and pfunbody = {
  formal : tparam list; (* arguments *)
  body   : pbexpr;
  typ    : full_type;
  clot  : ident list;
}
  
(* declaration de fonctions *)
and pdecl = {
  name : string;
  body : pfunbody;
  size : int;
}
  
(* fichier *)
and pfile = pdecl list
and vars = 
  |Vlocal of int 
  |Vclos of int 
  |Varg of int 
  |Vglob of int
  |Vfunc of string




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
  |EBlock(lst) -> let bon, mauvais = List.fold_left (fun (acc1,acc2) x -> let oui, non =  (freevars2 x) in (VSet.union acc1 oui,VSet.union acc2 non)) (VSet.empty, VSet.empty) lst in 
                                    VSet.diff bon mauvais
  |Int(_) -> VSet.empty
and freevars2 (t : tstmt) = match  t.stmt with
| SBexpr(t) -> freevars t , VSet.empty
| SDecl(id, t)|SVar(id, t) -> (VSet.diff (freevars t) (VSet.singleton id)), VSet.singleton id

and freevars3 (t : tdecl) = 
  freevars4 t.body
and freevars4 (t:tfunbody) = 
  (let acc = freevars t.body in let names = VSet.of_list (List.map (fun (x:tparam) -> x.name) t.formal) in VSet.diff acc names  )


let rec closure_exp glob (acomp: tdecl list ref)  clot (param:local_env) (env:local_env) (fcpur : int) (e : tbexpr) = 
let b, fcpur = (match e.bexpr with 
  |ATrue -> ATrue, fcpur
  |AFalse -> AFalse, fcpur
  |Int(n) -> Int(n), fcpur
  |String(s) -> String(s), fcpur
  |Empty -> Empty, fcpur
  |Ident(id) ->  if Hashtbl.mem lst_func id then ((Evar(Vfunc(id)), fcpur) )
              else (if Smap.mem id env then (Evar(Vlocal(Smap.find id env)), fcpur)
                  else( if Smap.mem id glob then (Evar(Vglob(Smap.find id glob)), fcpur) 
                else(if Smap.mem id param then (Evar(Varg(8*(Smap.find id param))), fcpur)
                  else( if (Smap.mem id clot) then( (Evar(Vclos(8*(Smap.find id clot + 1))), fcpur) )
                  else (  (failwith "Note Yet Man"))))))
  |Eval(e, lst) -> let e1, f1 = closure_exp glob acomp  clot param env fcpur e in 
                    let ls, fmax = List.fold_left (fun (lst1, fmax) (exp : tbexpr) ->let e, fmax' =  closure_exp glob acomp  clot param env fcpur exp in (lst1@[e], max fmax fmax')) ([], fcpur) lst in
                    Eval(e1, ls), max fmax f1
  |List(lst) -> let ls, fmax = List.fold_left (fun (lst1, fmax) (exp : tbexpr) ->let e, fmax' =  closure_exp glob acomp  clot param env fcpur exp in (lst1@[e], max fmax fmax')) ([], fcpur) lst in Lists(ls), fmax
  |Println(e) -> let e1, fcpur = closure_exp glob acomp  clot param env fcpur e in Println(e1), fcpur
  |Default(e1, e2) -> let e1, fcmax = closure_exp glob acomp  clot param env fcpur e1 in 
                      let e2, fbax = closure_exp glob acomp  clot param env fcpur e2
                      in Default(e1,e2), max fcmax fbax
  |Head(e) ->let acc =(closure_exp glob acomp  clot param env fcpur e) in  Head(fst acc), snd acc
  |Tail(e) -> Tail(fst (closure_exp glob acomp  clot param env fcpur e)), fcpur
  |For(e1,e2,e3) -> let e1, f1 = closure_exp glob acomp  clot param env fcpur e1 in 
                    let e2, f2 = closure_exp glob acomp  clot param env fcpur e2 in 
                    let e3, f3 = closure_exp glob acomp  clot param env fcpur e3 in 
                    For(e1,e2,e3), (max f1 (max f2 f3))
  |Repeat(e1, e2) -> (
                    let e1, f1 = closure_exp glob acomp  clot param env fcpur e1 in 
                     let e2,f2 = closure_exp glob acomp  clot param (env) fcpur e2 
                    in Repeat(e1,e2), f2)
  |While(e1,e2) ->(let e1, fm1 =  closure_exp glob acomp  clot param env fcpur e1 in 
                   let e2, fm2 =  closure_exp glob acomp  clot param (env) fcpur e2
                  in While(e1, e2), max fm1 fm2)
  |EBlock(lst) -> let glob = (Smap.fold (fun key elem acc ->Smap.add key elem acc) (env) glob) in let ls, fmax , _, _= List.fold_left (fun (lst1, fmax, nv, glob) (exp : tstmt) ->let e, fmax, nv, glob =  closure_stmt glob  acomp   clot param nv fmax exp in (lst1@[e], fmax, nv, glob)) ([], fcpur, env, glob) lst in EBlock(ls), fmax
  |ETild(e) -> let acc = closure_exp glob acomp  clot param env fcpur e in  ETild(fst(acc)), snd acc
  |ENot(e)->let acc =closure_exp glob acomp  clot param env fcpur e in   ENot(fst acc), snd acc
  |EBinop(o, e1, e2)-> let e1, fm1 =  closure_exp glob acomp  clot param env fcpur e1 in 
                       let e2, fm2 =  closure_exp glob acomp  clot param env fcpur e2 in 
                       EBinop(o, e1, e2), max fm1 fm2
  |EAsign(id, e) -> let acc = (closure_exp glob acomp  clot param env fcpur e) in 
                    let accu = (if Smap.mem id env then ((Vlocal(Smap.find id env)))
                    else( if Smap.mem id glob then ((Vglob(Smap.find id glob))) 
                  else(if Smap.mem id param then ((Varg(8*(Smap.find id param))))
                    else( if (Smap.mem id clot) then( ((Vclos(8*(Smap.find id clot + 1)))) )
                    else ( if Hashtbl.mem lst_func id then ((Vfunc(id))) 
                  else (failwith "Note Yet Man")))))) in 
                           EAsign(accu, fst acc), snd acc
  |EIf(e1, e2,e3) -> ( let e1, f1 = closure_exp glob acomp  clot param env fcpur e1 in 
                       let e2, f2 =  closure_exp glob acomp  clot param env fcpur e2 in 
                       let e3, f3 =closure_exp glob acomp  clot param env fcpur e3 in 
                       EIf(e1,e2,e3), max (max f1 f2) f3)
  |EFn(t) -> begin 
                let name = "fun_"^(string_of_int (!nb_anno)) in 
                nb_anno := !nb_anno + 1;
                acomp := (!acomp)@[({name = name; body = t})];
                let free = freevars4 t in 
                let var_lst =  (VSet.elements free) in 
                let var_lst2 = List.map (fun id -> (if Smap.mem id env then ((Vlocal(Smap.find id env)))
                else( if Smap.mem id glob then ((Vglob(Smap.find id glob))) 
              else(if Smap.mem id param then ((Varg(8*(Smap.find id param))))
                else( if (Smap.mem id clot) then ((Vclos(8*(Smap.find id clot)))) 
                else (failwith "Note Yet sry")))))) var_lst in 
                EClos(name, var_lst2), fcpur
             end
  |EReturn(e)->let acc =(closure_exp glob acomp  clot param env fcpur e) in  EReturn(fst acc), snd acc)
in 
  {bexpr = b; loc = e.loc; typ = e.typ}, fcpur

and closure_stmt glob  acomp   clot param env fcpur (s : tstmt)  = 
  match s.stmt with 
  |SBexpr(t) -> let e1, fcpur = closure_exp glob acomp  clot param env fcpur t in {stmt = SBexpr(e1); loc = s.loc; typ = s.typ}, fcpur, env, glob
  |SDecl(id, t) ->let e1, fcpur2 = closure_exp glob acomp  clot param ( env ) (fcpur + 8 ) t in 
                    {stmt = SDecl(fcpur, e1); loc = s.loc; typ = s.typ}, fcpur2, (Smap.add id (fcpur) env ), glob
  |SVar(id, t) -> let e1, fcpur2 = closure_exp glob acomp  clot param ( env ) (fcpur + 8 ) t in 
                    {stmt = SVar(fcpur, e1); loc = s.loc; typ = s.typ}, fcpur2, (Smap.add id (fcpur) env ), glob
  
and closure_funbody glob  (acomp: tdecl list ref)   clot param env fcpur (f : tfunbody) = 
  let free= freevars4 f in 
  let par_lst = List.map (fun (elem: tparam) -> elem.name) f.formal in 
  let s1 = (list_to_smap (VSet.elements free)) in 
  let s2 = list_to_smap par_lst in 
  let acc = (closure_exp glob acomp  s1 s2 Smap.empty 8 f.body) in
  {formal = f.formal; body = fst acc; typ = f.typ; clot = VSet.elements free }, snd  (acc)

  
and list_to_smap lst : local_env= 
  let acc = ref 0 in 
   let accu = List.fold_left (fun elem id -> acc := !acc + 1; Smap.add id (!acc-1) elem) (Smap.empty) lst
in  accu
and cloture_delc (acomp : tdecl list ref) (d : tdecl) =
  Hashtbl.add lst_func d.name d.name;
  let glob = Smap.empty in 
  let acc = ( closure_funbody glob  acomp   Smap.empty Smap.empty Smap.empty 8 d.body) in
  {name = d.name; body = fst acc; size = snd acc }

and clotur_tfile (f : tdecl list) : pdecl list = 

  let acomp = ref f in 
  let res = ref [] in 
  let nb_comp = ref 0 in 
  while List.length (!acomp) > !nb_comp do 
    res := (!res)@[cloture_delc acomp (List.nth (!acomp) (!nb_comp) )];
    nb_comp := !nb_comp + 1
  done;
  !res
 




let rec compile_expr  (e : pbexpr) = match e.bexpr with 
  |Empty -> nop
  |ENot(b) -> compile_expr b ++ popq rax ++ notb !%al ++ andq (imm 1) !%rax ++ pushq !%rax
  |ETild(b) -> division := !division + 1; compile_expr b ++ popq rax ++ andq !%rax !%rax ++ jz ("pasnon_"^(string_of_int !division))  ++negq !%rax ++ label ("pasnon_"^(string_of_int !division)) ++ pushq !%rax
  |EBlock(lst) -> List.fold_left (fun acc elem ->  acc ++ compile_stmt  elem ++ popq rax )  nop lst ++ pushq !%rax
  |String(str) -> (Hashtbl.add variables_str str (!nb_str); nb_str := !nb_str + 1; movq (lab ("$.string_"^(string_of_int (Hashtbl.find variables_str str)))) !%rax ++ pushq !%rax)
  |Int(n) -> pushq (imm n) 
  |Println(b) -> (if head b.typ.typ = Tstring then let t =(compile_expr  b) in t ++ popq rax ++ pushq !%rdi ++ pushq !%rsi  ++movq !%rax !%rdi ++ call "print_string" ++ popq rsi ++ popq rdi  else (if head b.typ.typ = Tint then let t =(compile_expr  b) in t ++ popq rax++pushq !%rdi ++ pushq !%rsi  ++ movq !%rax !%rdi ++ call "print_int" ++ popq rsi ++popq rdi else (if head b.typ.typ = Tbool then  let t =(compile_expr  b) in t ++ popq rax ++pushq !%rdi ++ pushq !%rsi  ++ movq !%rax !%rdi ++ call "print_bool" ++ popq rsi ++popq rdi
                  else (nop)))) ++ pushq (imm 0)
  |ATrue -> movq (imm 1) !%rax ++ pushq !%rax
  |AFalse -> movq (imm 0) !%rax ++ pushq !%rax
  |EBinop(op, e, e2) -> (concat_lst := !concat_lst + 1;let e1 = compile_expr e in 
                          concat_lst := !concat_lst + 1;
                         let e2 = compile_expr e2 in 
                        
                         match op with 
                          |Eq->    e1 ++ e2 ++ popq rax  ++ popq rbx ++  (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ sete !%al ++ pushq !%rax)
                          |Neq ->  e1 ++ e2 ++ popq rax  ++ popq rbx ++  (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setne !%al ++ pushq !%rax)
                          |Lt ->   e1 ++ e2 ++ popq rax  ++ popq rbx ++  (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setl !%al ++ pushq !%rax)
                          |Lte ->  e1 ++ e2 ++ popq rax  ++ popq rbx ++  (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setle !%al ++ pushq !%rax)
                          |Gt ->   e1 ++ e2 ++ popq rax  ++ popq rbx ++  (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setg !%al ++ pushq !%rax)
                          |Gte ->  e1 ++ e2 ++ popq rax  ++ popq rbx ++  (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setge !%al ++ pushq !%rax)
                          |Add ->  e1 ++ e2 ++ popq rax  ++ popq rbx ++  (addq !%rax !%rbx ++ pushq !%rbx)
                          |Sub ->  e1 ++ e2 ++ popq rax  ++ popq rbx ++  (subq !%rax !%rbx ++ pushq !%rbx)
                          |Mul ->  e1 ++ e2 ++ popq rax  ++ popq rbx ++  (imulq !%rax !%rbx ++ pushq !%rbx)
                          |Div ->  division := !division + 1;e1 ++ e2 ++ popq rax  ++ popq rbx ++ movq (imm 0) (!%rdx) ++
                                       (movq !%rax !%rcx ++ movq !%rbx !%rax ++ movq !%rcx !%rbx++(movq (imm 0) (!%rdx)) ++ cqto ++  andq !%rbx !%rbx ++ jz (("fin_div_nulle"^(string_of_int !division)) ) ++ (idivq (!%rbx)) ++ movq !%rax !%r14 ++ testq !%rdx !%rdx ++ jz  ("findiv_"^(string_of_int !division)) ++ movq (imm 0) !%r15++ cmpq !%rdx !%r15 ++ je  ("findiv_"^(string_of_int !division)) ++ cmpq !%r14 !%r15 ++ jle ("findiv_"^(string_of_int !division))  ++ subq (imm 1) !%r14 ++ movq !%r14 !%rax ++jmp ("findiv_"^(string_of_int !division))++label ("fin_div_nulle"^(string_of_int !division))++movq (imm 0) !%rax++ label ("findiv_"^(string_of_int !division))  ++ (pushq !%rax ))
                          |Mod -> division := !division + 1; e1 ++ e2 ++ popq rax  ++ popq rbx ++  (movq !%rax !%rcx ++ movq !%rbx !%rax ++ movq !%rcx !%rbx++ andq !%rbx !%rbx ++ jz ("fin_div_nulle"^(string_of_int !division))++ movq !%rax !%r13++ (movq (imm 0) (!%rdx)) ++ cqto++ (idivq (!%rbx))++ movq (imm 0) !%r15 ++ movq !%rdx !%r14++cmpq !%r14 !%r15 ++ jle (("findiv_"^(string_of_int !division))) ++ cmpq !%rbx !%r15 ++ jle ("pasdemois_"^(string_of_int !division))++ negq !%rbx ++ label (("pasdemois_"^(string_of_int !division)))++addq !%rbx !%r14 ++ movq !%r14 !%rdx  ++jmp ("findiv_"^(string_of_int !division))  ++ label ("fin_div_nulle"^(string_of_int !division)) ++ movq !%rax !%rdx  ++ label ("findiv_"^(string_of_int !division))++ (pushq !%rdx ))
                          |And -> lazy_koka := !lazy_koka + 1; e1 ++popq rax ++andq !%rax !%rax  ++ jz ("lazy_faux"^(string_of_int !lazy_koka)) ++movq (imm 0) !%rbx  ++e2 ++ popq rax  ++ popq rbx ++  (andq !%rbx !%rax ++ pushq !%rax)++ jmp ("fin_lazy"^(string_of_int !lazy_koka))  ++ label ("lazy_faux"^(string_of_int !lazy_koka)) ++ pushq (imm 0) ++ label ("fin_lazy"^(string_of_int !lazy_koka)) 
                          |Or -> lazy_koka := !lazy_koka + 1; e1 ++ popq rax ++ jnz ("lazy_true"^(string_of_int !lazy_koka)) ++ e2 ++ popq rax  ++ popq rbx ++  (orq !%rbx !%rax ++ pushq !%rax) ++jmp  ("fin_lazy"^(string_of_int !lazy_koka)) ++ label (("lazy_true"^(string_of_int !lazy_koka)) ) ++ pushq (imm 1) ++ label ("fin_lazy"^(string_of_int !lazy_koka))
                          |Concat -> (concat_lst := !concat_lst + 1;match head e.typ.typ with 
                                      |Tint -> failwith "impossible"
                                      |Tlist(_)-> 
                                        
                                        let name = "concat_list_p1_"^(string_of_int !concat_lst) in 
                                        e1 ++e2 ++ popq rbx ++ popq rax 
                                        ++ movq !%rax !%rcx ++ 
                                        movq !%rax !%rdx ++ 
                                        label (name) ++
                                        movq !%rdx !%rcx ++ 
                                        movq (ind ~ofs:(8) rcx) !%rdx ++ 
                                        andq !%rdx !%rdx ++
                                        jnz (name) ++
                                        movq !%rbx (ind ~ofs:(8) rcx) ++ 
                                        pushq !%rax
                                      |Tstring ->   e1  ++e2 ++popq r14 ++ popq r13 ++ pushq !%rdi ++pushq !%rsi ++ movq !%r14 !%rsi ++ movq !%r13 !%rdi ++ call "strcat" ++   popq rsi ++ popq rdi++ pushq !%rax
                                     |_ -> failwith "Impossible"))
  |Evar(v) -> (match  v with
              | Vlocal(n) -> pushq (ind ~ofs:(-n) rbp)
              |Vglob(n) -> pushq (ind ~ofs:(-n) rbp)
              |Vclos(n) -> movq  (ind ~ofs:(n) rsi) !%rbx ++ movq (ind rbx) !%rax ++ pushq !%rax
              |Varg(n) -> pushq (ind ~ofs:(n) rdi)
              |Vfunc(id) -> pushq !%rsi ++ pushq !%rdi ++ movq (imm 8) !%rdi ++ call "my_malloc" ++ movq (ilab (id)) (ind ~ofs:(0) rax)  ++ popq rdi ++ popq rsi ++ pushq !%rax
              )
  |EAsign(pos, e) -> (match pos with 
                  |Vlocal(n) |Vglob(n) -> (compile_expr e ++ popq rax++ movq !%rax (ind ~ofs:(-n) rbp) ++ pushq (imm 0))
                  |Vclos(n) -> compile_expr e ++ popq rax++movq (ind ~ofs:(n) rsi) !%rbx ++movq !%rax (ind rbx) ++ pushq (imm 0)
                  |Varg(n) ->  compile_expr e ++ popq rax++ movq !%rax (ind ~ofs:(n) rdi) ++ pushq (imm 0)
                  |_ -> failwith "pas possible")
                  
  |EIf(e1,e2,e3) -> (option_if := !option_if + 1;
                    let e1 = compile_expr e1 in 
                    option_if := !option_if + 1;
                    let e2 = compile_expr e2 in 
                    option_if := !option_if + 1;
                    let e3 = compile_expr e3 in 
                    option_if := !option_if + 1;
                    e1 ++ popq rax ++ andq !%rax !%rax++jz ("option_if_"^(string_of_int (!option_if)))++e2 ++ popq rbx ++ pushq !%rbx++ jmp ("fin_option_if_"^(string_of_int (!option_if)))++ label ("option_if_"^(string_of_int (!option_if)))++e3 ++ popq rcx ++ pushq !%rcx ++ label ("fin_option_if_"^(string_of_int (!option_if))))
  |Head(e) -> compile_expr e ++ popq rax ++ call "head" ++ pushq !%rax 
  |Tail(e) -> compile_expr e ++ popq rax ++ call "tail" ++ pushq !%rax
  |Lists(lst) -> let acc = (List.fold_right (fun elem acc -> acc ++ popq rbx ++ pushq !%rdi ++movq (imm 16) !%rdi ++ call "my_malloc"++popq rdi ++movq !%rbx (ind ~ofs:8 rax ) ++ compile_expr elem ++ popq rcx ++ movq !%rcx (ind ~ofs:(0) rax) ++ pushq !%rax) lst (pushq (imm 0))) in 
                acc
  |Default(e1,e2) -> (default_nb := !default_nb + 1;
                     let e1 = compile_expr e1 in 
                     let e2 = compile_expr e2 in 
                     e1 ++ popq rax ++ andq !%rax !%rax ++ jnz ("default_nb_"^(string_of_int !default_nb))
                     ++ e2  ++ popq rax ++ label ("default_nb_"^(string_of_int !default_nb)) ++ pushq !%rax) 

  |EReturn(e) -> let e = compile_expr e in e ++ popq rax ++ pushq !%rax ++ jmp ("finfonc"^(string_of_int !fin_fonc))
  |While(e1,e2) -> nb_boulces := !nb_boulces + 1;
                    let e1 = compile_expr e1 in 
                    let e2 = compile_expr e2 in 
                    label ("debut_boucles_"^(string_of_int !nb_boulces)) ++ 
                    e1 ++popq rbx
                    ++ pushq !%rsi 
                    ++ pushq !%rdi ++ 
                    movq !%rbx !%rsi ++ 
                    call_star (lab ("(%rsi)")) ++ 
                    popq rdi ++ popq rsi ++ movq !%rax !%rbx
                    ++ andq !%rbx !%rbx ++ jz  ("boulces_nb_"^(string_of_int (!nb_boulces))) ++ e2 ++ 
                    popq rax ++ pushq !%rdi ++
                    pushq !%rsi ++ 
                    movq !%rax !%rsi ++ 
                    call_star (lab ("(%rsi)")) ++ popq rsi ++ popq rdi
                     ++ jmp  ("debut_boucles_"^(string_of_int !nb_boulces))++label ("boulces_nb_"^(string_of_int (!nb_boulces))) ++ pushq !%rax 
  |Repeat(e1,e2) -> (nb_boulces := !nb_boulces + 1; 
                      let e1 = compile_expr e1 in 
                      let e2 = compile_expr e2 in
                      e1 ++ popq r15 ++ label ("debut_"^(string_of_int (!nb_boulces))) ++ andq !%r15 !%r15 
                      ++ jz ("fin_"^(string_of_int (!nb_boulces))) ++ pushq !%r15 ++ 
                      e2 ++ popq rax ++     
                      pushq !%rsi  ++ pushq !%rdi ++ 
                      movq !%rax !%rsi ++
                      call_star (lab "(%rsi)") ++ 
                      popq rdi ++ popq rsi ++ 
                      popq r15 ++ subq (imm 1) !%r15 ++ jmp ("debut_"^(string_of_int (!nb_boulces))) 
                      ++ label ("fin_"^(string_of_int (!nb_boulces))) ++ pushq !%rax )
  |EClos(id, vlst) ->let i = ref 0 in let j = ref 0 in pushq !%rdi ++pushq !%rsi++  movq (imm (8*(List.length vlst + 1))) !%rdi ++ call "my_malloc" ++ popq rsi ++ popq rdi++ 
                     ( List.fold_left (fun acc (elem: vars) -> i:= !i + 1; match elem with 
                                                      |Vlocal(n) |Vglob(n) -> acc ++ movq !%rbp !%rbx ++ 
                                                                                subq (imm n) !%rbx ++  
                                                    
                                                                              movq !%rbx (ind ~ofs:(8*(!i)) rax) 
                                                      |Vclos(n) -> acc ++movq (ind ~ofs:n rsi) !%rbx ++ movq !%rbx (ind ~ofs:(8*(!i)) rax)  
                                                      |Varg(n) ->   acc ++movq !%rdi !%rbx ++addq (imm n) !%rbx ++ movq !%rbx (ind ~ofs:(8*(!i)) rax) 
                                                      |Vfunc(id) ->  acc ++movq (ilab (id)) !%rbx ++ movq !%rbx (ind ~ofs:(8*(!i)) rax)  ) (nop) vlst) ++ movq (lab ("$"^id)) (ind ~ofs:(0) rax) 
                                         
                      ++pushq !%rax
  |Eval(e1,e2) -> let i = ref (-8) in       
                  let e1 = compile_expr e1 in 
                  e1 ++ popq r14 ++ pushq !%rsi ++ pushq !%rdi ++ movq (imm (8*(List.length e2))) !%rdi  ++ call "my_malloc" ++ movq !%rax !%rdi ++ movq !%r14 !%rsi ++ 
                  (List.fold_left (fun acc elem -> i := !i + 8;let accu = compile_expr elem in 
                                                    acc ++ popq r15 (*rdi*) ++popq r14 (*rsi*) ++ pushq !%rsi ++ pushq!% rdi ++ movq !%r14 !%rsi 
                                                    ++ movq !%r15 !%rdi ++accu ++ popq rax
                                                    ++ popq r15 (*rdi*) ++popq r14 (*rsi*) ++ pushq !%rsi ++ pushq !%rdi ++ movq !%r14 !%rsi 
                                                    ++ movq !%r15 !%rdi
                                                     ++ movq !%rax (ind ~ofs:(!i) rdi) ) (nop) e2)++call_star (lab "(%rsi)") ++ popq rdi ++ popq rsi++ pushq !%rax
  | For(e1,e2,e3) -> (nb_boulces := !nb_boulces + 1;
                      let e1 = compile_expr e1 in 
                      let e2 = compile_expr e2 in 
                      let e3 = compile_expr e3 in 
                      e1 ++ e2 ++ e3 ++ popq rdx (*fonc*) ++ popq rbx ++ popq rcx  ++
                      pushq !%rsi ++ pushq !%rdi ++ pushq !%rcx ++ pushq !%rbx ++ pushq !%rdx ++
                      movq (imm 8) !%rdi ++ call "my_malloc" ++movq !%rax !%rdi++ popq rsi ++ popq rbx ++ popq rdx ++ 
                      movq !%rdx !%r15++ label ("debut_for_"^(string_of_int !nb_boulces)) ++  
                      movq (!%r15) (ind ~ofs:(0) rdi) ++ pushq !%r15 ++  pushq !%rbx ++ 
                      call_star (lab ("(%rsi)")) ++popq rbx++popq r15 ++
                      addq (imm 1) !%r15 ++ cmpq !%r15 !%rbx ++ jns ("debut_for_"^(string_of_int !nb_boulces))
                       ++ label ("finboucle_"^(string_of_int !nb_boulces)) ++ popq rdi ++ popq rsi++ pushq (imm 0) )
and compile_stmt  (s : pstmt) : text = match s.stmt with 
  |SBexpr(e) -> compile_expr  e
  |SDecl(pos, e) -> compile_expr e ++ popq rax ++ movq !%rax (ind ~ofs:(-pos) rbp) ++ pushq !%rax
  |SVar(pos, e) -> compile_expr e ++ popq rax ++ movq !%rax (ind ~ofs:(-pos) rbp) ++ pushq !%rax

let compile_delc  (d : pdecl) = 
  fin_fonc := !fin_fonc + 1;
  label d.name ++pushq !%rbp ++ movq !%rsp !% rbp++ addq (imm (-d.size)) !%rsp ++compile_expr  (d.body.body) ++label ("finfonc"^(string_of_int !fin_fonc))++ popq rax++ addq (imm (d.size)) !%rsp  ++ popq rbp ++ ret

let compile str (f : pfile) = 
  let ofile = str in
  let acc = List.fold_left ( fun acc x -> acc ++ compile_delc  x) (nop) f in 
  let p =
    { text =
        globl "main" ++ 
        movq !%rsp !%rbp ++ 
        acc  ++ movq (imm 0) !%rax 
        ++ ret ++
        label "print_int" ++
        pushq !%rbp ++ 
        movq !%rsp !%rbp ++
        andq (imm (-16)) !%rsp ++  
        movq !%rdi !%rsi ++    
        movq (ilab ".Sprint_int") !%rdi ++    
        call "printf" ++
        movq !%rbp !%rsp ++ 
        popq rbp++ 
        ret 
        ++ 
        label "print_bool" ++ 
        andq !%rdi !%rdi ++ 
        jnz "ptrue" ++ 
        pushq !%rbp ++ 
        movq !%rsp !%rbp ++
        andq (imm (-16)) !%rsp ++ 
        movq (ilab ".Sprint_faux") !%rdi ++
        call "printf" ++ 
        movq !%rbp !%rsp ++ 
        popq rbp++ 
        ret ++ 
        label "ptrue" ++ 
        pushq !%rbp ++ 
        movq !%rsp !%rbp ++
        andq (imm (-16)) !%rsp ++ 
        movq (ilab ".Sprint_vrai") !%rdi ++  
        movq (imm 0) !%rax ++ 
        call "printf" ++ 
        movq !%rbp !%rsp ++ 
        popq rbp++ 
        ret ++ 
        label "head" ++ 
        movq (ind ~ofs:0 rax) !%rax ++ 
        ret ++ 
        label "tail" ++ 
        movq (ind ~ofs:8 rax) !%rax ++ 
        ret ++ 
        label "my_malloc" ++ 
        pushq !%rbp ++ 
        movq !%rsp !%rbp ++
        andq (imm (-16)) !%rsp ++  
        call "malloc" ++ 
        movq !%rbp !%rsp ++ 
        popq rbp++ 
        ret ++ 
        label "print_string" ++
        pushq !%rbp ++ 
        movq !%rsp !%rbp ++
        andq (imm (-16)) !%rsp ++  
        movq !%rdi !%rsi ++
        movq (lab "$.Sprint_string") !%rdi ++ 
        call "printf" ++ 
        movq !%rbp !%rsp ++ 
        popq rbp++ 
        ret 
        ;
      data =
      (label ".Sprint_int" ++ string "%d\n" ++ label ".Sprint_vrai" ++ string "True\n" ++ label ".Sprint_faux" ++ string "False\n" ++ label ".Sprint_string" ++ string "%s\n" ) ++
           Hashtbl.fold (fun x y elem -> elem ++ label (".string_"^(string_of_int y)) ++ string x) variables_str nop ++ 
           Hashtbl.fold (fun x y elem -> elem ++ label ("fun_"^x) ++ string x) lst_func nop
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f