.global sum

# rax - for result
# rbx - for storing integer from string
# r8 and r9 - addition

sum:
	pushq %rbx
	movq $0, %rbx
	movq $0, %rax
	pushq %rbp
	movq %rsp, %rbp
	addq $1, %rdi # first character is a line feed
	subq $1, %rsi
	scanc:
		testq %rsi, %rsi
		jz donescanc
		movb (%rdi), %bl
		addq $1, %rdi
		subq $1, %rsi
		cmpb $32, %bl
		je scanc
		cmpb $67, %bl
		je remove
		cmpb $68, %bl
		je double
		cmpb $43, %bl
		je add2
		subq $48, %rbx
		pushq %rbx
		jmp scanc
	remove:
		popq %r10 # dump the value
		jmp scanc
	double:
		popq %rbx
		pushq %rbx
		imulq $2, %rbx
		pushq %rbx
		jmp scanc
	add2:
		popq %r8
		popq %r9
		pushq %r9
		pushq %r8
		addq %r9, %r8
		pushq %r8
		jmp scanc
	donescanc:
		cmpq %rbp, %rsp
		je done
		popq %rbx
		addq %rbx, %rax
		jmp donescanc
	done:
		popq %rbp
		popq %rbx
		ret
