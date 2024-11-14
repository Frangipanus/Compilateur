
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
# 22 "parser.mly"
       (string)
# 20 "parser.ml"
  )
    | SEMICOLON
    | RSPAR
    | RPAR
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
    | LBRAC
    | INT of (
# 21 "parser.mly"
       (int)
# 41 "parser.ml"
  )
    | IF
    | IDENT of (
# 20 "parser.mly"
       (string)
# 47 "parser.ml"
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


# 78 "parser.ml"

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

  | MenhirState011 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_RPAR, _menhir_box_file) _menhir_state
    (** State 011.
        Stack shape : LPAR RPAR.
        Start symbol: file. *)

  | MenhirState012 : (('s, _menhir_box_file) _menhir_cell1_LT, _menhir_box_file) _menhir_state
    (** State 012.
        Stack shape : LT.
        Start symbol: file. *)

  | MenhirState014 : (('s, _menhir_box_file) _menhir_cell1_IDENT, _menhir_box_file) _menhir_state
    (** State 014.
        Stack shape : IDENT.
        Start symbol: file. *)

  | MenhirState018 : ((('s, _menhir_box_file) _menhir_cell1_LT, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_IDENT__, _menhir_box_file) _menhir_state
    (** State 018.
        Stack shape : LT loption(separated_nonempty_list(COMMA,IDENT)).
        Start symbol: file. *)

  | MenhirState021 : (('s, _menhir_box_file) _menhir_cell1_IDENT _menhir_cell0_LPAR _menhir_cell0_LT, _menhir_box_file) _menhir_state
    (** State 021.
        Stack shape : IDENT LPAR LT.
        Start symbol: file. *)

  | MenhirState026 : (('s, _menhir_box_file) _menhir_cell1_atype, _menhir_box_file) _menhir_state
    (** State 026.
        Stack shape : atype.
        Start symbol: file. *)

  | MenhirState033 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype _menhir_cell0_RPAR, _menhir_box_file) _menhir_state
    (** State 033.
        Stack shape : LPAR kokatype RPAR.
        Start symbol: file. *)

  | MenhirState035 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_state
    (** State 035.
        Stack shape : LPAR kokatype.
        Start symbol: file. *)

  | MenhirState038 : (((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_kokatype_ _menhir_cell0_RPAR, _menhir_box_file) _menhir_state
    (** State 038.
        Stack shape : LPAR kokatype separated_nonempty_list(COMMA,kokatype) RPAR.
        Start symbol: file. *)

  | MenhirState041 : ((('s, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_state
    (** State 041.
        Stack shape : kokatype kokatype.
        Start symbol: file. *)

  | MenhirState046 : (('s, _menhir_box_file) _menhir_cell1_param, _menhir_box_file) _menhir_state
    (** State 046.
        Stack shape : param.
        Start symbol: file. *)

  | MenhirState049 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR, _menhir_box_file) _menhir_state
    (** State 049.
        Stack shape : LPAR loption(separated_nonempty_list(COMMA,param)) RPAR.
        Start symbol: file. *)

  | MenhirState051 : (('s, _menhir_box_file) _menhir_cell1_TILD, _menhir_box_file) _menhir_state
    (** State 051.
        Stack shape : TILD.
        Start symbol: file. *)

  | MenhirState053 : (('s, _menhir_box_file) _menhir_cell1_RETURN, _menhir_box_file) _menhir_state
    (** State 053.
        Stack shape : RETURN.
        Start symbol: file. *)

  | MenhirState054 : (('s, _menhir_box_file) _menhir_cell1_LSPAR, _menhir_box_file) _menhir_state
    (** State 054.
        Stack shape : LSPAR.
        Start symbol: file. *)

  | MenhirState055 : (('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 055.
        Stack shape : LPAR.
        Start symbol: file. *)

  | MenhirState057 : (('s, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_state
    (** State 057.
        Stack shape : LBRAC.
        Start symbol: file. *)

  | MenhirState058 : ((('s, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_cell1_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 058.
        Stack shape : LBRAC list(SEMICOLON).
        Start symbol: file. *)

  | MenhirState061 : (('s, _menhir_box_file) _menhir_cell1_VAR _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 061.
        Stack shape : VAR IDENT.
        Start symbol: file. *)

  | MenhirState063 : (('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_state
    (** State 063.
        Stack shape : IF.
        Start symbol: file. *)

  | MenhirState065 : (('s, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 065.
        Stack shape : FN.
        Start symbol: file. *)

  | MenhirState068 : (('s, _menhir_box_file) _menhir_cell1_EXCLAM, _menhir_box_file) _menhir_state
    (** State 068.
        Stack shape : EXCLAM.
        Start symbol: file. *)

  | MenhirState070 : (('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_state
    (** State 070.
        Stack shape : atom.
        Start symbol: file. *)

  | MenhirState071 : ((('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 071.
        Stack shape : atom LPAR.
        Start symbol: file. *)

  | MenhirState076 : (('s, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 076.
        Stack shape : expr.
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

  | MenhirState098 : (('s, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_LT, _menhir_box_file) _menhir_state
    (** State 098.
        Stack shape : bexpr LT.
        Start symbol: file. *)

  | MenhirState100 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 100.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState102 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 102.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState104 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 104.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState106 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 106.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState108 : ((('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 108.
        Stack shape : atom FN.
        Start symbol: file. *)

  | MenhirState114 : ((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 114.
        Stack shape : IF bexpr.
        Start symbol: file. *)

  | MenhirState115 : (((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 115.
        Stack shape : IF bexpr expr.
        Start symbol: file. *)

  | MenhirState116 : (((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELSE, _menhir_box_file) _menhir_state
    (** State 116.
        Stack shape : bexpr expr ELSE.
        Start symbol: file. *)

  | MenhirState118 : (((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_state
    (** State 118.
        Stack shape : bexpr expr ELIF.
        Start symbol: file. *)

  | MenhirState120 : ((((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 120.
        Stack shape : bexpr expr ELIF bexpr.
        Start symbol: file. *)

  | MenhirState121 : (((((('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 121.
        Stack shape : bexpr expr ELIF bexpr expr.
        Start symbol: file. *)

  | MenhirState124 : ((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_RETURN, _menhir_box_file) _menhir_state
    (** State 124.
        Stack shape : IF bexpr RETURN.
        Start symbol: file. *)

  | MenhirState129 : (('s, _menhir_box_file) _menhir_cell1_VAL _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 129.
        Stack shape : VAL IDENT.
        Start symbol: file. *)

  | MenhirState131 : (('s, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_state
    (** State 131.
        Stack shape : stmt.
        Start symbol: file. *)

  | MenhirState132 : (('s, _menhir_box_file) _menhir_cell1_SEMICOLON, _menhir_box_file) _menhir_state
    (** State 132.
        Stack shape : SEMICOLON.
        Start symbol: file. *)

  | MenhirState134 : ((('s, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 134.
        Stack shape : stmt nonempty_list(SEMICOLON).
        Start symbol: file. *)

  | MenhirState145 : (((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR, _menhir_box_file) _menhir_cell1_COLON, _menhir_box_file) _menhir_state
    (** State 145.
        Stack shape : LPAR loption(separated_nonempty_list(COMMA,param)) RPAR COLON.
        Start symbol: file. *)

  | MenhirState148 : (((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR, _menhir_box_file) _menhir_cell1_annot, _menhir_box_file) _menhir_state
    (** State 148.
        Stack shape : LPAR loption(separated_nonempty_list(COMMA,param)) RPAR annot.
        Start symbol: file. *)

  | MenhirState153 : (('s, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_state
    (** State 153.
        Stack shape : decl.
        Start symbol: file. *)

  | MenhirState154 : ((('s, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 154.
        Stack shape : decl nonempty_list(SEMICOLON).
        Start symbol: file. *)


and ('s, 'r) _menhir_cell1_annot = 
  | MenhirCell1_annot of 's * ('s, 'r) _menhir_state * (Ast.result)

and ('s, 'r) _menhir_cell1_atom = 
  | MenhirCell1_atom of 's * ('s, 'r) _menhir_state * (Ast.bexpr) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_atype = 
  | MenhirCell1_atype of 's * ('s, 'r) _menhir_state * (Ast.kokaType) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_bexpr = 
  | MenhirCell1_bexpr of 's * ('s, 'r) _menhir_state * (Ast.bexpr) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_decl = 
  | MenhirCell1_decl of 's * ('s, 'r) _menhir_state * (Ast.decl)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.bexpr) * Lexing.position

and ('s, 'r) _menhir_cell1_kokatype = 
  | MenhirCell1_kokatype of 's * ('s, 'r) _menhir_state * (Ast.kokaType) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_list_SEMICOLON_ = 
  | MenhirCell1_list_SEMICOLON_ of 's * ('s, 'r) _menhir_state * (unit list)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA_IDENT__ = 
  | MenhirCell1_loption_separated_nonempty_list_COMMA_IDENT__ of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ = 
  | MenhirCell1_loption_separated_nonempty_list_COMMA_param__ of 's * ('s, 'r) _menhir_state * (Ast.param list)

and ('s, 'r) _menhir_cell1_nonempty_list_SEMICOLON_ = 
  | MenhirCell1_nonempty_list_SEMICOLON_ of 's * ('s, 'r) _menhir_state * (unit list)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (Ast.param)

and ('s, 'r) _menhir_cell1_separated_nonempty_list_COMMA_kokatype_ = 
  | MenhirCell1_separated_nonempty_list_COMMA_kokatype_ of 's * ('s, 'r) _menhir_state * (Ast.kokaType list)

and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (Ast.stmt)

and ('s, 'r) _menhir_cell1_COLON = 
  | MenhirCell1_COLON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ELIF = 
  | MenhirCell1_ELIF of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_ELSE = 
  | MenhirCell1_ELSE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EXCLAM = 
  | MenhirCell1_EXCLAM of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_FN = 
  | MenhirCell1_FN of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_FUN = 
  | MenhirCell1_FUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 20 "parser.mly"
       (string)
# 456 "parser.ml"
) * Lexing.position * Lexing.position

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 20 "parser.mly"
       (string)
# 463 "parser.ml"
) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LBRAC = 
  | MenhirCell1_LBRAC of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LPAR = 
  | MenhirCell1_LPAR of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_LPAR = 
  | MenhirCell0_LPAR of 's * Lexing.position

and ('s, 'r) _menhir_cell1_LSPAR = 
  | MenhirCell1_LSPAR of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LT = 
  | MenhirCell1_LT of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_LT = 
  | MenhirCell0_LT of 's * Lexing.position

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_RETURN = 
  | MenhirCell0_RETURN of 's * Lexing.position

and ('s, 'r) _menhir_cell1_RPAR = 
  | MenhirCell1_RPAR of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_RPAR = 
  | MenhirCell0_RPAR of 's * Lexing.position

and ('s, 'r) _menhir_cell1_SEMICOLON = 
  | MenhirCell1_SEMICOLON of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TILD = 
  | MenhirCell1_TILD of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_VAL = 
  | MenhirCell1_VAL of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_VAR = 
  | MenhirCell1_VAR of 's * ('s, 'r) _menhir_state * Lexing.position

and _menhir_box_file = 
  | MenhirBox_file of (Ast.file) [@@unboxed]

let _menhir_action_01 =
  fun res ->
    (
# 71 "parser.mly"
                         ( res )
# 519 "parser.ml"
     : (Ast.result))

let _menhir_action_02 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 96 "parser.mly"
         ( ATrue (_startpos,_endpos) )
# 529 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_03 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 97 "parser.mly"
          ( AFalse (_startpos,_endpos))
# 539 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_04 =
  fun _endpos_n_ _startpos_n_ n ->
    let _endpos = _endpos_n_ in
    let _startpos = _startpos_n_ in
    (
# 98 "parser.mly"
            ( Int(n, (_startpos,_endpos)) )
# 549 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_05 =
  fun _endpos_id_ _startpos_id_ id ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_id_ in
    (
# 99 "parser.mly"
               ( Ident(id, (_startpos,_endpos)) )
# 559 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_06 =
  fun _endpos_s_ _startpos_s_ s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
    (
# 100 "parser.mly"
               ( String(s, (_startpos,_endpos)) )
# 569 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_07 =
  fun _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    (
# 101 "parser.mly"
                ( Empty((_startpos,_endpos)) )
# 579 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_08 =
  fun e ->
    (
# 102 "parser.mly"
                           ( e )
# 587 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_09 =
  fun _endpos__4_ _startpos_at_ at xs ->
    let el = 
# 241 "<standard.mly>"
    ( xs )
# 595 "parser.ml"
     in
    let _endpos = _endpos__4_ in
    let _startpos = _startpos_at_ in
    (
# 103 "parser.mly"
                                                               ( Eval(at, el, (_startpos,_endpos)) )
# 602 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_10 =
  fun _endpos_id_ _startpos_at_ at id ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_at_ in
    (
# 104 "parser.mly"
                                 ( Dot(at, id,(_startpos,_endpos)) )
# 612 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_11 =
  fun _endpos_fb_ _startpos_at_ at fb ->
    let _endpos = _endpos_fb_ in
    let _startpos = _startpos_at_ in
    (
# 105 "parser.mly"
                                  ( Fn(at, fb, (_startpos,_endpos)) )
# 622 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_12 =
  fun _endpos_b_ _startpos_at_ at b ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos_at_ in
    (
# 106 "parser.mly"
                          ( AtomBlock(at, b,(_startpos,_endpos)) )
# 632 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_13 =
  fun _endpos__3_ _startpos__1_ xs ->
    let el = 
# 241 "<standard.mly>"
    ( xs )
# 640 "parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 107 "parser.mly"
                                                     ( Brac(el, (_startpos,_endpos)) )
# 647 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_14 =
  fun _endpos__6_ _startpos_s_ s ty ->
    let _endpos = _endpos__6_ in
    let _startpos = _startpos_s_ in
    (
# 89 "parser.mly"
                                               (AVar(s, Some(ty), (_startpos,_endpos)))
# 657 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_15 =
  fun _endpos_s_ _startpos_s_ s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
    (
# 90 "parser.mly"
           (AVar(s, None, (_startpos,_endpos)))
# 667 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_16 =
  fun _endpos__3_ _startpos__1_ ty ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 91 "parser.mly"
                          (AType(ty, (_startpos,_endpos)))
# 677 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_17 =
  fun _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    (
# 92 "parser.mly"
            (AEmpty (_startpos,_endpos))
# 687 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_18 =
  fun _endpos_a_ _startpos_a_ a ->
    let _endpos = _endpos_a_ in
    let _startpos = _startpos_a_ in
    (
# 116 "parser.mly"
             ( Eatom(a, (_startpos,_endpos)) )
# 697 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_19 =
  fun _endpos_b_ _startpos__1_ b ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos__1_ in
    (
# 117 "parser.mly"
                   ( ETild (b,(_startpos,_endpos)) )
# 707 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_20 =
  fun _endpos_b_ _startpos__1_ b ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos__1_ in
    (
# 118 "parser.mly"
                     ( ENot(b,(_startpos,_endpos)) )
# 717 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_21 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 142 "parser.mly"
       ( Eq )
# 725 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 732 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_22 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 143 "parser.mly"
        ( Neq )
# 740 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 747 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_23 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 144 "parser.mly"
       ( Lt )
# 755 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 762 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_24 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 145 "parser.mly"
        ( Lte )
# 770 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 777 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_25 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 146 "parser.mly"
       ( Gt )
# 785 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 792 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_26 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 147 "parser.mly"
        ( Gte )
# 800 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 807 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_27 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 148 "parser.mly"
         ( Add )
# 815 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 822 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_28 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 149 "parser.mly"
          ( Sub )
# 830 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 837 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_29 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 150 "parser.mly"
        ( Mul )
# 845 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 852 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_30 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 151 "parser.mly"
        ( Div )
# 860 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 867 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_31 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 152 "parser.mly"
        ( Mod )
# 875 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 882 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_32 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 153 "parser.mly"
           ( Concat )
# 890 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 897 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_33 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 154 "parser.mly"
        ( And )
# 905 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 912 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_34 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 155 "parser.mly"
       ( Or )
# 920 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 119 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 927 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_35 =
  fun _endpos_lst_ _startpos__1_ b1 b2 lst ->
    let _endpos = _endpos_lst_ in
    let _startpos = _startpos__1_ in
    (
# 120 "parser.mly"
                                             (EIf(b1, b2,lst, (_startpos,_endpos)) )
# 937 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_36 =
  fun _endpos_b2_ _startpos__1_ b1 b2 ->
    let _endpos = _endpos_b2_ in
    let _startpos = _startpos__1_ in
    (
# 121 "parser.mly"
                                   ( EIf (b1, EReturn(b2, (_startpos, _endpos)), EBlock([],(_startpos, _endpos)), (_startpos,_endpos)) )
# 947 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_37 =
  fun _endpos_f_ _startpos__1_ f ->
    let _endpos = _endpos_f_ in
    let _startpos = _startpos__1_ in
    (
# 122 "parser.mly"
                   ( EFn(f, (_startpos,_endpos)) )
# 957 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_38 =
  fun _endpos_e_ _startpos__1_ e ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 123 "parser.mly"
                    ( EReturn(e, (_startpos,_endpos)) )
# 967 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_39 =
  fun lst ->
    (
# 132 "parser.mly"
                                                               ( lst )
# 975 "parser.ml"
     : (Ast.stmt list))

let _menhir_action_40 =
  fun body i ->
    (
# 54 "parser.mly"
    ( { name = i ; body = body } )
# 983 "parser.ml"
     : (Ast.decl))

let _menhir_action_41 =
  fun _endpos__0_ ->
    let _endpos = _endpos__0_ in
    let _startpos = _endpos__0_ in
    (
# 127 "parser.mly"
                           (EBlock([], (_startpos,_endpos)))
# 993 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_42 =
  fun _endpos_s_ _startpos__1_ b2 b3 s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos__1_ in
    (
# 128 "parser.mly"
                                             (EIf(b2, b3, s, (_startpos,_endpos)))
# 1003 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_43 =
  fun b3 ->
    (
# 129 "parser.mly"
                   (b3)
# 1011 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_44 =
  fun _endpos_s_ _startpos_s_ s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
    (
# 111 "parser.mly"
             ( EBexpr(s, (_startpos,_endpos)) )
# 1021 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_45 =
  fun _endpos_s_ _startpos_s_ s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
    (
# 112 "parser.mly"
             (EBlock(s, (_startpos,_endpos)) )
# 1031 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_46 =
  fun dl ->
    (
# 49 "parser.mly"
    ( dl )
# 1039 "parser.ml"
     : (Ast.file))

let _menhir_action_47 =
  fun a e xs ->
    let pl = 
# 241 "<standard.mly>"
    ( xs )
# 1047 "parser.ml"
     in
    (
# 59 "parser.mly"
   ( { formal = pl ; annot = a ; body = e } )
# 1052 "parser.ml"
     : (Ast.funbody))

let _menhir_action_48 =
  fun _endpos_e_ _startpos__1_ e xs ->
    let pl = 
# 241 "<standard.mly>"
    ( xs )
# 1060 "parser.ml"
     in
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 62 "parser.mly"
   ( { formal = pl ; annot = ([], TAType(AEmpty((_startpos,_endpos)), (_startpos,_endpos)), (_startpos,_endpos)) ; body = e } )
# 1067 "parser.ml"
     : (Ast.funbody))

let _menhir_action_49 =
  fun _endpos_at_ _startpos_at_ at ->
    let _endpos = _endpos_at_ in
    let _startpos = _startpos_at_ in
    (
# 81 "parser.mly"
               ( TAType(at, (_startpos,_endpos)) )
# 1077 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_50 =
  fun _endpos_res_ _startpos_at_ at res ->
    let _endpos = _endpos_res_ in
    let _startpos = _startpos_at_ in
    (
# 82 "parser.mly"
                                      ( TFun(at, res, (_startpos,_endpos)) )
# 1087 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_51 =
  fun _endpos_res_ _startpos__1_ res tl tl1 ->
    let _endpos = _endpos_res_ in
    let _startpos = _startpos__1_ in
    (
# 83 "parser.mly"
                                                                                                            ( TMulFun(tl1::tl, res, (_startpos,_endpos)) )
# 1097 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_52 =
  fun _endpos_res_ _startpos__1_ res tl ->
    let _endpos = _endpos_res_ in
    let _startpos = _startpos__1_ in
    (
# 84 "parser.mly"
                                                      ( TMulFun([tl], res, (_startpos,_endpos)) )
# 1107 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_53 =
  fun _endpos_res_ _startpos__1_ res ->
    let _endpos = _endpos_res_ in
    let _startpos = _startpos__1_ in
    (
# 85 "parser.mly"
                                    (TMulFun([], res, (_startpos,_endpos)))
# 1117 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_54 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1125 "parser.ml"
     : (unit list))

let _menhir_action_55 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1133 "parser.ml"
     : (unit list))

let _menhir_action_56 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1141 "parser.ml"
     : (Ast.file))

let _menhir_action_57 =
  fun d xs ->
    let x = 
# 48 "parser.mly"
                                                  (d)
# 1149 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1154 "parser.ml"
     : (Ast.file))

let _menhir_action_58 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1162 "parser.ml"
     : (Ast.stmt list))

let _menhir_action_59 =
  fun s xs ->
    let x = 
# 132 "parser.mly"
                                                   (s)
# 1170 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1175 "parser.ml"
     : (Ast.stmt list))

let _menhir_action_60 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1183 "parser.ml"
     : (string list))

let _menhir_action_61 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1191 "parser.ml"
     : (string list))

let _menhir_action_62 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1199 "parser.ml"
     : (Ast.bexpr list))

let _menhir_action_63 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1207 "parser.ml"
     : (Ast.bexpr list))

let _menhir_action_64 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1215 "parser.ml"
     : (Ast.param list))

let _menhir_action_65 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1223 "parser.ml"
     : (Ast.param list))

let _menhir_action_66 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 1231 "parser.ml"
     : (unit list))

let _menhir_action_67 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 1239 "parser.ml"
     : (unit list))

let _menhir_action_68 =
  fun _endpos_ty_ _startpos_s_ s ty ->
    let _endpos = _endpos_ty_ in
    let _startpos = _startpos_s_ in
    (
# 67 "parser.mly"
                                      ( (s, ty, (_startpos,_endpos)) )
# 1249 "parser.ml"
     : (Ast.param))

let _menhir_action_69 =
  fun _endpos_t_ _startpos__1_ t xs ->
    let lst = 
# 241 "<standard.mly>"
    ( xs )
# 1257 "parser.ml"
     in
    let _endpos = _endpos_t_ in
    let _startpos = _startpos__1_ in
    (
# 76 "parser.mly"
    ( (lst, t, (_startpos,_endpos)) )
# 1264 "parser.ml"
     : (Ast.result))

let _menhir_action_70 =
  fun _endpos_t_ _startpos_t_ t ->
    let _endpos = _endpos_t_ in
    let _startpos = _startpos_t_ in
    (
# 77 "parser.mly"
                 ( ([], t, (_startpos,_endpos)))
# 1274 "parser.ml"
     : (Ast.result))

let _menhir_action_71 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1282 "parser.ml"
     : (string list))

let _menhir_action_72 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1290 "parser.ml"
     : (string list))

let _menhir_action_73 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1298 "parser.ml"
     : (Ast.bexpr list))

let _menhir_action_74 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1306 "parser.ml"
     : (Ast.bexpr list))

let _menhir_action_75 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1314 "parser.ml"
     : (Ast.kokaType list))

let _menhir_action_76 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1322 "parser.ml"
     : (Ast.kokaType list))

let _menhir_action_77 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1330 "parser.ml"
     : (Ast.param list))

let _menhir_action_78 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1338 "parser.ml"
     : (Ast.param list))

let _menhir_action_79 =
  fun _endpos_b_ _startpos_b_ b ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos_b_ in
    (
# 136 "parser.mly"
              ( SBexpr(b, (_startpos,_endpos)) )
# 1348 "parser.ml"
     : (Ast.stmt))

let _menhir_action_80 =
  fun _endpos_e_ _startpos__1_ e s ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 137 "parser.mly"
                               ( SDecl(s, e, (_startpos,_endpos)) )
# 1358 "parser.ml"
     : (Ast.stmt))

let _menhir_action_81 =
  fun _endpos_e_ _startpos__1_ e s ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 138 "parser.mly"
                                 ( SVar(s,e, (_startpos,_endpos)) )
# 1368 "parser.ml"
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
  
  let _menhir_run_151 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_list_SEMICOLON_ -> _ -> _menhir_box_file =
    fun _menhir_stack _v ->
      let MenhirCell1_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let dl = _v in
      let _v = _menhir_action_46 dl in
      MenhirBox_file _v
  
  let rec _menhir_run_155 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_ -> _ -> _menhir_box_file =
    fun _menhir_stack _v ->
      let MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_decl (_menhir_stack, _menhir_s, d) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_57 d xs in
      _menhir_goto_list___anonymous_0_ _menhir_stack _v _menhir_s
  
  and _menhir_goto_list___anonymous_0_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState154 ->
          _menhir_run_155 _menhir_stack _v
      | MenhirState003 ->
          _menhir_run_151 _menhir_stack _v
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
          let _v = _menhir_action_54 () in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_55 x xs in
      _menhir_goto_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_SEMICOLON_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState057 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_058 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRAC as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | VAL ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | STRING _v_0 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState058
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | INT _v_1 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState058
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | IDENT _v_2 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState058
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
      | RBRAC ->
          let _v_3 = _menhir_action_58 () in
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_VAR (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v, _startpos, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ASSIGN ->
              let _menhir_s = MenhirState061 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TILD ->
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LSPAR ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FN ->
                  _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCLAM ->
                  _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_02 _endpos__1_ _startpos__1_ in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_atom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, MenhirState070, _startpos_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | TILD ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | STRING _v_1 ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState071
          | RETURN ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | LSPAR ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | LPAR ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | LBRAC ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | INT _v_2 ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState071
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | IDENT _v_3 ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState071
          | FN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | FALSE ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | EXCLAM ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState071
          | RPAR ->
              let _v_4 = _menhir_action_62 () in
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 _tok
          | _ ->
              _eRR ())
      | LBRAC ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
      | FN ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState070 in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_FN (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_s = MenhirState108 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | DOT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_6 ->
              let _endpos_8 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos_id_, id, _startpos_at_, at) = (_endpos_8, _v_6, _startpos, _v) in
              let _v = _menhir_action_10 _endpos_id_ _startpos_at_ at id in
              _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_at_ _v _menhir_s _tok
          | _ ->
              _eRR ())
      | AND | COMMA | CONCAT | DIV | ELIF | ELSE | EQ | GT | GTE | LT | LTE | MINUS | MOD | MUL | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_18 _endpos_a_ _startpos_a_ a in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_051 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_TILD (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState051 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_06 _endpos_s_ _startpos_s_ s in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
  
  and _menhir_run_053 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState053 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_054 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LSPAR (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState054
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | LBRAC ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState054
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState054
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
      | RSPAR ->
          let _v = _menhir_action_62 () in
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | TILD ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | STRING _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055
      | RPAR ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_startpos__1_, _endpos__2_) = (_startpos, _endpos) in
          let _v = _menhir_action_07 _endpos__2_ _startpos__1_ in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
      | RETURN ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | LSPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | LPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | LBRAC ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | INT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055
      | IF ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055
      | FN ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | FALSE ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | EXCLAM ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LBRAC (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState057
      | EXCLAM | FALSE | FN | IDENT _ | IF | INT _ | LPAR | LSPAR | RBRAC | RETURN | STRING _ | TILD | TRUE | VAL | VAR ->
          let _v = _menhir_action_54 () in
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState057 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_04 _endpos_n_ _startpos_n_ n in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _menhir_s _tok
  
  and _menhir_run_063 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState063 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_064 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_05 _endpos_id_ _startpos_id_ id in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_id_ _v _menhir_s _tok
  
  and _menhir_run_065 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_FN (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState065 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState006 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RPAR ->
          let _v = _menhir_action_64 () in
          _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState008 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_009 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ARROW ->
              let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
              let _menhir_stack = MenhirCell1_RPAR (_menhir_stack, MenhirState009, _endpos) in
              let _menhir_s = MenhirState011 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | COMMA | EXCLAM | FALSE | FN | GT | IDENT _ | IF | INT _ | LBRAC | LPAR | LSPAR | RETURN | RPAR | STRING _ | TILD | TRUE ->
              let (_startpos__1_, _endpos__2_) = (_startpos, _endpos) in
              let _v = _menhir_action_17 _endpos__2_ _startpos__1_ in
              _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
          | _ ->
              _eRR ())
      | LPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState009
      | _ ->
          _eRR ()
  
  and _menhir_run_012 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LT (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState012 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | GT ->
          let _v = _menhir_action_60 () in
          _menhir_goto_loption_separated_nonempty_list_COMMA_IDENT__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState014 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | GT ->
          let x = _v in
          let _v = _menhir_action_71 x in
          _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_IDENT_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState012 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState014 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_016 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_61 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_IDENT__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_IDENT__ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_IDENT__ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState018 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_019 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAR ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LPAR (_menhir_stack, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LT ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_LT (_menhir_stack, _startpos) in
              let _menhir_s = MenhirState021 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LPAR ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | ARROW | COMMA | EXCLAM | FALSE | FN | GT | IDENT _ | IF | INT _ | LBRAC | LSPAR | RETURN | RPAR | STRING _ | TILD | TRUE ->
          let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_15 _endpos_s_ _startpos_s_ s in
          _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_atype : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ARROW ->
          let _menhir_stack = MenhirCell1_atype (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState026 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | COMMA | EXCLAM | FALSE | FN | GT | IDENT _ | IF | INT _ | LBRAC | LPAR | LSPAR | RETURN | RPAR | STRING _ | TILD | TRUE ->
          let (_endpos_at_, _startpos_at_, at) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_49 _endpos_at_ _startpos_at_ at in
          _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_at_ _startpos_at_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_kokatype : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState008 ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState041 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState035 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState145 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState011 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState026 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_043 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
      let (_endpos_ty_, ty) = (_endpos, _v) in
      let _v = _menhir_action_68 _endpos_ty_ _startpos_s_ s ty in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState046 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_77 x in
          _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState046 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState006 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_047 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_78 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_044 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_65 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_param__ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RPAR (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState049 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | COLON ->
          let _menhir_stack = MenhirCell1_COLON (_menhir_stack, _menhir_s) in
          let _menhir_s = MenhirState145 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_03 _endpos__1_ _startpos__1_ in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_068 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_EXCLAM (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState068 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_040 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_kokatype as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_kokatype (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState041 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_75 x in
          _menhir_goto_separated_nonempty_list_COMMA_kokatype_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_kokatype_ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_kokatype as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState041 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState035 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_042 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_cell1_kokatype -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_kokatype (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_76 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_kokatype_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_036 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_kokatype_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RPAR (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ARROW ->
          let _menhir_s = MenhirState038 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LT ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_031 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ARROW ->
              let _menhir_stack = MenhirCell1_kokatype (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell0_RPAR (_menhir_stack, _endpos_0) in
              let _menhir_s = MenhirState033 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LT ->
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | COMMA | EXCLAM | FALSE | FN | GT | IDENT _ | IF | INT _ | LBRAC | LPAR | LSPAR | RETURN | RPAR | STRING _ | TILD | TRUE ->
              let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
              let (_endpos__3_, ty) = (_endpos_0, _v) in
              let _v = _menhir_action_16 _endpos__3_ _startpos__1_ ty in
              _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
          | _ ->
              _eRR ())
      | COMMA ->
          let _menhir_stack = MenhirCell1_kokatype (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState035 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LT, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_IDENT__ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_loption_separated_nonempty_list_COMMA_IDENT__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_LT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_t_, t) = (_endpos, _v) in
      let _v = _menhir_action_69 _endpos_t_ _startpos__1_ t xs in
      _menhir_goto_result _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
  
  and _menhir_goto_result : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState145 ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState038 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState011 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState026 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_146 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR, _menhir_box_file) _menhir_cell1_COLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_COLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let res = _v in
      let _v = _menhir_action_01 res in
      let _menhir_stack = MenhirCell1_annot (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | STRING _v_0 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState148
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | LBRAC ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | INT _v_1 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState148
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | IDENT _v_2 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState148
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | _ ->
          _eRR ()
  
  and _menhir_run_039 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_kokatype_ _menhir_cell0_RPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_separated_nonempty_list_COMMA_kokatype_ (_menhir_stack, _, tl) = _menhir_stack in
      let MenhirCell1_kokatype (_menhir_stack, _, tl1, _, _) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_res_, res) = (_endpos, _v) in
      let _v = _menhir_action_51 _endpos_res_ _startpos__1_ res tl tl1 in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_res_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_034 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype _menhir_cell0_RPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_kokatype (_menhir_stack, _, tl, _, _) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_res_, res) = (_endpos, _v) in
      let _v = _menhir_action_52 _endpos_res_ _startpos__1_ res tl in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_res_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_030 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_RPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_RPAR (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_res_, res) = (_endpos, _v) in
      let _v = _menhir_action_53 _endpos_res_ _startpos__1_ res in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_res_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_027 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_atype -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_atype (_menhir_stack, _menhir_s, at, _startpos_at_, _) = _menhir_stack in
      let (_endpos_res_, res) = (_endpos, _v) in
      let _v = _menhir_action_50 _endpos_res_ _startpos_at_ at res in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_res_ _startpos_at_ _v _menhir_s _tok
  
  and _menhir_run_028 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_70 _endpos_t_ _startpos_t_ t in
      _menhir_goto_result _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
  
  and _menhir_run_022 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT _menhir_cell0_LPAR _menhir_cell0_LT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | GT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RPAR ->
              let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell0_LT (_menhir_stack, _) = _menhir_stack in
              let MenhirCell0_LPAR (_menhir_stack, _) = _menhir_stack in
              let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
              let (ty, _endpos__6_) = (_v, _endpos_0) in
              let _v = _menhir_action_14 _endpos__6_ _startpos_s_ s ty in
              _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__6_ _startpos_s_ _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_72 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_IDENT_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_141 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LSPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RSPAR ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LSPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (xs, _endpos__3_) = (_v, _endpos) in
          let _v = _menhir_action_13 _endpos__3_ _startpos__1_ xs in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _, _) = _menhir_stack in
          let MenhirCell1_atom (_menhir_stack, _menhir_s, at, _startpos_at_, _) = _menhir_stack in
          let (xs, _endpos__4_) = (_v, _endpos) in
          let _v = _menhir_action_09 _endpos__4_ _startpos_at_ at xs in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_at_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_bexpr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState051 ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState058 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState134 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState106 ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState104 ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState102 ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState100 ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState098 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState092 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState090 ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState088 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState082 ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState080 ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState148 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState054 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState114 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_144 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_TILD -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_TILD (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_b_, b) = (_endpos, _v) in
      let _v = _menhir_action_19 _endpos_b_ _startpos__1_ b in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_136 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_79 _endpos_b_ _startpos_b_ b in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState080 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState088 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState090 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState082 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState084 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState092 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState096 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_LT (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState098 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState100 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState102 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState104 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState086 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState094 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState106 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | _ ->
          _eRR ()
  
  and _menhir_run_132 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _menhir_stack = MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) in
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState132
      | EOF | EXCLAM | FALSE | FN | FUN | IDENT _ | IF | INT _ | LPAR | LSPAR | RBRAC | RETURN | STRING _ | TILD | TRUE | VAL | VAR ->
          let x = () in
          let _v = _menhir_action_66 x in
          _menhir_goto_nonempty_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_SEMICOLON_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState153 ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState131 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_154 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_decl as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | FUN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState154
      | EOF ->
          let _v_0 = _menhir_action_56 () in
          _menhir_run_155 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FUN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState005 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_134 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_stmt as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | VAL ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | STRING _v_0 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState134
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | INT _v_1 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState134
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | IDENT _v_2 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState134
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | RBRAC ->
          let _v_3 = _menhir_action_58 () in
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
      | _ ->
          _eRR ()
  
  and _menhir_run_127 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_VAL (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v, _startpos, _endpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | DEF ->
              let _menhir_s = MenhirState129 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TILD ->
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LSPAR ->
                  _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FN ->
                  _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCLAM ->
                  _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_135 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_stmt, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, s) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_59 s xs in
      _menhir_goto_list___anonymous_1_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list___anonymous_1_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState058 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState134 ->
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_137 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_cell1_list_SEMICOLON_ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_LBRAC (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__4_, lst) = (_endpos, _v) in
      let _v = _menhir_action_39 lst in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState070 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState148 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState054 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState114 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_112 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, at, _startpos_at_, _) = _menhir_stack in
      let (_endpos_b_, b) = (_endpos, _v) in
      let _v = _menhir_action_12 _endpos_b_ _startpos_at_ at b in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_at_ _v _menhir_s _tok
  
  and _menhir_run_078 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_45 _endpos_s_ _startpos_s_ s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState148 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState049 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState053 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState055 ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState129 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState061 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState124 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState120 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState114 ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState054 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_149 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR, _menhir_box_file) _menhir_cell1_annot -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_annot (_menhir_stack, _, a) = _menhir_stack in
      let MenhirCell0_RPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_47 a e xs in
      _menhir_goto_funbody _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _v _menhir_s _tok
  
  and _menhir_goto_funbody : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState005 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState108 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState065 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_150 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_FUN _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, i, _, _) = _menhir_stack in
      let MenhirCell1_FUN (_menhir_stack, _menhir_s) = _menhir_stack in
      let body = _v in
      let _v = _menhir_action_40 body i in
      let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | _ ->
          _eRR ()
  
  and _menhir_run_109 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_FN -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_FN (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_atom (_menhir_stack, _menhir_s, at, _startpos_at_, _) = _menhir_stack in
      let (_endpos_fb_, fb) = (_endpos, _v) in
      let _v = _menhir_action_11 _endpos_fb_ _startpos_at_ at fb in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_fb_ _startpos_at_ _v _menhir_s _tok
  
  and _menhir_run_066 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_FN -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_FN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_f_, f) = (_endpos, _v) in
      let _v = _menhir_action_37 _endpos_f_ _startpos__1_ f in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_147 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_48 _endpos_e_ _startpos__1_ e xs in
      _menhir_goto_funbody _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _v _menhir_s _tok
  
  and _menhir_run_143 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_RETURN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_38 _endpos_e_ _startpos__1_ e in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_139 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos__3_, e) = (_endpos_0, _v) in
          let _v = _menhir_action_08 e in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_130 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_VAL _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s, _, _) = _menhir_stack in
      let MenhirCell1_VAL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_80 _endpos_e_ _startpos__1_ e s in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_126 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_VAR _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s, _, _) = _menhir_stack in
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_81 _endpos_e_ _startpos__1_ e s in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_125 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_RETURN -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RETURN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, b1, _, _) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_b2_, b2) = (_endpos, _v) in
      let _v = _menhir_action_36 _endpos_b2_ _startpos__1_ b1 b2 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b2_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_121 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _endpos) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | ELIF ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | AND | COMMA | CONCAT | DIV | DOT | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | MOD | MUL | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let _v_0 =
            let _endpos__0_ = _endpos in
            _menhir_action_41 _endpos__0_
          in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_116 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState116 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_118 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_ELIF (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState118 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_122 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _, b3, _) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, b2, _, _) = _menhir_stack in
      let MenhirCell1_ELIF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_s_, s) = (_endpos, _v) in
      let _v = _menhir_action_42 _endpos_s_ _startpos__1_ b2 b3 s in
      _menhir_goto_elifs _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
  
  and _menhir_goto_elifs : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState115 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState121 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_123 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _, b2, _) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, b1, _, _) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_lst_, lst) = (_endpos, _v) in
      let _v = _menhir_action_35 _endpos_lst_ _startpos__1_ b1 b2 lst in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_lst_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_117 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELSE -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_ELSE (_menhir_stack, _menhir_s) = _menhir_stack in
      let (_endpos_b3_, b3) = (_endpos, _v) in
      let _v = _menhir_action_43 b3 in
      _menhir_goto_elifs _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _v _menhir_s _tok
  
  and _menhir_run_115 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _endpos) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | ELIF ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState115
      | AND | COMMA | CONCAT | DIV | DOT | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | MOD | MUL | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let _v_0 =
            let _endpos__0_ = _endpos in
            _menhir_action_41 _endpos__0_
          in
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _endpos) in
          let _menhir_s = MenhirState076 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RPAR | RSPAR ->
          let x = _v in
          let _v = _menhir_action_73 x in
          _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_expr_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState076 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState054 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_077 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_74 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_072 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let x = _v in
      let _v = _menhir_action_63 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState054 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState071 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_133 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_67 x xs in
      _menhir_goto_nonempty_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_119 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState120 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_113 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState114 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RETURN ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_RETURN (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState124 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_107 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_33 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_105 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_21 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_103 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_25 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_26 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_LT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell0_LT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_23 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_24 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_32 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_28 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_22 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_34 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
      let (_endpos_b3_, b3) = (_endpos, _v) in
      let _v = _menhir_action_30 _endpos_b3_ _startpos_b1_ b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
  
  and _menhir_run_085 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
      let (_endpos_b3_, b3) = (_endpos, _v) in
      let _v = _menhir_action_31 _endpos_b3_ _startpos_b1_ b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
  
  and _menhir_run_083 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
      let (_endpos_b3_, b3) = (_endpos, _v) in
      let _v = _menhir_action_29 _endpos_b3_ _startpos_b1_ b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
  
  and _menhir_run_081 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_27 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_44 _endpos_s_ _startpos_s_ s in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_EXCLAM -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_EXCLAM (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_b_, b) = (_endpos, _v) in
      let _v = _menhir_action_20 _endpos_b_ _startpos__1_ b in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_003 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | FUN ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
      | EOF ->
          let _v_0 = _menhir_action_56 () in
          _menhir_run_151 _menhir_stack _v_0
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF | FUN ->
          let _v = _menhir_action_54 () in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let file =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
