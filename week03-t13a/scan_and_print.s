N_ELEMENTS = 10

main:
	# $t0: int i
	# $t1: intermediate value
        
        # TODO: create loop for scanning

read_loop__init:
	li	$t0, 0				# i = 0;

read_loop__cond:
	bge	$t0, N_ELEMENTS, read_loop__end	#
        
        li      $v0, 5				# syscall 5: read_int
        syscall					#
        mul	$t1, $t0, 4			# (4 * i
	add	$t1, $t1, numbers			#  + numbers)
	sw	$v0, ($t1)			# scanf("%d", &numbers[i]);

read_loop__step:
	addi	$t0, $t0, 1			# i++;
	b	read_loop__cond

read_loop__end:



print_loop__init:
	li	$t0, 0			# int i = 0;

print_loop__cond:
	bge	$t0, N_ELEMENTS, print_loop__end

print_loop__body:

	li	$v0, 1			# syscall 1: print_int
	mul	$t1, $t0, 4		# 4 * i
	lw	$a0, numbers($t1)	#
	syscall				# printf("%d", numbers);

	
	li	$v0, 11			# syscall 11: print_char
	li	$a0, ' '		#
	syscall				# putchar(' ');

print_loop__step:
	addi	$t0, $t0, 1		# i++;
	b	print_loop__cond

print_loop__end:

	li	$v0, 0
	jr	$ra			# return 0;
        

        .data
numbers:
	.word	0:N_ELEMENTS
