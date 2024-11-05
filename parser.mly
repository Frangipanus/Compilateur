%{
  open Ast

%}

/* Déclaration des tokens */

/* Déclaration des tokens */
%token EOF
%token IF
%token ELSE
%token ELIF
%token FN
%token FUN
%token RETURN
%token THEN
%token VAL
%token VAR
%token PLUS MINUS MUL DIV MOD CONCAT LT LTE GT GTE EQ NEQ AND OR LPAR RPAR LBRAC RBRAC COMMA ARROW DEF DOT ASSIGN SEMICOLON
%token <string> IDENT

/* Priorités et associativités des tokens */


/* Point d'entrée de la grammaire */
%start file

/* Type des valeurs renvoyées par l'analyseur syntaxique */
%type <int list> file

%%

/* Règles de grammaire */

stmt: 
  |IF {8}
  |IDENT {9}
  

file:
  /* À COMPLÉTER */
    |  sl = stmt* EOF {sl}

;