.global GCD

GCD:
cmpq %rsi, %rdi
jl swap # jump if M < N
cont: # make sure M >= N
cmpq $0, %rsi
je done
movq %rdi, %rax
cqto
idivq %rsi
movq %rdx, %rdi
callq GCD
done:
movq %rdi, %rax
ret

swap:
movq %rdi, %r10
movq %rsi, %rdi
movq %r10, %rsi
jmp cont
