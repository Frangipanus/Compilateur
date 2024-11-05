
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

  | MenhirState029 : (('s, _menhir_box_file) _menhir_cell1_COMMA, _menhir_box_file) _menhir_state
    (** State 029.
        Stack shape : COMMA.
        Start symbol: file. *)

  | MenhirState030 : ((('s, _menhir_box_file) _menhir_cell1_COMMA, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_state
    (** State 030.
        Stack shape : COMMA kokatype.
        Start symbol: file. *)

  | MenhirState033 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_list___anonymous_2_, _menhir_box_file) _menhir_state
    (** State 033.
        Stack shape : LPAR list(__anonymous_2).
        Start symbol: file. *)

  | MenhirState040 : (('s, _menhir_box_file) _menhir_cell1_param, _menhir_box_file) _menhir_state
    (** State 040.
        Stack shape : param.
        Start symbol: file. *)

  | MenhirState044 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__, _menhir_box_file) _menhir_state
    (** State 044.
        Stack shape : LPAR loption(separated_nonempty_list(COMMA,param)).
        Start symbol: file. *)

  | MenhirState046 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_option_annot_, _menhir_box_file) _menhir_state
    (** State 046.
        Stack shape : LPAR loption(separated_nonempty_list(COMMA,param)) option(annot).
        Start symbol: file. *)

  | MenhirState048 : (('s, _menhir_box_file) _menhir_cell1_TILD, _menhir_box_file) _menhir_state
    (** State 048.
        Stack shape : TILD.
        Start symbol: file. *)

  | MenhirState050 : (('s, _menhir_box_file) _menhir_cell1_RETURN, _menhir_box_file) _menhir_state
    (** State 050.
        Stack shape : RETURN.
        Start symbol: file. *)

  | MenhirState051 : (('s, _menhir_box_file) _menhir_cell1_LSPAR, _menhir_box_file) _menhir_state
    (** State 051.
        Stack shape : LSPAR.
        Start symbol: file. *)

  | MenhirState052 : (('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 052.
        Stack shape : LPAR.
        Start symbol: file. *)

  | MenhirState054 : (('s, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_state
    (** State 054.
        Stack shape : LBRAC.
        Start symbol: file. *)

  | MenhirState055 : ((('s, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_cell1_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 055.
        Stack shape : LBRAC list(SEMICOLON).
        Start symbol: file. *)

  | MenhirState058 : (('s, _menhir_box_file) _menhir_cell1_VAR _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 058.
        Stack shape : VAR IDENT.
        Start symbol: file. *)

  | MenhirState060 : (('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_state
    (** State 060.
        Stack shape : IF.
        Start symbol: file. *)

  | MenhirState062 : (('s, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 062.
        Stack shape : FN.
        Start symbol: file. *)

  | MenhirState065 : (('s, _menhir_box_file) _menhir_cell1_EXCLAM, _menhir_box_file) _menhir_state
    (** State 065.
        Stack shape : EXCLAM.
        Start symbol: file. *)

  | MenhirState067 : (('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_state
    (** State 067.
        Stack shape : atom.
        Start symbol: file. *)

  | MenhirState068 : ((('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 068.
        Stack shape : atom LPAR.
        Start symbol: file. *)

  | MenhirState073 : (('s, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 073.
        Stack shape : expr.
        Start symbol: file. *)

  | MenhirState077 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 077.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState079 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 079.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState081 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 081.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState083 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 083.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState085 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 085.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState087 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 087.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState089 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 089.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState091 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 091.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState093 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 093.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState095 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 095.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState097 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 097.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState099 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 099.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState101 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 101.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState103 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 103.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState105 : ((('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 105.
        Stack shape : atom FN.
        Start symbol: file. *)

  | MenhirState111 : ((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 111.
        Stack shape : IF bexpr.
        Start symbol: file. *)

  | MenhirState112 : (((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 112.
        Stack shape : IF bexpr expr.
        Start symbol: file. *)

  | MenhirState113 : (((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_state
    (** State 113.
        Stack shape : bexpr expr ELIF.
        Start symbol: file. *)

  | MenhirState115 : ((((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 115.
        Stack shape : bexpr expr ELIF bexpr.
        Start symbol: file. *)

  | MenhirState116 : (((((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 116.
        Stack shape : bexpr expr ELIF bexpr expr.
        Start symbol: file. *)

  | MenhirState119 : ((((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_list___anonymous_4_, _menhir_box_file) _menhir_state
    (** State 119.
        Stack shape : IF bexpr expr list(__anonymous_4).
        Start symbol: file. *)

  | MenhirState121 : ((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 121.
        Stack shape : IF bexpr.
        Start symbol: file. *)

  | MenhirState126 : (('s, _menhir_box_file) _menhir_cell1_VAL _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 126.
        Stack shape : VAL IDENT.
        Start symbol: file. *)

  | MenhirState128 : (('s, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_state
    (** State 128.
        Stack shape : stmt.
        Start symbol: file. *)

  | MenhirState129 : (('s, _menhir_box_file) _menhir_cell1_SEMICOLON, _menhir_box_file) _menhir_state
    (** State 129.
        Stack shape : SEMICOLON.
        Start symbol: file. *)

  | MenhirState131 : ((('s, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 131.
        Stack shape : stmt nonempty_list(SEMICOLON).
        Start symbol: file. *)

  | MenhirState147 : (('s, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_state
    (** State 147.
        Stack shape : decl.
        Start symbol: file. *)

  | MenhirState148 : ((('s, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 148.
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

and ('s, 'r) _menhir_cell1_list___anonymous_4_ = 
  | MenhirCell1_list___anonymous_4_ of 's * ('s, 'r) _menhir_state * ((Ast.bexpr * Ast.expr) list)

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
# 89 "parser.mly"
         ( ATrue )
# 499 "parser.ml"
     : (Ast.atom))

let _menhir_action_03 =
  fun () ->
    (
# 90 "parser.mly"
          ( AFalse )
# 507 "parser.ml"
     : (Ast.atom))

let _menhir_action_04 =
  fun n ->
    (
# 91 "parser.mly"
            ( Int(n) )
# 515 "parser.ml"
     : (Ast.atom))

let _menhir_action_05 =
  fun s ->
    (
# 92 "parser.mly"
               ( String(s) )
# 523 "parser.ml"
     : (Ast.atom))

let _menhir_action_06 =
  fun () ->
    (
# 93 "parser.mly"
                ( Empty )
# 531 "parser.ml"
     : (Ast.atom))

let _menhir_action_07 =
  fun id ->
    (
# 94 "parser.mly"
               ( Ident(id) )
# 539 "parser.ml"
     : (Ast.atom))

let _menhir_action_08 =
  fun e ->
    (
# 95 "parser.mly"
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
# 96 "parser.mly"
                                                               ( Eval(at, el) )
# 560 "parser.ml"
     : (Ast.atom))

let _menhir_action_10 =
  fun at id ->
    (
# 97 "parser.mly"
                                 ( Dot(at, id) )
# 568 "parser.ml"
     : (Ast.atom))

let _menhir_action_11 =
  fun at fb ->
    (
# 98 "parser.mly"
                                  ( Fn(at, fb) )
# 576 "parser.ml"
     : (Ast.atom))

let _menhir_action_12 =
  fun at b ->
    (
# 99 "parser.mly"
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
# 100 "parser.mly"
                                                     ( Brac(el) )
# 597 "parser.ml"
     : (Ast.atom))

let _menhir_action_14 =
  fun s ty ->
    (
# 83 "parser.mly"
                                                                        (AVar(s, ty))
# 605 "parser.ml"
     : (Ast.atype))

let _menhir_action_15 =
  fun ty ->
    (
# 84 "parser.mly"
                          (AType(ty))
# 613 "parser.ml"
     : (Ast.atype))

let _menhir_action_16 =
  fun () ->
    (
# 85 "parser.mly"
            (AEmpty)
# 621 "parser.ml"
     : (Ast.atype))

let _menhir_action_17 =
  fun a ->
    (
# 109 "parser.mly"
             (Eatom(a))
# 629 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_18 =
  fun b ->
    (
# 110 "parser.mly"
                   (ETild (b))
# 637 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_19 =
  fun b ->
    (
# 111 "parser.mly"
                     (ENot(b))
# 645 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_20 =
  fun b1 b3 ->
    let b2 = 
# 132 "parser.mly"
       (Eq)
# 653 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 658 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_21 =
  fun b1 b3 ->
    let b2 = 
# 133 "parser.mly"
        (Neq)
# 666 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 671 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_22 =
  fun b1 b3 ->
    let b2 = 
# 134 "parser.mly"
       (Lt)
# 679 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 684 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_23 =
  fun b1 b3 ->
    let b2 = 
# 135 "parser.mly"
        (Lte)
# 692 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 697 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_24 =
  fun b1 b3 ->
    let b2 = 
# 136 "parser.mly"
       (Gt)
# 705 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 710 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_25 =
  fun b1 b3 ->
    let b2 = 
# 137 "parser.mly"
        (Gte)
# 718 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 723 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_26 =
  fun b1 b3 ->
    let b2 = 
# 138 "parser.mly"
         (Add)
# 731 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 736 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_27 =
  fun b1 b3 ->
    let b2 = 
# 139 "parser.mly"
          (Sub)
# 744 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 749 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_28 =
  fun b1 b3 ->
    let b2 = 
# 140 "parser.mly"
        (Mul)
# 757 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 762 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_29 =
  fun b1 b3 ->
    let b2 = 
# 141 "parser.mly"
        (Div)
# 770 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 775 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_30 =
  fun b1 b3 ->
    let b2 = 
# 142 "parser.mly"
        (Mod)
# 783 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 788 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_31 =
  fun b1 b3 ->
    let b2 = 
# 143 "parser.mly"
           (Concat)
# 796 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 801 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_32 =
  fun b1 b3 ->
    let b2 = 
# 144 "parser.mly"
        (And)
# 809 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 814 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_33 =
  fun b1 b3 ->
    let b2 = 
# 145 "parser.mly"
       (Or)
# 822 "parser.ml"
     in
    (
# 112 "parser.mly"
                                      (EBinop(b2,b1,b3))
# 827 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_34 =
  fun b1 b2 b3 lst ->
    (
# 113 "parser.mly"
                                                                                                      (EIfElse(b1, b2,[] , b3))
# 835 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_35 =
  fun b1 b2 ->
    (
# 114 "parser.mly"
                                   (EIfReturn (b1, b2))
# 843 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_36 =
  fun f ->
    (
# 115 "parser.mly"
                   (EFn(f))
# 851 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_37 =
  fun e ->
    (
# 116 "parser.mly"
                    (EReturn(e))
# 859 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_38 =
  fun lst ->
    (
# 122 "parser.mly"
                                                              (lst)
# 867 "parser.ml"
     : (Ast.block))

let _menhir_action_39 =
  fun body i ->
    (
# 54 "parser.mly"
    ( { name = i ; body = body } )
# 875 "parser.ml"
     : (Ast.decl))

let _menhir_action_40 =
  fun s ->
    (
# 104 "parser.mly"
             (EBlock(s))
# 883 "parser.ml"
     : (Ast.expr))

let _menhir_action_41 =
  fun s ->
    (
# 105 "parser.mly"
             (EBexpr(s))
# 891 "parser.ml"
     : (Ast.expr))

let _menhir_action_42 =
  fun dl ->
    (
# 49 "parser.mly"
    ( Printf.printf "hi" ; dl )
# 899 "parser.ml"
     : (Ast.file))

let _menhir_action_43 =
  fun e xs ->
    let pl = 
# 241 "<standard.mly>"
    ( xs )
# 907 "parser.ml"
     in
    (
# 59 "parser.mly"
   ( { formal = [] ; annot = ([], TAType(AEmpty)) ; body = e } )
# 912 "parser.ml"
     : (Ast.funbody))

let _menhir_action_44 =
  fun at ->
    (
# 77 "parser.mly"
               ( TAType(at) )
# 920 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_45 =
  fun at res ->
    (
# 78 "parser.mly"
                                      ( TFun(at, res) )
# 928 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_46 =
  fun res tl ->
    (
# 79 "parser.mly"
                                                                    (TMulFun(tl, res))
# 936 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_47 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 944 "parser.ml"
     : (unit list))

let _menhir_action_48 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 952 "parser.ml"
     : (unit list))

let _menhir_action_49 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 960 "parser.ml"
     : (Ast.file))

let _menhir_action_50 =
  fun d xs ->
    let x = 
# 48 "parser.mly"
                                                  (d)
# 968 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 973 "parser.ml"
     : (Ast.file))

let _menhir_action_51 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 981 "parser.ml"
     : (string list))

let _menhir_action_52 =
  fun s xs ->
    let x = 
# 71 "parser.mly"
                                    (s)
# 989 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 994 "parser.ml"
     : (string list))

let _menhir_action_53 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1002 "parser.ml"
     : (Ast.kokaType list))

let _menhir_action_54 =
  fun s xs ->
    let x = 
# 79 "parser.mly"
                                        (s)
# 1010 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1015 "parser.ml"
     : (Ast.kokaType list))

let _menhir_action_55 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1023 "parser.ml"
     : ((Ast.bexpr * Ast.expr) list))

let _menhir_action_56 =
  fun bb be xs ->
    let x = 
# 113 "parser.mly"
                                                                           ((be, bb))
# 1031 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1036 "parser.ml"
     : ((Ast.bexpr * Ast.expr) list))

let _menhir_action_57 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1044 "parser.ml"
     : (Ast.block))

let _menhir_action_58 =
  fun s xs ->
    let x = 
# 122 "parser.mly"
                                                   (s)
# 1052 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1057 "parser.ml"
     : (Ast.block))

let _menhir_action_59 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1065 "parser.ml"
     : (Ast.expr list))

let _menhir_action_60 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1073 "parser.ml"
     : (Ast.expr list))

let _menhir_action_61 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1081 "parser.ml"
     : ((string * Ast.kokaType) list))

let _menhir_action_62 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1089 "parser.ml"
     : ((string * Ast.kokaType) list))

let _menhir_action_63 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 1097 "parser.ml"
     : (unit list))

let _menhir_action_64 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 1105 "parser.ml"
     : (unit list))

let _menhir_action_65 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 1113 "parser.ml"
     : (Ast.kokaType option))

let _menhir_action_66 =
  fun ty ->
    let x = 
# 83 "parser.mly"
                                                                  (ty)
# 1121 "parser.ml"
     in
    (
# 114 "<standard.mly>"
    ( Some x )
# 1126 "parser.ml"
     : (Ast.kokaType option))

let _menhir_action_67 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 1134 "parser.ml"
     : (Ast.result option))

let _menhir_action_68 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 1142 "parser.ml"
     : (Ast.result option))

let _menhir_action_69 =
  fun s ty ->
    (
# 63 "parser.mly"
                                      ( (s, ty) )
# 1150 "parser.ml"
     : (string * Ast.kokaType))

let _menhir_action_70 =
  fun lst t ->
    (
# 72 "parser.mly"
    ( (lst, t) )
# 1158 "parser.ml"
     : (Ast.result))

let _menhir_action_71 =
  fun t ->
    (
# 73 "parser.mly"
                 ( ([], t))
# 1166 "parser.ml"
     : (Ast.result))

let _menhir_action_72 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1174 "parser.ml"
     : (Ast.expr list))

let _menhir_action_73 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1182 "parser.ml"
     : (Ast.expr list))

let _menhir_action_74 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1190 "parser.ml"
     : ((string * Ast.kokaType) list))

let _menhir_action_75 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1198 "parser.ml"
     : ((string * Ast.kokaType) list))

let _menhir_action_76 =
  fun b ->
    (
# 126 "parser.mly"
              (SBexpr(b))
# 1206 "parser.ml"
     : (Ast.stmt))

let _menhir_action_77 =
  fun e s ->
    (
# 127 "parser.mly"
                               (SDecl(s, e))
# 1214 "parser.ml"
     : (Ast.stmt))

let _menhir_action_78 =
  fun e s ->
    (
# 128 "parser.mly"
                                 (SVar(s,e))
# 1222 "parser.ml"
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
  
  let _menhir_run_145 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_list_SEMICOLON_ -> _ -> _menhir_box_file =
    fun _menhir_stack _v ->
      let MenhirCell1_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let dl = _v in
      let _v = _menhir_action_42 dl in
      MenhirBox_file _v
  
  let rec _menhir_run_149 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_ -> _ -> _menhir_box_file =
    fun _menhir_stack _v ->
      let MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_decl (_menhir_stack, _menhir_s, d) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_50 d xs in
      _menhir_goto_list___anonymous_0_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list___anonymous_0_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState148 ->
          _menhir_run_149 _menhir_stack _v
      | MenhirState003 ->
          _menhir_run_145 _menhir_stack _v
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
          let _v = _menhir_action_47 () in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_48 x xs in
      _menhir_goto_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_SEMICOLON_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState054 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_055 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRAC as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | VAL ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | STRING _v_0 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState055
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | INT _v_1 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState055
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | IDENT _v_2 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState055
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | RBRAC ->
          let _v_3 = _menhir_action_57 () in
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ASSIGN ->
              let _menhir_s = MenhirState058 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TILD ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LSPAR ->
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FN ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCLAM ->
                  _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_02 () in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_atom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, MenhirState067) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | TILD ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | STRING _v_0 ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState068
          | RETURN ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | LSPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | LPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | LBRAC ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | INT _v_1 ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState068
          | IF ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | IDENT _v_2 ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState068
          | FN ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | FALSE ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | EXCLAM ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState068
          | RPAR ->
              let _v_3 = _menhir_action_59 () in
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 _tok
          | _ ->
              _eRR ())
      | LBRAC ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
      | FN ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_FN (_menhir_stack, MenhirState067) in
          let _menhir_s = MenhirState105 in
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
          let _v = _menhir_action_17 a in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TILD (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState048 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let s = _v in
      let _v = _menhir_action_05 s in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState050 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_051 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LSPAR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | LBRAC ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState051
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
      | RSPAR ->
          let _v = _menhir_action_59 () in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | TILD ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | STRING _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | RETURN ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LSPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LBRAC ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | INT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052
      | IF ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052
      | FN ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | FALSE ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | EXCLAM ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | _ ->
          _eRR ()
  
  and _menhir_run_054 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRAC (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | EXCLAM | FALSE | FN | IDENT _ | IF | INT _ | LPAR | LSPAR | RBRAC | RETURN | STRING _ | TILD | TRUE | VAL | VAR ->
          let _v = _menhir_action_47 () in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState054 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let n = _v in
      let _v = _menhir_action_04 n in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_060 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState060 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let id = _v in
      let _v = _menhir_action_07 id in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_062 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState062 in
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
          let _v = _menhir_action_61 () in
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
          let _v = _menhir_action_16 () in
          _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | LPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009
      | COMMA ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | ARROW ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s) in
          let _v = _menhir_action_53 () in
          let _menhir_s = MenhirState009 in
          let _menhir_stack = MenhirCell1_list___anonymous_2_ (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState033 in
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
          let _v = _menhir_action_44 at in
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
          let _v = _menhir_action_51 () in
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
              let _v_0 = _menhir_action_51 () in
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
      let _v = _menhir_action_52 s xs in
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
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
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
          let _v = _menhir_action_65 () in
          _menhir_goto_option___anonymous_3_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_option___anonymous_3_ : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s) = _menhir_stack in
      let ty = _v in
      let _v = _menhir_action_14 s ty in
      _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_kokatype : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState008 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState009 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState029 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState013 ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_037 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s) = _menhir_stack in
      let ty = _v in
      let _v = _menhir_action_69 s ty in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState040 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_74 x in
          _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState040 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState006 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_041 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_75 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_038 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_62 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_param__ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState044 in
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
          let _v = _menhir_action_67 () in
          _menhir_goto_option_annot_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_option_annot_ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_option_annot_ (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | STRING _v_0 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState046
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | LBRAC ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | INT _v_1 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState046
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | IDENT _v_2 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState046
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState046
      | _ ->
          _eRR ()
  
  and _menhir_run_064 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_03 () in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_065 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EXCLAM (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState065 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let ty = _v in
          let _v = _menhir_action_15 ty in
          _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_030 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_kokatype (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState029 in
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
      let _v = _menhir_action_71 t in
      _menhir_goto_result _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_result : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState044 ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_045 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let res = _v in
      let _v = _menhir_action_01 res in
      let x = _v in
      let _v = _menhir_action_68 x in
      _menhir_goto_option_annot_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_034 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_list___anonymous_2_ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list___anonymous_2_ (_menhir_stack, _, tl) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
      let res = _v in
      let _v = _menhir_action_46 res tl in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_026 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_atype -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atype (_menhir_stack, _menhir_s, at) = _menhir_stack in
      let res = _v in
      let _v = _menhir_action_45 at res in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_025 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LHOOK, _menhir_box_file) _menhir_cell1_list___anonymous_1_ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list___anonymous_1_ (_menhir_stack, _, lst) = _menhir_stack in
      let MenhirCell1_LHOOK (_menhir_stack, _menhir_s) = _menhir_stack in
      let t = _v in
      let _v = _menhir_action_70 lst t in
      _menhir_goto_result _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_014 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RHOOK ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RPAR ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let ty = _v in
              let _v = _menhir_action_66 ty in
              _menhir_goto_option___anonymous_3_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_138 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LSPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
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
  
  and _menhir_run_070 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
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
      | MenhirState048 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState131 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState083 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState077 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState126 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState121 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState065 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_141 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_TILD -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_TILD (_menhir_stack, _menhir_s) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_18 b in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_133 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let b = _v in
          let _v = _menhir_action_76 b in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState077 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState085 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState087 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState079 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState081 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState089 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState093 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState095 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState097 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState099 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState101 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState083 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState091 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_103 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState103 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
      | _ ->
          _eRR ()
  
  and _menhir_run_129 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) in
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState129
      | EOF | EXCLAM | FALSE | FN | FUN | IDENT _ | IF | INT _ | LPAR | LSPAR | RBRAC | RETURN | STRING _ | TILD | TRUE | VAL | VAR ->
          let x = () in
          let _v = _menhir_action_63 x in
          _menhir_goto_nonempty_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_SEMICOLON_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState147 ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_148 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | FUN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | EOF ->
          let _v_0 = _menhir_action_49 () in
          _menhir_run_149 _menhir_stack _v_0
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
  
  and _menhir_run_131 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_stmt as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | VAL ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | STRING _v_0 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState131
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | INT _v_1 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState131
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | IDENT _v_2 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState131
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | RBRAC ->
          let _v_3 = _menhir_action_57 () in
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
      | _ ->
          _eRR ()
  
  and _menhir_run_124 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VAL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | DEF ->
              let _menhir_s = MenhirState126 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TILD ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LSPAR ->
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FN ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCLAM ->
                  _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_132 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_58 s xs in
      _menhir_goto_list___anonymous_5_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list___anonymous_5_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState055 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState131 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_134 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_cell1_list_SEMICOLON_ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_LBRAC (_menhir_stack, _menhir_s) = _menhir_stack in
      let lst = _v in
      let _v = _menhir_action_38 lst in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState067 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState046 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState126 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState121 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_109 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, at) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_12 at b in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let s = _v in
      let _v = _menhir_action_40 s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState046 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState050 ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState052 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState126 ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState121 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState119 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState115 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_142 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_option_annot_ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_option_annot_ (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_43 e xs in
      _menhir_goto_funbody _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_funbody : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState005 ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState105 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState062 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_144 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_FUN _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, i) = _menhir_stack in
      let MenhirCell1_FUN (_menhir_stack, _menhir_s) = _menhir_stack in
      let body = _v in
      let _v = _menhir_action_39 body i in
      let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_FN -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_atom (_menhir_stack, _menhir_s, at) = _menhir_stack in
      let fb = _v in
      let _v = _menhir_action_11 at fb in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_063 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_FN -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_FN (_menhir_stack, _menhir_s) = _menhir_stack in
      let f = _v in
      let _v = _menhir_action_36 f in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_140 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_37 e in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_136 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
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
  
  and _menhir_run_127 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_VAL _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_VAL (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_77 e s in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_123 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_VAR _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s) = _menhir_stack in
      let MenhirCell1_VAR (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_78 e s in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_122 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _, b1) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let b2 = _v in
      let _v = _menhir_action_35 b1 b2 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_120 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_list___anonymous_4_ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list___anonymous_4_ (_menhir_stack, _, lst) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _, b2) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, b1) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let b3 = _v in
      let _v = _menhir_action_34 b1 b2 b3 lst in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_116 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELIF ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState116
      | ELSE ->
          let _v_0 = _menhir_action_55 () in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_113 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ELIF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState113 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_117 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_expr (_menhir_stack, _, bb) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, be) = _menhir_stack in
      let MenhirCell1_ELIF (_menhir_stack, _menhir_s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_56 bb be xs in
      _menhir_goto_list___anonymous_4_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list___anonymous_4_ : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState112 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState116 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_118 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list___anonymous_4_ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState119 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_112 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELIF ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState112
      | ELSE ->
          let _v_0 = _menhir_action_55 () in
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState112
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState073 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RPAR | RSPAR ->
          let x = _v in
          let _v = _menhir_action_72 x in
          _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_expr_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState073 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState051 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_074 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_73 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_069 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let x = _v in
      let _v = _menhir_action_60 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState051 ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState068 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_130 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_64 x xs in
      _menhir_goto_nonempty_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_114 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState115 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_110 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState111 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RETURN ->
          let _menhir_s = MenhirState121 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_32 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_20 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_24 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_25 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_22 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_23 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_31 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_27 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_21 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_33 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
      let b3 = _v in
      let _v = _menhir_action_29 b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_082 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
      let b3 = _v in
      let _v = _menhir_action_30 b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_080 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
      let b3 = _v in
      let _v = _menhir_action_28 b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_078 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1) = _menhir_stack in
          let b3 = _v in
          let _v = _menhir_action_26 b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let s = _v in
          let _v = _menhir_action_41 s in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_EXCLAM -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_EXCLAM (_menhir_stack, _menhir_s) = _menhir_stack in
      let b = _v in
      let _v = _menhir_action_19 b in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_003 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | FUN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
      | EOF ->
          let _v_0 = _menhir_action_49 () in
          _menhir_run_145 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF | FUN ->
          let _v = _menhir_action_47 () in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let file =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
