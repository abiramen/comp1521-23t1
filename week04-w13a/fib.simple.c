// A simple, recursive, non-memoized fibonacci implementation.
// Abiram Nadarajah, October 2021
#include <stdio.h>

int fib(int n) {
    // Prefix label names with the name of the function
    // Introduce a retval variable if your function returns in more than one place
    int retval;

    if (n >= 2) goto fib__n_ge_2;
    retval = n;
    goto fib__epi;

fib__n_ge_2:
    retval = fib(n - 1) + fib(n - 2);

fib__epi:
    return retval;
}

int main(void) {
    printf("Enter a number: ");
    int n;
    scanf("%d", &n);

    printf("Fibonacci of ");
    printf("%d", n);
    printf(" is ");
    printf("%d", fib(n));
    putchar('\n');


    return 0;
}
