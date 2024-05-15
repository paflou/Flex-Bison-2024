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

%token PUBLIC
%token PRIVATE 
%token CLASS 
%token MAIN
%token INT 
%token CHAR 
%token DOUBLE 
%token BOOLEAN 
%token STRING 
%token NEW 
%token RETURN 
%token VOID 
%token IF 
%token ELSE 
%token WHILE 
%token DO 
%token FOR 
%token SWITCH 
%token CASE 
%token DEFAULT 
%token BREAK 
%token TRUE 
%token FALSE 
%token STRING_LITERAL 
%token INTEGER_LITERAL

%token <strval>     ID        

%token <intval>     ICONST    
%token <doubleval>  DCONST   
%token <charval>    CCONST    
%token <boolval>    BCONST    

%token OROP      
%token ANDOP     
%token EQUOP     
%token RELOP     
%token ADDOP     
%token MULOP     
%token NOTOP     
%token INCDEC    

%token LPAREN    
%token RPAREN    
%token SEMI      
%token COMMA     
%token ASSIGN    
%token LBRACK    
%token RBRACK    
%token REFER     
%token LBRACE    
%token RBRACE   
%token T_EOF   0

%type <strval> program class_declaration_list class_declaration class_body class_member_list class_member variable_declaration type method_declaration parameter_list block statement_list statement assignment_statement method_call_statement return_statement if_statement while_statement do_while_statement for_statement switch_statement case_list case_statement default_case break_statement expression constant

%left COMMA
%right ASSIGN
%left OROP
%left ANDOP
%left EQUOP
%left RELOP
%left ADDOP
%left MULOP
%left NOTOP REFER INCDEC 
%left LPAREN RPAREN LBRACK RBRACK 

%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE 

%start program

%%

program: class_declaration_list
    ;

class_declaration_list: class_declaration
    | class_declaration_list class_declaration
    ;

class_declaration: PUBLIC CLASS ID LBRACE class_body RBRACE
    ;

class_body: class_member_list
    ;

class_member_list: /* Empty */
    | class_member_list class_member
    ;

class_member: variable_declaration
    | method_declaration
    ;

variable_declaration: type ID SEMI
    ;

type: INT
    | CHAR
    | DOUBLE
    | BOOLEAN
    | STRING
    | VOID
    ;

method_declaration: PUBLIC type ID LPAREN parameter_list RPAREN block
    | PUBLIC VOID ID LPAREN parameter_list RPAREN block
    | PRIVATE type ID LPAREN parameter_list RPAREN block
    | PRIVATE VOID ID LPAREN parameter_list RPAREN block
    ;

parameter_list: /* Empty */
    | type ID
    | parameter_list COMMA type ID
    ;

block: LBRACE statement_list RBRACE
    ;

statement_list: /* Empty */
    | statement_list statement
    ;

statement: variable_declaration
    | assignment_statement
    | method_call_statement
    | return_statement
    | if_statement
    | while_statement
    | do_while_statement
    | for_statement
    | switch_statement
    | break_statement
    ;

assignment_statement: ID ASSIGN expression SEMI
    ;

method_call_statement: expression SEMI
    ;

return_statement: RETURN expression SEMI
    | RETURN SEMI
    ;

if_statement: IF LPAREN expression RPAREN block
    | IF LPAREN expression RPAREN block ELSE block
    ;

while_statement: WHILE LPAREN expression RPAREN block
    ;

do_while_statement: DO block WHILE LPAREN expression RPAREN SEMI
    ;

for_statement: FOR LPAREN expression SEMI expression SEMI expression RPAREN block
    ;

switch_statement: SWITCH LPAREN expression RPAREN LBRACE case_list default_case RBRACE
    ;

case_list: /* Empty */
    | case_list case_statement
    ;

case_statement: CASE expression ':' statement_list
    ;

default_case: DEFAULT ':' statement_list
    ;

break_statement: BREAK SEMI
    ;

expression:   INTEGER_LITERAL
            | ID
            | STRING_LITERAL
            | expression ADDOP expression
            | expression MULOP expression
            | expression ANDOP expression
            | expression OROP expression
            | expression EQUOP expression
            | expression NOTOP expression
            | expression RELOP expression
            | NOTOP expression 
            | ADDOP expression 
            | INCDEC type
            | type INCDEC
            | type
            | type ID LPAREN expression RPAREN
            | constant
            | LBRACE expression RBRACE
            | LPAREN expression RPAREN
            ;
constant:     CCONST
            | ICONST
            | DCONST
            | BCONST
            ;

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
