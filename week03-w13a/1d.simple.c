#include <stdio.h>
#define N_ELEMENTS 5

int main(void) {
    char array[N_ELEMENTS] = {'h', 'e', 'l', 'l', 'o'};

print_loop__init:;
    int i = 0;
print_loop__cond:
    if (i >= N_ELEMENTS) goto print_loop__end;
print_loop__body:
    putchar(array[i]);      // *(array + i)
    putchar('\n');
print_loop__step:
    i++;
    goto print_loop__cond;
print_loop__end:
    return 0;
}


// What if we had
// int array[N_ELEMENTS] = {3, 1, 4, 1, 5};

