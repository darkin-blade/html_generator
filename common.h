#include <assert.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define COMMON_H

#define RED(format, ...) \
  printf("\033[1;31m[%s,%d]" format "\33[0m\n", __FILE__, __LINE__, ## __VA_ARGS__)
#define GREEN(format, ...) \
  printf("\033[1;32m[%s,%d]" format "\33[0m\n", __FILE__, __LINE__, ## __VA_ARGS__)
#define CYAN(format, ...) \
  assert(1)
  // printf("\033[1;36m[%s,%d]" format "\33[0m\n", __FILE__, __LINE__, ## __VA_ARGS__)

struct tmp_node {
  ;
};

void save_last(const char *text);

extern int yytext_last;
