
all: main.exe
	dune exec ./main.exe test.koka

tests: main.exe
	for f in tests/*.logo; do dune exec ./main.exe $$f; done

main.exe:
	dune build main.exe

explain:
	menhir --base /tmp/parser --dump --explain parser.mly
	cat /tmp/parser.conflicts

clean:
	dune clean

.PHONY: all clean explain main.exe



