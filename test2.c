#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <riscv_vector.h>
void s221(float *restrict a, float *restrict b, float *restrict c) {
  for (int i = 0; i < 12000; ++i) {
    c[i] = a[i] + b[i];
  }
}
/*int main() {
  int a[12000], b[12000], c[12000];
  for (int i = 0; i < 12000; ++i) {
    a[i] = i;
    b[i] = 1+2*i;
    c[i] = 0;
  }
  //uint64_t start = __builtin_readcyclecounter();
  s221(a,b,c);
  //uint64_t end = __builtin_readcyclecounter();
  //printf("Cycles executed: %lu\n", end - start);
  printf("Output: %d %d %d %d %d\n", c[0], c[1], c[2], c[3], c[4]);
  return 0;
}*/
