#include <stdio.h>
#include <stdint.h>

#define SIX_BIT_MASK 0x3f
 
typedef struct six_bit_groups {
    uint8_t middle_bits;
    uint8_t lower_bits;
} six_bit_groups_t;
 
/* 
For example:
             0000000000000101010
                        00111111
                           3   f


 
middle six bits are 101010
 lower six bits are 110110  
*/
 
// TODO
six_bit_groups_t get_bit_groups(uint32_t value) {

    // six_bit_groups_t *new_struct = malloc(sizeof(six_bit_groups_t));
    // new_struct->lower_bits is the same (*new_struct).lower_bits


    // struct six_bit_groups result;
    // six_bit_groups_t result;
    // result.lower_bits = value & SIX_BIT_MASK;
    // result.middle_bits = (value >> 13) & SIX_BIT_MASK;


    six_bit_groups_t result = {
        .lower_bits = value & SIX_BIT_MASK,
        .middle_bits = (value >> 13) & SIX_BIT_MASK
    };

    return result;

}
 
int main(void) {
    return 0;
}
