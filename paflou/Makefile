all: parser

# Generate parser.tab.c and parser.tab.h from parser.y
parser.tab.c parser.tab.h: parser.y 
	bison -v -d parser.y

# Generate lex.yy.c from lexer.l and parser.tab.h
lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

# Compile everything and create the final executable "parser"
parser: lex.yy.c parser.tab.c parser.tab.h
	gcc -o parser parser.tab.c lex.yy.c -lfl

# Clean up generated files
clean:
	rm -f parser parser.tab.c parser.tab.h lex.yy.c
	rm -f output
