
(* Analyseur lexical pour mini-Turtle *)

{

  open Lexing
  open Parser
  
  exception Lexing_error of string

  let key_words = Hashtbl.create 11
  let () = Hashtbl.add key_words "if" IF
  let () = Hashtbl.add key_words "then" THEN
  let () = Hashtbl.add key_words "else" ELSE
  let () = Hashtbl.add key_words "elif" ELIF
  let () = Hashtbl.add key_words "fn" FN
  let () = Hashtbl.add key_words "fun" FUN
  let () = Hashtbl.add key_words "return" RETURN
  let () = Hashtbl.add key_words "val" VAL
  let () = Hashtbl.add key_words "var" VAR
  let () = Hashtbl.add key_words "True" TRUE
  let () = Hashtbl.add key_words "False" FALSE
  
  let fin_cont = [PLUS; MINUS; MUL; DIV; MOD; CONCAT ;LT ; LTE; GT ;GTE ;EQ; NEQ ;AND; OR ;LPAR; LBRAC; COMMA; ]
  let debut_cont = [PLUS; MINUS ;MUL; DIV; MOD; CONCAT; LT; LTE; GT; GTE; EQ; NEQ; AND; OR; LPAR; LBRAC; COMMA; RPAR; RBRAC ;ARROW ; DEF; DOT ;ASSIGN ; SEMICOLON ;THEN; ELSE; ELIF;]

  let level = ref (-1)  
  let last = ref SEMICOLON
  let indented = ref false 
  let last_line = ref (-1)

}
let digit = ['0'-'9']
let lower = ['a'-'z' '_']
let upper = ['A'-'Z']
let other = ['a'-'z' '_' 'A'-'Z' '0'-'9']
let lud = lower | upper | digit
let ident = lower (lud | lud '_' lud)* '\''*
let tabu = ' '+
let retour = '\n' ' '*
let integer = '-'? ('0' | ['1'-'9'] digit*)
let string = [^'"']*

rule token  = parse
  | "//"  { comment lexbuf }
  | "/*"  { comment2 lexbuf }
  | "++"  { [CONCAT]}
  | '+'   { [PLUS]}
  | '-'   { [MINUS]}
  | '*'   { [MUL]}
  | '/'   { [DIV]}
  | "<="  { [LTE]}
  | "<"   { [LT]}
  | ">="  { [GTE]}
  | ">"   { [GT]}
  | "=="  { [EQ]}
  | "!="  { [NEQ]}
  | "&&"  { [AND]}
  | "||"  { [OR]}
  | '('   { [LPAR]}
  | ')'   { [RPAR]}
  | '{'   { [LBRAC]}
  | '}'   { [SEMICOLON;RBRAC]}
  | '['   { [LSPAR]}
  | ']'   { [RSPAR]}
  | '<'   { [LHOOK]}
  | '>'   { [RHOOK]}
  | ','   { [COMMA]}
  | ':'   { [COLON]}
  | ';'   { [SEMICOLON]}
  | "->"  { [ARROW]}
  | "="   { [DEF]}
  | ":="  { [ASSIGN]}
  | '.'   { [DOT]}
  | '~'   { [TILD]}
  | "!"   { [EXCLAM]}
  | '"'   { read_string lexbuf}
  | integer as s {Printf.printf "hielo\n"; [INT (int_of_string s)] }
  | retour as s {token lexbuf }
  | ' ' { token lexbuf }
  | ident as id { try [Hashtbl.find key_words id] with Not_found -> [IDENT id] }
  | eof { [SEMICOLON;EOF] }
  | _ as c { raise (Lexing_error ("error read: "^(String.make 1 c))) }

and comment = parse 
  | retour { token lexbuf }
  | _  { comment lexbuf }

and comment2 = parse
  | "*/" { token lexbuf }
  | eof  { raise(Lexing_error ("commentaire non finit")) }
  |"\n"{ comment2 lexbuf}
  | _    { comment2 lexbuf }

and read_string = parse
  | string as s { [STRING s] }
  | '"' { token lexbuf }


  { 
   
  let next_token =
    let tokens = Queue.create () in
    let pile = Stack.create () in 
   Stack.push 0 pile;
    Queue.add SEMICOLON tokens; (* prochains lexèmes à renvoyer *)
    fun lb ->
        if Queue.is_empty tokens then begin
	  let l = token lb in
    let pos = Lexing.lexeme_start_p lb in 
    let line = pos.pos_lnum in 
    if (line <> !last_line) then begin    
          last_line := line;
          let c = pos.pos_cnum - pos.pos_bol in 
          let m = Stack.top pile in 
           if c > m then ( 
              if (not(List.mem (!last) fin_cont) && not(List.mem (List.nth l 0) debut_cont)) then (
                  Queue.add LBRAC tokens;
                  Stack.push c pile
                  )
              else ();
              if (!last = LBRAC) then Stack.push c pile else ()
            )
           else (
            
           )

    end;
	  List.iter (fun t -> Queue.add t tokens) l
        end;
        Queue.pop tokens
}
