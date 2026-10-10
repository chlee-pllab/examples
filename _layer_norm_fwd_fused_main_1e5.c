#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define eps 1e-5f
#define M 4096
#define N 5120

void _layer_norm_fwd_fused(void*, void*, void*, void*, void*, void*, int32_t, int32_t, float, int32_t);

int main() {
  srand(0);
  int total_size = M * N;
  float *input = malloc(total_size * sizeof(float));
  float *output = malloc(total_size * sizeof(float));
  float *weight = malloc(N * sizeof(float));
  float *bias = malloc(N * sizeof(float));
  float *mean = malloc(M * sizeof(float));
  float *rstd = malloc(M * sizeof(float));
  if (!input || !output || !weight || !bias || !mean || !rstd) {
    fprintf(stderr, "malloc failed\n");
    return 1;
  }
  for (int i = 0; i < total_size; ++i) {
    input[i] = -2.3 + 0.5 * (float)rand() / (float)RAND_MAX;
    output[i] = 0;
  }
  for (int i = 0; i < N; ++i) {
    weight[i] = (float)rand() / (float)RAND_MAX;
    bias[i] = (float)rand() / (float)RAND_MAX;
  }
  for (int i = 0; i < M; ++i) {
    mean[i] = 0;
    rstd[i] = 0;
  }
  for (int row = 0; row < M; ++row) {
    _layer_norm_fwd_fused(input, output, weight, bias, mean, rstd, N, N, eps, row);
  }
  /*bool correct = true;
  for (int row = 0; row < M && correct; row++) {
    float* y_row = output + row * N;
    float mean_y = 0.0f;
    for (int col = 0; col < N; col++) {
      mean_y += y_row[col];
    }
    mean_y /= N;
    float var_y = 0.0f;
    for (int col = 0; col < N; col++) {
      float diff = y_row[col] - mean_y;
      var_y += diff * diff;
    }
    var_y /= N;
    float std_y = sqrtf(var_y);
    if (fabs(mean_y - 0.5) > 1e-2 || fabs(std_y - 0.6455) > 1e-2) {
      printf("Row %d: mean=%f (expected ~0), std=%f (expected ~1)\n",
             row, mean_y, std_y);
      correct = false;
    }
  }
  printf("\nLayer norm test: %s\n", correct ? "PASS" : "FAIL");
  printf("\nFirst row outputs (first 5 columns):\n");
  for (int j = 0; j < (N < 5 ? N : 5); j++) {
      printf("output[%d] = %f\n", j, output[j]);
  }*/
  return 0;
}
