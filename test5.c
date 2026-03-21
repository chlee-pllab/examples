#define ID int
/*void foo(ID *restrict a, ID *restrict b, ID *restrict c, ID t);
void caller(ID *restrict a, ID *restrict b, ID *restrict c, ID t) {
  for (int i = 0; i < 12000; ++i) {
    a[i] = i;
    b[i] = 1+2*i;
    c[i] = 2;
  }
  foo(a,b,c,t);
}*/
void init(int *restrict u, int v) {
  int *m1 = u;
  *m1 = v;
}
void foo(ID *restrict a, ID *restrict b, ID *restrict c, ID t) {
  int *p, j = 0;
  int k = 1;
  int *q = &j;

  for (int i = 0; i < 12000; ++i) {
    int *r = &c[i];

    if (t) {
      *q = t;
      p = &a[i];
    } else {
      init (q, k);
      //*q = k;
      p = &b[i];
    }

    *r = *p + *q;
  }
  return;
}
