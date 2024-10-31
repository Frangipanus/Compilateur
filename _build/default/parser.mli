
(* The type of tokens. *)

type token = 
  | VAR
  | VAL
  | THEN
  | RETURN
  | IF
  | IDENT of (string)
  | FUN
  | FN
  | EOF
  | ELSE
  | ELIF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (int list)
