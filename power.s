.section .text
.global _start

_start:
	pushq %rbp
	movq  %rsp, %rbp
	
	pushq $7
	pushq $2
	
	callq simple_loop

.exit_system:
	movq $60, %rax
	movq %rax, %rdi
	syscall

.type simple_loop, @function
simple_loop:
variables_init:
	pushq %rbp
	movq  %rsp, %rbp
	movq  -24(%rbp), %rdi
	movq  -16(%rbp), %rcx
	movq  %rcx, %rsi

loop:
	imulq %rcx, %rdi
	decq  %rsi
	cmpq $0, %rsi
	jne loop

quit_loop:
	movq %rdi, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
	
