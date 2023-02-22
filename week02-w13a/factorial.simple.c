// non recursively calculate a factorial in C
// Abiram Nadarajah, Feb 2022

#include <stdio.h>

int main(void) {
    int n;
    printf("n  = ");
    scanf("%d", &n);

    int fac = 1;

calc_loop__init:
    int i = 1;
calc_loop__cond:
    if (i > n) goto calc_loop__end;

calc_loop__body:
    fac *= i;
calc_loop__step:
    i++;
    goto calc_loop__cond;

calc_loop__end:

    printf("n! = %d\n", fac);
    return 0;
}
