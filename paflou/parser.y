%{
    #include <stdbool.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdbool.h>

    extern FILE *yyin;
    int yyparse();


    extern int yylex();
    extern int line_number;
    extern void yyerror(const char* err);
%}

%define parse.error verbose

%token DATATYPE NEW RETURN VOID IF ELSE WHILE DO FOR SWITCH CASE DEFAULT BREAK
%token INT CHAR BOOL STRING DOUBLE PRIVATE PUBLIC STATIC ABSTRACT FINAL NATIVE SYNCHRONIZED OUTPRINT
%left OROP      
%left ANDOP     
%left EQUOP     
%left NOTOP
%left RELOP
%token IDENT LCURLY RCURLY CLASS CLASS_NAME LPAR RPAR COLON DOT SEMICOLON EQUALS
%left PLUS MINUS DIV TIMES
%token COMMA

%%


program:                 
        class_list

class_list:
            class_list class
            | class


class: 
           PUBLIC CLASS CLASS_NAME LCURLY class_body RCURLY

class_body:
        | variable_declaration_list methods
        | variable_declaration_list 
        | methods
        | variable_declaration_list methods class
        | variable_declaration_list class
        | methods class


variable_declaration_list:
          variable_declaration                                 
        | variable_declaration_list variable_declaration       

variable_declaration:
    modifier return_type IDENT SEMICOLON
    | return_type IDENT SEMICOLON

return_type:
    DATATYPE
    | CLASS_NAME
    | VOID;

methods: 
                     method_declaration
                    | methods method_declaration
                    
method_declaration:
    modifier secondary_modifier return_type IDENT LPAR parameter_list RPAR LCURLY method_body RCURLY
    | modifier return_type IDENT LPAR parameter_list RPAR LCURLY method_body RCURLY;
    | modifier IDENT LPAR parameter_list RPAR LCURLY method_body RCURLY;

modifier:
         PUBLIC
        | PRIVATE

method_access:
                    IDENT DOT IDENT 

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
                  NEW CLASS_NAME LPAR RPAR                   


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
                | method_access

addition:
        expression PLUS expression
multiplication:
        expression TIMES expression
division:
        expression DIV expression
subtraction:
        expression MINUS expression

call_method:
                 IDENT LPAR argument_list RPAR
               | IDENT LPAR RPAR

argument_list:
               IDENT                
              | argument_list COMMA literal
              | argument_list COMMA IDENT
              | literal

loop:
                        while
                        |for

while:
                        DO LCURLY variable_declaration_list commands RCURLY WHILE LPAR condition RPAR SEMICOLON
                      | DO LCURLY commands RCURLY WHILE LPAR condition RPAR SEMICOLON


condition:
      expression conop expression
    | expression
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
                        | FOR LPAR exp1 SEMICOLON exp2 SEMICOLON exp3 RPAR LCURLY commands RCURLY                 

//maybe literal?
exp1:
                        DATATYPE IDENT EQUALS expression
                    |   IDENT EQUALS expression

exp2:
                         IDENT conop expression

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
     | IF LPAR condition RPAR LCURLY commands RCURLY elseif else

elseif:
        | elseif ELSE IF LPAR condition RPAR LCURLY variable_declaration_list commands RCURLY
        | elseif ELSE IF LPAR condition RPAR LCURLY commands RCURLY

else:
        | ELSE LCURLY variable_declaration_list commands RCURLY
        | ELSE LCURLY commands RCURLY
                    

switch_statement:
    SWITCH LPAR IDENT RPAR LCURLY case default_opt RCURLY
;

case:
    | case CASE literal COLON variable_declaration_list commands break
    | case CASE literal COLON commands break
;

default_opt:
     DEFAULT COLON variable_declaration_list commands
    | DEFAULT COLON commands
;

print:
                          OUTPRINT LPAR STRING RPAR SEMICOLON
                        | OUTPRINT LPAR STRING list RPAR SEMICOLON 
                        
list:
             COMMA expression
            | list COMMA expression

return:
                        RETURN expression SEMICOLON

break:
                        BREAK SEMICOLON                      


%%
int flag =0;

void yyerror(const char *s) {
    printf("\n\n\nError: %s at line %d\n", s, line_number);
    printf("\nProgram terminated unsuccessfully.\n");
    flag = 1;
}

int main(int argc, char* argv[]) {

    char ch;
    int token; 
    yyin = fopen(argv[1], "r"); 
                                
    if (yyin == NULL) {
        printf("%s: File not found\n", argv[1]);
        return 1;
    }
    
    yyparse();

    if(flag==0) {
        rewind(yyin);

        while ((ch = fgetc(yyin)) != EOF) {
            putchar(ch);
        }
        printf("\n\n\nProgram terminated successfully.\n");
    }
        fclose(yyin);
    return 0;
}