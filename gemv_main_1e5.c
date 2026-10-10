#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define BLOCK_SIZE_M 1
#define BLOCK_SIZE_N 128
#define M 512
#define N 1024

void gemv_kernel(void*, void*, void*, int32_t, int32_t, int32_t, int32_t);

int main() {
  srand(0);
  //float weight[M * N], x[N], output[M];
  float *weight = malloc(M * N * sizeof(float));
  float *x      = malloc(N * sizeof(float));
  float *output = malloc(M * sizeof(float));
  if (!weight || !x || !output) {
    fprintf(stderr, "malloc failed\n");
    return 1;
  }
  for (int i = 0; i < M; ++i) {
    for (int j = 0; j < N; ++j) {
      int idx = i * N + j;
      weight[idx] = (float)rand() / (float)RAND_MAX;
    }
  }
  for (int i = 0; i < N; ++i) {
    x[i] = (float)rand() / (float)RAND_MAX;
  }
  for (int i = 0; i < M; ++i) {
    output[i] = 0.0f;
  }
  int num_blocks = (M + BLOCK_SIZE_M - 1) / BLOCK_SIZE_M;
  for (int i = 0; i < num_blocks; ++i) {
    gemv_kernel(output, weight, x, M, N, N, i);
  }
  /*bool correct = true;
  for (int i = 0; i < M; ++i) {
    float acc = 0.0f;
    for (int n = N; n > 0; n -= BLOCK_SIZE_N) {
      int start = (n - BLOCK_SIZE_N > 0) ? (n - BLOCK_SIZE_N) : 0;
      int end = n;
      float chunk_sum = 0.0f;
      for (int j = start; j < end; j++) {
        chunk_sum += weight[i * N + j] * x[j];
      }
      acc += chunk_sum;
    }
    printf("output[%d]=%f %f\n", i, output[i], acc);
    if (fabs(output[i] - acc) > 1e-4) {
      correct = false;
    }
  }
  printf("Size %d %d: %s\n", M, N, correct ? "PASS" : "FAIL");*/
  return 0;
}
