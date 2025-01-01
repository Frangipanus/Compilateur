	.text
	.globl	main
main:
	movq $1, %rax
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_bool
	pushq $0
	popq %rax
	movq $.string_0, %rax
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_string
	pushq $0
	popq %rax
	pushq $42
	popq %rax
	movq %rax, %rdi
	call print_int
	pushq $0
	popq %rax
	pushq $10
	pushq $10
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	movq $0, %rax
	sete %al
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_bool
	pushq $0
	popq %rax
	pushq $10
	pushq $11
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	movq $0, %rax
	sete %al
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_bool
	pushq $0
	popq %rax
	pushq $10
	pushq $11
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	movq $0, %rax
	setne %al
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_bool
	pushq $0
	popq %rax
	pushq $10
	pushq $10
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	movq $0, %rax
	setne %al
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_bool
	pushq $0
	popq %rax
	pushq $10
	pushq $11
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	movq $0, %rax
	setl %al
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_bool
	pushq $0
	popq %rax
	pushq $10
	pushq $10
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	movq $0, %rax
	setl %al
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_bool
	pushq $0
	popq %rax
	pushq $10
	pushq $9
	popq %rax
	popq %rbx
	cmpq %rax, %rbx
	movq $0, %rax
	setl %al
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_bool
	pushq $0
	popq %rax
	pushq $10
	pushq $11
	popq %rax
	popq %rbx
	addq %rax, %rbx
	pushq %rbx
	popq %rax
	movq %rax, %rdi
	call print_int
	pushq $0
	popq %rax
	pushq $42
	pushq $2
	popq %rax
	popq %rbx
	imulq %rax, %rbx
	pushq %rbx
	popq %rax
	movq %rax, %rdi
	call print_int
	pushq $0
	popq %rax
	pushq $1
	pushq $2
	pushq $3
	popq %rax
	popq %rbx
	imulq %rax, %rbx
	pushq %rbx
	popq %rax
	popq %rbx
	addq %rax, %rbx
	pushq %rbx
	popq %rax
	movq %rax, %rdi
	call print_int
	pushq $0
	popq %rax
	pushq $8
	pushq $2
	popq %rax
	popq %rbx
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	movq $0, %rdx
	idivq %rbx
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_int
	pushq $0
	popq %rax
	pushq $8
	pushq $3
	popq %rax
	popq %rbx
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	movq $0, %rdx
	idivq %rbx
	pushq %rax
	popq %rax
	movq %rax, %rdi
	call print_int
	pushq $0
	popq %rax
	pushq $8
	pushq $3
	popq %rax
	popq %rbx
	movq %rax, %rcx
	movq %rbx, %rax
	movq %rcx, %rbx
	movq $0, %rdx
	idivq %rbx
	pushq %rdx
	popq %rax
	movq %rax, %rdi
	call print_int
	pushq $0
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
.string_0:
	.string "Hello World"
