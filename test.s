	.text
	.globl	main
main:
	movq $.string_0, %rax
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_string
	pushq $0
	popq %rax
	movq $1, %rax
	pushq %rax
	popq %rax
	pushq %rax
	movq $.string_1, %rax
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_string
	pushq $0
	popq %rax
	movq $1, %rax
	pushq %rax
	popq %rax
	pushq %rax
	popq %rax
	movq $0, %rax
	ret
print_int:
	movq %rdi, %rsi
	movq $.Sprint_int, %rdi
	movq %rbp, %r14
	movq %rsp, %r15
	andq $-16, %rsp
	movq $0, %rax
	call printf
	movq %r14, %rbp
	movq %r15, %rsp
	ret
print_bool:
	andq %rdi, %rdi
	jnz ptrue
	movq %rbp, %r14
	movq %rsp, %r15
	movq %rsp, %rbp
	andq $-16, %rsp
	movq $.Sprint_faux, %rdi
	call printf
	movq %r14, %rbp
	movq %r15, %rsp
	ret
ptrue:
	movq %rbp, %r14
	movq %rsp, %r15
	movq %rsp, %rbp
	andq $-16, %rsp
	movq $.Sprint_vrai, %rdi
	movq $0, %rax
	call printf
	movq %r14, %rbp
	movq %r15, %rsp
	ret
head:
	movq 0(%rbp), %rax
	ret
	movq 8(%rbp), %rax
	ret
my_malloc:
	movq %rbp, %r14
	movq %rsp, %r15
	movq %rsp, %rbp
	andq $-16, %rsp
	call malloc
	movq %r14, %rbp
	movq %r15, %rsp
	ret
print_string:
	movq %rbp, %r14
	movq %rsp, %r15
	movq %rsp, %rbp
	movq %rdi, %rsi
	movq $.Sprint_string, %rdi
	call printf
	movq %r14, %rbp
	movq %r15, %rsp
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
.string_1:
	.string "bad"
.string_0:
	.string "bad"
