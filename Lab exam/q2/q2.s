.global ans

ans:
movq $0, %rax
start:
cmpq $0, %rdi
je end
movq %rdi, %rsi
andq $1, %rsi
addq %rsi, %rax
shrq $1, %rdi # CHECK, arithmetic or logical shift?
jmp start
end:
andq $1, %rax
ret
