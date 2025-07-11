.global isSpecial

factorial: # recursive function
testq %rdi, %rdi
jz base
pushq %rdi
decq %rdi
call factorial
popq %rdi
imulq %rdi, %rax
ret
base:
movq $1, %rax
ret

isSpecial:
testq %rdi, %rdi
jnz nzN # extra check to check if input is 0, because the current implementation returns true for 0.
movq $0, %rax
ret
nzN:
pushq %rbp
movq %rsp, %rbp
movq $10, %rcx
movq %rdi, %r9
getdigits: # push each digit onto the stack
testq %rdi, %rdi
jz gotdigits
movq %rdi, %rax
cqto
idivq %rcx
movq %rax, %rdi
pushq %rdx
jmp getdigits
gotdigits:
leaq -8(%rbp), %rsi
calculatefactorials:
cmpq %rsp, %rsi
jl sumfactorials
movq (%rsi), %rdi
call factorial
movq %rax, (%rsi)
subq $8, %rsi
jmp calculatefactorials
sumfactorials:
movq $0, %rax
loopf:
cmpq %rsp, %rbp
je done
popq %rcx
addq %rcx, %rax
jmp loopf
done:
movq %r9, %rdi
cmpq %rax, %rdi
je special
movq $0, %rax
popq %rbp
ret
special:
movq $1, %rax
popq %rbp
ret
