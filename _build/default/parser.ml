
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR
    | VAL
    | THEN
    | RETURN
    | IF
    | IDENT of (
# 18 "parser.mly"
       (string)
# 20 "parser.ml"
  )
    | FUN
    | FN
    | EOF
    | ELSE
    | ELIF
  
end

include MenhirBasics

# 1 "parser.mly"
  



# 37 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState0 : ('s, _menhir_box_prog) _menhir_state
    (** State 0.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState3 : (('s, _menhir_box_prog) _menhir_cell1_stmt, _menhir_box_prog) _menhir_state
    (** State 3.
        Stack shape : stmt.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (int)

and _menhir_box_prog = 
  | MenhirBox_prog of (int list) [@@unboxed]

let _menhir_action_1 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 62 "parser.ml"
     : (int list))

let _menhir_action_2 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 70 "parser.ml"
     : (int list))

let _menhir_action_3 =
  fun sl ->
    (
# 29 "parser.mly"
                      (sl)
# 78 "parser.ml"
     : (int list))

let _menhir_action_4 =
  fun () ->
    (
# 23 "parser.mly"
      (8)
# 86 "parser.ml"
     : (int))

let _menhir_action_5 =
  fun () ->
    (
# 24 "parser.mly"
         (9)
# 94 "parser.ml"
     : (int))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ELIF ->
        "ELIF"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | FN ->
        "FN"
    | FUN ->
        "FUN"
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | RETURN ->
        "RETURN"
    | THEN ->
        "THEN"
    | VAL ->
        "VAL"
    | VAR ->
        "VAR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_6 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let sl = _v in
      let _v = _menhir_action_3 sl in
      MenhirBox_prog _v
  
  let rec _menhir_run_4 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_stmt -> _ -> _menhir_box_prog =
    fun _menhir_stack _v ->
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_2 x xs in
      _menhir_goto_list_stmt_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list_stmt_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState0 ->
          _menhir_run_6 _menhir_stack _v
      | MenhirState3 ->
          _menhir_run_4 _menhir_stack _v
  
  let rec _menhir_run_1 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_4 () in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IF ->
          _menhir_run_1 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState3
      | IDENT _ ->
          _menhir_run_2 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState3
      | EOF ->
          let _v_1 = _menhir_action_1 () in
          _menhir_run_4 _menhir_stack _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_2 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_5 () in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_0 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IF ->
          _menhir_run_1 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState0
      | IDENT _ ->
          _menhir_run_2 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState0
      | EOF ->
          let _v = _menhir_action_1 () in
          _menhir_run_6 _menhir_stack _v
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_0 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
