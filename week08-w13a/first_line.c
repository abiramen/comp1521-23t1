// Write a C program, first_line.c, which is given one command-line argument -
// the name of a file - and which prints the first line of that file to stdout.
// If given an incorrect number of arguments, or if there was an error opening
// the file, it should print a suitable error message.
//
// A line may be of any size.

#include <stdio.h>
#include <stdlib.h>

#define MAX_LINE 1024

// ./first_line <filename>
int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Usage: %s <filename>", argv[0]);
        return 1;
    }

    FILE *stream = fopen(argv[1], "r");

    // FILE *stdin
    // FILE *stdout
    // FILE *stderr

    if (stream == NULL) {
        perror(argv[1]);
        return 1;
    }


    int c;
    while ((c = fgetc(stream)) != '\n' && c != EOF) {
        putchar(c);
    }

    putchar('\n');
    
    return 0;
}
