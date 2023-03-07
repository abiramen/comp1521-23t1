#include <stdio.h>

int main(void) {
    int i;
    int numbers[10] = {0,1,2,3,4,5,6,7,8,9};

    i = 0;
    while (i < 5) {
        int x = numbers[i];         // $t0
        int y = numbers[9 - i];     // $t1
        numbers[i] = y;             // $t1 stored to ram
        numbers[9 - i] = x;         // $t0 stored to ram
        i++;
    }
}
