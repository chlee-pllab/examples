void foo(float *restrict a, float *restrict b, float *restrict c) {
  for (int i = 0; i < 12000; ++i) {
    c[i] = a[i] + b[i];
  }
}
