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
        PUBLIC CLASS CLASS_NAME LCURLY declarations method_declaration RCURLY {printf("success");}

declarations:
            | declarations object_creation
            | declarations variable_declaration
        
variable_declaration: 
                    modifier DATATYPE IDENT SEMICOLON        {printf("alright");}

object_creation:
                    modifier CLASS_NAME IDENT EQUALS NEW CLASS_NAME LPAR RPAR SEMICOLON     {printf("object");}


modifier:
        | PUBLIC
        | PRIVATE

return_type:
                     VOID
                    | CLASS_NAME


secondary_modifier:
                        | secondary_modifier STATIC
                        | secondary_modifier ABSTRACT
                        | secondary_modifier FINAL
                        | secondary_modifier NATIVE
                        | secondary_modifier SYNCHRONIZED


method_declaration:
                    | method_declaration modifier secondary_modifier return_type IDENT LPAR parameter_list RPAR LCURLY declarations RCURLY
                    | method_declaration modifier secondary_modifier DATATYPE IDENT LPAR parameter_list RPAR LCURLY declarations RCURLY 

parameter_list:
                | DATATYPE IDENT
                | parameter_list COMMA DATATYPE IDENT

%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}