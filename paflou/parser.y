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

%token STATIC
%token ABSTRACT
%token FINAL
%token NATIVE
%token SYNCHRONIZED

%token OUTPRINT

%token IDENT
%token LCURLY
%token RCURLY 
%token CLASS
%token CLASS_NAME

%token LPAR
%token RPAR

%token COLON
%token DOT
%token COMMA
%token SEMICOLON
%token EQUALS
%%
program:                 {printf("class");}
        | program class  {printf("class2");}


class: 
        PUBLIC CLASS CLASS_NAME LCURLY variable_declaration method_declaration RCURLY {printf("success");}

variable_declaration: 
                    | variable_declaration DATATYPE IDENT SEMICOLON                {printf("alright");}
                    | variable_declaration modifier DATATYPE IDENT SEMICOLON        {printf("alright");}
                    | variable_declaration object_creation                         {printf("alright");}


modifier:
         PUBLIC
        | PRIVATE

return_type:
                      DATATYPE
                    | CLASS_NAME
                    | VOID

secondary_modifier:
                        | secondary_modifier STATIC
                        | secondary_modifier ABSTRACT
                        | secondary_modifier FINAL
                        | secondary_modifier NATIVE
                        | secondary_modifier SYNCHRONIZED


object_creation:
                 modifier CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON     {printf("object");}
                 CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON              {printf("object");}

*********************
object_access:
                    IDENT DOT IDENT  {printf("access");}
*********************************************

method_declaration:
                    modifier secondary_modifier IDENT LPAR parameter_list RPAR LCURLY variable_declaration commands RCURLY

parameter_list:
                | DATATYPE IDENT
                | parameter_list COMMA DATATYPE IDENT


method_declaration:
                modifier secondary_modifier return_type IDENT LPAR parameter_list RPAR LCURLY method_body RCURLY

method_body:
                variable_declaration commands


commands:
        | commands assignment
        | commands loop
        | commands control
        | commands print
        | commands return
        | commands break


assignment:
                IDENT EQUALS expression SEMICOLON

literal:
                  INT
                | CHAR
                | STRING
                | BOOL
                | DOUBLE   

expression:
                  literal
                | suntheti_parastash 


suntheti_parastash:
                | suntheti_parastash literal
                | suntheti_parastash IDENT
                | suntheti_parastash LPAR suntheti_parastash RPAR
                | suntheti_parastash call_method
                | suntheti_parastash object_creation
                | suntheti_parastash arithmitiki_parastasi

call_method:
                IDENT DOT IDENT LPAR argument_list RPAR

argument_list:
              | IDENT                 
              | argument_list COMMA IDENT


arithmitiki_parastasi:
                        '+'
                        | '-'
                        | '*'
                        | '/'

instructions:
                        | instructions commands
                        | instructions variable_declaration
                        | instructions object_creation
                        | instructions method_declaration
                    
loop:
                        while
                        |for

while:
                        DO LCURLY instructions RCURLY WHILE LPAR condition RPAR SEMICOLON

condition:
                        con1 con2 con1
con1:
                        IDENT
                        | DATATYPE
con2:
                        '>'
                        | '<'
                        | "=="
                        | "!="  
                        | "&&"
                        | "||"          

for:
                        FOR LPAR exp1 SEMICOLON exp2 SEMICOLON exp3 RPAR LCURLY instructions RCURLY                 
exp1:
                        DATATYPE IDENT EQUALS DATATYPE

exp2:
                        IDENT con2 DATATYPE
exp3:
                        IDENT EQUALS expression


control:
                        if
                        | switch

if:
     IF LPAR condition RPAR LCURLY instructions RCURLY elseif else

elseif:
        | elseif ELSE IF LPAR condition RPAR LCURLY instructions RCURLY

else:
        | ELSE LCURLY instructions RCURLY
                    

switch:
                        SWITCH LPAR expression RPAR  LCURLY case default RCURLY

case:           
                          expression COLON instructions
                        | case expression COLON instructions

default:
                        | COLON instructions

print:
                          OUTPRINT LPAR STRING RPAR SEMICOLON
                        | OUTPRINT LPAR STRING COMMA IDENT RPAR SEMICOLON 
                        
return:
                        RETURN expression SEMICOLON

break:
                        BREAK SEMICOLON                      


%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}