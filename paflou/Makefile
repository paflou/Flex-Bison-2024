all: lexer

parser.tab.c parser.tab.h: parser.y 
	bison -v -d parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

lexer: lex.yy.c parser.tab.c parser.tab.h
	gcc parser.tab.c lex.yy.c -lfl

clean:
	rm a.exe parser.tab.c parser.tab.h lex.yy.c
	rm parser output