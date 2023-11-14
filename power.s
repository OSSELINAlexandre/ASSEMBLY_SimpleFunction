.section .text
.global _start

_start:
	movq  %rsp, %rbp
	
	pushq $5
	pushq $3
	
	callq simple_loop
	
.exit_system:
	movq $60, %rax
	movq %r11, %rdi
	syscall

.type simple_loop, @function
simple_loop:
	pushq %rbp
	movq  %rsp, %rbp
	movq  $1,   %rax
	movq  24(%rbp), %rdi
	movq  16(%rbp), %rcx

loop:
	imulq %rdi, %rax
	decq  %rcx
	cmpq  $0, %rcx
	jne   loop

quit_loop:
	movq %rax, %r11
	movq %rbp, %rsp
	popq %rbp
	ret
	
