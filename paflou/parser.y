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

class: 
        PUBLIC CLASS CLASS_NAME LCURLY variable_declaration method_declaration RCURLY {printf("success");}

variable_declaration: 
                    | variable_declaration DATATYPE IDENT SEMICOLON                {printf("alright");}
                    | variable_declaration PRIVATE DATATYPE IDENT SEMICOLON        {printf("alright");}
                    | variable_declaration PUBLIC DATATYPE IDENT SEMICOLON         {printf("alright");}
                    | variable_declaration object_creation                         {printf("alright");}

modifier:
         PUBLIC
        | PRIVATE

secondary_modifier:
                     DATATYPE
                    | VOID

object_creation:
                 modifier CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON     {printf("object");}
                 CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON              {printf("object");}


object_access:
                    IDENT DOT IDENT  {printf("access");}

method_declaration:
                    modifier secondary_modifier IDENT LPAR parameter_list RPAR LCURLY variable_declaration commands RCURLY

parameter_list:
                | DATATYPE IDENT
                | parameter_list ',' DATATYPE IDENT

commands:
        | commands assignment
        | commands loop
        | commands control
        | commands print
        | commands return
        | commands break

assignment:
            IDENT

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}