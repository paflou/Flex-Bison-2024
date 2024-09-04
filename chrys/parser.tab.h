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
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    DATATYPE = 258,                /* DATATYPE  */
    NEW = 259,                     /* NEW  */
    RETURN = 260,                  /* RETURN  */
    VOID = 261,                    /* VOID  */
    IF = 262,                      /* IF  */
    ELSE = 263,                    /* ELSE  */
    WHILE = 264,                   /* WHILE  */
    DO = 265,                      /* DO  */
    FOR = 266,                     /* FOR  */
    SWITCH = 267,                  /* SWITCH  */
    CASE = 268,                    /* CASE  */
    DEFAULT = 269,                 /* DEFAULT  */
    BREAK = 270,                   /* BREAK  */
    TRUE = 271,                    /* TRUE  */
    FALSE = 272,                   /* FALSE  */
    INT = 273,                     /* INT  */
    CHAR = 274,                    /* CHAR  */
    BOOL = 275,                    /* BOOL  */
    STRING = 276,                  /* STRING  */
    DOUBLE = 277,                  /* DOUBLE  */
    PRIVATE = 278,                 /* PRIVATE  */
    PUBLIC = 279,                  /* PUBLIC  */
    STATIC = 280,                  /* STATIC  */
    ABSTRACT = 281,                /* ABSTRACT  */
    FINAL = 282,                   /* FINAL  */
    NATIVE = 283,                  /* NATIVE  */
    SYNCHRONIZED = 284,            /* SYNCHRONIZED  */
    OUTPRINT = 285,                /* OUTPRINT  */
    OROP = 286,                    /* OROP  */
    ANDOP = 287,                   /* ANDOP  */
    EQUOP = 288,                   /* EQUOP  */
    NOTOP = 289,                   /* NOTOP  */
    RELOP = 290,                   /* RELOP  */
    IDENT = 291,                   /* IDENT  */
    LCURLY = 292,                  /* LCURLY  */
    RCURLY = 293,                  /* RCURLY  */
    CLASS = 294,                   /* CLASS  */
    CLASS_NAME = 295,              /* CLASS_NAME  */
    LPAR = 296,                    /* LPAR  */
    RPAR = 297,                    /* RPAR  */
    COLON = 298,                   /* COLON  */
    DOT = 299,                     /* DOT  */
    COMMA = 300,                   /* COMMA  */
    SEMICOLON = 301,               /* SEMICOLON  */
    EQUALS = 302                   /* EQUALS  */
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

#line 119 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
