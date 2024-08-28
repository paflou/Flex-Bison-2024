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
%token LPAR
%token RPAR 
%token CLASS
%token CLASS_NAME

%%
program:                 {printf("class");}
        | program class  {printf("class2");}

class: PUBLIC CLASS CLASS_NAME LPAR variable_declaration RPAR {printf("success");}

variable_declaration: 
                    | variable_declaration DATATYPE IDENT                {printf("alright");}
                    | variable_declaration PRIVATE DATATYPE IDENT        {printf("alright");}
                    | variable_declaration PUBLIC DATATYPE IDENT         {printf("alright");}


%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}