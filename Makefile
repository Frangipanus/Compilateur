
all: main.exe
	dune build kokac.exe

main.exe:
	dune build kokac.exe 

explain:
	menhir --base /tmp/parser --dump --explain parser.mly
	cat /tmp/parser.conflicts

clean:
	dune clean
	
	

parser:
	menhir -v parser.mly

ajout: 
	cp _build/default/lexer.ml . 
	cp _build/default/parser.ml . 
	ocamlc -c ast.ml
	ocamlc -c parser.ml 
	ocamlc -c lexer.ml

.PHONY: all clean explain main.exe



