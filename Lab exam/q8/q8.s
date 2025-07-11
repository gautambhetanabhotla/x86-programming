.global wavesort

wavesort:
pushq %rbp
movq %rsp, %rbp
pushq %rdi
pushq %rsi
call rbubblesort
popq %rsi
popq %rdi
shrq $1, %rsi # N = floor(N/2)
loop2:
testq %rsi, %rsi
jz done2
movq (%rdi), %r8
movq 8(%rdi), %r9
movq %r8, 8(%rdi)
movq %r9, (%rdi)
addq $16, %rdi
subq $1, %rsi
jmp loop2
done2:
popq %rbp
ret

bubblesort:
pushq %r8
pushq %r9
pushq %r10
movq %rsi, %r10
.pass:
subq $1, %r10
testq %r10, %r10
jz done
movq %rdi, %rdx
movq %rsi, %rcx # arr = rdx, N = rcx
subq $1, %rcx
	.loop1:
	testq %rcx, %rcx
	jz .pass
	movq (%rdx), %r8
	movq 8(%rdx), %r9
	cmpq %r8, %r9
	jge .cont
	movq %r8, 8(%rdx)
	movq %r9, (%rdx)
	.cont:
	addq $8, %rdx
	subq $1, %rcx
	jmp .loop1
done:
popq %r8
popq %r9
popq %r10
ret

rbubblesort:
pushq %rbp
movq %rsp, %rbp
testq %rsi, %rsi
jz .rbase
pushq %rdi
pushq %rsi
movq $0, %r10 # flag to detect if a swap took place
.rpass:
subq $1, %rsi
testq %rsi, %rsi
jz .rdone
movq (%rdi), %r8
movq 8(%rdi), %r9
cmpq %r8, %r9
jge .noswap
movq $1, %r10
movq %r8, 8(%rdi)
movq %r9, (%rdi)
.noswap:
addq $8, %rdi
jmp .rpass
.rdone:
popq %rsi
popq %rdi
decq %rsi
testq %r10, %r10
jz .rbase
call rbubblesort
.rbase:
popq %rbp
ret
