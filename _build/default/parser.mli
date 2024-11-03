
(* The type of tokens. *)

type token = 
  | VIR
  | VAR
  | VAL
  | THEN
  | SUPS
  | SUP
  | RPAR
  | RETURN
  | RBRAC
  | POINTVIRG
  | POINTEGAL
  | POINT
  | PLUS
  | OU
  | MUL
  | MOINS
  | MOD
  | LPAR
  | LBRAC
  | INFS
  | INF
  | IF
  | IDENT of (string)
  | FUN
  | FN
  | FLECHE
  | ET
  | EOF
  | ELSE
  | ELIF
  | EGAL
  | EGA
  | DIV
  | DIF
  | CONC

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (int list)
