.global ncr

ncr:
	pushq %rdi # n
	pushq %rsi # r
	pushq %rbx
	cmpq %rdi, %rsi
	je base
	jg invalid
	cmpq $0, %rsi
	je base
	subq $1, %rdi
	call ncr # (n-1)C(r)
	movq %rax, %rbx # make rbx store (n-1)C(r)
	subq $1, %rsi
	call ncr # (n-1)C(r-1) will be in rax
	addq %rbx, %rax # nCr = (n-1)C(r) + (n-1)C(r-1), return nCr
	popq %rbx
	popq %rsi
	popq %rdi
	ret
	base: # base case of recursion, either when n = r or r = 0. 1 should be returned in both cases.
		movq $1, %rax
		popq %rbx
		popq %rsi
		popq %rdi
		ret
	invalid:
		movq $0, %rax
		popq %rbx
		popq %rsi
		popq %rdi
		ret
