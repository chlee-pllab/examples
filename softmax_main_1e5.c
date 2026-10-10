#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define BLOCK_SIZE 128
#define ROWS 4096
#define COLS 100

void softmax_kernel(void*, void*, int32_t, int32_t, int32_t, int32_t);

int main() {
  srand(0);
  int total_size = ROWS * COLS;
  float *input = malloc(total_size * sizeof(float));
  float *output = malloc(total_size * sizeof(float));
  if (!input || !output) {
    fprintf(stderr, "malloc failed\n");
    return 1;
  }
  for (int i = 0; i < total_size; ++i) {
    input[i] = (float)rand() / (float)RAND_MAX;
    output[i] = 0;
  }
  for (int row = 0; row < ROWS; ++row) {
    softmax_kernel(output, input, COLS, COLS, COLS, row);
  }
  /*bool correct = true;
  for (int i = 0; i < ROWS; ++i) {
    float row_sum = 0;
    for (int j = 0; j < COLS; ++j) {
      row_sum += output[i * COLS + j];
    }
    if (fabs(row_sum - 1.0) > 1e-4) {
      correct = false;
      printf("Row %d sum = %f (should be 1)\n", i, row_sum);
    }
  }
  printf("Softmax %d x %d: %s\n", ROWS, COLS, correct ? "PASS" : "FAIL");
  printf("First row output: ");
  for (int j = 0; j < (COLS < 5 ? COLS : 5); ++j) {
    printf("%f ", output[j]);
  }
  free(input);
  free(output);*/
  return 0;
}
