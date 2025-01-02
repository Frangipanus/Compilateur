	.text
	.globl	main
	movq %rsp, %rbp
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-8, %rsp
	pushq %rsi
	pushq %rdi
	movq $8, %rdi
	call my_malloc
	movq $main, 0(%rax)
	popq %rdi
	popq %rsi
	pushq %rax
	popq %r14
	pushq %rsi
	pushq %rdi
	movq $0, %rdi
	call my_malloc
	movq %rax, %rdi
	movq %r14, %rsi
	call *(%rsi)
	popq %rdi
	popq %rsi
	pushq %rax
	pushq $0
	popq %rax
	pushq %rax
finfonc1:
	popq %rax
	addq $8, %rsp
	popq %rbp
	ret
	movq $0, %rax
	ret
print_int:
	pushq %rbp
	movq %rsp, %rbp
	andq $-16, %rsp
	movq %rdi, %rsi
	movq $.Sprint_int, %rdi
	call printf
	movq %rbp, %rsp
	popq %rbp
	ret
print_bool:
	andq %rdi, %rdi
	jnz ptrue
	pushq %rbp
	movq %rsp, %rbp
	andq $-16, %rsp
	movq $.Sprint_faux, %rdi
	call printf
	movq %rbp, %rsp
	popq %rbp
	ret
ptrue:
	pushq %rbp
	movq %rsp, %rbp
	andq $-16, %rsp
	movq $.Sprint_vrai, %rdi
	movq $0, %rax
	call printf
	movq %rbp, %rsp
	popq %rbp
	ret
head:
	andq %rax, %rax
	jz nothing
	pushq %rsi
	pushq %rdi
	movq 0(%rax), %rax
	pushq %rax
	movq $8, %rdi
	call my_malloc
	popq %rcx
	movq %rcx, 0(%rax)
	popq %rdi
	popq %rsi
	ret
nothing:
	movq $0, %rax
	ret
tail:
	andq %rax, %rax
	jz dommage
	movq 8(%rax), %rax
	ret
dommage:
	movq $0, %rax
	ret
my_malloc:
	pushq %rbp
	movq %rsp, %rbp
	andq $-16, %rsp
	call malloc
	movq %rbp, %rsp
	popq %rbp
	ret
print_string:
	pushq %rbp
	movq %rsp, %rbp
	andq $-16, %rsp
	movq %rdi, %rsi
	movq $.Sprint_string, %rdi
	call printf
	movq %rbp, %rsp
	popq %rbp
	ret
	.data
.Sprint_int:
	.string "%d\n"
.Sprint_vrai:
	.string "True\n"
.Sprint_faux:
	.string "False\n"
.Sprint_string:
	.string "%s\n"
fun_main:
	.string "main"
