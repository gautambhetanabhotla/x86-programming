.global binarysearch

# rdi = output, rsi = input array, rdx = target
# rcx = l, r8 = r

binarysearch:
	pushq %r9
	movq $1, %r9
	call binarysearchhelper
	popq %r9
	ret

binarysearchhelper:
	start:
		movq $0, %rax
		movq %rcx, %rax
		addq %r8, %rax # using quad word operations because word operations could overflow.
		pushw %dx
		movq $0, %rdx
		movq $2, %r10
		idivq %r10 # rax = l+r/2 = m
		popw %dx
		cmpw %ax, %cx # m = l?
		je endsearch
		movzwq (%rsi, %rax, 2), %r11 # mid element of the array
		cmpw %dx, %r11w
		jl searchright
	searchleft:
		pushq %r8
		movw %ax, %r8w
		addq $1, %r9
		call binarysearchhelper
		popq %r8
		ret
	searchright:
		pushq %rcx
		movw %ax, %cx
		addq $1, %r9
		call binarysearchhelper
		popq %rcx
		ret
	endsearch:
		movzwq 2(%rsi, %rax, 2), %r11 # element after the mid element of the array
		cmpw %dx, %r11w
		je found
		jmp notfound
	found:
		movw %r8w, (%rdi) # index
		movw %r9w, 2(%rdi) # number of iterations
		jmp end
	notfound:
		movw $-1, (%rdi) # index = -1
		movw %r9w, 2(%rdi) # number of iterations
	end:
		ret
