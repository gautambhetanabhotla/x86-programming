.global ispalindrome

ispalindrome:
	pushq %rbx # rbx is callee saved.
	movq %rdi, %rbx # rdi is l pointer, rbx is r pointer
	movq $0, %rcx # setting to 0 because we will only be using the least significant byte of rcx and rdx and we dont want garbage values in them.
	movq $0, %rdx
	addq %rsi, %rbx # setting rbx to rdi+n-1
	subq $1, %rbx # rbx is now the end pointer
	doing:
	cmpq %rdi, %rbx
	jl yes # if the r pointer is less than the l pointer, the string passed all checks and is a palindrome.
	movb (%rbx), %cl # moving the characters in the string to temporary registers.
	movb (%rdi), %dl
	cmpq %rdx, %rcx
	jnz no # if *(arr + i) and *(arr + n - 1 - i) aren't equal at any point, the string is not a palindrome.
	addq $1, %rdi # increment l pointer
	subq $1, %rbx # decrement r pointer
	jmp doing
	yes:
	movq $1, %rax # return 1 if string is palindrome
	popq %rbx
	ret
	no:
	movq $0, %rax # return 0 if it is not
	popq %rbx
	ret
