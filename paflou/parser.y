%{
    #define __USE_C99_MATH
    #include <stdbool.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdbool.h>

    extern FILE *yyin;
    extern int yylex();
    extern int line_number;
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

%token LPAR
%token RPAR
%token COLON
%token DOT
%token SEMICOLON
%token EQUALS


%left PLUS
%left MINUS
%left DIV
%left TIMES


%token COMMA


%locations
%%


program:                 {printf("program\n");}
        | program class  {printf("program\n");}

class: 
          PUBLIC CLASS CLASS_NAME LCURLY variable_declaration_list method_declaration RCURLY {printf("class \n");}
        | PUBLIC CLASS CLASS_NAME LCURLY RCURLY                                         {printf("class \n");}
        | PUBLIC CLASS CLASS_NAME LCURLY variable_declaration_list RCURLY                    {printf("class \n");}



variable_declaration_list:
          variable_declaration                                 { printf("variable_declaration_list\n"); }
        | variable_declaration_list variable_declaration       { printf("variable_declaration_list\n"); }



variable_declaration: 
                     DATATYPE IDENT SEMICOLON               { printf("variable_declaration\n"); }
                    | modifier DATATYPE IDENT SEMICOLON     { printf("variable_declaration\n"); }
                    | CLASS_NAME IDENT SEMICOLON
                    |   modifier CLASS_NAME IDENT SEMICOLON

modifier:
         PUBLIC
        | PRIVATE


object_access:
                    IDENT DOT IDENT  {printf("access");}


method_declaration:
                      modifier secondary_modifier return_type IDENT LPAR parameter_list RPAR LCURLY method_body RCURLY

return_type:
                    | DATATYPE
                    | CLASS_NAME
                    | VOID

secondary_modifier:
                        STATIC
                        | ABSTRACT
                        | FINAL
                        | NATIVE
                        | SYNCHRONIZED

parameter_list:
                | DATATYPE IDENT
                | parameter_list COMMA DATATYPE IDENT

method_body:
                variable_declaration_list commands
              | commands 


commands:
        | commands assignment
        | commands loop
        | commands control
        | commands print
        | commands return
        | commands break


assignment:
                 IDENT EQUALS expression SEMICOLON
                |IDENT EQUALS object_creation SEMICOLON

object_creation:
                  NEW CLASS_NAME LPAR RPAR                    { printf("object_creation\n"); }


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
                 addition
                | IDENT
                | multiplication
                | division
                | subtraction
                | LPAR expression RPAR
                | call_method
                | object_access

addition:
        expression PLUS expression
multiplication:
        expression TIMES expression
division:
        expression DIV expression
subtraction:
        expression MINUS expression




call_method:
                 IDENT LPAR arguement_list RPAR
               | IDENT LPAR RPAR

arguement_list:
               IDENT                
              | arguement_list COMMA literal
              | arguement_list COMMA IDENT
              | literal


                    
loop:
                        while
                        |for

while:
                      DO LCURLY variable_declaration_list commands RCURLY WHILE LPAR condition RPAR SEMICOLON

condition:
      expression conop expression
    | expression
;

con1:
    IDENT
    | literal
;

conop:
    RELOP
    | EQUOP
    | NOTOP  
    | ANDOP
    | OROP
;

for:
                        FOR LPAR exp1 SEMICOLON exp2 SEMICOLON exp3 RPAR LCURLY variable_declaration_list commands RCURLY                 
exp1:
                        DATATYPE IDENT EQUALS literal
                    |   IDENT EQUALS literal

exp2:
                        IDENT conop literal
exp3:
                          IDENT PLUS expression
                        | IDENT MINUS expression
                        | IDENT DIV expression
                        | IDENT TIMES expression
                        


control:
                        if
                        | switch_statement

if:
     IF LPAR condition RPAR LCURLY variable_declaration_list commands RCURLY elseif else

elseif:
        | elseif ELSE IF LPAR condition RPAR LCURLY variable_declaration_list commands RCURLY

else:
        | ELSE LCURLY variable_declaration_list commands RCURLY
                    

switch_statement:
    SWITCH LPAR IDENT RPAR LCURLY case default_opt RCURLY
;

case:
    | case CASE literal COLON LCURLY variable_declaration_list commands RCURLY
;

default_opt:
    /* empty */
    | DEFAULT COLON LCURLY variable_declaration_list commands RCURLY
;

print:
                          OUTPRINT LPAR STRING RPAR SEMICOLON
                        | OUTPRINT LPAR STRING ident_list RPAR SEMICOLON 
                        
ident_list:
             COMMA IDENT
            | ident_list COMMA IDENT

return:
                        RETURN expression SEMICOLON

break:
                        BREAK SEMICOLON                      


%%

void yyerror(const char *s) {
    printf("Error: %s at line %d\n", s, line_number);
}

int main(int argc, char* argv[]) {

    //int token; 
    //yyin = fopen(argv[1], "r"); 
                                
    //if (yyin == NULL) {
      //  printf("%s: File not found\n", argv[1]);
     //   return 1;
    //}

    yyparse();
    fclose(yyin);
    return 0;
}