
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VAR
    | VAL
    | TRUE
    | TILD
    | THEN
    | STRING of (
# 24 "parser.mly"
       (string)
# 20 "parser.ml"
  )
    | SEMICOLON
    | RSPAR
    | RPAR
    | RHOOK
    | RETURN
    | RBRAC
    | PLUS
    | OR
    | NEQ
    | MUL
    | MOD
    | MINUS
    | LTE
    | LT
    | LSPAR
    | LPAR
    | LHOOK
    | LBRAC
    | INT of (
# 23 "parser.mly"
       (int)
# 43 "parser.ml"
  )
    | IF
    | IDENT of (
# 22 "parser.mly"
       (string)
# 49 "parser.ml"
  )
    | GTE
    | GT
    | FUN
    | FN
    | FALSE
    | EXCLAM
    | EQ
    | EOF
    | ELSE
    | ELIF
    | DOT
    | DIV
    | DEF
    | CONCAT
    | COMMA
    | COLON
    | ASSIGN
    | ARROW
    | AND
  
end

include MenhirBasics

# 1 "parser.mly"
  
  open Ast


# 80 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_file) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: file. *)

  | MenhirState001 : (('s, _menhir_box_file) _menhir_cell1_SEMICOLON, _menhir_box_file) _menhir_state
    (** State 001.
        Stack shape : SEMICOLON.
        Start symbol: file. *)

  | MenhirState003 : (('s, _menhir_box_file) _menhir_cell1_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 003.
        Stack shape : list(SEMICOLON).
        Start symbol: file. *)

  | MenhirState005 : (('s, _menhir_box_file) _menhir_cell1_FUN _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 005.
        Stack shape : FUN IDENT.
        Start symbol: file. *)

  | MenhirState006 : (('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 006.
        Stack shape : LPAR.
        Start symbol: file. *)

  | MenhirState008 : (('s, _menhir_box_file) _menhir_cell1_IDENT, _menhir_box_file) _menhir_state
    (** State 008.
        Stack shape : IDENT.
        Start symbol: file. *)

  | MenhirState009 : (('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 009.
        Stack shape : LPAR.
        Start symbol: file. *)

  | MenhirState013 : (('s, _menhir_box_file) _menhir_cell1_IDENT, _menhir_box_file) _menhir_state
    (** State 013.
        Stack shape : IDENT.
        Start symbol: file. *)

  | MenhirState018 : (('s, _menhir_box_file) _menhir_cell1_atype, _menhir_box_file) _menhir_state
    (** State 018.
        Stack shape : atype.
        Start symbol: file. *)

  | MenhirState019 : (('s, _menhir_box_file) _menhir_cell1_LHOOK, _menhir_box_file) _menhir_state
    (** State 019.
        Stack shape : LHOOK.
        Start symbol: file. *)

  | MenhirState021 : (('s, _menhir_box_file) _menhir_cell1_COMMA _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 021.
        Stack shape : COMMA IDENT.
        Start symbol: file. *)

  | MenhirState024 : ((('s, _menhir_box_file) _menhir_cell1_LHOOK, _menhir_box_file) _menhir_cell1_list___anonymous_1_, _menhir_box_file) _menhir_state
    (** State 024.
        Stack shape : LHOOK list(__anonymous_1).
        Start symbol: file. *)

  | MenhirState028 : (('s, _menhir_box_file) _menhir_cell1_COMMA, _menhir_box_file) _menhir_state
    (** State 028.
        Stack shape : COMMA.
        Start symbol: file. *)

  | MenhirState029 : ((('s, _menhir_box_file) _menhir_cell1_COMMA, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_state
    (** State 029.
        Stack shape : COMMA kokatype.
        Start symbol: file. *)

  | MenhirState032 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_list___anonymous_2_, _menhir_box_file) _menhir_state
    (** State 032.
        Stack shape : LPAR list(__anonymous_2).
        Start symbol: file. *)

  | MenhirState039 : (('s, _menhir_box_file) _menhir_cell1_param, _menhir_box_file) _menhir_state
    (** State 039.
        Stack shape : param.
        Start symbol: file. *)

  | MenhirState043 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__, _menhir_box_file) _menhir_state
    (** State 043.
        Stack shape : LPAR loption(separated_nonempty_list(COMMA,param)).
        Start symbol: file. *)

  | MenhirState045 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_option_annot_, _menhir_box_file) _menhir_state
    (** State 045.
        Stack shape : LPAR loption(separated_nonempty_list(COMMA,param)) option(annot).
        Start symbol: file. *)

  | MenhirState047 : (('s, _menhir_box_file) _menhir_cell1_TILD, _menhir_box_file) _menhir_state
    (** State 047.
        Stack shape : TILD.
        Start symbol: file. *)

  | MenhirState049 : (('s, _menhir_box_file) _menhir_cell1_RETURN, _menhir_box_file) _menhir_state
    (** State 049.
        Stack shape : RETURN.
        Start symbol: file. *)

  | MenhirState050 : (('s, _menhir_box_file) _menhir_cell1_LSPAR, _menhir_box_file) _menhir_state
    (** State 050.
        Stack shape : LSPAR.
        Start symbol: file. *)

  | MenhirState051 : (('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 051.
        Stack shape : LPAR.
        Start symbol: file. *)

  | MenhirState053 : (('s, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_state
    (** State 053.
        Stack shape : LBRAC.
        Start symbol: file. *)

  | MenhirState054 : ((('s, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_cell1_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 054.
        Stack shape : LBRAC list(SEMICOLON).
        Start symbol: file. *)

  | MenhirState057 : (('s, _menhir_box_file) _menhir_cell1_VAR _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 057.
        Stack shape : VAR IDENT.
        Start symbol: file. *)

  | MenhirState059 : (('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_state
    (** State 059.
        Stack shape : IF.
        Start symbol: file. *)

  | MenhirState061 : (('s, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 061.
        Stack shape : FN.
        Start symbol: file. *)

  | MenhirState064 : (('s, _menhir_box_file) _menhir_cell1_EXCLAM, _menhir_box_file) _menhir_state
    (** State 064.
        Stack shape : EXCLAM.
        Start symbol: file. *)

  | MenhirState066 : (('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_state
    (** State 066.
        Stack shape : atom.
        Start symbol: file. *)

  | MenhirState067 : ((('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 067.
        Stack shape : atom LPAR.
        Start symbol: file. *)

  | MenhirState072 : (('s, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 072.
        Stack shape : expr.
        Start symbol: file. *)

  | MenhirState076 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 076.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState078 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 078.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState080 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 080.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState082 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 082.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState084 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 084.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState086 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 086.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState088 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 088.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState090 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 090.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState092 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 092.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState094 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 094.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState096 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 096.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState098 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 098.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState100 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 100.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState102 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 102.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState104 : ((('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 104.
        Stack shape : atom FN.
        Start symbol: file. *)

  | MenhirState110 : ((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 110.
        Stack shape : IF bexpr.
        Start symbol: file. *)

  | MenhirState111 : (((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 111.
        Stack shape : IF bexpr expr.
        Start symbol: file. *)

  | MenhirState112 : (((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_state
    (** State 112.
        Stack shape : bexpr expr ELIF.
        Start symbol: file. *)

  | MenhirState114 : ((((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 114.
        Stack shape : bexpr expr ELIF bexpr.
        Start symbol: file. *)

  | MenhirState115 : (((((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 115.
        Stack shape : bexpr expr ELIF bexpr expr.
        Start symbol: file. *)

  | MenhirState118 : ((((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_list___anonymous_3_, _menhir_box_file) _menhir_state
    (** State 118.
        Stack shape : IF bexpr expr list(__anonymous_3).
        Start symbol: file. *)

  | MenhirState120 : ((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 120.
        Stack shape : IF bexpr.
        Start symbol: file. *)

  | MenhirState125 : (('s, _menhir_box_file) _menhir_cell1_VAL _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 125.
        Stack shape : VAL IDENT.
        Start symbol: file. *)

  | MenhirState127 : (('s, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_state
    (** State 127.
        Stack shape : stmt.
        Start symbol: file. *)

  | MenhirState128 : (('s, _menhir_box_file) _menhir_cell1_SEMICOLON, _menhir_box_file) _menhir_state
    (** State 128.
        Stack shape : SEMICOLON.
        Start symbol: file. *)

  | MenhirState130 : ((('s, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 130.
        Stack shape : stmt nonempty_list(SEMICOLON).
        Start symbol: file. *)

  | MenhirState146 : (('s, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_state
    (** State 146.
        Stack shape : decl.
        Start symbol: file. *)

  | MenhirState147 : ((('s, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 147.
        Stack shape : decl nonempty_list(SEMICOLON).
        Start symbol: file. *)


and ('s, 'r) _menhir_cell1_atom = 
  | MenhirCell1_atom of 's * ('s, 'r) _menhir_state * (Ast.atom)

and ('s, 'r) _menhir_cell1_atype = 
  | MenhirCell1_atype of 's * ('s, 'r) _menhir_state * (Ast.atype)

and ('s, 'r) _menhir_cell1_bexpr = 
  | MenhirCell1_bexpr of 's * ('s, 'r) _menhir_state * (Ast.bexpr)

and ('s, 'r) _menhir_cell1_decl = 
  | MenhirCell1_decl of 's * ('s, 'r) _menhir_state * (Ast.decl)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.expr)

and ('s, 'r) _menhir_cell1_kokatype = 
  | MenhirCell1_kokatype of 's * ('s, 'r) _menhir_state * (Ast.kokaType)

and ('s, 'r) _menhir_cell1_list_SEMICOLON_ = 
  | MenhirCell1_list_SEMICOLON_ of 's * ('s, 'r) _menhir_state * (unit list)

and ('s, 'r) _menhir_cell1_list___anonymous_1_ = 
  | MenhirCell1_list___anonymous_1_ of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_list___anonymous_2_ = 
  | MenhirCell1_list___anonymous_2_ of 's * ('s, 'r) _menhir_state * (Ast.kokaType list)

and ('s, 'r) _menhir_cell1_list___anonymous_3_ = 
  | MenhirCell1_list___anonymous_3_ of 's * ('s, 'r) _menhir_state * ((Ast.bexpr * Ast.expr) list)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ = 
  | MenhirCell1_loption_separated_nonempty_list_COMMA_param__ of 's * ('s, 'r) _menhir_state * ((string * Ast.kokaType) list)

and ('s, 'r) _menhir_cell1_nonempty_list_SEMICOLON_ = 
  | MenhirCell1_nonempty_list_SEMICOLON_ of 's * ('s, 'r) _menhir_state * (unit list)

and 's _menhir_cell0_option_annot_ = 
  | MenhirCell0_option_annot_ of 's * (Ast.result option)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (string * Ast.kokaType)

and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (Ast.stmt)

and ('s, 'r) _menhir_cell1_COMMA = 
  | MenhirCell1_COMMA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ELIF = 
  | MenhirCell1_ELIF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EXCLAM = 
  | MenhirCell1_EXCLAM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FN = 
  | MenhirCell1_FN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FUN = 
  | MenhirCell1_FUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 22 "parser.mly"
       (string)
# 443 "parser.ml"
)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 22 "parser.mly"
       (string)
# 450 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRAC = 
  | MenhirCell1_LBRAC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LHOOK = 
  | MenhirCell1_LHOOK of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAR = 
  | MenhirCell1_LPAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LSPAR = 
  | MenhirCell1_LSPAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SEMICOLON = 
  | MenhirCell1_SEMICOLON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TILD = 
  | MenhirCell1_TILD of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAL = 
  | MenhirCell1_VAL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state

and _menhir_box_file = 
  | MenhirBox_file of (Ast.file) [@@unboxed]

let _menhir_action_01 =
  fun res ->
    (
# 67 "parser.mly"
                         ( res )
# 491 "parser.ml"
     : (Ast.result))

let _menhir_action_02 =
  fun () ->
    (
# 90 "parser.mly"
         ( ATrue )
# 499 "parser.ml"
     : (Ast.atom))

let _menhir_action_03 =
  fun () ->
    (
# 91 "parser.mly"
          ( AFalse )
# 507 "parser.ml"
     : (Ast.atom))

let _menhir_action_04 =
  fun n ->
    (
# 92 "parser.mly"
            ( Int(n) )
# 515 "parser.ml"
     : (Ast.atom))

let _menhir_action_05 =
  fun id ->
    (
# 93 "parser.mly"
               ( Ident(id) )
# 523 "parser.ml"
     : (Ast.atom))

let _menhir_action_06 =
  fun s ->
    (
# 94 "parser.mly"
               ( String(s) )
# 531 "parser.ml"
     : (Ast.atom))

let _menhir_action_07 =
  fun () ->
    (
# 95 "parser.mly"
                ( Empty )
# 539 "parser.ml"
     : (Ast.atom))

let _menhir_action_08 =
  fun e ->
    (
# 96 "parser.mly"
                           ( Expr(e) )
# 547 "parser.ml"
     : (Ast.atom))

let _menhir_action_09 =
  fun at xs ->
    let el = 
# 241 "<standard.mly>"
    ( xs )
# 555 "parser.ml"
     in
    (
# 97 "parser.mly"
                                                               ( Eval(at, el) )
# 560 "parser.ml"
     : (Ast.atom))

let _menhir_action_10 =
  fun at id ->
    (
# 98 "parser.mly"
                                 ( Dot(at, id) )
# 568 "parser.ml"
     : (Ast.atom))

let _menhir_action_11 =
  fun at fb ->
    (
# 99 "parser.mly"
                                  ( Fn(at, fb) )
# 576 "parser.ml"
     : (Ast.atom))

let _menhir_action_12 =
  fun at b ->
    (
# 100 "parser.mly"
                          ( AtomBlock(at, b) )
# 584 "parser.ml"
     : (Ast.atom))

let _menhir_action_13 =
  fun xs ->
    let el = 
# 241 "<standard.mly>"
    ( xs )
# 592 "parser.ml"
     in
    (
# 101 "parser.mly"
                                                     ( Brac(el) )
# 597 "parser.ml"
     : (Ast.atom))

let _menhir_action_14 =
  fun s ty ->
    (
# 83 "parser.mly"
                                                     (AVar(s, Some(ty)))
# 605 "parser.ml"
     : (Ast.atype))

let _menhir_action_15 =
  fun s ->
    (
# 84 "parser.mly"
           (AVar(s, None))
# 613 "parser.ml"
     : (Ast.atype))

let _menhir_action_16 =
  fun ty ->
    (
# 85 "parser.mly"
                          (AType(ty))
# 621 "parser.ml"
     : (Ast.atype))

let _menhir_action_17 =
  fun () ->
    (
# 86 "parser.mly"
            (AEmpty)
# 629 "parser.ml"
     : (Ast.atype))

let _menhir_action_18 =
  fun a ->
    (
# 113 "parser.mly"
             (Eatom(a))
# 637 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_19 =
  fun b ->
    (
# 114 "parser.mly"
                   (ETild (b))
# 645 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_20 =
  fun b ->
    (
# 115 "parser.mly"
                     (ENot(b))
# 653 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_21 =
  fun b1 b3 ->
    let b2 = 
# 137 "parser.mly"
       (Eq)
# 661 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 666 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_22 =
  fun b1 b3 ->
    let b2 = 
# 138 "parser.mly"
        (Neq)
# 674 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 679 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_23 =
  fun b1 b3 ->
    let b2 = 
# 139 "parser.mly"
       (Lt)
# 687 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 692 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_24 =
  fun b1 b3 ->
    let b2 = 
# 140 "parser.mly"
        (Lte)
# 700 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 705 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_25 =
  fun b1 b3 ->
    let b2 = 
# 141 "parser.mly"
       (Gt)
# 713 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 718 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_26 =
  fun b1 b3 ->
    let b2 = 
# 142 "parser.mly"
        (Gte)
# 726 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 731 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_27 =
  fun b1 b3 ->
    let b2 = 
# 143 "parser.mly"
         (Add)
# 739 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 744 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_28 =
  fun b1 b3 ->
    let b2 = 
# 144 "parser.mly"
          (Sub)
# 752 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 757 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_29 =
  fun b1 b3 ->
    let b2 = 
# 145 "parser.mly"
        (Mul)
# 765 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 770 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_30 =
  fun b1 b3 ->
    let b2 = 
# 146 "parser.mly"
        (Div)
# 778 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 783 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_31 =
  fun b1 b3 ->
    let b2 = 
# 147 "parser.mly"
        (Mod)
# 791 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 796 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_32 =
  fun b1 b3 ->
    let b2 = 
# 148 "parser.mly"
           (Concat)
# 804 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 809 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_33 =
  fun b1 b3 ->
    let b2 = 
# 149 "parser.mly"
        (And)
# 817 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 822 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_34 =
  fun b1 b3 ->
    let b2 = 
# 150 "parser.mly"
       (Or)
# 830 "parser.ml"
     in
    (
# 116 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 835 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_35 =
  fun b1 b2 b3 lst ->
    (
# 117 "parser.mly"
                                                                                                      (EIfElse(b1, b2,[] , b3))
# 843 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_36 =
  fun b1 b2 ->
    (
# 118 "parser.mly"
                                   (EIfReturn (b1, b2))
# 851 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_37 =
  fun f ->
    (
# 119 "parser.mly"
                   (EFn(f))
# 859 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_38 =
  fun e ->
    (
# 120 "parser.mly"
                    (EReturn(e))
# 867 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_39 =
  fun lst ->
    (
# 127 "parser.mly"
                                                              (lst)
# 875 "parser.ml"
     : (Ast.block))

let _menhir_action_40 =
  fun body i ->
    (
# 54 "parser.mly"
    ( { name = i ; body = body } )
# 883 "parser.ml"
     : (Ast.decl))

let _menhir_action_41 =
  fun s ->
    (
# 105 "parser.mly"
             (EBexpr(s))
# 891 "parser.ml"
     : (Ast.expr))

let _menhir_action_42 =
  fun s ->
    (
# 106 "parser.mly"
             (Printf.printf "hi\n";EBlock(s))
# 899 "parser.ml"
     : (Ast.expr))

let _menhir_action_43 =
  fun dl ->
    (
# 49 "parser.mly"
    ( Printf.printf "HELLO" ; dl )
# 907 "parser.ml"
     : (Ast.file))

let _menhir_action_44 =
  fun e xs ->
    let pl = 
# 241 "<standard.mly>"
    ( xs )
# 915 "parser.ml"
     in
    (
# 59 "parser.mly"
   ( { formal = [] ; annot = ([], TAType(AEmpty)) ; body = e } )
# 920 "parser.ml"
     : (Ast.funbody))

let _menhir_action_45 =
  fun at ->
    (
# 77 "parser.mly"
               ( TAType(at) )
# 928 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_46 =
  fun at res ->
    (
# 78 "parser.mly"
                                      ( TFun(at, res) )
# 936 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_47 =
  fun res tl ->
    (
# 79 "parser.mly"
                                                                    (TMulFun(tl, res))
# 944 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_48 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 952 "parser.ml"
     : (unit list))

let _menhir_action_49 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 960 "parser.ml"
     : (unit list))

let _menhir_action_50 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 968 "parser.ml"
     : (Ast.file))

let _menhir_action_51 =
  fun d xs ->
    let x = 
# 48 "parser.mly"
                                                  (d)
# 976 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 981 "parser.ml"
     : (Ast.file))

let _menhir_action_52 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 989 "parser.ml"
     : (string list))

let _menhir_action_53 =
  fun s xs ->
    let x = 
# 71 "parser.mly"
                                    (s)
# 997 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1002 "parser.ml"
     : (string list))

let _menhir_action_54 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1010 "parser.ml"
     : (Ast.kokaType list))

let _menhir_action_55 =
  fun s xs ->
    let x = 
# 79 "parser.mly"
                                        (s)
# 1018 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1023 "parser.ml"
     : (Ast.kokaType list))

let _menhir_action_56 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1031 "parser.ml"
     : ((Ast.bexpr * Ast.expr) list))

let _menhir_action_57 =
  fun bb be xs ->
    let x = 
# 117 "parser.mly"
                                                                           ((be, bb))
# 1039 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1044 "parser.ml"
     : ((Ast.bexpr * Ast.expr) list))

let _menhir_action_58 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1052 "parser.ml"
     : (Ast.block))

let _menhir_action_59 =
  fun s xs ->
    let x = 
# 127 "parser.mly"
                                                   (s)
# 1060 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1065 "parser.ml"
     : (Ast.block))

let _menhir_action_60 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1073 "parser.ml"
     : (Ast.expr list))

let _menhir_action_61 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1081 "parser.ml"
     : (Ast.expr list))

let _menhir_action_62 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1089 "parser.ml"
     : ((string * Ast.kokaType) list))

let _menhir_action_63 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1097 "parser.ml"
     : ((string * Ast.kokaType) list))

let _menhir_action_64 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 1105 "parser.ml"
     : (unit list))

let _menhir_action_65 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 1113 "parser.ml"
     : (unit list))

let _menhir_action_66 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 1121 "parser.ml"
     : (Ast.result option))

let _menhir_action_67 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 1129 "parser.ml"
     : (Ast.result option))

let _menhir_action_68 =
  fun s ty ->
    (
# 63 "parser.mly"
                                      ( (s, ty) )
# 1137 "parser.ml"
     : (string * Ast.kokaType))

let _menhir_action_69 =
  fun lst t ->
    (
# 72 "parser.mly"
    ( (lst, t) )
# 1145 "parser.ml"
     : (Ast.result))

let _menhir_action_70 =
  fun t ->
    (
# 73 "parser.mly"
                 ( ([], t))
# 1153 "parser.ml"
     : (Ast.result))

let _menhir_action_71 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1161 "parser.ml"
     : (Ast.expr list))

let _menhir_action_72 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1169 "parser.ml"
     : (Ast.expr list))

let _menhir_action_73 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1177 "parser.ml"
     : ((string * Ast.kokaType) list))

let _menhir_action_74 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1185 "parser.ml"
     : ((string * Ast.kokaType) list))

let _menhir_action_75 =
  fun b ->
    (
# 131 "parser.mly"
              (SBexpr(b))
# 1193 "parser.ml"
     : (Ast.stmt))

let _menhir_action_76 =
  fun e s ->
    (
# 132 "parser.mly"
                               (SDecl(s, e))
# 1201 "parser.ml"
     : (Ast.stmt))

let _menhir_action_77 =
  fun e s ->
    (
# 133 "parser.mly"
                                 (SVar(s,e))
# 1209 "parser.ml"
     : (Ast.stmt))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | ARROW ->
        "ARROW"
    | ASSIGN ->
        "ASSIGN"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | CONCAT ->
        "CONCAT"
    | DEF ->
        "DEF"
    | DIV ->
        "DIV"
    | DOT ->
        "DOT"
    | ELIF ->
        "ELIF"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | EXCLAM ->
        "EXCLAM"
    | FALSE ->
        "FALSE"
    | FN ->
        "FN"
    | FUN ->
        "FUN"
    | GT ->
        "GT"
    | GTE ->
        "GTE"
    | IDENT _ ->
        "IDENT"
    | IF ->
        "IF"
    | INT _ ->
        "INT"
    | LBRAC ->
        "LBRAC"
    | LHOOK ->
        "LHOOK"
    | LPAR ->
        "LPAR"
    | LSPAR ->
        "LSPAR"
    | LT ->
        "LT"
    | LTE ->
        "LTE"
    | MINUS ->
        "MINUS"
    | MOD ->
        "MOD"
    | MUL ->
        "MUL"
    | NEQ ->
        "NEQ"
    | OR ->
        "OR"
    | PLUS ->
        "PLUS"
    | RBRAC ->
        "RBRAC"
    | RETURN ->
        "RETURN"
    | RHOOK ->
        "RHOOK"
    | RPAR ->
        "RPAR"
    | RSPAR ->
        "RSPAR"
    | SEMICOLON ->
        "SEMICOLON"
    | STRING _ ->
        "STRING"
    | THEN ->
        "THEN"
    | TILD ->
        "TILD"
    | TRUE ->
        "TRUE"
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
  
  let _menhir_run_144 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_list_SEMICOLON_ -> _ -> _menhir_box_file =
    fun _menhir_stack _v ->
      let MenhirCell1_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let dl = _v in
      let _v = _menhir_action_43 dl in
      MenhirBox_file _v
  
  let rec _menhir_run_148 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_ -> _ -> _menhir_box_file =
    fun _menhir_stack _v ->
      let MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_decl (_menhir_stack, _menhir_s, d) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_51 d xs in
      _menhir_goto_list___anonymous_0_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list___anonymous_0_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState147 ->
          _menhir_run_148 _menhir_stack _v
      | MenhirState003 ->
          _menhir_run_144 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | EOF | EXCLAM | FALSE | FN | FUN | IDENT _ | IF | INT _ | LPAR | LSPAR | RBRAC | RETURN | STRING _ | TILD | TRUE | VAL | VAR ->
          let _v = _menhir_action_48 () in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_49 x xs in
      _menhir_goto_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_SEMICOLON_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState053 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_054 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRAC as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | VAL ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | STRING _v_0 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState054
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | INT _v_1 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState054
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | IDENT _v_2 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState054
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | RBRAC ->
          let _v_3 = _menhir_action_58 () in
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ASSIGN ->
              let _menhir_s = MenhirState057 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TILD ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LSPAR ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FN ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCLAM ->
                  _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_046 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_02 () in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_atom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, MenhirState066) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | TILD ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | STRING _v_0 ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState067
          | RETURN ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | LSPAR ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | LPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | LBRAC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | INT _v_1 ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState067
          | IF ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | IDENT _v_2 ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState067
          | FN ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | FALSE ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | EXCLAM ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
          | RPAR ->
              let _v_3 = _menhir_action_60 () in
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 _tok
          | _ ->
              _eRR ())
      | LBRAC ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | FN ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_FN (_menhir_stack, MenhirState066) in
          let _menhir_s = MenhirState104 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_4 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (id, at) = (_v_4, _v) in
              let _v = _menhir_action_10 at id in
              _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | AND | COMMA | CONCAT | DIV | ELIF | ELSE | EQ | GT | GTE | LT | LTE | MINUS | MOD | MUL | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let a = _v in
          let _v = _menhir_action_18 a in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TILD (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState047 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let s = _v in
      let _v = _menhir_action_06 s in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState049 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LSPAR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState050
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | LBRAC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState050
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState050
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState050
      | RSPAR ->
          let _v = _menhir_action_60 () in
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_051 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | TILD ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | STRING _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | RETURN ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | LSPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | LPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | LBRAC ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | INT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051
      | IF ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051
      | FN ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | FALSE ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | EXCLAM ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | _ ->
          _eRR ()
  
  and _menhir_run_053 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRAC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | EXCLAM | FALSE | FN | IDENT _ | IF | INT _ | LPAR | LSPAR | RBRAC | RETURN | STRING _ | TILD | TRUE | VAL | VAR ->
          let _v = _menhir_action_48 () in
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState053 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_058 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let n = _v in
      let _v = _menhir_action_04 n in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState059 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_060 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let id = _v in
      let _v = _menhir_action_05 id in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_061 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState061 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState006 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RPAR ->
          let _v = _menhir_action_62 () in
          _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState008 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_009 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_17 () in
          _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009
      | COMMA ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | ARROW ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          let _v = _menhir_action_54 () in
          let _menhir_s = MenhirState009 in
          let _menhir_stack = MenhirCell1_list___anonymous_2_ (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState032 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LHOOK ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_atype : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ARROW ->
          let _menhir_stack = MenhirCell1_atype (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState018 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LHOOK ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | COMMA | EXCLAM | FALSE | FN | IDENT _ | IF | INT _ | LBRAC | LPAR | LSPAR | RETURN | RHOOK | RPAR | STRING _ | TILD | TRUE ->
          let at = _v in
          let _v = _menhir_action_45 at in
          _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_019 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LHOOK (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState019
      | RHOOK ->
          let _v = _menhir_action_52 () in
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState019
      | _ ->
          _eRR ()
  
  and _menhir_run_020 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState021
          | RHOOK ->
              let _v_0 = _menhir_action_52 () in
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_022 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_COMMA _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell0_IDENT (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_COMMA (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_53 s xs in
      _menhir_goto_list___anonymous_1_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list___anonymous_1_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState019 ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState021 ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_023 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LHOOK as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list___anonymous_1_ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState024 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LHOOK ->
              let _menhir_s = MenhirState013 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAR ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | ARROW | COMMA | EXCLAM | FALSE | FN | IDENT _ | IF | INT _ | LBRAC | LSPAR | RETURN | RHOOK | RPAR | STRING _ | TILD | TRUE ->
          let s = _v in
          let _v = _menhir_action_15 s in
          _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_kokatype : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState008 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState009 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState028 ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState032 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState013 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_036 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s) = _menhir_stack in
      let ty = _v in
      let _v = _menhir_action_68 s ty in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState039 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_73 x in
          _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState039 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState006 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_040 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_74 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_037 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_63 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_param__ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState043 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LHOOK ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | EXCLAM | FALSE | FN | IDENT _ | IF | INT _ | LBRAC | LPAR | LSPAR | RETURN | STRING _ | TILD | TRUE ->
          let _v = _menhir_action_66 () in
          _menhir_goto_option_annot_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_option_annot_ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_option_annot_ (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | STRING _v_0 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState045
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | LBRAC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | INT _v_1 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState045
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | IDENT _v_2 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState045
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState045
      | _ ->
          _eRR ()
  
  and _menhir_run_063 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_03 () in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_064 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EXCLAM (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState064 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_034 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let ty = _v in
          let _v = _menhir_action_16 ty in
          _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_kokatype (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState029
      | _ ->
          _eRR ()
  
  and _menhir_run_028 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState028 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let t = _v in
      let _v = _menhir_action_70 t in
      _menhir_goto_result _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_result : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState043 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState032 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_044 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let res = _v in
      let _v = _menhir_action_01 res in
      let x = _v in
      let _v = _menhir_action_67 x in
      _menhir_goto_option_annot_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_033 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_list___anonymous_2_ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list___anonymous_2_ (_menhir_stack, _, tl) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
      let res = _v in
      let _v = _menhir_action_47 res tl in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_026 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_atype -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atype (_menhir_stack, _menhir_s, at) = _menhir_stack in
      let res = _v in
      let _v = _menhir_action_46 at res in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_025 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LHOOK, _menhir_box_file) _menhir_cell1_list___anonymous_1_ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list___anonymous_1_ (_menhir_stack, _, lst) = _menhir_stack in
      let MenhirCell1_LHOOK (_menhir_stack, _menhir_s) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_69 lst t in
      _menhir_goto_result _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_014 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RHOOK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RPAR ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s) = _menhir_stack in
              let ty = _v in
              let _v = _menhir_action_14 s ty in
              _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_137 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LSPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RSPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LSPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_13 xs in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_atom (_menhir_stack, _menhir_s, at) = _menhir_stack in
          let xs = _v in
          let _v = _menhir_action_09 at xs in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_bexpr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState047 ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState054 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState102 ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState100 ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState092 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState090 ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState088 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState080 ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState078 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState076 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState125 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState114 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_140 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_TILD -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_TILD (_menhir_stack, _menhir_s) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_19 b in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_132 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let b = _v in
          let _v = _menhir_action_75 b in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState076 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState084 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState086 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState078 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState080 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState088 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState092 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState094 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState096 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState098 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState100 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState082 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState090 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState102 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
      | _ ->
          _eRR ()
  
  and _menhir_run_128 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) in
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
      | EOF | EXCLAM | FALSE | FN | FUN | IDENT _ | IF | INT _ | LPAR | LSPAR | RBRAC | RETURN | STRING _ | TILD | TRUE | VAL | VAR ->
          let x = () in
          let _v = _menhir_action_64 x in
          _menhir_goto_nonempty_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_SEMICOLON_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState146 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState127 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_147 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | FUN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | EOF ->
          let _v_0 = _menhir_action_50 () in
          _menhir_run_148 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _menhir_s = MenhirState005 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_130 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_stmt as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | VAL ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | STRING _v_0 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState130
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | INT _v_1 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState130
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | IDENT _v_2 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState130
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | RBRAC ->
          let _v_3 = _menhir_action_58 () in
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
      | _ ->
          _eRR ()
  
  and _menhir_run_123 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VAL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | DEF ->
              let _menhir_s = MenhirState125 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TILD ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LSPAR ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FN ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCLAM ->
                  _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_131 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_59 s xs in
      _menhir_goto_list___anonymous_4_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list___anonymous_4_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState054 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState130 ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_133 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_cell1_list_SEMICOLON_ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_LBRAC (_menhir_stack, _menhir_s) = _menhir_stack in
      let lst = _v in
      let _v = _menhir_action_39 lst in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState066 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState045 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState125 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState114 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_108 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, at) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_12 at b in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let s = _v in
      let _v = _menhir_action_42 s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState045 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState049 ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState051 ->
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState125 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState057 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState120 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState118 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState114 ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState110 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_141 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_option_annot_ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_option_annot_ (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_44 e xs in
      _menhir_goto_funbody _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_funbody : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState005 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState104 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_143 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_FUN _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
      let MenhirCell1_FUN (_menhir_stack, _menhir_s) = _menhir_stack in
      let body = _v in
      let _v = _menhir_action_40 body i in
      let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
      | _ ->
          _eRR ()
  
  and _menhir_run_105 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_FN -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_atom (_menhir_stack, _menhir_s, at) = _menhir_stack in
      let fb = _v in
      let _v = _menhir_action_11 at fb in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_062 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_FN -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FN (_menhir_stack, _menhir_s) = _menhir_stack in
      let f = _v in
      let _v = _menhir_action_37 f in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_139 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_38 e in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_135 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_126 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_VAL _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_VAL (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_76 e s in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_122 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_VAR _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_VAR (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_77 e s in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_121 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _, b1) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let b2 = _v in
      let _v = _menhir_action_36 b1 b2 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_119 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_list___anonymous_3_ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list___anonymous_3_ (_menhir_stack, _, lst) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _, b2) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, b1) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let b3 = _v in
      let _v = _menhir_action_35 b1 b2 b3 lst in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_115 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELIF ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | ELSE ->
          let _v_0 = _menhir_action_56 () in
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_112 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ELIF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState112 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_116 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_expr (_menhir_stack, _, bb) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, be) = _menhir_stack in
      let MenhirCell1_ELIF (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_57 bb be xs in
      _menhir_goto_list___anonymous_3_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list___anonymous_3_ : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState111 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState115 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_117 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list___anonymous_3_ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState118 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_111 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELIF ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState111
      | ELSE ->
          let _v_0 = _menhir_action_56 () in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState111
      | _ ->
          _eRR ()
  
  and _menhir_run_071 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState072 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RPAR | RSPAR ->
          let x = _v in
          let _v = _menhir_action_71 x in
          _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_expr_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState072 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState050 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_72 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_068 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let x = _v in
      let _v = _menhir_action_61 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState050 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState067 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_129 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_65 x xs in
      _menhir_goto_nonempty_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_113 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState114 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_109 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState110 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RETURN ->
          let _menhir_s = MenhirState120 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_103 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_33 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_21 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_25 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_26 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_23 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_24 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_32 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_28 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_22 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_34 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
      let b3 = _v in
      let _v = _menhir_action_30 b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_081 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
      let b3 = _v in
      let _v = _menhir_action_31 b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_079 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
      let b3 = _v in
      let _v = _menhir_action_29 b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_077 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_27 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let s = _v in
          let _v = _menhir_action_41 s in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_065 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_EXCLAM -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_EXCLAM (_menhir_stack, _menhir_s) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_20 b in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_003 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | FUN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
      | EOF ->
          let _v_0 = _menhir_action_50 () in
          _menhir_run_144 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF | FUN ->
          let _v = _menhir_action_48 () in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let file =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
