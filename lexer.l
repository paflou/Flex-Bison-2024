%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "parser.tab.h"

    char str_buf[256];
    void yyerror(const char* err);
    int lineno = 1;             
%}

%option yylineno
%option noyywrap

%x STRING
%x SINGLE_LINE_COMMENT
%x MULTI_LINE_COMMENT

ID          [A-Za-z_][A-Za-z0-9_]*
ICONST      -?[0-9]+
DCONST      -?[0-9]+(\.[0-9]+)?d
CCONST      '\\.'|'[^'\\]''
BCONST      TRUE|FALSE

%%

"char"                  { printf("\nKEYWORD -> char\n"); return CHAR; }
"int"                   { printf("\nKEYWORD -> int\n"); return INT; }
"double"                { printf("\nKEYWORD -> double\n"); return DOUBLE; }
"boolean"               { printf("\nKEYWORD -> boolean\n"); return BOOLEAN; }
"void"                  { printf("\nKEYWORD -> void\n"); return VOID; }
"if"                    { printf("\nKEYWORD -> if\n"); return IF; }
"else"                  { printf("\nKEYWORD -> else\n"); return ELSE; }
"while"                 { printf("\nKEYWORD -> while\n"); return WHILE; }
"return"                { printf("\nKEYWORD -> return\n"); return RETURN; }
"main"                  { printf("\nKEYWORD -> main\n"); return MAIN; }


{ID}                    { printf("\nID -> %s\n", yytext); /*yylval.strval = strdup(yytext);*/ return ID; }
{ICONST}                { printf("\nICONST -> %s\n", yytext); /*yylval.intval =strdup(yytext);*/ return ICONST; }
{DCONST}                { printf("\nDCONST -> %s\n", yytext); /*yylval.doubleval =strdup(yytext);*/ return DCONST; }
{CCONST}                { printf("\nCCONST -> %s\n", yytext); /*yylval.charval =strdup(yytext);*/ return CCONST; }
{BCONST}                { printf("\nBCONST -> %s\n", yytext); /*yylval.boolval =strdup(yytext);*/ return BCONST; }

"||"                    { printf("\nOROP\n"); return OROP; }
"&&"                    { printf("\nANDOP\n"); return ANDOP; }
"=="|"!="               { printf("\nEQUOP -> %s\n", yytext); return EQUOP; }
">"|">="|"<"|"<="       { printf("\nRELOP -> %s\n", yytext); return RELOP; }
"+"|"-"                 { printf("\nADDOP -> %s\n", yytext); return ADDOP; }
"*"|"/"|"%"             { printf("\nMULOP -> %s\n", yytext); return MULOP; }
"!"                     { printf("\nNOTOP\n"); return NOTOP; }
"++"|"--"               { printf("\nINCDEC -> %s\n", yytext); return INCDEC; }

"("                     { printf("\nLPAREN\n"); return LPAREN; }
")"                     { printf("\nRPAREN\n"); return RPAREN; }
";"                     { printf("\nSEMI\n"); return SEMI; }
","                     { printf("\nCOMMA\n"); return COMMA; }
"="                     { printf("\nASSIGN\n"); return ASSIGN; }
"["                     { printf("\nLBRACK\n"); return LBRACK; }
"]"                     { printf("\nRBRACK\n"); return RBRACK; }
"&"                     { printf("\nREFER\n"); return REFER; }
"{"                     { printf("\nLBRACE\n"); return LBRACE; }
"}"                     { printf("\nRBRACE\n"); return RBRACE; }
"\""[^\"]*"\""          { yylval.strval = strdup(yytext); return STRING_LITERAL; }
[ \t\n]     ;

<<EOF>>                 { printf("\nEOF\n"); return T_EOF; }
.                       { printf("\nUnrecognised character at line %d!\n", yylineno); }

%%