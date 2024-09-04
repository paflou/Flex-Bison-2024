%{
    #define __USE_C99_MATH
    #include <stdbool.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdbool.h>

    extern FILE *yyin;
    extern int yylex();
    extern void yyerror(const char* err);
%}

%union {
    int intval;
    float doubleval;
    char charval;
    _Bool boolval;
    char* strval;
}

%define parse.error verbose


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

%left OROP      
%left ANDOP     
%left EQUOP     
%left NOTOP
%left RELOP

%token IDENT
%token LCURLY
%token RCURLY 
%token CLASS
%token CLASS_NAME

%left LPAR
%left RPAR
%token COLON
%token DOT
%left COMMA
%token SEMICOLON
%token EQUALS

%left '+' '-'
%left '*' '/'

%%

program:                 {printf("class");}
        | program class  {printf("class2");}


class: 
        PUBLIC CLASS CLASS_NAME LCURLY variable_declaration method_declaration RCURLY {printf("success");}

variable_declaration: 
                    DATATYPE IDENT SEMICOLON                {printf("alright");}
                    | modifier DATATYPE IDENT SEMICOLON        {printf("alright");}

modifier:
         PUBLIC
        | PRIVATE

return_type:
                      DATATYPE
                    | CLASS_NAME
                    | VOID

secondary_modifier:
                        STATIC
                        | ABSTRACT
                        | FINAL
                        | NATIVE
                        | SYNCHRONIZED


object_creation:
                modifier CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON     {printf("object");}
                | CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON              {printf("object");}


object_access:
                    IDENT DOT IDENT  {printf("access");}

method_declaration:
                    modifier secondary_modifier IDENT LPAR parameter_list RPAR LCURLY variable_declaration commands RCURLY

parameter_list:
                DATATYPE IDENT
                | parameter_list COMMA DATATYPE IDENT

method_body:
                variable_declaration commands


commands:
        | assignment
        | loop
        | control
        | print
        | return
        | break


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
                | IDENT
                | LPAR suntheti_parastash RPAR
                | call_method
                | object_creation
                | arithmitiki_parastasi

call_method:
                IDENT DOT IDENT LPAR argument_list RPAR

argument_list:
              | IDENT                 
              | argument_list COMMA IDENT


arithmitiki_parastasi:
    expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
;

instructions:
                        commands
                        | variable_declaration
                        | object_creation
                        | method_declaration
                    
loop:
                        while
                        |for

while:
                        DO LCURLY instructions RCURLY WHILE LPAR condition RPAR SEMICOLON

condition:
    expression con2 expression
;

con1:
    IDENT
    | literal
;

con2:
    RELOP
    | EQUOP
    | NOTOP  
    | ANDOP
    | OROP
;

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
                        | switch_statement

if:
     IF LPAR condition RPAR LCURLY instructions RCURLY elseif else

elseif:
        | elseif ELSE IF LPAR condition RPAR LCURLY instructions RCURLY

else:
        | ELSE LCURLY instructions RCURLY
                    
switch_statement:
    SWITCH LPAR expression RPAR LCURLY case default_opt RCURLY
;

case:
    expression COLON instructions
;

default_opt:
    /* empty */
    | DEFAULT COLON instructions
;

print:
                          OUTPRINT LPAR STRING RPAR SEMICOLON
                        | OUTPRINT LPAR STRING COMMA IDENT RPAR SEMICOLON 
                        
return:
                        RETURN expression SEMICOLON

break:
                        BREAK SEMICOLON                      


%%

void yyerror(const char *s) {
    printf("Parse error: %s\n", s);
}

int main(int argc, char* argv[]) {

    int token; 
    yyin = fopen(argv[1], "r"); 
                                
    if (yyin == NULL) {
        printf("%s: File not found\n", argv[1]);
        return 1;
    }

    yyparse();
    fclose(yyin);
    return 0;
}