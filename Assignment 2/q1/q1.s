.global sum

# rdi = arr, rsi = N, rdx = L, rcx = R

sum:
	pushq %rbx
	pushq %rbp
	movq %rsp, %rbp
	movq $0xf000000000000000, %rax # rax = LLONG_MIN
	movq %rsi, %rbx
	imulq $8, %rbx # rbx = 8N
	subq %rbx, %rsp
	subq $8, %rsp # allocate stack space of 8(N + 1) bytes
	movq $0, %r10 # cumulative sum
	movq %r10, (%rsp) # prefix[0] = 0
	movq $0, %r9
	initialiseprefix:
		testq %rsi, %rsi
		jz initialisedprefix
		movq -8(%rdi, %rsi, 8), %rbx # rbx = *(arr + r - 1) = arr[r]
		addq %rbx, %r10
		movq %r10, 8(%rsp, %r9, 8) # *(prefix + r) = cumsum
		subq $1, %rsi
		addq $1, %r9
		jmp initialiseprefix 
	initialisedprefix: # this forms a prefix sum array of the reversed input array, but this problem remains unchanged for the reverse of an array.
		movq %rdx, %r9 # r9 = size
	ltor:
		cmpq %r9, %rcx
		jl end
		# inner loop initialisation:
		movq %rsp, %r8
		shlq $3, %r9
		addq %r9, %r8 # r8 = prefix + size
		shrq $3, %r9
		checksums:
			cmpq %r8, %rbp
			jle endchecksums
			movq (%r8), %r10
			shlq $3, %r9
			subq %r9, %r8
			movq (%r8), %r11 # *(prefix + r - size)
			addq %r9, %r8
			shrq $3, %r9
			subq %r11, %r10 # prefix sum from left to right
			cmpq %r10, %rax
			cmovl %r10, %rax # update max sum
			addq $8, %r8
			jmp checksums
		endchecksums:
			addq $1, %r9
			jmp ltor
	end:
	movq %rbp, %rsp
	popq %rbp
	popq %rbx
	ret
