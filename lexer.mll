
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

  let id_or_kwd =
    let h = Hashtbl.create 9 in
    List.iter (fun (s,t) -> Hashtbl.add h s t) kwd_tbl;
    fun s ->
      try Hashtbl.find h s with _ -> IDENT s

    

}
let digit = ['0'-'9']
let lower = ['a'-'z' '_']
let upper = ['A'-'Z']
let other = ['a'-'z' '_' 'A'-'Z' '0'-'9']
let ident =  lower (other)* '''* 



rule token = parse
  | "//" { comment lexbuf }
  |"/*" {comment2 lexbuf}
  |" " {token lexbuf}
  |"\n"{ token lexbuf}
  | ident as id { id_or_kwd id }
  |eof {EOF}
  |_ as c {raise (Lexing_error ("error read: "^(String.make 1 c))) }

  
and comment = parse 
  | "\n" {token lexbuf}
  | _  {comment lexbuf}

and comment2 = parse
  |"*/" {token lexbuf}
  |eof {raise(Lexing_error ("commentaire non finit"))}
  |_ {comment2 lexbuf}
  