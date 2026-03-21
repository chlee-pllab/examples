#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define BLOCK_SIZE 128
#define size 100000

void add_kernel(void*, void*, void*, int32_t, int32_t);

void add(float *restrict x, float *restrict y, float *restrict output) {
  int num_blocks = (size + BLOCK_SIZE - 1) / BLOCK_SIZE;

  for (int i = 0; i < num_blocks; ++i) {
    add_kernel(x, y, output, size, i);
  }

  bool correct = true;
  for (int i = 0; i < size; ++i) {
    if (fabs(output[i] - (x[i] + y[i])) > 1e-9) {
      correct = false;
    }
  }
  printf("Size %d: %s\n", size, correct ? "PASS" : "FAIL");
}
int main() {
  srand(0);
  float x[size], y[size], output[size];
  for (int i = 0; i < size; ++i) {
    x[i] = (float)rand() / (float)RAND_MAX;
    y[i] = (float)rand() / (float)RAND_MAX;
    output[i] = 0;
  }
  add(x, y, output);
  return 0;
}
