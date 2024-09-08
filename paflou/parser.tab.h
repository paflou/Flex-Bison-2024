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
    INT = 271,                     /* INT  */
    CHAR = 272,                    /* CHAR  */
    BOOL = 273,                    /* BOOL  */
    STRING = 274,                  /* STRING  */
    DOUBLE = 275,                  /* DOUBLE  */
    PRIVATE = 276,                 /* PRIVATE  */
    PUBLIC = 277,                  /* PUBLIC  */
    STATIC = 278,                  /* STATIC  */
    ABSTRACT = 279,                /* ABSTRACT  */
    FINAL = 280,                   /* FINAL  */
    NATIVE = 281,                  /* NATIVE  */
    SYNCHRONIZED = 282,            /* SYNCHRONIZED  */
    OUTPRINT = 283,                /* OUTPRINT  */
    OROP = 284,                    /* OROP  */
    ANDOP = 285,                   /* ANDOP  */
    EQUOP = 286,                   /* EQUOP  */
    NOTOP = 287,                   /* NOTOP  */
    RELOP = 288,                   /* RELOP  */
    IDENT = 289,                   /* IDENT  */
    LCURLY = 290,                  /* LCURLY  */
    RCURLY = 291,                  /* RCURLY  */
    CLASS = 292,                   /* CLASS  */
    CLASS_NAME = 293,              /* CLASS_NAME  */
    LPAR = 294,                    /* LPAR  */
    RPAR = 295,                    /* RPAR  */
    COLON = 296,                   /* COLON  */
    DOT = 297,                     /* DOT  */
    SEMICOLON = 298,               /* SEMICOLON  */
    EQUALS = 299,                  /* EQUALS  */
    PLUS = 300,                    /* PLUS  */
    MINUS = 301,                   /* MINUS  */
    DIV = 302,                     /* DIV  */
    TIMES = 303,                   /* TIMES  */
    COMMA = 304                    /* COMMA  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
