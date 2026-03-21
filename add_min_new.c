#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define BLOCK_SIZE 128
#define size 100000
//#define n_elements 100000
#define n_elements 99968

void add_kernel(void*, void*, void*, int32_t, int32_t);

int main() {
  srand(0);
  float x[size], y[size], output[size];
  for (int i = 0; i < size; ++i) {
    x[i] = (float)rand() / (float)RAND_MAX;
    y[i] = (float)rand() / (float)RAND_MAX;
    //x[i] = i;
    //y[i] = 1;
    output[i] = 0;
  }
  int num_blocks = (size + BLOCK_SIZE - 1) / BLOCK_SIZE;
  for (int i = 0; i < num_blocks; ++i) {
    add_kernel(x, y, output, n_elements, i);
  }
  /*bool correct = true;
  for (int i = 0; i < size; ++i) {
    //if (i < n_elements) {
      //printf("  output[%d]=%f, %f\n", i, x[i] + y[i], output[i]);
      if (fabs(output[i] - (x[i] + y[i])) > 1e-4) {
        correct = false;
      }
    //} else {
      //printf("  output[%d]=%f, %f\n", i, 0.0, output[i]);
    //  if (fabs(output[i]) > 1e-4) {
    //    correct = false;
    //  }
    //}
  }
  printf("Size %d: %s\n", size, correct ? "PASS" : "FAIL");*/
  return 0;
}
