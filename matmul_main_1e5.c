#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

#define BLOCK_SIZE_M 8
#define BLOCK_SIZE_N 32
#define BLOCK_SIZE_K 8
#define M 256
#define N 256
#define K 128

void matmul_kernel(void*, void*, void*, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t);

int main() {
  srand(0);
  size_t a_size = M * K;
  size_t b_size = K * N;
  size_t c_size = M * N;

  float *A = (float*)malloc(a_size * sizeof(float));
  float *B = (float*)malloc(b_size * sizeof(float));
  float *C = (float*)malloc(c_size * sizeof(float));

  if (!A || !B || !C) {
    fprintf(stderr, "malloc failed\n");
    return 1;
  }
    for (int i = 0; i < M; ++i) {
      for (int j = 0; j < K; ++j) {
        A[i * K + j] = (float)rand() / (float)RAND_MAX;
      }
    }
    for (int i = 0; i < K; ++i) {
      for (int j = 0; j < N; ++j) {
        B[i * N + j] = (float)rand() / (float)RAND_MAX;
      }
    }
    for (int i = 0; i < M; ++i) {
      for (int j = 0; j < N; ++j) {
        C[i * M + j] = (float)rand() / (float)RAND_MAX;
      }
    }
    int num_blocks_m = (M + BLOCK_SIZE_M - 1) / BLOCK_SIZE_M;
    int num_blocks_n = (N + BLOCK_SIZE_N - 1) / BLOCK_SIZE_N;

    for (int pid_m = 0; pid_m < num_blocks_m; ++pid_m) {
        for (int pid_n = 0; pid_n < num_blocks_n; ++pid_n) {
            matmul_kernel(
                A, B, C,
                M, N, K,
                K,
                1,
                N,
                1,
                N,
                1,
                pid_m,
                pid_n
            );
        }
    }
  return 0;
}
