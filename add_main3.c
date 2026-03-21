#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <stdbool.h>
#include <math.h>

int BLOCK_SIZE = 128;

typedef void (*kernel_func_t)(void*, void*, void*, int32_t, int32_t);

void add(int size, kernel_func_t kernel, float *restrict x, float *restrict y, float *restrict output) {
  int n_elements = size;

  int num_blocks = (n_elements + BLOCK_SIZE - 1) / BLOCK_SIZE;

  for (int i = 0; i < num_blocks; ++i) {
    kernel(x, y, output, n_elements, i);
  }

  bool correct = true;
  for (int i = 0; i < n_elements; ++i) {
    printf("  output[%d]=%f, %f\n", i, output[i], x[i] + y[i]);
    if (fabs(output[i] - (x[i] + y[i])) > 1e-9) {
      correct = false;
      printf("  Chunk [%d:%d] failed\n", (i/BLOCK_SIZE)*BLOCK_SIZE, (i/BLOCK_SIZE+1)*BLOCK_SIZE);
    }
  }
  printf("Size %d: %s\n", size, correct ? "PASS" : "FAIL");
}
int main() {
  void* lib_handle = dlopen("./libadd_kernel.so", RTLD_LAZY);
  if (!lib_handle) {
    fprintf(stderr, "Failed to load library: %s\n", dlerror());
    return 1;
  }

  kernel_func_t kernel = (kernel_func_t)dlsym(lib_handle, "add_kernel");
  if (!kernel) {
    fprintf(stderr, "Failed to find function: %s\n", dlerror());
    dlclose(lib_handle);
    return 1;
  }
    
  srand(0);
  int size = 1100;
  float x[1200], y[1200], output[1200];
  for (int i = 0; i < size; i++) {
    x[i] = i;
    y[i] = 1;
    output[i] = 0.0;
  }
  add(size, kernel, x, y, output);
  printf("Output: %f %f %f %f %f\n", output[0], output[1], output[2], output[3], output[4]);
  dlclose(lib_handle);
  return 0;
}
