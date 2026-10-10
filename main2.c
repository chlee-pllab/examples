#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <riscv_vector.h>
#include "foo.h"
int main() {
  float a[12000], b[12000], c[12000];
  for (int i = 0; i < 12000; ++i) {
    a[i] = i;
    b[i] = 1+2*i;
    c[i] = 0;
  }
  foo(a,b,c);
  printf("Output: %f %f %f %f %f\n", c[0], c[1], c[2], c[3], c[4]);
  return 0;
}
