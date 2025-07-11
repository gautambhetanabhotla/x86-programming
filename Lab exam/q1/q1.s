.global result

result:
cmpq $1, %rdx
je sum
cmpq $2, %rdx
je sub
cmpq $3, %rdx
je div
cmpq $4, %rdx
je expo
cmpq $5, %rdx
je mod
done:
ret

sum:
movq %rdi, %rax
addq %rsi, %rax
jmp done

sub:
movq %rdi, %rax
subq %rsi, %rax
jmp done

div:
movq %rdi, %rax
cqto
idivq %rsi
jmp done

expo:
movq $1, %rax
loop:
testq %rsi, %rsi
je done
imulq %rdi, %rax
subq $1, %rsi
jmp loop

mod:
movq %rdi, %rax
cqto
idivq %rsi
movq %rdx, %rax
jmp done
