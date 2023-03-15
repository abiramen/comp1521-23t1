#include <assert.h>
#include <stdio.h>

// most machines have 32 bit integers
// C standard states this can be anything >= 16 bits
typedef unsigned int Word;

Word reverse_bits(Word value) {
    int N_BITS = sizeof(Word);

    Word result = 0;

    for (int i = 0; i < N_BITS; i++) {
        Word read_mask = 1u << (N_BITS - i - 1);
        Word update_mask = 1u << i;

        if (value & read_mask) {
            // the bit in this position is set to a 1
            result = result | update_mask;
        } else {
            // the bit in this position is set to a 0
            // we don't need this because the bits of 
            // result start off as 0
        }
    }

    return result;
}

int main(void) {
    assert(reverse_bits(0xFFFFFFFF) == 0xFFFFFFFF);
    assert(reverse_bits(0x00000000) == 0x00000000);
    assert(reverse_bits(0x1) == 0x80000000);
    assert(reverse_bits(0x2) == 0x40000000);
    assert(reverse_bits(0x01234567) == 0xE6A2C480);
    printf("All tests passed!\n");
    return 0;
}
