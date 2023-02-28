N_ELEMENTS = 5

main:
	# $t0: int i
	# $t1: intermediate value

print_loop__init:
	li	$t0, 0			# int i = 0;

print_loop__cond:
	bge	$t0, N_ELEMENTS, print_loop__end

print_loop__body:

	

	li	$v0, 11			# syscall 11: print_char
	la	$t1, array		# (array
	add 	$t1, $t1, $t0		#  + i)
	lb 	$a0, ($t1)		#
	syscall				# putchar(*(array + i));

	li	$v0, 11			# syscall 11: print_char
	li	$a0, '\n'		#
	syscall				# putchar('\n');

print_loop__step:
	addi	$t0, $t0, 1		# i++;
	b	print_loop__cond

print_loop__end:

	li	$v0, 0
	jr	$ra			# return 0;

	.data

array:
	.byte	'h', 'e', 'l', 'l', 'o'
