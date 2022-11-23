	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w"
.LC1:
	.string	"Problems with file"
.LC2:
	.string	"%.*lf\n"
.LC3:
	.string	"result: %.*lf\n"
.LC4:
	.string	"number of decimal places: %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"accuracy of calculations: %lf\n"
	.text
	.p2align 4
	.globl	write_to_file
	.type	write_to_file, @function
write_to_file:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%esi, %r12d
	leaq	.LC0(%rip), %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movsd	%xmm0, 8(%rsp)
	call	fopen@PLT
	movsd	8(%rsp), %xmm0
	testq	%rax, %rax
	je	.L5
	movl	%r12d, %ecx
	movq	%rax, %rbp
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rdi
	movl	$1, %esi
	movl	$1, %eax
	movsd	%xmm0, 8(%rsp)
	call	__fprintf_chk@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movsd	8(%rsp), %xmm0
	movl	%r12d, %edx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movl	%r12d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rsi
	call	__printf_chk@PLT
	movl	$1, %edi
	movl	$1, %eax
	movsd	accuracy(%rip), %xmm0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	leaq	.LC5(%rip), %rsi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
.L5:
	.cfi_restore_state
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	leaq	.LC1(%rip), %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	puts@PLT
	.cfi_endproc
.LFE52:
	.size	write_to_file, .-write_to_file
	.section	.rodata.str1.1
.LC6:
	.string	"g"
.LC7:
	.string	"file"
.LC8:
	.string	"Incorrect input"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	xorl	%edi, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	movl	%eax, %ebx
	call	rand@PLT
	movl	%ebx, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	sarl	$31, %edx
	movl	%eax, %ecx
	shrl	$30, %edx
	sarl	$31, %ecx
	addl	%edx, %ebx
	andl	$3, %ebx
	subl	%edx, %ebx
	movslq	%eax, %rdx
	imulq	$1563749871, %rdx, %rdx
	addl	$1, %ebx
	cvtsi2sdl	%ebx, %xmm0
	sarq	$47, %rdx
	subl	%ecx, %edx
	imull	$90000, %edx, %edx
	subl	%edx, %eax
	addl	$10000, %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, accuracy(%rip)
	cmpl	$3, %r12d
	je	.L11
	cmpl	$4, %r12d
	jne	.L8
	movq	8(%rbp), %rdi
	leaq	.LC7(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L12
.L8:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
.L9:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	movq	16(%rbp), %rdi
	call	files@PLT
	movl	%eax, %r12d
	xorl	%eax, %eax
	call	algorithm_pi@PLT
	movq	24(%rbp), %rdi
	movl	%r12d, %esi
	call	write_to_file
	jmp	.L9
.L11:
	movq	8(%rbp), %rdi
	leaq	.LC6(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L8
	call	rand@PLT
	movl	%eax, %ebx
	xorl	%eax, %eax
	call	algorithm_pi@PLT
	movl	%ebx, %eax
	movl	$8, %ecx
	movq	16(%rbp), %rdi
	cltd
	idivl	%ecx
	leal	1(%rdx), %esi
	call	write_to_file
	jmp	.L9
	.cfi_endproc
.LFE51:
	.size	main, .-main
	.globl	accuracy
	.bss
	.align 8
	.type	accuracy, @object
	.size	accuracy, 8
accuracy:
	.zero	8
