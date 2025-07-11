.global rotate

rotate:
	movq (%rdi), %r10 # storing first element of the array
	subq $1, %rsi # loop counter, loop will run n-1 times
	notdone:
	testq %rsi, %rsi
	jz done
	subq $1, %rsi
	movq 8(%rdi), %r11 # this line and the next do one thing:
	movq %r11, (%rdi) # copy the next element in the array to the current one.
	addq $8, %rdi
	jmp notdone
	done:
	movq %r10, (%rdi) # the last element in the array is set to the initial first one.
	ret
