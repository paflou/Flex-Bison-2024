%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}
%token DATATYPE
%token NEW RETURN VOID IF ELSE WHILE DO FOR SWITCH CASE DEFAULT BREAK TRUE FALSE PRIVATE

%token INT
%token CHAR
%token BOOL
%token STRING
%token DOUBLE

%token IDENT
%token PUBLIC
%token LPAR
%token RPAR 
%token CLASS
%token CLASS_NAME

%%
program:
        | program class  {printf("class2");}

class: PUBLIC CLASS CLASS_NAME LPAR STRING RPAR {printf("success");};

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}