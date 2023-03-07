N_ELEMENTS = 5

main:
	# $t0: int i
	# $t1: temporary value
print_loop__init:
	li	$t0, 0
print_loop__cond:

	bge	$t0, N_ELEMENTS, print_loop__end
print_loop__body:

	li	$v0, 11			# syscall 11: print_cjar
	lb 	$a0, array($t0)		# *(array + i)
	syscall				# putchar(array[i]);

	li	$v0, 11			# syscall 11: print_char
	li	$a0, '\n'		#
	syscall

print_loop__step:
	addi	$t0, $t0, 1		# i++;
	b	print_loop__cond	



print_loop__end:
	li	$v0, 0
	jr	$ra			# return 0;

	.data

array:
	.byte	'h', 'e', 'l', 'l', 'o'
