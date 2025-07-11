.global sum

sum:
	movq (%rdi), %rcx # min value, initially initialised to the first element
	movq (%rdi), %rdx # max value, initially initialised to the first element
	subq $1, %rsi # loop counter, we will run a loop n-1 times (because the first element of the array has already been counted)
	notdone:
	testq %rsi, %rsi
	jz done
	subq $1, %rsi
	addq $8, %rdi # go to next element in array
	cmpq (%rdi), %rcx
	jg updatemin # if minimum element in array is greater than current element, then update the minimum value.
	cmpq (%rdi), %rdx # if maximum element is lesser than current element, update maximum value.
	jl updatemax
	jmp notdone
	updatemin:
	movq (%rdi), %rcx
	jmp notdone
	updatemax:
	movq (%rdi), %rdx
	jmp notdone
	done:
	movq %rdx, %rax # add minimum and maximum values and return
	addq %rcx, %rax
	ret
