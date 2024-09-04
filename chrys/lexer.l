%{
    #include "parser.tab.h"

    char str_buf[256];
    void yyerror(const char* err);
    int lineno = 1;
%}

%option yylineno
%option noyywrap

INT             [0-9]+

LETTER          [a-zA-Z]
IDENT           ({LETTER}|_)({LETTER}|{INT}|_)*
%%

";"         { return SEMICOLON; }
"."         { return DOT; }
","         { return COMMA; }
":"         { return COLON; }
"int"       { return DATATYPE; }
"char"      { return DATATYPE; }
"double"    { return DATATYPE; }
"boolean"   { return DATATYPE; }
"String"    { return DATATYPE; }

"new"       { return NEW; }
"return"    { return RETURN; }
"void"      { return VOID; }
"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }
"do"        { return DO; }
"for"       { return FOR; }
"switch"    { return SWITCH; }
"case"      { return CASE; }
"default"   { return DEFAULT; }
"break"     { return BREAK; }

"private"   { return PRIVATE; }
"public"    { return PUBLIC; }

"static"    { return STATIC; }
"abstract"  { return ABSTRACT; }
"final"     { return FINAL; }
"native"    { return NATIVE; }
"synchronized" { return SYNCHRONIZED; }

"//".*                  { /* Ignore single-line comments */ }
"/*"([^*]|\*+[^*/])*"*"+"/"  { /* Ignore multi-line comments */ }

[A-Z][a-zA-Z0-9_]*              { return CLASS_NAME; }

"class"                         { return CLASS; }
"{"                             { return LCURLY; }
"}"                             { return RCURLY; }

{INT}                           { return INT; }

\'([^\\]|\\[ntbrf'\\])\'        { return CHAR; }

{INT}"."{INT}([eE][+-]?{INT})?([fFdD])? { return DOUBLE; }

"true"                          { return BOOL; }
"false"                         { return BOOL; }

\"(\\.|[^"])*\"                 { return STRING; }

"="                             { return EQUALS; }
"("                             { return LPAR; }
")"                             { return RPAR; }
"||"                            { return OROP; }
"&&"                            { return ANDOP; }
"=="|"!="                       { return EQUOP; }
">"|">="|"<"|"<="               { return RELOP; }

"out.print"                     { return OUTPRINT; }
{IDENT}                         { return IDENT; }

[ \t\n]+                        { /* Ignore whitespace */ }
.                               { fprintf(stderr, "Unexpected character: %s at line %d\n", yytext, yylineno); }
