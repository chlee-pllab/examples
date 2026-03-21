#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
void s221(int *restrict a, int *restrict b, int *restrict c) {
  for (int i = 0; i < 12000; ++i) {
    c[i] = a[i] + b[i];
  }
}
/*static inline uint64_t read_instret() {
  uint64_t instr;
  asm volatile("rdinstret %0" : "=r"(instr));
  return instr;
}*/
int main() {
  int a[12000], b[12000], c[12000];
  for (int i = 0; i < 12000; ++i) {
    a[i] = i;
    b[i] = 1+2*i;
    c[i] = 0;
  }
  //uint64_t start_instr = read_instret();
  s221(a,b,c);
  printf("Output: %d %d %d %d %d\n", c[0], c[1], c[2], c[3], c[4]);
  //uint64_t end_instr = read_instret();
  //uint64_t instr_count = end_instr - start_instr;
  //printf("Instructions executed: %lu\n", instr_count);
  return 0;
}
