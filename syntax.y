/* 定义部分 */

%{

#ifndef COMMON_H
#include "common.h"
#endif

%}

/* 将所有可能的类型包括 */
%union {
  struct tmp_node *nPtr;
};

/* 所有未被定义为token的符号被视为非终结符 */
/* 这里定义的词法单元都可以作为Flex源代码里的返回值 */
%token <nPtr> H1 H2 H3 H4 H5 /* 标题 */
%token <nPtr> UL /* 无序列表 */
%token <nPtr> OL /* 有序列表 */
%token <nPtr> LATEX_INLINE LATEX_DISPLAY /* 行内公式, 行间公式 */
%token <nPtr> STRONG /* 强调 */
%token <nPtr> EM /* 隐藏 */
%token <nPtr> TABLE /* 表格 */
%token <nPtr> BLOCKQUOTE /* 引用 */
%token <nPtr> CODE /* 行内代码 */
%token <nPtr> CODE_BLOCK /* 行间代码 */
%token <nPtr> HR /* 分割线 */
/* 非终结符 */
%type <nPtr> Paragraph
%type <nPtr> Img /* 图片 */
%type <nPtr> Link /* 链接 */

%%

/* 规则部分:书写产生式 */

Paragraph
  : H1
  { ; }
  ;

%%

/* 用户函数部分 */

#include "lex.yy.c" /* 为了能够使用Flex中的各种函数 */
