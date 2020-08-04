#ifndef COMMON_H
#include "common.h"
#endif

int main(int argc, char **argv) {
  if (argc <= 1) {
    return 1;
  }

  FILE *md_file = fopen(argv[1], "r");
  yyrestart(md_file);
  yyparse();
  fclose(md_file);

  return 0;
}
