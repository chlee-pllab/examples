#define ID int
void s221(ID *restrict a, ID *restrict b, ID *restrict c, ID *restrict d, ID *restrict e) {
  for (int i = 1; i < 12000; i++) {
    a[i] += b[i] * c[i];
    e[i] = e[i - 1] * e[i - 1];
    a[i] -= b[i] * c[i];
  }
}
