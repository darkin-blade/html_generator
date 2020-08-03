#include <assert.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define COMMON_H

#if defined(DEBUG)
#define RED(format, ...) \
  fprintf(stderr, "\033[1;31m[%s,%d]" format "\33[0m\n", __FILE__, __LINE__, ## __VA_ARGS__)
#define GREEN(format, ...) \
  printf("\033[1;32m[%s,%d]" format "\33[0m\n", __FILE__, __LINE__, ## __VA_ARGS__)
#define CYAN(format, ...) \
  printf("\033[1;36m[%s,%d]" format "\33[0m\n", __FILE__, __LINE__, ## __VA_ARGS__)
#else
#define RED(format, ...) \
  fprintf(stderr, format "\n", ## __VA_ARGS__)
#define GREEN(format, ...) \
  assert(1)
#define CYAN(format, ...) \
  assert(1)
#endif

struct tmp_node {
  ;
};

const int INF = 0xfffffff;
