.global setoutput

# for this problem, if there's more than one '0' in the array, the output array will contain all zeroes. we will keep a flag that tells us if we've encountered a 0 so far in the array and if we encounter a zero when that flag is set, it means we have encountered a second 0.
# logic: split into cases: no zeroes, one zero and 2 or more zeroes. 
# In the last case, all the elements in the output array will be 0. 
# in the second case, all the elements in the output array that do not correspond to 0 will be 0, and the one corresponding to 0 will be the product of the non-zero elements in the array. 
# we can begin by calculating the product of all the non-zero elements in the array, as we will need this for the first case too.

setoutput:
	pushq %rbx # will be used to store input[i] temporarily
	movq %rdx, %r9 # stores copy of n
	movq $1, %rcx # stores product of the non-zero elements
	movq $0, %r8 # stores "zero encountered" flag.
	movq %rdi, %r10 # copy of input base pointer

	notdonei:
	testq %rdx, %rdx
	jz donei
	subq $1, %rdx
	movq (%rdi), %rbx
	testq %rbx, %rbx
	jz test0 # if you encounter 0, see if you have already encountered one before.
	imulq %rbx, %rcx
	addq $8, %rdi
	jmp notdonei

	donei: # at this point, we are done multiplying all the non-zero elements in the array.
	testq %r8, %r8
	jnz one0

	notdoneo: # this is the case of no zeroes in the input array.
	testq %r9, %r9
	jz doneo
	subq $1, %r9
	movq (%r10), %rbx
	movq %rcx, %rax
	cqto
	idivq %rbx # divide the product of all elements by the current element and put that in output[i].
	movq %rax, (%rsi)
	addq $8, %r10
	addq $8, %rsi
	jmp notdoneo

	doneo:
	popq %rbx
	ret

	test0: # check if a zero is already encountered.
	testq %r8, %r8
	jnz all0 # if already encountered, the output array will have all zeroes.
	movq $1, %r8 # zero encountered
	addq $8, %rdi
	jmp notdonei

	all0: # set all elements in output array to 0.
	notdonea0:
	testq %r9, %r9
	jz donea0
	subq $1, %r9
	movq $0, (%rsi)
	addq $8, %rsi
	jmp notdonea0
	donea0:
	popq %rbx
	ret

	one0: # this is the case where one element in the array is 0.
	notdoneo0:
	testq %r9, %r9 # unless for the all zero case, %r9 will contain n only. and in the all zero case, this block of code won't be reached.
	jz doneo0
	subq $1, %r9
	movq (%r10), %rbx
	movq $0, %r11 # otherwise, just push 0
	testq %rbx, %rbx
	cmovz %rcx, %r11 # r11 is a dummy register, if input[i] is 0 then make output[i] the product of all non-zero elements (rcx)
	movq %r11, (%rsi)
	addq $8, %rsi
	addq $8, %r10
	jmp notdoneo0
	
	doneo0:
	popq %rbx
	ret
