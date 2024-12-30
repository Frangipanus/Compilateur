	.text
	.globl	main
main:
	movq $0, %rdi
	call print_bool
	ret


print_int:
	movq %rdi, %rsi
	movq $.Sprint_int, %rdi
	andq $-16, %rsp # alignement de la pile
	call printf
	movq $0, %rax
	ret
print_bool:

	movq %rsp, %rdx
	
	andq %rdi, %rdi
	 # alignement de la pile	*    call printf 
    jnz ptrue 
    movq %rdi, %rsi
    movq $.Sprint_faux, %rdi 
	call printf 
	movq %rdx, %rsp
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


