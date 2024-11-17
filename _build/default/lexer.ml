# 4 "lexer.mll"
 

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
  let debut_cont = [PLUS; MINUS ;MUL; DIV; MOD; CONCAT; LT; LTE; GT; GTE; EQ; NEQ; AND; OR; LBRAC; COMMA; RPAR; RBRAC ;ARROW ; DEF; DOT ;ASSIGN  ;THEN; ELSE; ELIF;]
  let level = ref (-1)  
  let last = ref SEMICOLON
  let indented = ref false 
  let last_line = ref (-1)


# 31 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\215\255\216\255\217\255\018\000\088\000\192\000\219\255\
    \220\255\221\255\166\000\019\000\049\000\136\000\226\255\227\255\
    \228\255\232\255\031\000\234\255\235\255\236\255\237\255\238\255\
    \239\255\240\255\004\000\001\000\035\000\068\000\069\000\070\000\
    \250\255\011\001\089\000\105\000\254\255\255\255\253\255\026\001\
    \222\255\231\255\248\255\246\255\244\255\243\255\242\255\241\255\
    \229\255\218\255\017\000\034\000\224\255\040\000\034\000\049\000\
    \223\255\045\001\129\001\187\001\245\001\047\002\141\000\254\255\
    \255\255\170\000\252\255\253\255\254\255\132\000\255\255\160\002\
    \250\255\251\255\253\255\249\000\252\255\254\255\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\040\000\037\000\037\000\255\255\
    \255\255\255\255\033\000\033\000\040\000\040\000\255\255\255\255\
    \255\255\255\255\022\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\040\000\040\000\030\000\025\000\010\000\008\000\
    \255\255\004\000\003\000\006\000\255\255\255\255\255\255\033\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\037\000\037\000\037\000\037\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\003\000\255\255\255\255\
    \255\255\255\255\255\255\005\000\255\255\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\000\000\255\255\255\255\255\255\000\000\
    \000\000\000\000\255\255\255\255\255\255\255\255\000\000\000\000\
    \000\000\000\000\255\255\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\255\255\000\000\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\063\000\000\000\
    \000\000\066\000\000\000\000\000\000\000\255\255\000\000\072\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\007\000\009\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \008\000\028\000\002\000\000\000\000\000\014\000\027\000\046\000\
    \025\000\024\000\032\000\034\000\019\000\033\000\016\000\035\000\
    \011\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\018\000\017\000\031\000\029\000\030\000\049\000\
    \049\000\004\000\004\000\004\000\004\000\004\000\012\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\013\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\021\000\048\000\020\000\049\000\005\000\
    \045\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\023\000\026\000\022\000\015\000\049\000\
    \047\000\044\000\043\000\042\000\038\000\061\000\051\000\052\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\053\000\036\000\054\000\055\000\056\000\064\000\
    \037\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\070\000\067\000\049\000\000\000\057\000\
    \000\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\049\000\069\000\000\000\039\000\039\000\
    \039\000\039\000\039\000\039\000\039\000\039\000\039\000\039\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\049\000\
    \000\000\000\000\000\000\000\000\000\000\059\000\000\000\000\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\050\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\077\000\000\000\000\000\000\000\057\000\
    \000\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\040\000\039\000\039\000\039\000\039\000\
    \039\000\039\000\039\000\039\000\039\000\000\000\000\000\000\000\
    \000\000\041\000\039\000\039\000\039\000\039\000\039\000\039\000\
    \039\000\039\000\039\000\039\000\049\000\078\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\076\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \000\000\000\000\000\000\000\000\057\000\255\255\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \049\000\000\000\068\000\000\000\000\000\000\000\060\000\000\000\
    \000\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\000\000\000\000\000\000\000\000\
    \057\000\000\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\000\000\000\000\
    \000\000\000\000\057\000\000\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\000\000\000\000\000\000\000\000\057\000\000\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\073\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\074\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\075\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\255\255\255\255\000\000\000\000\027\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\
    \011\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\018\000\000\000\012\000\000\000\
    \028\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
    \026\000\029\000\030\000\031\000\034\000\005\000\050\000\051\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\012\000\035\000\053\000\054\000\055\000\062\000\
    \035\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\069\000\065\000\013\000\255\255\005\000\
    \255\255\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\010\000\065\000\255\255\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\006\000\
    \255\255\255\255\255\255\255\255\255\255\006\000\255\255\255\255\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\013\000\255\255\255\255\255\255\255\255\255\255\
    \000\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\075\000\255\255\255\255\255\255\006\000\
    \255\255\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\033\000\033\000\033\000\033\000\033\000\
    \033\000\033\000\033\000\033\000\033\000\255\255\255\255\255\255\
    \255\255\033\000\039\000\039\000\039\000\039\000\039\000\039\000\
    \039\000\039\000\039\000\039\000\057\000\075\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\075\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \255\255\255\255\255\255\255\255\057\000\062\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \057\000\057\000\057\000\057\000\057\000\057\000\057\000\057\000\
    \058\000\255\255\065\000\255\255\255\255\255\255\058\000\255\255\
    \255\255\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\255\255\255\255\255\255\255\255\
    \058\000\255\255\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\058\000\058\000\058\000\058\000\
    \058\000\058\000\058\000\058\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\255\255\255\255\
    \255\255\255\255\059\000\255\255\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\059\000\059\000\
    \059\000\059\000\059\000\059\000\059\000\059\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \060\000\060\000\060\000\060\000\060\000\060\000\060\000\060\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\255\255\255\255\255\255\255\255\061\000\255\255\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\061\000\061\000\061\000\061\000\061\000\061\000\
    \061\000\061\000\071\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\071\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\071\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \071\000";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 44 "lexer.mll"
          ( comment lexbuf )
# 323 "lexer.ml"

  | 1 ->
# 45 "lexer.mll"
          ( comment2 lexbuf )
# 328 "lexer.ml"

  | 2 ->
# 46 "lexer.mll"
          ( [CONCAT] )
# 333 "lexer.ml"

  | 3 ->
# 47 "lexer.mll"
          ( [PLUS] )
# 338 "lexer.ml"

  | 4 ->
# 48 "lexer.mll"
          ( [MINUS] )
# 343 "lexer.ml"

  | 5 ->
# 49 "lexer.mll"
          ( [MUL] )
# 348 "lexer.ml"

  | 6 ->
# 50 "lexer.mll"
          ( [DIV] )
# 353 "lexer.ml"

  | 7 ->
# 51 "lexer.mll"
          ( [LTE] )
# 358 "lexer.ml"

  | 8 ->
# 52 "lexer.mll"
          ( [LT] )
# 363 "lexer.ml"

  | 9 ->
# 53 "lexer.mll"
          ( [GTE] )
# 368 "lexer.ml"

  | 10 ->
# 54 "lexer.mll"
          ( [GT] )
# 373 "lexer.ml"

  | 11 ->
# 55 "lexer.mll"
          ( [EQ] )
# 378 "lexer.ml"

  | 12 ->
# 56 "lexer.mll"
          ( [NEQ] )
# 383 "lexer.ml"

  | 13 ->
# 57 "lexer.mll"
          ( [AND] )
# 388 "lexer.ml"

  | 14 ->
# 58 "lexer.mll"
          ( [OR] )
# 393 "lexer.ml"

  | 15 ->
# 59 "lexer.mll"
          ( [LPAR] )
# 398 "lexer.ml"

  | 16 ->
# 60 "lexer.mll"
          ( [RPAR] )
# 403 "lexer.ml"

  | 17 ->
# 61 "lexer.mll"
          ( [LBRAC] )
# 408 "lexer.ml"

  | 18 ->
# 62 "lexer.mll"
          ( [SEMICOLON;RBRAC] )
# 413 "lexer.ml"

  | 19 ->
# 63 "lexer.mll"
          ( [LSPAR] )
# 418 "lexer.ml"

  | 20 ->
# 64 "lexer.mll"
          ( [RSPAR] )
# 423 "lexer.ml"

  | 21 ->
# 65 "lexer.mll"
          ( [COMMA] )
# 428 "lexer.ml"

  | 22 ->
# 66 "lexer.mll"
          ( [COLON] )
# 433 "lexer.ml"

  | 23 ->
# 67 "lexer.mll"
          ( [SEMICOLON] )
# 438 "lexer.ml"

  | 24 ->
# 68 "lexer.mll"
          ( [ARROW] )
# 443 "lexer.ml"

  | 25 ->
# 69 "lexer.mll"
          ( [DEF] )
# 448 "lexer.ml"

  | 26 ->
# 70 "lexer.mll"
          ( [ASSIGN] )
# 453 "lexer.ml"

  | 27 ->
# 71 "lexer.mll"
          ( [DOT] )
# 458 "lexer.ml"

  | 28 ->
# 72 "lexer.mll"
          ( [TILD] )
# 463 "lexer.ml"

  | 29 ->
# 73 "lexer.mll"
       ([MOD])
# 468 "lexer.ml"

  | 30 ->
# 74 "lexer.mll"
          ( [EXCLAM] )
# 473 "lexer.ml"

  | 31 ->
# 76 "lexer.mll"
          ([TRUE])
# 478 "lexer.ml"

  | 32 ->
# 77 "lexer.mll"
            ([FALSE])
# 483 "lexer.ml"

  | 33 ->
let
# 78 "lexer.mll"
               s
# 489 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 78 "lexer.mll"
                 ( [INT(int_of_string s)] )
# 493 "lexer.ml"

  | 34 ->
# 79 "lexer.mll"
        (Lexing.new_line lexbuf; token lexbuf)
# 498 "lexer.ml"

  | 35 ->
# 80 "lexer.mll"
        ( token lexbuf )
# 503 "lexer.ml"

  | 36 ->
# 81 "lexer.mll"
         (token lexbuf)
# 508 "lexer.ml"

  | 37 ->
let
# 82 "lexer.mll"
             id
# 514 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 82 "lexer.mll"
                ( try [Hashtbl.find key_words id] with Not_found -> [IDENT id] )
# 518 "lexer.ml"

  | 38 ->
# 83 "lexer.mll"
        ( Lexing.new_line lexbuf;[EOF] )
# 523 "lexer.ml"

  | 39 ->
# 84 "lexer.mll"
          ( [IDENT(read_string lexbuf)] )
# 528 "lexer.ml"

  | 40 ->
let
# 85 "lexer.mll"
         c
# 534 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 85 "lexer.mll"
           ( raise (Lexing_error ("error read: "^(String.make 1 c))) )
# 538 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and comment lexbuf =
   __ocaml_lex_comment_rec lexbuf 62
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 88 "lexer.mll"
         (Lexing.new_line lexbuf;  token lexbuf )
# 550 "lexer.ml"

  | 1 ->
# 89 "lexer.mll"
       ( comment lexbuf )
# 555 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

and comment2 lexbuf =
   __ocaml_lex_comment2_rec lexbuf 65
and __ocaml_lex_comment2_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 92 "lexer.mll"
         ( token lexbuf )
# 567 "lexer.ml"

  | 1 ->
# 93 "lexer.mll"
         ( raise(Lexing_error ("commentaire non finit")) )
# 572 "lexer.ml"

  | 2 ->
# 94 "lexer.mll"
         (Lexing.new_line lexbuf; comment2 lexbuf )
# 577 "lexer.ml"

  | 3 ->
# 95 "lexer.mll"
         ( comment2 lexbuf )
# 582 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_comment2_rec lexbuf __ocaml_lex_state

and read_string lexbuf =
   __ocaml_lex_read_string_rec lexbuf 71
and __ocaml_lex_read_string_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 98 "lexer.mll"
           ("\\"^(read_string lexbuf))
# 594 "lexer.ml"

  | 1 ->
# 99 "lexer.mll"
            ("\""^(read_string lexbuf))
# 599 "lexer.ml"

  | 2 ->
let
# 100 "lexer.mll"
            s
# 605 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 100 "lexer.mll"
              ( "" )
# 609 "lexer.ml"

  | 3 ->
# 101 "lexer.mll"
          ("\t"^(read_string lexbuf))
# 614 "lexer.ml"

  | 4 ->
# 102 "lexer.mll"
         (raise (Lexing_error("Les string sont sur une seule ligne")))
# 619 "lexer.ml"

  | 5 ->
let
# 103 "lexer.mll"
         c
# 625 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 103 "lexer.mll"
           ( (String.make 1 c) ^(read_string lexbuf))
# 629 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_read_string_rec lexbuf __ocaml_lex_state

;;

# 105 "lexer.mll"
  
  let next_token =
    let tokens = Queue.create () in
    let pile = Stack.create () in 
    Stack.push 0 pile;
    Queue.add SEMICOLON tokens; (* prochains lexèmes à renvoyer *)
    fun lb ->
      
      if Queue.is_empty tokens then begin
      
        let next = token lb in
        let pos = Lexing.lexeme_start_p lb in 
        let line = pos.pos_lnum in
        if (line <> !last_line) || ((List.length next = 1 && List.nth next 0 = EOF) ) then begin    
              last_line := line;
              let c =  
              if (List.length next = 1 && List.nth next 0 = EOF) then (0) else (pos.pos_cnum - pos.pos_bol) in
             
              let m = ref (Stack.top pile) in 
              if c > !m then ( 
                  if (not (List.mem (!last) fin_cont) &&  (not(List.mem (List.nth next 0) debut_cont))) then (
                      Queue.add LBRAC tokens;
                      Stack.push c pile;
                      );
                  if (!last = LBRAC) then Stack.push c pile
                )
              else (
                while c < !m do
                  
                  let _ = Stack.pop pile in  
                  m := Stack.top pile;
                  if (List.length next == 2 && List.nth next 1 = RBRAC) then () else ( Queue.add SEMICOLON tokens; Queue.add RBRAC tokens)
                done;
                if c > !m then raise(Lexing_error("Erreur d'indentation"));
                if ((not (List.mem (!last) fin_cont)) && (not (List.mem (List.nth next 0) debut_cont))) then
                  Queue.add SEMICOLON tokens;
              )
        end;
        
	      List.iter (fun t -> Queue.add t tokens) next
      end;
      let acc = Queue.pop tokens in 
      last := acc;
      acc

# 682 "lexer.ml"
