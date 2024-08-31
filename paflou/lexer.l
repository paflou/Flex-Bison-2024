%{
#include <stdio.h>
#include "parser.tab.h"
%}

--------------------------
INT             0 | [1-9][0-9]*
---------------------------
LETTER          [a-zA-Z]
IDENT           ({LETTER}|_)({LETTER}|{INT}|_)*
%%

";"         { return SEMICOLON; }
"."         { return DOT; }

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
-------------
"static"    { return STATIC; }
"abstract"  { return ABSTRACT; }
"final"     { return FINAL; }
"native"    { return NATIVE; }
"synchronized"{ return SYNCHRONIZED; }
-------------


[A-Z][a-zA-Z0-9_]*              { return CLASS_NAME; }

"class"                         { return CLASS; }
"{"                             { return LCURLY; }
"}"                             { return RCURLY; }


{INT}                           {return INT;}

\'[a-zA-Z0-9]\'                         { return CHAR; }
\'[!#$%&()*+,\-./:;<=>?@[\]^_`{|}~]\'   { return CHAR; }
\'\\n\'                                  { return CHAR; }
\'\\t\'                                  { return CHAR; }
\'\\r\'                                  { return CHAR; }
\'\\b\'                                  { return CHAR; }
\'\\f\'                                  { return CHAR; }
\'\\\\'                                  { return CHAR; }
\'\\'\'                                  { return CHAR; }


{INT}[.]{INT}[d]                { return DOUBLE; }

"true"                          { return BOOL; }
"false"                         { return BOOL; }

\"(\\.|[^"])*\"                 { return STRING; }


"="                             { return EQUALS; }
"("                             { return LPAR; }
")"                             { return RPAR; }

{IDENT}                         {return IDENT;}

---------
"out.print"                     { return OUTPRINT; }
"return"                        { return RETURN; }
"break"                         { return BREAK; }
---------

.                               { /* Ignore other characters */ }
%%
