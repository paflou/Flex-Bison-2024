%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}
%token DATATYPE
%token NEW RETURN VOID IF ELSE WHILE DO FOR SWITCH CASE DEFAULT BREAK TRUE FALSE

%token INT
%token CHAR
%token BOOL
%token STRING
%token DOUBLE

%token PRIVATE
%token PUBLIC
--------------
%token STATIC
%token ABSTRACT
%token FINAL
%token NATIVE
%token SYNCHRONIZED

%token OUTPRINT
%token RETURN
%token BREAK
--------------

%token IDENT
%token LCURLY
%token RCURLY 
%token CLASS
%token CLASS_NAME

%token LPAR
%token RPAR

%token DOT
%token SEMICOLON
%token EQUALS
%%
program:                 {printf("class");}
        | program class  {printf("class2");}
--------------
program:
    class+
    ;
-------------

class: 
        PUBLIC CLASS CLASS_NAME LCURLY variable_declaration method_declaration RCURLY {printf("success");}

variable_declaration: 
                    | variable_declaration DATATYPE IDENT SEMICOLON                {printf("alright");}
                    | variable_declaration PRIVATE DATATYPE IDENT SEMICOLON        {printf("alright");}
                    | variable_declaration PUBLIC DATATYPE IDENT SEMICOLON         {printf("alright");}
                    | variable_declaration object_creation                         {printf("alright");}
---------------------
variable_declaration: 
                    | variable_declaration (PRIVATE | PUBLIC)? DATATYPE IDENT SEMICOLON                     {printf("alright");}
                    | variable_declaration object_creation    
---------------------

modifier:
         PUBLIC
        | PRIVATE

secondary_modifier:
                     DATATYPE
                    | VOID
-------------------
secondary_modifier:
                        STATIC
                        | ABSTRACT
                        | FINAL
                        | NATIVE
                        | SYNCHRONIZED
---------------------

object_creation:
                 modifier CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON     {printf("object");}
                 CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON              {printf("object");}
----------------
object_creation:
                 modifier? CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON     {printf("object");}
-----------------


object_access:
                    IDENT DOT IDENT  {printf("access");}



method_declaration:
                    modifier secondary_modifier IDENT LPAR parameter_list RPAR LCURLY variable_declaration commands RCURLY

parameter_list:
                | DATATYPE IDENT
                | parameter_list ',' DATATYPE IDENT
-----------------
return_type:
                type
                | VOID
type:
                DATATYPE
                | CLASS_NAME
parameter_list:
                | DATATYPE IDENT
                | parameter_list ',' DATATYPE IDENT
method_declaration:
                modifier secondary_modifier DATATYPE IDENT LPAR parameter_list RPAR LCURLY method_body RCURLY
method_body:
                variable_declaration* commands
------------


commands:
        | commands assignment
        | commands loop
        | commands control
        | commands print
        | commands return
        | commands break

----------
assignment:
                IDENT EQUALS expression SEMICOLON
expression:
                DATATYPE   
                | suntheti_parastash  
suntheti_parastash:
                suntheti_parastasi arithmitiki_parastasi suntheti_parastasi 
                       | DATATYPE
                       | IDENT
                       | LPAR suntheti_parastasi RPAR 
                       | call_method
                       | object_creation
call_method:
                        IDENT DOT IDENT LPAR IDENT* RPAR
arithmitiki_parastasi:
                        '+'
                        | '-'
                        | '*'
                        | '/'

instructions:
                        commands
                        | variable_declaration
                        | object_creation
                        | method_declaration
loop:
                        loop1
                        |loop2

loop1:
                        DO LCURLY instructions* RCURLY WHILE LPAR condition RPAR SEMICOLON
condition:
                        con1 con2 xon1
con1:
                        IDENT
                        | LETTER
                        | INT
con2:
                        '>'
                        | '<'
                        | '=='
                        | '!='  
                        | '&&'
                        | '||'          

loop2:
                        FOR LPAR exp1 SEMICOLON exp2 SEMICOLON exp3 RPAR LCURLY instructions* RCURLY                 
exp1:
                        DATATYPE IDENT EQUALS INT
exp2:
                        IDENT con2 INT
exp3:
                        IDENT EQUALS IDENT arithmitiki_parastasi INT


control:
                        control1
                        | control2
control1:
                        IF LPAR condition LPAR LCURLY instructions RCURLY (ELSE IF LCURLY instructions RCURLY)*  (ELSE LCURLY instructions RCURLY)?
control2:
                        SWITCH LPAR expression RPAR  LCURLY (CASE expression ':' instructions)* (DEFAULT ':' instructions)?

print:
                        OUTPRINT LPAR STRING ( ',' IDENT)* RPAR SEMICOLON
                        
return:
                        RETURN expression SEMICOLON

break:
                        BREAK SEMICOLON                      

comment:
                        CHAR (LETTER | INT | CHAR)* CHAR
-------------------

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}