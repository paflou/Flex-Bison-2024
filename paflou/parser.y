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

%token DATATYPE NEW RETURN VOID IF ELSE WHILE DO FOR SWITCH CASE DEFAULT BREAK TRUE FALSE
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
        | program class  

class: 
          PUBLIC CLASS CLASS_NAME LCURLY variable_declaration_list method_declaration RCURLY 
        | PUBLIC CLASS CLASS_NAME LCURLY RCURLY                                         
        | PUBLIC CLASS CLASS_NAME LCURLY variable_declaration_list RCURLY                    



variable_declaration_list:
          variable_declaration                                 
        | variable_declaration_list variable_declaration       



variable_declaration: 
                     DATATYPE IDENT SEMICOLON             
                    | modifier DATATYPE IDENT SEMICOLON     
                    | CLASS_NAME IDENT SEMICOLON
                    |   modifier CLASS_NAME IDENT SEMICOLON

modifier:
         PUBLIC
        | PRIVATE


object_access:
                    IDENT DOT IDENT 


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
int flag =0;

void yyerror(const char *s) {
    printf("\n\n\nError: %s at line %d\n", s, line_number);
    printf("\nProgram terminated unsuccessfully.\n");
    flag = 1;
}

int main(int argc, char* argv[]) {

    int token; 
    yyin = fopen(argv[1], "r"); 
                                
    if (yyin == NULL) {
        printf("%s: File not found\n", argv[1]);
        return 1;
    }
    
    char ch;
    while ((ch = fgetc(yyin)) != EOF) {
        putchar(ch);
    }

    rewind(yyin);

    yyparse();
    fclose(yyin);

    if(flag==0)
        printf("\n\n\nProgram terminated successfully.\n");
    return 0;
}