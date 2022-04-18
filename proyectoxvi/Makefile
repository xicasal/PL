analizadorxvi: analisisBison.tab.c analisisFlex.lex.c
	gcc -o analizadorxvi analisisBison.tab.c lex.yy.c -lm
analisisBison.tab.c: analisisBison.y
	bison -dv analisisBison.y
analisisFlex.lex.c: analisisFlex.l
	flex analisisFlex.l
clean:
	rm analisisBison.tab.c analisisBison.tab.h analisisBison.output lex.yy.c analizadorxvi
