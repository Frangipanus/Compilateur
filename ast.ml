type binop = Add | Sub | Mul | Div

(* ceci est un commentaire *)

type expr =
  | Econst of int
  | Evar   of string
  | Ebinop of binop * expr * expr

(* instructions *)

type stmt =
  | Spenup
  | Spendown
  | Sforward of expr
  | Sturn    of expr (* tourne à gauche *)
  | Sif      of expr * stmt * stmt
  | Srepeat  of expr * stmt
  | Sblock   of stmt list
  | Scall    of string * expr list

(* définition de procédure *)

type def = {
  name    : string;
  formals : string list; (* arguments *)
  body    : stmt; }

(* programme *)

type program = {
  defs : def list;
  main : stmt; }
