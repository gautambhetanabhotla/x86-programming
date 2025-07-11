.global lonelynum

# the answer will just be the XOR of every element in the array.

lonelynum:
	movq $0, %rax # initialising rax to 0, because 0 is the identity for XOR
	notdone:
	testq %rsi, %rsi # loop counter
	jz done
	subq $1, %rsi # decrement loop counter
	xorq (%rdi), %rax # xor with answer
	addq $8, %rdi # go to next element in the array
	jmp notdone
	done:
	ret

.section .note.GNU-stack,"",@progbits
