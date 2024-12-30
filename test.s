	.text
	.globl	main
main:
	movq %rsp, %rbp
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
	.data
.Sprint_int:
	.string "%d\n"
.Sprint_vrai:
	.string "True"
.Sprint_faux:
	.string "Faux"
.Sprint_string:
	.string "%s"
