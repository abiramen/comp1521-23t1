main:
	# $t0: int x
	# $t1: int y

	li	$v0, 4			# syscall 4: print_string
	la	$a0, enter_number_msg	#
	syscall				# printf("Enter a number: ");

	li	$v0, 5			# syscall 5: read_int
	syscall				#
	move	$t0, $v0		# scanf("%d", &x);

	ble	$t0, 46340, x_le_46340	# if (x <= 46340) goto x_le_46340;

	li	$v0, 4			# syscall 4: print_string
	la	$a0, too_big_msg	#
	syscall				# printf("square too big for 32 bits\n");

	b 	main__epi		# goto main__epi;

x_le_46340:
	


	.data
enter_number_msg:
	.asciiz "Enter a number: "
too_big_msg:
	.asciiz "square too big for 32 bits\n"
