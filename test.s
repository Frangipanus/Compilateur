	.text
	.globl	main
	movq %rsp, %rbp
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $0, %rsp
	movq $.string_0, %rax
	pushq %rax
	movq $.string_1, %rax
	pushq %rax
	popq %rsi
	popq %rdi
	call strcat
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_string
	pushq $0
	popq %rax
	pushq %rax
	popq %rax
	popq %rbp
	addq $0, %rsp
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
.string_1:
	.string " World!"
.string_0:
	.string "Hello"
