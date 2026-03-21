#define ID int
void s221(ID *restrict a, ID *restrict b, ID *restrict c, ID *restrict d, ID *restrict e) {
  for (int i = 0; i < 12000; ++i) {
    e[i] = a[i] + b[i] + c[i] + d[i] + e[i];
  }
}
