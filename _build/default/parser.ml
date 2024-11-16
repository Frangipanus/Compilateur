
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
# 29 "parser.mly"
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
# 28 "parser.mly"
       (int)
# 41 "parser.ml"
  )
    | IF
    | IDENT of (
# 27 "parser.mly"
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
  
  let is_good lst = 
  match (List.rev lst) with 
  |[] -> (true)
  |_ -> (match List.hd (List.rev lst) with 
        |SBexpr(_,_)-> true 
        |_ -> false) 


# 85 "parser.ml"

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

  | MenhirState018 : ((('s, _menhir_box_file) _menhir_cell1_LT, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_IDENT__ _menhir_cell0_GT, _menhir_box_file) _menhir_state
    (** State 018.
        Stack shape : LT loption(separated_nonempty_list(COMMA,IDENT)) GT.
        Start symbol: file. *)

  | MenhirState020 : (('s, _menhir_box_file) _menhir_cell1_IDENT _menhir_cell0_LT, _menhir_box_file) _menhir_state
    (** State 020.
        Stack shape : IDENT LT.
        Start symbol: file. *)

  | MenhirState024 : (('s, _menhir_box_file) _menhir_cell1_atype, _menhir_box_file) _menhir_state
    (** State 024.
        Stack shape : atype.
        Start symbol: file. *)

  | MenhirState031 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype _menhir_cell0_RPAR, _menhir_box_file) _menhir_state
    (** State 031.
        Stack shape : LPAR kokatype RPAR.
        Start symbol: file. *)

  | MenhirState033 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_state
    (** State 033.
        Stack shape : LPAR kokatype.
        Start symbol: file. *)

  | MenhirState036 : (((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_kokatype_ _menhir_cell0_RPAR, _menhir_box_file) _menhir_state
    (** State 036.
        Stack shape : LPAR kokatype separated_nonempty_list(COMMA,kokatype) RPAR.
        Start symbol: file. *)

  | MenhirState039 : ((('s, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_state
    (** State 039.
        Stack shape : kokatype kokatype.
        Start symbol: file. *)

  | MenhirState044 : (('s, _menhir_box_file) _menhir_cell1_param, _menhir_box_file) _menhir_state
    (** State 044.
        Stack shape : param.
        Start symbol: file. *)

  | MenhirState047 : ((('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR, _menhir_box_file) _menhir_state
    (** State 047.
        Stack shape : LPAR loption(separated_nonempty_list(COMMA,param)) RPAR.
        Start symbol: file. *)

  | MenhirState049 : (('s, _menhir_box_file) _menhir_cell1_TILD, _menhir_box_file) _menhir_state
    (** State 049.
        Stack shape : TILD.
        Start symbol: file. *)

  | MenhirState051 : (('s, _menhir_box_file) _menhir_cell1_RETURN, _menhir_box_file) _menhir_state
    (** State 051.
        Stack shape : RETURN.
        Start symbol: file. *)

  | MenhirState052 : (('s, _menhir_box_file) _menhir_cell1_LSPAR, _menhir_box_file) _menhir_state
    (** State 052.
        Stack shape : LSPAR.
        Start symbol: file. *)

  | MenhirState053 : (('s, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 053.
        Stack shape : LPAR.
        Start symbol: file. *)

  | MenhirState055 : (('s, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_state
    (** State 055.
        Stack shape : LBRAC.
        Start symbol: file. *)

  | MenhirState056 : ((('s, _menhir_box_file) _menhir_cell1_LBRAC, _menhir_box_file) _menhir_cell1_list_SEMICOLON_, _menhir_box_file) _menhir_state
    (** State 056.
        Stack shape : LBRAC list(SEMICOLON).
        Start symbol: file. *)

  | MenhirState059 : (('s, _menhir_box_file) _menhir_cell1_VAR _menhir_cell0_IDENT, _menhir_box_file) _menhir_state
    (** State 059.
        Stack shape : VAR IDENT.
        Start symbol: file. *)

  | MenhirState061 : (('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_state
    (** State 061.
        Stack shape : IF.
        Start symbol: file. *)

  | MenhirState063 : (('s, _menhir_box_file) _menhir_cell1_IDENT, _menhir_box_file) _menhir_state
    (** State 063.
        Stack shape : IDENT.
        Start symbol: file. *)

  | MenhirState064 : (('s, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 064.
        Stack shape : FN.
        Start symbol: file. *)

  | MenhirState067 : (('s, _menhir_box_file) _menhir_cell1_EXCLAM, _menhir_box_file) _menhir_state
    (** State 067.
        Stack shape : EXCLAM.
        Start symbol: file. *)

  | MenhirState069 : (('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_state
    (** State 069.
        Stack shape : atom.
        Start symbol: file. *)

  | MenhirState070 : ((('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_state
    (** State 070.
        Stack shape : atom LPAR.
        Start symbol: file. *)

  | MenhirState075 : (('s, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_state
    (** State 075.
        Stack shape : expr.
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

  | MenhirState097 : (('s, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_LT, _menhir_box_file) _menhir_state
    (** State 097.
        Stack shape : bexpr LT.
        Start symbol: file. *)

  | MenhirState099 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 099.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState101 : (('s, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_GT, _menhir_box_file) _menhir_state
    (** State 101.
        Stack shape : bexpr GT.
        Start symbol: file. *)

  | MenhirState103 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 103.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState105 : (('s, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_state
    (** State 105.
        Stack shape : bexpr.
        Start symbol: file. *)

  | MenhirState107 : ((('s, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_FN, _menhir_box_file) _menhir_state
    (** State 107.
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

and 's _menhir_cell0_GT = 
  | MenhirCell0_GT of 's * Lexing.position

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 27 "parser.mly"
       (string)
# 471 "parser.ml"
) * Lexing.position * Lexing.position

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 27 "parser.mly"
       (string)
# 478 "parser.ml"
) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LBRAC = 
  | MenhirCell1_LBRAC of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LPAR = 
  | MenhirCell1_LPAR of 's * ('s, 'r) _menhir_state * Lexing.position

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
# 78 "parser.mly"
                         ( res )
# 531 "parser.ml"
     : (Ast.result))

let _menhir_action_02 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 103 "parser.mly"
         ( ATrue (_startpos,_endpos) )
# 541 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_03 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 104 "parser.mly"
          ( AFalse (_startpos,_endpos))
# 551 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_04 =
  fun _endpos_n_ _startpos_n_ n ->
    let _endpos = _endpos_n_ in
    let _startpos = _startpos_n_ in
    (
# 105 "parser.mly"
            ( Int(n, (_startpos,_endpos)) )
# 561 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_05 =
  fun _endpos_id_ _startpos_id_ id ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_id_ in
    (
# 106 "parser.mly"
               ( String(id, (_startpos,_endpos)) )
# 571 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_06 =
  fun _endpos_s_ _startpos_s_ s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
    (
# 107 "parser.mly"
               ( String(s, (_startpos,_endpos)) )
# 581 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_07 =
  fun _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    (
# 108 "parser.mly"
                ( Empty((_startpos,_endpos)) )
# 591 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_08 =
  fun e ->
    (
# 109 "parser.mly"
                           ( e )
# 599 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_09 =
  fun _endpos__4_ _startpos_at_ at xs ->
    let el = 
# 241 "<standard.mly>"
    ( xs )
# 607 "parser.ml"
     in
    let _endpos = _endpos__4_ in
    let _startpos = _startpos_at_ in
    (
# 110 "parser.mly"
                                                               ( Eval(at, el, (_startpos,_endpos)) )
# 614 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_10 =
  fun _endpos_id_ _startpos_at_ at id ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_at_ in
    (
# 111 "parser.mly"
                                 ( Eval((String(id, (_startpos, _endpos))), [at],(_startpos,_endpos)) )
# 624 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_11 =
  fun _endpos_fb_ _startpos_at_ at fb ->
    let _endpos = _endpos_fb_ in
    let _startpos = _startpos_at_ in
    (
# 112 "parser.mly"
                                  (match at with 
                                  | Eval(id, arg, _) -> Eval(id, arg@[EFn(fb, (_startpos, _endpos))], (_startpos, _endpos))
                                  | String(id, loc) -> Eval(String(id,loc), [EFn(fb, (_startpos, _endpos))], (_startpos, _endpos))
                                  |_ -> raise (Error2(("Erreur: on n'applique pas une fonction a une anno"))) )
# 637 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_12 =
  fun _endpos_b_ _startpos_at_ at b ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos_at_ in
    (
# 116 "parser.mly"
                          ( AtomBlock(at, b,(_startpos,_endpos)) )
# 647 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_13 =
  fun _endpos__3_ _startpos__1_ xs ->
    let el = 
# 241 "<standard.mly>"
    ( xs )
# 655 "parser.ml"
     in
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 117 "parser.mly"
                                                     ( Brac(el, (_startpos,_endpos)) )
# 662 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_14 =
  fun _endpos__4_ _startpos_s_ s ty ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos_s_ in
    (
# 96 "parser.mly"
                                       (AVar(s, Some(ty), (_startpos,_endpos)))
# 672 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_15 =
  fun _endpos_s_ _startpos_s_ s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
    (
# 97 "parser.mly"
           (AVar(s, None, (_startpos,_endpos)))
# 682 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_16 =
  fun _endpos__3_ _startpos__1_ ty ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 98 "parser.mly"
                          (AType(ty, (_startpos,_endpos)))
# 692 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_17 =
  fun _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    (
# 99 "parser.mly"
            (AEmpty (_startpos,_endpos))
# 702 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_18 =
  fun a ->
    (
# 126 "parser.mly"
             ( a )
# 710 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_19 =
  fun _endpos_b_ _startpos__1_ b ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos__1_ in
    (
# 127 "parser.mly"
                   ( ETild (b,(_startpos,_endpos)) )
# 720 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_20 =
  fun _endpos_b_ _startpos__1_ b ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos__1_ in
    (
# 128 "parser.mly"
                     ( ENot(b,(_startpos,_endpos)) )
# 730 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_21 =
  fun _endpos_b_ _startpos_s_ b s ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos_s_ in
    (
# 129 "parser.mly"
                               (EAsign(s, b, (_startpos, _endpos)))
# 740 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_22 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 153 "parser.mly"
       ( Eq )
# 748 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 755 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_23 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 154 "parser.mly"
        ( Neq )
# 763 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 770 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_24 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 155 "parser.mly"
       ( Lt )
# 778 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 785 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_25 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 156 "parser.mly"
        ( Lte )
# 793 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 800 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_26 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 157 "parser.mly"
       ( Gt )
# 808 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 815 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_27 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 158 "parser.mly"
        ( Gte )
# 823 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 830 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_28 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 159 "parser.mly"
         ( Add )
# 838 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 845 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_29 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 160 "parser.mly"
          ( Sub )
# 853 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 860 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_30 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 161 "parser.mly"
        ( Mul )
# 868 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 875 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_31 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 162 "parser.mly"
        ( Div )
# 883 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 890 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_32 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 163 "parser.mly"
        ( Mod )
# 898 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 905 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_33 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 164 "parser.mly"
           ( Concat )
# 913 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 920 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_34 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 165 "parser.mly"
        ( And )
# 928 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 935 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_35 =
  fun _endpos_b3_ _startpos_b1_ b1 b3 ->
    let b2 = 
# 166 "parser.mly"
       ( Or )
# 943 "parser.ml"
     in
    let _endpos = _endpos_b3_ in
    let _startpos = _startpos_b1_ in
    (
# 130 "parser.mly"
                                      ( EBinop(b2,b1,b3, (_startpos,_endpos)) )
# 950 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_36 =
  fun _endpos_lst_ _startpos__1_ b1 b2 lst ->
    let _endpos = _endpos_lst_ in
    let _startpos = _startpos__1_ in
    (
# 131 "parser.mly"
                                             (EIf(b1, b2,lst, (_startpos,_endpos)) )
# 960 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_37 =
  fun _endpos_b2_ _startpos__1_ b1 b2 ->
    let _endpos = _endpos_b2_ in
    let _startpos = _startpos__1_ in
    (
# 132 "parser.mly"
                                   ( EIf (b1, EReturn(b2, (_startpos, _endpos)), EBlock([],(_startpos, _endpos)), (_startpos,_endpos)) )
# 970 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_38 =
  fun _endpos_f_ _startpos__1_ f ->
    let _endpos = _endpos_f_ in
    let _startpos = _startpos__1_ in
    (
# 133 "parser.mly"
                   ( EFn(f, (_startpos,_endpos)) )
# 980 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_39 =
  fun _endpos_e_ _startpos__1_ e ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 134 "parser.mly"
                    ( EReturn(e, (_startpos,_endpos)) )
# 990 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_40 =
  fun lst ->
    (
# 143 "parser.mly"
                                                               ( lst )
# 998 "parser.ml"
     : (Ast.stmt list))

let _menhir_action_41 =
  fun body i ->
    (
# 61 "parser.mly"
    ( { name = i ; body = body } )
# 1006 "parser.ml"
     : (Ast.decl))

let _menhir_action_42 =
  fun _endpos__0_ ->
    let _endpos = _endpos__0_ in
    let _startpos = _endpos__0_ in
    (
# 138 "parser.mly"
                           (EBlock([], (_startpos,_endpos)))
# 1016 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_43 =
  fun _endpos_s_ _startpos__1_ b2 b3 s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos__1_ in
    (
# 139 "parser.mly"
                                             (EIf(b2, b3, s, (_startpos,_endpos)))
# 1026 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_44 =
  fun b3 ->
    (
# 140 "parser.mly"
                   (b3)
# 1034 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_45 =
  fun s ->
    (
# 121 "parser.mly"
             (s )
# 1042 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_46 =
  fun _endpos_s_ _startpos_s_ s ->
    let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
    (
# 122 "parser.mly"
             (if not(is_good s) then (raise (Error2 ("Le bloc ne doit pas finir par val ou var")) ); EBlock(s, (_startpos,_endpos)) )
# 1052 "parser.ml"
     : (Ast.bexpr))

let _menhir_action_47 =
  fun dl ->
    (
# 56 "parser.mly"
    ( dl )
# 1060 "parser.ml"
     : (Ast.file))

let _menhir_action_48 =
  fun a e xs ->
    let pl = 
# 241 "<standard.mly>"
    ( xs )
# 1068 "parser.ml"
     in
    (
# 66 "parser.mly"
   ( { formal = pl ; annot = a ; body = e } )
# 1073 "parser.ml"
     : (Ast.funbody))

let _menhir_action_49 =
  fun _endpos_e_ _startpos__1_ e xs ->
    let pl = 
# 241 "<standard.mly>"
    ( xs )
# 1081 "parser.ml"
     in
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 69 "parser.mly"
   ( { formal = pl ; annot = ([], TAType(AEmpty((_startpos,_endpos)), (_startpos,_endpos)), (_startpos,_endpos)) ; body = e } )
# 1088 "parser.ml"
     : (Ast.funbody))

let _menhir_action_50 =
  fun _endpos_at_ _startpos_at_ at ->
    let _endpos = _endpos_at_ in
    let _startpos = _startpos_at_ in
    (
# 88 "parser.mly"
               ( TAType(at, (_startpos,_endpos)) )
# 1098 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_51 =
  fun _endpos_res_ _startpos_at_ at res ->
    let _endpos = _endpos_res_ in
    let _startpos = _startpos_at_ in
    (
# 89 "parser.mly"
                                      ( TFun(at, res, (_startpos,_endpos)) )
# 1108 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_52 =
  fun _endpos_res_ _startpos__1_ res tl tl1 ->
    let _endpos = _endpos_res_ in
    let _startpos = _startpos__1_ in
    (
# 90 "parser.mly"
                                                                                                            ( TMulFun(tl1::tl, res, (_startpos,_endpos)) )
# 1118 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_53 =
  fun _endpos_res_ _startpos__1_ res tl ->
    let _endpos = _endpos_res_ in
    let _startpos = _startpos__1_ in
    (
# 91 "parser.mly"
                                                      ( TMulFun([tl], res, (_startpos,_endpos)) )
# 1128 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_54 =
  fun _endpos_res_ _startpos__1_ res ->
    let _endpos = _endpos_res_ in
    let _startpos = _startpos__1_ in
    (
# 92 "parser.mly"
                                    (TMulFun([], res, (_startpos,_endpos)))
# 1138 "parser.ml"
     : (Ast.kokaType))

let _menhir_action_55 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1146 "parser.ml"
     : (unit list))

let _menhir_action_56 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1154 "parser.ml"
     : (unit list))

let _menhir_action_57 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1162 "parser.ml"
     : (Ast.file))

let _menhir_action_58 =
  fun d xs ->
    let x = 
# 55 "parser.mly"
                                                  (d)
# 1170 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1175 "parser.ml"
     : (Ast.file))

let _menhir_action_59 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1183 "parser.ml"
     : (Ast.stmt list))

let _menhir_action_60 =
  fun s xs ->
    let x = 
# 143 "parser.mly"
                                                   (s)
# 1191 "parser.ml"
     in
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1196 "parser.ml"
     : (Ast.stmt list))

let _menhir_action_61 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1204 "parser.ml"
     : (string list))

let _menhir_action_62 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1212 "parser.ml"
     : (string list))

let _menhir_action_63 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1220 "parser.ml"
     : (Ast.bexpr list))

let _menhir_action_64 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1228 "parser.ml"
     : (Ast.bexpr list))

let _menhir_action_65 =
  fun () ->
    (
# 145 "<standard.mly>"
    ( [] )
# 1236 "parser.ml"
     : (Ast.param list))

let _menhir_action_66 =
  fun x ->
    (
# 148 "<standard.mly>"
    ( x )
# 1244 "parser.ml"
     : (Ast.param list))

let _menhir_action_67 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 1252 "parser.ml"
     : (unit list))

let _menhir_action_68 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 1260 "parser.ml"
     : (unit list))

let _menhir_action_69 =
  fun _endpos_ty_ _startpos_s_ s ty ->
    let _endpos = _endpos_ty_ in
    let _startpos = _startpos_s_ in
    (
# 74 "parser.mly"
                                      ( (s, ty, (_startpos,_endpos)) )
# 1270 "parser.ml"
     : (Ast.param))

let _menhir_action_70 =
  fun _endpos_t_ _startpos__1_ t xs ->
    let lst = 
# 241 "<standard.mly>"
    ( xs )
# 1278 "parser.ml"
     in
    let _endpos = _endpos_t_ in
    let _startpos = _startpos__1_ in
    (
# 83 "parser.mly"
    ( (lst, t, (_startpos,_endpos)) )
# 1285 "parser.ml"
     : (Ast.result))

let _menhir_action_71 =
  fun _endpos_t_ _startpos_t_ t ->
    let _endpos = _endpos_t_ in
    let _startpos = _startpos_t_ in
    (
# 84 "parser.mly"
                 ( ([], t, (_startpos,_endpos)))
# 1295 "parser.ml"
     : (Ast.result))

let _menhir_action_72 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1303 "parser.ml"
     : (string list))

let _menhir_action_73 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1311 "parser.ml"
     : (string list))

let _menhir_action_74 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1319 "parser.ml"
     : (Ast.bexpr list))

let _menhir_action_75 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1327 "parser.ml"
     : (Ast.bexpr list))

let _menhir_action_76 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1335 "parser.ml"
     : (Ast.kokaType list))

let _menhir_action_77 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1343 "parser.ml"
     : (Ast.kokaType list))

let _menhir_action_78 =
  fun x ->
    (
# 250 "<standard.mly>"
    ( [ x ] )
# 1351 "parser.ml"
     : (Ast.param list))

let _menhir_action_79 =
  fun x xs ->
    (
# 253 "<standard.mly>"
    ( x :: xs )
# 1359 "parser.ml"
     : (Ast.param list))

let _menhir_action_80 =
  fun _endpos_b_ _startpos_b_ b ->
    let _endpos = _endpos_b_ in
    let _startpos = _startpos_b_ in
    (
# 147 "parser.mly"
              ( SBexpr(b, (_startpos,_endpos)) )
# 1369 "parser.ml"
     : (Ast.stmt))

let _menhir_action_81 =
  fun _endpos_e_ _startpos__1_ e s ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 148 "parser.mly"
                               ( SDecl(s, e, (_startpos,_endpos)) )
# 1379 "parser.ml"
     : (Ast.stmt))

let _menhir_action_82 =
  fun _endpos_e_ _startpos__1_ e s ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 149 "parser.mly"
                                 ( SVar(s,e, (_startpos,_endpos)) )
# 1389 "parser.ml"
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
      let _v = _menhir_action_47 dl in
      MenhirBox_file _v
  
  let rec _menhir_run_155 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_cell1_nonempty_list_SEMICOLON_ -> _ -> _menhir_box_file =
    fun _menhir_stack _v ->
      let MenhirCell1_nonempty_list_SEMICOLON_ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_decl (_menhir_stack, _menhir_s, d) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_58 d xs in
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
          let _v = _menhir_action_55 () in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_56 x xs in
      _menhir_goto_list_SEMICOLON_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_SEMICOLON_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState055 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_056 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LBRAC as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_SEMICOLON_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VAR ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | VAL ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | STRING _v_0 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState056
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | INT _v_1 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState056
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | IDENT _v_2 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState056
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState056
      | RBRAC ->
          let _v_3 = _menhir_action_59 () in
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
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
              let _menhir_s = MenhirState059 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TILD ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LSPAR ->
                  _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FN ->
                  _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCLAM ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
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
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, MenhirState069, _startpos_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | TILD ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | STRING _v_1 ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState070
          | RETURN ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | LSPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | LPAR ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | LBRAC ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | INT _v_2 ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState070
          | IF ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | IDENT _v_3 ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState070
          | FN ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | FALSE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | EXCLAM ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState070
          | RPAR ->
              let _v_4 = _menhir_action_63 () in
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 _tok
          | _ ->
              _eRR ())
      | LBRAC ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | FN ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState069 in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_FN (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_s = MenhirState107 in
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
          let _v = _menhir_action_18 a in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_TILD (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState049 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_06 _endpos_s_ _startpos_s_ s in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
  
  and _menhir_run_051 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState051 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LSPAR (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | LBRAC ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState052
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState052
      | RSPAR ->
          let _v = _menhir_action_63 () in
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_053 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | TILD ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | STRING _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState053
      | RPAR ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_startpos__1_, _endpos__2_) = (_startpos, _endpos) in
          let _v = _menhir_action_07 _endpos__2_ _startpos__1_ in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
      | RETURN ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | LSPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | LPAR ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | LBRAC ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | INT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState053
      | IF ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | IDENT _v ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState053
      | FN ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | FALSE ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | EXCLAM ->
          let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState053
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LBRAC (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState055
      | EXCLAM | FALSE | FN | IDENT _ | IF | INT _ | LPAR | LSPAR | RBRAC | RETURN | STRING _ | TILD | TRUE | VAL | VAR ->
          let _v = _menhir_action_55 () in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState055 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_060 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_04 _endpos_n_ _startpos_n_ n in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _menhir_s _tok
  
  and _menhir_run_061 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState061 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ASSIGN ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState063 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | AND | COMMA | CONCAT | DIV | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | MOD | MUL | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_05 _endpos_id_ _startpos_id_ id in
          _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_id_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_064 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_FN (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState064 in
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
          let _v = _menhir_action_65 () in
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
          let _v = _menhir_action_61 () in
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
          let _v = _menhir_action_72 x in
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
      let _v = _menhir_action_62 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_IDENT__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_IDENT__ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_IDENT__ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_GT (_menhir_stack, _endpos) in
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
      | LT ->
          let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LT (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState020 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAR ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ARROW | COMMA | EXCLAM | FALSE | FN | GT | IDENT _ | IF | INT _ | LBRAC | LPAR | LSPAR | RETURN | RPAR | STRING _ | TILD | TRUE ->
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
          let _menhir_s = MenhirState024 in
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
          let _v = _menhir_action_50 _endpos_at_ _startpos_at_ at in
          _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_at_ _startpos_at_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_kokatype : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState008 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState039 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState145 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState031 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState011 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState020 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_041 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
      let (_endpos_ty_, ty) = (_endpos, _v) in
      let _v = _menhir_action_69 _endpos_ty_ _startpos_s_ s ty in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState044 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAR ->
          let x = _v in
          let _v = _menhir_action_78 x in
          _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState044 ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState006 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_045 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_79 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_042 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let x = _v in
      let _v = _menhir_action_66 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_param__ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RPAR (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState047 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
  
  and _menhir_run_066 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_03 _endpos__1_ _startpos__1_ in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_067 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_EXCLAM (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState067 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_kokatype as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_kokatype (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState039 in
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
          let _v = _menhir_action_76 x in
          _menhir_goto_separated_nonempty_list_COMMA_kokatype_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_kokatype_ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_kokatype as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState039 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_040 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_cell1_kokatype -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_kokatype (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_77 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_kokatype_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_034 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_kokatype_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RPAR (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ARROW ->
          let _menhir_s = MenhirState036 in
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
  
  and _menhir_run_029 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ARROW ->
              let _menhir_stack = MenhirCell1_kokatype (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell0_RPAR (_menhir_stack, _endpos_0) in
              let _menhir_s = MenhirState031 in
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
          let _menhir_s = MenhirState033 in
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
  
  and _menhir_run_027 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LT, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_IDENT__ _menhir_cell0_GT -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_GT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_loption_separated_nonempty_list_COMMA_IDENT__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_LT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_t_, t) = (_endpos, _v) in
      let _v = _menhir_action_70 _endpos_t_ _startpos__1_ t xs in
      _menhir_goto_result _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
  
  and _menhir_goto_result : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState145 ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState036 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState031 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState011 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState024 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
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
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | STRING _v_0 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState148
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | LBRAC ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | INT _v_1 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState148
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | IDENT _v_2 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState148
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState148
      | _ ->
          _eRR ()
  
  and _menhir_run_037 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_kokatype_ _menhir_cell0_RPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_separated_nonempty_list_COMMA_kokatype_ (_menhir_stack, _, tl) = _menhir_stack in
      let MenhirCell1_kokatype (_menhir_stack, _, tl1, _, _) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_res_, res) = (_endpos, _v) in
      let _v = _menhir_action_52 _endpos_res_ _startpos__1_ res tl tl1 in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_res_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_032 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_kokatype _menhir_cell0_RPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_kokatype (_menhir_stack, _, tl, _, _) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_res_, res) = (_endpos, _v) in
      let _v = _menhir_action_53 _endpos_res_ _startpos__1_ res tl in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_res_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_028 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_RPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_RPAR (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_res_, res) = (_endpos, _v) in
      let _v = _menhir_action_54 _endpos_res_ _startpos__1_ res in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_res_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_025 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_atype -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_atype (_menhir_stack, _menhir_s, at, _startpos_at_, _) = _menhir_stack in
      let (_endpos_res_, res) = (_endpos, _v) in
      let _v = _menhir_action_51 _endpos_res_ _startpos_at_ at res in
      _menhir_goto_kokatype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_res_ _startpos_at_ _v _menhir_s _tok
  
  and _menhir_run_026 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_71 _endpos_t_ _startpos_t_ t in
      _menhir_goto_result _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
  
  and _menhir_run_021 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT _menhir_cell0_LT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | GT ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
          let (_endpos__4_, ty) = (_endpos_0, _v) in
          let _v = _menhir_action_14 _endpos__4_ _startpos_s_ s ty in
          _menhir_goto_atype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_s_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_IDENT -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_IDENT (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_73 x xs in
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
  
  and _menhir_run_072 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
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
      | MenhirState049 ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState056 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState134 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState063 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState097 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState089 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState083 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState148 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState114 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
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
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer
      | SEMICOLON ->
          let (_endpos_b_, _startpos_b_, b) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_80 _endpos_b_ _startpos_b_ b in
          _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_079 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState079 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState087 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState089 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState081 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState083 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_091 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState091 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState095 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_LT (_menhir_stack, _startpos) in
      let _menhir_s = MenhirState097 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_099 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState099 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_GT (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState101 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_103 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState103 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState085 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState093 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_105 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState105 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
          let _v = _menhir_action_67 x in
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
          let _v_0 = _menhir_action_57 () in
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
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | VAL ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | TRUE ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | STRING _v_0 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState134
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | INT _v_1 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState134
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | IDENT _v_2 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState134
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
      | RBRAC ->
          let _v_3 = _menhir_action_59 () in
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
                  _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TILD ->
                  _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | RETURN ->
                  _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LSPAR ->
                  _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAR ->
                  _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LBRAC ->
                  _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IDENT _v ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FN ->
                  _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXCLAM ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
      let _v = _menhir_action_60 s xs in
      _menhir_goto_list___anonymous_1_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list___anonymous_1_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState056 ->
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
      let _v = _menhir_action_40 lst in
      _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState069 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState148 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState114 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_111 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_atom -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_atom (_menhir_stack, _menhir_s, at, _startpos_at_, _) = _menhir_stack in
      let (_endpos_b_, b) = (_endpos, _v) in
      let _v = _menhir_action_12 _endpos_b_ _startpos_at_ at b in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_at_ _v _menhir_s _tok
  
  and _menhir_run_077 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_46 _endpos_s_ _startpos_s_ s in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState148 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState047 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState051 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState053 ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState129 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState059 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState124 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState120 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState116 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState114 ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_149 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR, _menhir_box_file) _menhir_cell1_annot -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_annot (_menhir_stack, _, a) = _menhir_stack in
      let MenhirCell0_RPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_48 a e xs in
      _menhir_goto_funbody _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _v _menhir_s _tok
  
  and _menhir_goto_funbody : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState005 ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_150 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_FUN _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, i, _, _) = _menhir_stack in
      let MenhirCell1_FUN (_menhir_stack, _menhir_s) = _menhir_stack in
      let body = _v in
      let _v = _menhir_action_41 body i in
      let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | _ ->
          _eRR ()
  
  and _menhir_run_108 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_atom, _menhir_box_file) _menhir_cell1_FN -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_FN (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_atom (_menhir_stack, _menhir_s, at, _startpos_at_, _) = _menhir_stack in
      let (_endpos_fb_, fb) = (_endpos, _v) in
      let _v = _menhir_action_11 _endpos_fb_ _startpos_at_ at fb in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_fb_ _startpos_at_ _v _menhir_s _tok
  
  and _menhir_run_065 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_FN -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_FN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_f_, f) = (_endpos, _v) in
      let _v = _menhir_action_38 _endpos_f_ _startpos__1_ f in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_147 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_param__ _menhir_cell0_RPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_loption_separated_nonempty_list_COMMA_param__ (_menhir_stack, _, xs) = _menhir_stack in
      let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_49 _endpos_e_ _startpos__1_ e xs in
      _menhir_goto_funbody _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _v _menhir_s _tok
  
  and _menhir_run_143 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_RETURN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_39 _endpos_e_ _startpos__1_ e in
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
      let _v = _menhir_action_81 _endpos_e_ _startpos__1_ e s in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_126 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_VAR _menhir_cell0_IDENT -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_IDENT (_menhir_stack, s, _, _) = _menhir_stack in
      let MenhirCell1_VAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_82 _endpos_e_ _startpos__1_ e s in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_125 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_RETURN -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RETURN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, b1, _, _) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_b2_, b2) = (_endpos, _v) in
      let _v = _menhir_action_37 _endpos_b2_ _startpos__1_ b1 b2 in
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
            _menhir_action_42 _endpos__0_
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
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRAC ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TILD ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RETURN ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LSPAR ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAR ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENT _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FN ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLAM ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_122 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELIF, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _, b3, _) = _menhir_stack in
      let MenhirCell1_bexpr (_menhir_stack, _, b2, _, _) = _menhir_stack in
      let MenhirCell1_ELIF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_s_, s) = (_endpos, _v) in
      let _v = _menhir_action_43 _endpos_s_ _startpos__1_ b2 b3 s in
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
      let _v = _menhir_action_36 _endpos_lst_ _startpos__1_ b1 b2 lst in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_lst_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_117 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr, _menhir_box_file) _menhir_cell1_expr, _menhir_box_file) _menhir_cell1_ELSE -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_ELSE (_menhir_stack, _menhir_s) = _menhir_stack in
      let (_endpos_b3_, b3) = (_endpos, _v) in
      let _v = _menhir_action_44 b3 in
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
            _menhir_action_42 _endpos__0_
          in
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v, _endpos) in
          let _menhir_s = MenhirState075 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RPAR | RSPAR ->
          let x = _v in
          let _v = _menhir_action_74 x in
          _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_separated_nonempty_list_COMMA_expr_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState075 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState052 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_076 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_75 x xs in
      _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_071 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let x = _v in
      let _v = _menhir_action_64 x in
      _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState052 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState070 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_133 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_SEMICOLON -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_SEMICOLON (_menhir_stack, _menhir_s) = _menhir_stack in
      let (xs, x) = (_v, ()) in
      let _v = _menhir_action_68 x xs in
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
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer
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
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RETURN ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_RETURN (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState124 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TILD ->
              _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RETURN ->
              _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LSPAR ->
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAR ->
              _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRAC ->
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IDENT _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FN ->
              _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXCLAM ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_112 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
          let (_endpos_b_, b) = (_endpos, _v) in
          let _v = _menhir_action_21 _endpos_b_ _startpos_s_ b s in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_s_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_34 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_22 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_GT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell0_GT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_26 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_27 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_098 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr _menhir_cell0_LT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell0_LT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_24 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_25 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_33 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_29 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_23 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | OR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_35 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_086 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
      let (_endpos_b3_, b3) = (_endpos, _v) in
      let _v = _menhir_action_31 _endpos_b3_ _startpos_b1_ b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
  
  and _menhir_run_084 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
      let (_endpos_b3_, b3) = (_endpos, _v) in
      let _v = _menhir_action_32 _endpos_b3_ _startpos_b1_ b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
  
  and _menhir_run_082 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_bexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
      let (_endpos_b3_, b3) = (_endpos, _v) in
      let _v = _menhir_action_30 _endpos_b3_ _startpos_b1_ b1 b3 in
      _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
  
  and _menhir_run_080 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_bexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | CONCAT | DOT | ELIF | ELSE | EQ | FN | GT | GTE | LBRAC | LPAR | LT | LTE | MINUS | NEQ | OR | PLUS | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let MenhirCell1_bexpr (_menhir_stack, _menhir_s, b1, _startpos_b1_, _) = _menhir_stack in
          let (_endpos_b3_, b3) = (_endpos, _v) in
          let _v = _menhir_action_28 _endpos_b3_ _startpos_b1_ b1 b3 in
          _menhir_goto_bexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b3_ _startpos_b1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_078 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer
      | OR ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MUL ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MOD ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MINUS ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GTE ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DIV ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CONCAT ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND ->
          let _menhir_stack = MenhirCell1_bexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COMMA | DOT | ELIF | ELSE | FN | LBRAC | LPAR | RETURN | RPAR | RSPAR | SEMICOLON | THEN ->
          let (_endpos_s_, s) = (_endpos, _v) in
          let _v = _menhir_action_45 s in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_EXCLAM -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
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
          let _v_0 = _menhir_action_57 () in
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
          let _v = _menhir_action_55 () in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let file =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
