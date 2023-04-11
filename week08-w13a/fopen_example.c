#include <stdio.h>
#include <errno.h>

int main(void) {
    FILE *stream = fopen("askdlfjljksdfjlk", "r");

    if (stream == NULL) {
        perror("askdlfjljksdfjlk");
    }

    return 0;
}
