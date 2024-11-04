
(* Analyseur lexical pour mini-Turtle *)

{
  open Lexing
  open Parser
  
  exception Lexing_error of string
    let kwd_tbl =
    ["if", IF;
     "else", ELSE;
     "elif", ELIF;
     "fn", FN;
     "fun", FUN;
     "return", RETURN; 
     "then", THEN;
     "val", VAL;
     "var", VAR;
        ]
  
  let fin_cont = [PLUS; MOINS; MUL; DIV; MOD; CONC ;INFS; INF; SUPS ;SUP ;EGAL; DIF ;ET; OU ;LPAR; LBRAC; VIR; ]
  let debut_cont = [PLUS; MOINS ;MUL; DIV; MOD; CONC; INFS; INF; SUPS; SUP; EGAL; DIF; ET; OU; LPAR; LBRAC; VIR; RPAR; RBRAC ;FLECHE; EGA; POINT ;POINTEGAL; POINTVIRG ;THEN; ELSE; ELIF;]

  let id_or_kwd =
    let h = Hashtbl.create 9 in
    List.iter (fun (s,t) -> Hashtbl.add h s t) kwd_tbl;
    fun s ->
      try Hashtbl.find h s with _ -> IDENT s
  let level = ref (-1)
  let last = ref IF
  let indented = ref false


}
let digit = ['0'-'9']
let lower = ['a'-'z' '_']
let upper = ['A'-'Z']
let other = ['a'-'z' '_' 'A'-'Z' '0'-'9']
let ident =  lower (other)* '\''* 
let tabu = ' '+
let retour = '\n' ' '*

rule token  = parse
  | "//"  { comment lexbuf }
  | "/*"  {comment2 lexbuf}
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
  | ident as id { let next = id_or_kwd id in next }
  | eof { EOF }
  |_ as c { raise (Lexing_error ("error read: "^(String.make 1 c))) }

  

and comment = parse 
  | retour as s { let level1 = String.length s -1  in Printf.printf "My tab level is %d\n" level1; token lexbuf }
  | _  { comment lexbuf }

and comment2 = parse
  | "*/" { token lexbuf }
  | eof  { raise(Lexing_error ("commentaire non finit")) }
  | _    { comment2 lexbuf }
  