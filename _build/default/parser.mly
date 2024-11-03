%{
  open Ast

%}

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
%token PLUS MOINS MUL DIV MOD CONC INFS INF SUPS SUP EGAL DIF ET OU LPAR LBRAC VIR RPAR RBRAC FLECHE EGA POINT POINTEGAL POINTVIRG
%token <string> IDENT
%start file
%type <int list> file
%%
stmt: 
  |IF {8}
  |IDENT {9}
  

file:
  /* À COMPLÉTER */
    |  sl = stmt* EOF {sl}

;
