# An introduction to functions in MIPS with a recursive fibonacci implementation


main:
	# Args:		void
	# Returns:	int
	#
	# Stack:	[$ra]	
	# Uses:		[$v0, $a0, $t0] 
	# Clobbers:	[$v0, $a0, $t0]
	#
	# Locals:
	#	- $t0: int n
	#	
	# Structure:
	# - main
	#	-> [prologue]
	#	-> [body]
	#	-> [epilogue]
main__prologue:
	# back up the original value of $ra if we jal to another function
	# back up any $s registers that we want to use
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

	## we communicate information to a function using $a registers
	## we retrieve return values from $v0

	## 

	move	$a0, $t0
	jal	fib			# call fib(n)

	# $s0 is still 17 because other functions are not permanently allowed to modify
	# the value of $s registers
	## when we call a function, we have to assume that it completely
	## OBLITERATES the values of all $t registers

	## we have to assume that function calls also obliterate $a registers



	move	$a0, $v0
	li	$v0, 1			# syscall 1: print_int
	syscall				# printf("%d", fib(n));


	li	$v0, 11			# syscall 11: print_char
	li	$a0, '\n'		#
	syscall				# putchar('\n');

main__epi:
	# we need to restore the original value of the $s registers (if we use any)
	pop	$ra
	end
	# we need to restore the original value of $ra so we dont end up in an infinite loop

	li	$v0, 0
	jr	$ra			# return 0;




fib:
	# Args:
	#	- $a0: int n
	# Returns:	int
	#
	# Stack:	[$ra, $s0, $s1]
	# Uses:		[$v0, $a0, $s0, $s1] 
	# Clobbers:	[$v0, $a0]
	#
	# Locals:
	#	- $s0: int n
	#	- $s1: return value of fib(n - 1)
	#
	# Structure:
	# - fib
	#	-> [prologue]
	#	-> [body]
	#		-> n_ge_2
	#		-> row_loop
	#			-> init
	#			-> cond
	#			-> body
	#			-> step
	#			-> end
	#	-> [epilogue]

	# ...
fib__prologue:
	begin
	push	$ra
	push	$s0
	push	$s1

fib__body:

	move	$s0, $a0

	bge	$a0, 2, fib__n_ge_2

	move	$v0, $a0				# 
	j	fib__epi				# return n;

fib__n_ge_2:
	addi	$a0, $s0, -1			
	jal	fib					# call fib(n - 1)

	move	$s1, $v0				# store the return value of the function cal
	addi	$a0, $s0, -2			
	jal	fib					# call fib(n - 2)

	add	$v0, $v0, $s1				# return fib(n - 1) + fib(n - 2)

fib__epi:
	pop	$s1
	pop	$s0
	pop	$ra
	end
	jr	$ra




	.data
enter_number_msg:
	.asciiz	"Enter a number: "
fib_msg_1:
	.asciiz "Fibonacci of "
fib_msg_2:
	.asciiz " is "
