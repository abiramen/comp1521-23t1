main:






thread_1:
	# start of the critical section
	lw	$t0, global_total
	addi	$t0, $t0, 1
	sw	$t0, global_total
	# end of the critical section




# global_total = 1
# t0           = 1
# t1           = 1




















thread_2:
	# start of the critical section
	lw	$t1, global_total
	addi	$t1, $t1, 1
	sw	$t1, global_total
	# end of the critical section






















	.data
global_total:
	.word	0
