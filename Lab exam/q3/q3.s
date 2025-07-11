.global changearray

changearray:
pushq %rbp
movq %rsp, %rbp
pushq %rbx
movq $0, %r10 # current number
movq $15, %rcx
movq $3, %rbx
movq $5, %r8
.loop:
incq %r10
cmpq %r10, %rsi
jl .end
movq %r10, %rax
cqto
idivq %rcx
testq %rdx, %rdx
jz .fifteen
movq %r10, %rax
cqto
idivq %r8
testq %rdx, %rdx
jz .five
movq %r10, %rax
cqto
idivq %rbx
testq %rdx, %rdx
jz .three
jmp .none
.fifteen:
movq $-3, %r11
movq %r11, -8(%rdi, %r10, 8)
jmp .loop
.three:
movq $-1, %r11
movq %r11, -8(%rdi, %r10, 8)
jmp .loop
.five:
movq $-2, %r11
movq %r11, -8(%rdi, %r10, 8)
jmp .loop
.none:
movq %r10, -8(%rdi, %r10, 8)
jmp .loop
.end:
popq %rbx
popq %rbp
ret
