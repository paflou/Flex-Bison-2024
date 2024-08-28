/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    T_EOF = 0,                     /* T_EOF  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PUBLIC = 258,                  /* PUBLIC  */
    PRIVATE = 259,                 /* PRIVATE  */
    CLASS = 260,                   /* CLASS  */
    MAIN = 261,                    /* MAIN  */
    INT = 262,                     /* INT  */
    CHAR = 263,                    /* CHAR  */
    DOUBLE = 264,                  /* DOUBLE  */
    BOOLEAN = 265,                 /* BOOLEAN  */
    STRING = 266,                  /* STRING  */
    NEW = 267,                     /* NEW  */
    RETURN = 268,                  /* RETURN  */
    VOID = 269,                    /* VOID  */
    IF = 270,                      /* IF  */
    ELSE = 271,                    /* ELSE  */
    WHILE = 272,                   /* WHILE  */
    DO = 273,                      /* DO  */
    FOR = 274,                     /* FOR  */
    SWITCH = 275,                  /* SWITCH  */
    CASE = 276,                    /* CASE  */
    DEFAULT = 277,                 /* DEFAULT  */
    BREAK = 278,                   /* BREAK  */
    TRUE = 279,                    /* TRUE  */
    FALSE = 280,                   /* FALSE  */
    STRING_LITERAL = 281,          /* STRING_LITERAL  */
    INTEGER_LITERAL = 282,         /* INTEGER_LITERAL  */
    ID = 283,                      /* ID  */
    ICONST = 284,                  /* ICONST  */
    DCONST = 285,                  /* DCONST  */
    CCONST = 286,                  /* CCONST  */
    BCONST = 287,                  /* BCONST  */
    OROP = 288,                    /* OROP  */
    ANDOP = 289,                   /* ANDOP  */
    EQUOP = 290,                   /* EQUOP  */
    RELOP = 291,                   /* RELOP  */
    ADDOP = 292,                   /* ADDOP  */
    MULOP = 293,                   /* MULOP  */
    NOTOP = 294,                   /* NOTOP  */
    INCDEC = 295,                  /* INCDEC  */
    LPAREN = 296,                  /* LPAREN  */
    RPAREN = 297,                  /* RPAREN  */
    SEMI = 298,                    /* SEMI  */
    COMMA = 299,                   /* COMMA  */
    ASSIGN = 300,                  /* ASSIGN  */
    LBRACK = 301,                  /* LBRACK  */
    RBRACK = 302,                  /* RBRACK  */
    REFER = 303,                   /* REFER  */
    LBRACE = 304,                  /* LBRACE  */
    RBRACE = 305,                  /* RBRACE  */
    LOWER_THAN_ELSE = 306          /* LOWER_THAN_ELSE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "parser.y"

    int intval;
    float doubleval;
    char charval;
    _Bool boolval;
    char* strval;

#line 123 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
