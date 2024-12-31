open Algow
open Ast
open Format
open X86_64

let nb_anno = ref 0
let nb_str = ref 0
let variables_str = Hashtbl.create 17
let nb_string = ref 0  
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
  | SDecl of ident * pbexpr
  | SVar of ident * pbexpr
  
(* expression *)
and pbexpr = {
  bexpr : pbexpr1;
  loc   : loc;
  typ   : full_type
}

and pbexpr1 = 
  | EBlock of pstmt list
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
  |EClos of ident * ident list
  
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
}
  
(* fichier *)
and pfile = pdecl list
and vars = 
  |Vlocal of int 
  |Vclos of int 
  |Varg of int 
  |Vglob of ident




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


let rec closure_exp (acomp: tdecl list ref)  clot (param:local_env) (env:local_env) (fcpur : int) (e : tbexpr) = 
  let b, fcpur = (match e.bexpr with 
  |ATrue -> ATrue, fcpur
  |AFalse -> AFalse, fcpur
  |Int(n) -> Int(n), fcpur
  |String(s) -> String(s), fcpur
  |Empty -> Empty, fcpur
  |Ident(id) -> (if Smap.mem id env then (Evar(Vlocal(Smap.find id env)), fcpur)
                  else( if Smap.mem id param then (Evar(Varg(Smap.find id param)), fcpur)
                  else( if (Smap.mem id clot) then (Evar(Vclos(Smap.find id clot)), fcpur) 
                  else failwith "Variable non définie")))
  |Eval(e, lst) -> let e1, f1 = closure_exp acomp  clot param env fcpur e in 
                    let ls, fmax = List.fold_left (fun (lst1, fmax) (exp : tbexpr) ->let e, fmax' =  closure_exp acomp  clot param env fcpur exp in (lst1@[e], max fmax fmax')) ([], fcpur) lst in
                    Eval(e1, ls), max fmax f1
  |List(lst) -> let ls, fmax = List.fold_left (fun (lst1, fmax) (exp : tbexpr) ->let e, fmax' =  closure_exp acomp  clot param env fcpur exp in (lst1@[e], max fmax fmax')) ([], fcpur) lst in List(ls), fmax
  |Println(e) -> let e1, fcpur = closure_exp acomp  clot param env fcpur e in Println(e1), fcpur
  |Default(e1, e2) -> let e1, fcmax = closure_exp acomp  clot param env fcpur e1 in 
                      let e2, fbax = closure_exp acomp  clot param env fcpur e2
                      in Default(e1,e2), max fcmax fbax
  |Head(e) -> Head(fst (closure_exp acomp  clot param env fcpur e)), snd (closure_exp acomp  clot param env fcpur e)
  |Tail(e) -> Tail(fst (closure_exp acomp  clot param env fcpur e)), fcpur
  |For(e1,e2,e3) -> let e1, f1 = closure_exp acomp  clot param env fcpur e1 in 
                    let e2, f2 = closure_exp acomp  clot param env fcpur e2 in 
                    let e3, f3 = closure_exp acomp  clot param env fcpur e3 in 
                    For(e1,e2,e3), (max f1 (max f2 f3))
  |Repeat(e1, e2) -> let e1, f1 = closure_exp acomp  clot param env fcpur e1 in 
                     let e2,f2 = closure_exp acomp  clot param env fcpur e2 
                    in Repeat(e1,e2), f2
  |While(e1,e2) -> let e1, fm1 =  closure_exp acomp  clot param env fcpur e1 in 
                   let e2, fm2 =  closure_exp acomp  clot param env fcpur e2
                  in While(e1, e2), max fm1 fm2
  |EBlock(lst) ->let ls, fmax = List.fold_left (fun (lst1, fmax) (exp : tstmt) ->let e, fmax' =  closure_stmt acomp   clot param env fcpur exp in (lst1@[e], max fmax fmax')) ([], fcpur) lst in EBlock(ls), fmax
  |ETild(e) -> ETild(fst(closure_exp acomp  clot param env fcpur e)), snd (closure_exp acomp  clot param env fcpur e)
  |ENot(e)-> ENot(fst(closure_exp acomp  clot param env fcpur e)), snd (closure_exp acomp  clot param env fcpur e)
  |EBinop(o, e1, e2)-> let e1, fm1 =  closure_exp acomp  clot param env fcpur e1 in 
                       let e2, fm2 =  closure_exp acomp  clot param env fcpur e2 in 
                       EBinop(o, e1, e2), max fm1 fm2
  |EAsign(id, e) -> EAsign(id, fst (closure_exp acomp  clot param env fcpur e)), snd (closure_exp acomp  clot param env fcpur e) 
  |EIf(e1, e2,e3) -> ( let e1, f1 = closure_exp acomp  clot param env fcpur e1 in 
                       let e2, f2 =  closure_exp acomp  clot param env fcpur e2 in 
                       let e3, f3 =closure_exp acomp  clot param env fcpur e3 in 
                       EIf(e1,e2,e3), max (max f1 f2) f3)
  |EFn(t) -> begin 
                let name = "fun_"^(string_of_int (!nb_anno)) in 
                nb_anno := !nb_anno + 1;
                acomp := ({name = name; body = t})::(!acomp);
                let free = freevars4 t in 
                let var_lst =  (VSet.elements free) in 
                EClos(name, var_lst), fcpur
             end
  |EReturn(e)-> EReturn(fst(closure_exp acomp  clot param env fcpur e)), snd (closure_exp acomp  clot param env fcpur e))
in 
  
  {bexpr = b; loc = e.loc; typ = e.typ}, fcpur

and closure_stmt acomp   clot param env fcpur (s : tstmt) : pstmt*int = match s.stmt with 
  |SBexpr(t) -> let e1, fcpur = closure_exp acomp  clot param env fcpur t in {stmt = SBexpr(e1); loc = s.loc; typ = s.typ}, fcpur
  |SDecl(id, t) |SVar(id, t) -> let e1, fcpur = closure_exp acomp  clot param (Smap.add id (fcpur+8) env ) (fcpur + 8 ) t in 
                    {stmt = SDecl(id, e1); loc = s.loc; typ = s.typ}, fcpur
  
and closure_funbody (acomp: tdecl list ref)   clot param env fcpur (f : tfunbody) = 
  let free= freevars4 f in 
  let par_lst = List.map (fun (elem: tparam) -> elem.name) f.formal in 
  {formal = f.formal; body = fst (closure_exp acomp  (list_to_smap (VSet.elements free)) (list_to_smap par_lst) Smap.empty 0 f.body); typ = f.typ; clot = VSet.elements free }

  
and list_to_smap lst : local_env= 
  let acc = ref 0 in 
  List.fold_left (fun elem id -> acc := !acc + 1; Smap.add id (!acc-1) elem) (Smap.empty) lst

and cloture_delc (acomp : tdecl list ref) (d : tdecl) = 
  {name = d.name; body = closure_funbody acomp   Smap.empty Smap.empty Smap.empty 0 d.body}

and clotur_tfile (f : tdecl list) : pdecl list = 
  let acomp = ref f in 
  let res = ref [] in 
  let nb_comp = ref 0 in 
  while List.length (!acomp) > !nb_comp do 
    res := (!res)@[cloture_delc acomp (List.hd (!acomp))];
    nb_comp := !nb_comp + 1
  done;
  !res
 




let rec compile_expr  (e : pbexpr) = match e.bexpr with 
  |Empty -> nop
  |ENot(b) -> compile_expr b ++ popq rax ++ notb !%al ++ andq (imm 1) !%rax ++ pushq !%rax
  |ETild(b) -> compile_expr b ++ popq rax ++notq !%rax ++ pushq !%rax
  |EBlock(lst) -> List.fold_left (fun acc elem ->  acc ++ compile_stmt  elem ++ popq rax )  nop lst ++ pushq !%rax
  |String(str) -> (Hashtbl.add variables_str str (!nb_str); nb_str := !nb_str + 1; movq (lab ("$.string_"^(string_of_int (Hashtbl.find variables_str str)))) !%rax ++ pushq !%rax)
  |Int(n) -> pushq (imm n) 
  |Println(b) -> (if b.typ.typ = Tstring then let t =(compile_expr  b) in t ++ popq rax ++movq !%rax !%rdi ++ call "print_string" else (if b.typ.typ = Tint then let t =(compile_expr  b) in t ++ popq rax ++ movq !%rax !%rdi ++ call "print_int" else (if b.typ.typ = Tbool then  let t =(compile_expr  b) in t ++ popq rax ++ movq !%rax !%rdi ++ call "print_bool" else (nop)))) ++ pushq (imm 0)
  |ATrue -> movq (imm 1) !%rax ++ pushq !%rax
  |AFalse -> movq (imm 0) !%rax ++ pushq !%rax
  |EBinop(op, e1, e2) -> (let e1 = compile_expr e1 in 
                         let e2 = compile_expr e2 in 
                         e1 ++ e2 ++ popq rax  ++ popq rbx ++ 
                         match op with 
                          |Eq-> (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ sete !%al ++ pushq !%rax)
                          |Neq -> (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setne !%al ++ pushq !%rax)
                          |Lt ->(cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setl !%al ++ pushq !%rax)
                          |Lte -> (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setle !%al ++ pushq !%rax)
                          |Gt -> (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setg !%al ++ pushq !%rax)
                          |Gte -> (cmpq !%rax !%rbx ++ movq (imm 0) !%rax ++ setge !%al ++ pushq !%rax)
                          |Add -> (addq !%rax !%rbx ++ pushq !%rbx)
                          |Sub -> (subq !%rax !%rbx ++ pushq !%rbx)
                          |Mul -> (imulq !%rax !%rbx ++ pushq !%rbx)
                          |Div -> (movq !%rax !%rcx ++ movq !%rbx !%rax ++ movq !%rcx !%rbx++(movq (imm 0) (!%rdx)) ++ (idivq (!%rbx))   ++ (pushq !%rax ))
                          |Mod -> (movq !%rax !%rcx ++ movq !%rbx !%rax ++ movq !%rcx !%rbx++(movq (imm 0) (!%rdx)) ++ (idivq (!%rbx))   ++ (pushq !%rdx ))
                          |And -> (andq !%rbx !%rax ++ pushq !%rax)
                          |Or -> (orq !%rbx !%rax ++ pushq !%rax)
                          |Concat -> failwith "not yet")
  |_ -> failwith "not yet y guy"

and compile_stmt  (s : pstmt) : text = match s.stmt with 
  |SBexpr(e) -> compile_expr  e
  |_ -> failwith "not yet"

let compile_delc  (d : pdecl) = 
  compile_expr  (d.body.body)

let compile str (f : pfile) = 
  let ofile = str in
  let acc = List.fold_left ( fun acc x -> acc ++ compile_delc  x) (nop) f in 
  let p =
    { text =
        globl "main" ++ label "main" ++
        acc ++ popq rax ++ movq (imm 0) !%rax 
        ++ ret ++
        label "print_int" ++
        movq !%rdi !%rsi ++
        movq (ilab ".Sprint_int") !%rdi ++
        movq !%rbp !%r14 ++ 
        movq !%rsp !%r15 ++ 
        andq (imm (-16)) !%rsp++
        movq (imm 0) !%rax ++
        call "printf" ++
        movq !%r14 !%rbp ++ 
        movq !%r15 !%rsp ++
        ret 
        ++ 
        label "print_bool" ++ 
        andq !%rdi !%rdi ++ 
        jnz "ptrue" ++ 
        movq !%rbp !%r14 ++ 
        movq !%rsp !%r15 ++ 
        movq !%rsp !%rbp ++ 
        andq (imm (-16)) !%rsp ++ 
        movq (ilab ".Sprint_faux") !%rdi ++
        call "printf" ++ 
        movq !%r14 !%rbp ++ 
        movq !%r15 !%rsp ++
        ret ++ 
        label "ptrue" ++ 
        movq !%rbp !%r14 ++ 
        movq !%rsp !%r15 ++ 
        movq !%rsp !%rbp ++ 
        andq (imm (-16)) !%rsp ++ 
        movq (ilab ".Sprint_vrai") !%rdi ++  
        movq (imm 0) !%rax ++ 
        call "printf" ++ 
        movq !%r14 !%rbp ++ 
        movq !%r15 !%rsp ++
        ret ++ 
        label "head" ++ 
        movq (ind ~ofs:0 rbp) !%rax ++ 
        ret ++ 
        movq (ind ~ofs:8 rbp) !%rax ++ 
        ret ++ 
        label "my_malloc" ++ 
        movq !%rbp !%r14 ++ 
        movq !%rsp !%r15 ++ 
        movq !%rsp !%rbp ++ 
        andq (imm (-16)) !%rsp ++ 
        call "malloc" ++ 
        movq !%r14 !%rbp ++ 
        movq !%r15 !%rsp ++ 
        ret ++ 
        label "print_string" ++
        movq !%rbp !%r14 ++ 
        movq !%rsp !%r15 ++ 
        movq !%rsp !%rbp ++ 
        movq !%rdi !%rsi ++
        movq (lab "$.Sprint_string") !%rdi ++ 
        call "printf" ++ 
        movq !%r14 !%rbp ++ 
        movq !%r15 !%rsp ++ 
        ret 
        ;
      data =
      (label ".Sprint_int" ++ string "%d\n" ++ label ".Sprint_vrai" ++ string "True\n" ++ label ".Sprint_faux" ++ string "False\n" ++ label ".Sprint_string" ++ string "%s\n" ) ++
           Hashtbl.fold (fun x y elem -> elem ++ label (".string_"^(string_of_int y)) ++ string x) variables_str nop
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f