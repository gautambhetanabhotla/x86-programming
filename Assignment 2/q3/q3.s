.global evaluatePostfix

# this function will return 0 if the input string length is 0.

evaluatePostfix:
	pushq %rbx
	movq $0, %rax
	testq %rsi, %rsi
	jz done
	movq $0, %rcx
	addq $1, %rdi # skipping the first line feed character
	movb (%rdi), %cl
	movzbq %cl, %rax
	subq $48, %rax # stores first int value in expression
	addq $1, %rdi
	subq $1, %rsi
	notdone:
		testq %rsi, %rsi
		jz done
		subq $1, %rsi
		movb (%rdi), %cl
		addq $1, %rdi
		cmpb $32, %cl
		je notdone # ignore if the character is a space
		cmpb $42, %cl
		je mult
		cmpb $43, %cl
		je add
		cmpb $45, %cl
		je sub
		cmpb $47, %cl
		je div
		movzbq %cl, %rbx # if neither a space nor a mathematical operator, then it's a number. Put the number in rbx.
		subq $48, %rbx
		jmp notdone
	mult:
		imulq %rbx, %rax
		jmp notdone
	add:
		addq %rbx, %rax
		jmp notdone
	sub:
		subq %rbx, %rax
		jmp notdone
	div:
		cqto
		idivq %rbx
		jmp notdone
	done:
		popq %rbx
		ret
