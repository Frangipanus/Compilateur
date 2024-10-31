%{


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
%token <string> IDENT
%start prog
%type <int list> prog
%%
stmt: 
  |IF {8}
  |IDENT {9}
  

prog:
  /* À COMPLÉTER */
    |  sl = stmt* EOF {sl}

;
