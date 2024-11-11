
(* The type of tokens. *)

type token = 
  | VAR
  | VAL
  | TRUE
  | TILD
  | THEN
  | STRING of (string)
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
  | INT of (int)
  | IF
  | IDENT of (string)
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

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.file)
