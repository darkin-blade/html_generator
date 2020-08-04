  /* 定义部分 */

%{

#include "syntax.tab.h" /* 增加对syntax的引用 */

#ifndef COMMON_H
#include "common.h"
#endif

%}

  /* 状态声明 */

%x escape
%x code_inline_1
%x code_inline_2
%x code_block 
  /* 行间代码 */
%option yylineno

  /* 正则定义 */
delim [ \f\r\t\v]
oct [0-7]
digit [0-9]
hex [a-fA-F0-9]
letter [A-Za-z]

%%

  /* 规则部分 */

"\\" {
  /* 转义符号 */
  BEGIN(escape);
}

<escape>[\s\S] {
  CYAN("%s", yytext);
  BEGIN(0);
}

"---" {
  /* 分割线 */
  if (yytext_last == '\n') {
    CYAN("%s", yytext);
    // return HR;
  } else {
    yymore();
  }
}

"```" {
  /* 行间代码开始 */
  BEGIN(code_block);
}

<code_block>"\n```" {
  /* 行间代码结束 */
  BEGIN(0);
}

<code_block>[\s\S]* {
  /* 行间代码 */
  CYAN("%s", yytext);
}

"\n"{delim}*"\n" { 
  /* 空行 */
  CYAN("%s", yytext);
}

"__" {
  /* 下划线 */
  CYAN("%s", yytext);
  // return underline_double;
}

"\*\*" {
  /* 星号 */
  CYAN("%s", yytext);
  // return star_double;
}

"``" {
  /* 反引号 */
  BEGIN(code_inline_2);
}

<code_inline_2>"``" {
  BEGIN(0);
}

<code_inline_2>[\s\S]* {
  CYAN("%s", yytext);
}

"_" {
  /* 下划线 */
  CYAN("%s", yytext);
  // return underline;
}

"\*" {
  /* 星号 */
  CYAN("%s", yytext);
  // return star;
}

"`" {
  /* 反引号 */
  BEGIN(code_inline_1);
}

"#"+ { 
  /* 标题 */
  if (yytext_last == '\n') {
    CYAN("%s", yytext);
    // return TITLE;
  } else {
    yymore();
  }
}

"\n" {
  yytext_last = '\n';
}

[\s\S] {
  CYAN("%s", yytext);
}

%%

  /* 自定义代码部分 */

int yytext_last = -1;// 初始化

void save_last(const char *text) {
  yytext_last = text[strlen(text) - 1];
}
