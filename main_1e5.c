#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define BLOCK_SIZE 128
#define size 100000

void add_kernel(void*, void*, void*, int32_t, int32_t);

int main() {
  srand(0);
  //float x[size], y[size], output[size];
  float *x      = malloc(size * sizeof(float));
  float *y      = malloc(size * sizeof(float));
  float *output = malloc(size * sizeof(float));
  if (!x || !y || !output) {
    fprintf(stderr, "malloc failed\n");
    return 1;
  }
  for (int i = 0; i < size; ++i) {
    x[i] = (float)rand() / (float)RAND_MAX;
    y[i] = (float)rand() / (float)RAND_MAX;
    //x[i] = i;
    //y[i] = 1;
    output[i] = 0;
  }
  int num_blocks = (size + BLOCK_SIZE - 1) / BLOCK_SIZE;
  for (int i = 0; i < num_blocks; ++i) {
    add_kernel(x, y, output, size, i);
  }
  bool correct = true;
  for (int i = 0; i < size; ++i) {
    //printf("  output[%d]=%f, %f\n", i, output[i], x[i] + y[i]);
    if (fabs(output[i] - (x[i] + y[i])) > 1e-4) {
      correct = false;
    }
  }
  printf("Size %d: %s\n", size, correct ? "PASS" : "FAIL");
  return 0;
}
