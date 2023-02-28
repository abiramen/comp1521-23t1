#include <stdio.h>
#define N_ELEMENTS 5

int main(void) {
    int array[N_ELEMENTS] = {3, 1, 4, 1, 5};

    for (int i = 0; i < N_ELEMENTS; i++) {
        printf("array[%d] lives at %p and has the value %d", i, &array[i], array[i]);
        // array[i] = array + sizeof(element) * i
        putchar('\n');
    }

    return 0;
}


// What if we had
// int array[N_ELEMENTS] = {3, 1, 4, 1, 5};

