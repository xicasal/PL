all: analisisFlex $(F)
	./analisisFlex < lenguaje.xvi

analisisFlex: analisisFlex.l
	flex analisisFlex.l
	gcc -o analisisFlex lex.yy.c -lfl

clean:
	rm analisisFlex lex.yy.c
