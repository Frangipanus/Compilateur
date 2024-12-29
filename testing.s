	.text
	.globl	main
main:
	movq $64, %rdi
	call my_malloc
	movq $print_int, 0(%rax)
	movq 0(%rax), %rbx
	movq %rax, %rbx
	movq $42, 0(%rbx)
	call my_malloc
	movq $64, 0(%rax)
	movq $128, 8(%rax)
	movq %rax, 8(%rbx)
	movq 8(%rbx), %rcx
	movq 8(%rcx), %rdi
	movq $1, %rax
	
	call print_int
	
	
	ret


print_int:
	movq %rdi, %rsi
	movq $.Sprint_int, %rdi
	movq $0, %rax
	call printf
	movq $0, %rax

	ret
print_bool:
    andq %rdi, %rdi
    jnz ptrue 
    movq %rdi, %rsi
    movq $.Sprint_faux, %rdi 
    movq $0, %rax 
    call printf 
    ret
ptrue:
    movq %rdi, %rsi
    movq $.Sprint_vrai, %rdi 
    movq $0, %rax 
    call printf 
	movq $0, %rax 
    ret
print_string:
    movq %rdi, %rsi
	movq $.Sprint_string, %rdi
	movq $0, %rax
	call printf
	movq $0, %rax 
	ret
head: 
	movq 0(%rdi), %rax 
	ret 
tail:
	movq 8(%rdi), %rax 
	ret 


my_malloc:
	pushq %rbp
	movq %rsp, %rbp
	andq $-16, %rsp # alignement de la pile
	movq 24(%rbp), %rdi # argument de malloc ici passé sur la pile
	call malloc
	movq %rbp, %rsp
	popq %rbp
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
.fin:
	.string "\0"


