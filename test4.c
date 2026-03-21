#define ID int
void s221(ID *restrict a, ID *restrict b, ID *restrict c, ID *restrict d, ID *restrict e, ID *restrict f, ID *restrict g);
void caller(ID *restrict a, ID *restrict b, ID *restrict c, ID *restrict d, ID *restrict e, ID *restrict f, ID *restrict g) {
  for (int i = 0; i < 12000; ++i) {
    a[i] = i;
    b[i] = 1+2*i;
    c[i] = 2;
    d[i] = 3;
  }
  s221(a,b,c,d,e,f,g);
}
void s221(ID *restrict a, ID *restrict b, ID *restrict c, ID *restrict d, ID *restrict e, ID *restrict f, ID *restrict g) {
  for (int i = 1; i < 12000; ++i) {
    int x = a[i-1] + b[i];
    int y = c[i] + d[i]; 
    f[i] = x + y + e[i];
    g[i] = a[i-1] + b[i] + f[i];
  }
}
