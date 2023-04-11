#include <stdio.h>
#include <stdint.h>
 
typedef struct six_bit_groups {
    uint8_t middle_bits;
    uint8_t lower_bits;
} six_bit_groups_t;
 
/* 
For example:
                0000000000000101010
                             111111 <- mask
                              3   f

 
middle six bits are 101010
 lower six bits are 110110  
*/
 
// TODO
six_bit_groups_t get_bit_groups(uint32_t value) {
    // uint32_t six_bit_mask = 0x3f;       // 0b111111

    six_bit_groups_t result = {
        .lower_bits = value & 0x3f,
        .middle_bits = (value >> 13) & 0x3f
    };
    // result.lower_bits = value & six_bit_mask;
    // result.middle_bits = (value >> 13) & six_bit_mask;

    return result;
}
 
int main(void) {
    return 0;
}
