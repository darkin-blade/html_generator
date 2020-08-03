  /* 定义部分 */

%{

#include "syntax.tab.h" /* 增加对syntax的引用 */

#ifndef COMMON_H
#include "common.h"
#endif

%}

%option yylineno

  /* 正则定义 */
delim [ \f\r\t\v]
oct [0-7]
digit [0-9]
hex [a-fA-F0-9]
letter [A-Za-z]

%%

  /* 规则部分 */

(?<=^|\n)"---" {
  /* 分割线 */
  CYAN(yytext);
  // return HR;
}

(?<=^|\n)"```"[\s\S]*?(?<=^|\n)"```" {
  /* 行间代码 */
  CYAN(yytext);
  // return CODE_DISPLAY;
}

"\n"{delim}*"\n" { 
  /* 空行 */
  CYAN(yytext);
}

(?<!\\)"__" {
  /* 下划线 */
  CYAN(yytext);
  // return underline_double;
}

(?<!\\)"\*\*" {
  /* 星号 */
  CYAN(yytext);
  // return star_double;
}

(?<!\\)"``" {
  /* 反引号 */
  CYAN(yytext);
  // return backquote_double;
}

(?<!\\)"_" {
  /* 下划线 */
  CYAN(yytext);
  // return underline;
}

(?<!\\)"\*" {
  /* 星号 */
  CYAN(yytext);
  // return star;
}

(?<!\\)"`" {
  /* 反引号 */
  CYAN(yytext);
  // return backquote;
}

(?<=^|\n)"#"+ { 
  /* 标题 */
  CYAN(yytext);
  // return TITLE;
}

%%

  /* 自定义代码部分 */

