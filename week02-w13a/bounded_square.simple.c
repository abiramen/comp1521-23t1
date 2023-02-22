#include <stdio.h>

int main(void) {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 46340) goto x_le_46340;
    printf("square too big for 32 bits\n");
    goto main__epi;


x_le_46340:
    y = x * x;
    printf("%d", y);
    putchar('\n');

main__epi:
    return 0;
}
