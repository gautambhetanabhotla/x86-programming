.global answer

# Procedure:
# Get current value.
# Get changes, push them.
# Push zeroes as required.
# Add change to rax, move to output array.

answer:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
	movq $0, %r8 # l pointer
	movq %rdi, %r9
	decq %r9 # r pointer
.getvalues:
	cmpq %r8, %r9
	jl .gotvalues
	movq (%rsi, %r8, 8), %r10
	testq %r10, %r10
	jz .Z
	jnz .NZ
	.cont:
		incq %r8
		jmp .getvalues
	.Z:
		addq %r8, %rax
		jmp .cont
	.NZ:
		pushq %rdi
		subq %r8, %rdi
		decq %rdi
		addq %rdi, %rax
		popq %rdi
		jmp .cont
.gotvalues:
movq $0, %r8
	.setvalues:
	cmpq %r8, %r9
	jle .setEDvalues
	movq (%rsi, %r8, 8), %r10
	testq %r10, %r10
	jnz .NZ2
	movq %rdi, %r10
	subq %r8, %r10
	subq %r8, %r10
	decq %r10
	pushq %r10
	.NZ2:
	movq (%rsi, %r9, 8), %r10
	testq %r10, %r10
	jz .Z2
	movq %rdi, %r10
	subq %r9, %r10
	subq %r9, %r10
	decq %r10
	negq %r10
	pushq %r10
	.Z2:
	incq %r8
	decq %r9
	jmp .setvalues
.setEDvalues:
movq %rbp, %r10
subq %rsp, %r10
shrq $3, %r10 # (rbp - rsp)/8 is the number of elements pushed already
negq %r10
addq %rdi, %r10 # push n - (number of elements already pushed) zeroes
movq $0, %r11
	.push0s:
	testq %r10, %r10
	jz .pushed0s
	pushq %r11
	decq %r10
	jmp .push0s
	.pushed0s:
	movq %rbp, %r11
	subq $8, %r11
	movq %rdx, %rcx
.pushvalues:
cmpq %r11, %rsp
jg .done
addq (%r11), %rax
movq %rax, (%rcx)
addq $8, %rcx
subq $8, %r11
jmp .pushvalues
.done:
movq %rbp, %rsp
popq %rbp
ret
