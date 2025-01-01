	.text
	.globl	main
	movq %rsp, %rbp
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $0, %rsp
	pushq $1
	pushq $5
	pushq %rdi
	pushq %rsi
	movq $8, %rdi
	call my_malloc
	popq %rsi
	popq %rdi
	movq $fun_0, 0(%rax)
	pushq %rax
	popq %rdx
	popq %rbx
	popq %rcx
	pushq %rsi
	pushq %rdi
	pushq %rcx
	pushq %rbx
	pushq %rdx
	movq $8, %rdi
	call my_malloc
	movq %rax, %rdi
	popq %rsi
	popq %rbx
	popq %rdx
	movq %rdx, %r15
debut_for_1:
	movq %r15, 0(%rdi)
	pushq %r15
	pushq %rbx
	call *(%rsi)
	popq %rbx
	popq %r15
	addq $1, %r15
	cmpq %r15, %rbx
	jns debut_for_1
finboucle_1:
	popq %rdi
	popq %rsi
	pushq $0
	popq %rax
	pushq %rax
	popq %rax
	popq %rbp
	addq $0, %rsp
	ret
fun_0:
	pushq %rbp
	movq %rsp, %rbp
	addq $0, %rsp
	pushq 0(%rdi)
	popq %rax
	pushq %rdi
	pushq %rsi
	movq %rax, %rdi
	call print_int
	popq %rsi
	popq %rdi
	pushq $0
	popq %rax
	pushq %rax
	popq %rax
	popq %rbp
	addq $0, %rsp
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
	movq 0(%rax), %rax
	ret
tail:
	movq 8(%rax), %rax
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
fun_fun_0:
	.string "fun_0"
