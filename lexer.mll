
(* Analyseur lexical pour mini-Turtle *)

{
  open Lexing
  open Parser
  
  exception Lexing_error of string

  let key_words = Hashtbl.create 9
  let () = Hashtbl.add key_words "if" IF
  let () = Hashtbl.add key_words "then" THEN
  let () = Hashtbl.add key_words "else" ELSE
  let () = Hashtbl.add key_words "elif" ELIF
  let () = Hashtbl.add key_words "fn" FN
  let () = Hashtbl.add key_words "fun" FUN
  let () = Hashtbl.add key_words "return" RETURN
  let () = Hashtbl.add key_words "val" VAL
  let () = Hashtbl.add key_words "var" VAR
  
  let fin_cont = [PLUS; MINUS; MUL; DIV; MOD; CONCAT ;LT ; LTE; GT ;GTE ;EQ; NEQ ;AND; OR ;LPAR; LBRAC; COMMA; ]
  let debut_cont = [PLUS; MINUS ;MUL; DIV; MOD; CONCAT; LT; LTE; GT; GTE; EQ; NEQ; AND; OR; LPAR; LBRAC; COMMA; RPAR; RBRAC ;ARROW ; DEF; DOT ;ASSIGN ; SEMICOLON ;THEN; ELSE; ELIF;]

  let level = ref (-1)
  let last = ref IF
  let indented = ref false


}
let digit = ['0'-'9']
let lower = ['a'-'z' '_']
let upper = ['A'-'Z']
let other = ['a'-'z' '_' 'A'-'Z' '0'-'9']
let lud = lower | upper | digit
let ident = lower (lud | lud '_' lud)* '\''*
let tabu = ' '+
let retour = '\n' ' '*

rule token  = parse
  | "//"  { comment lexbuf }
  | "/*"  { comment2 lexbuf }
  | "++"  { CONCAT }
  | '+'   { PLUS }
  | '-'   { MINUS }
  | '*'   { MUL }
  | '/'   { DIV }
  | "<="  { LTE }
  | "<"   { LT }
  | ">="  { GTE }
  | ">"   { GT }
  | "=="  { EQ }
  | "!="  { NEQ }
  | "&&"  { AND }
  | "||"  { OR }
  | '('   { LPAR }
  | ')'   { RPAR }
  | '{'   { LBRAC }
  | '}'   { RBRAC }
  | ','   { COMMA }
  | ';'   { SEMICOLON }
  | "->"  { ARROW }
  | "="   { DEF }
  | ":="  { ASSIGN }
  | '.'   { DOT }
  | retour as s { level := String.length s -1; token lexbuf }
  | ' ' { token lexbuf }
  | ident as id { try Hashtbl.find key_words id with Not_found -> Ident id }
  | eof { EOF }
  | _ as c { raise (Lexing_error ("error read: "^(String.make 1 c))) }

  

and comment = parse 
  | retour as s { let level1 = String.length s -1  in Printf.printf "My tab level is %d\n" level1; token lexbuf }
  | _  { comment lexbuf }

and comment2 = parse
  | "*/" { token lexbuf }
  | eof  { raise(Lexing_error ("commentaire non finit")) }
  | _    { comment2 lexbuf }
  