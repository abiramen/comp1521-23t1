# An introduction to functions in MIPS with a recursive fibonacci implementation


main:
	# Args:
	# Returns:	int
	#
	# Stack:	
	# Uses:		
	# Clobbers
	#
	# Locals:
	#
	# Structure:
main__prologue:				
	begin				
	push	$ra			 

main__body:

	li	$v0, 4			# syscall 4: print_string
	la	$a0, enter_number_msg	#
	syscall				# printf("Enter a number: ");

	li	$v0, 5			# syscall 5: read_int
	syscall				#
	move	$t0, $v0		# scanf("%d", &n);

	li	$v0, 4			# syscall 4: print_string
	la	$a0, fib_msg_1		#
	syscall				# printf("Fibonacci of ");

	li	$v0, 1			# syscall 1: print_int
	move	$a0, $t0		#
	syscall				# printf("%d", n);


	li	$v0, 4			# syscall 4: print_string
	la	$a0, fib_msg_2		#
	syscall				# printf(" is ");

	# TODO: call fib and print its result

	li	$v0, 11			# syscall 11: print_char
	li	$a0, '\n'		#
	syscall				# putchar('\n');



main__epi:
	li	$v0, 0

	pop	$ra
	end

	jr	$ra			# return 0;




fib:
	# Args:
	# Returns:	int
	#
	# Stack:	
	# Uses:		
	# Clobbers
	#
	# Locals:
	#
	# Structure:




	.data
enter_number_msg:
	.asciiz	"Enter a number: "
fib_msg_1:
	.asciiz "Fibonacci of "
fib_msg_2:
	.asciiz " is "
