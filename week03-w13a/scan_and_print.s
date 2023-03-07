N_ELEMENTS = 10

main:
        
        # TODO: create loop for scanning
	# $t0: int i
	# $t1: temporary result
        
        li      $v0, 5
        syscall
	mul	$t1, $t0, 4		# 4 * i
        sw	$v0, numbers($t1)	# numbers + 4 * i




        # TODO: create loop for printing


        li      $v0, 1
        mul	$t1, $t0, 4
	lw	$a0, numbers($t1)
        syscall
        

        .data
numbers:
	.word	0:N_ELEMENTS
