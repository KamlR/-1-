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
.LC5:
	.string	"accuracy of calculations: %lf\n"
	.text
	.globl	write_to_file
	.type	write_to_file, @function
write_to_file:
.LFB37:
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
	jne	.L2
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	leaq	.LC1(%rip), %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	puts@PLT
.L2:
	.cfi_restore_state
	movl	%r12d, %ecx
	movq	%rax, %rbp
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rdi
	movl	$1, %esi
	movb	$1, %al
	movsd	%xmm0, 8(%rsp)
	call	__fprintf_chk@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movsd	8(%rsp), %xmm0
	movl	%r12d, %edx
	movb	$1, %al
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	%r12d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rsi
	call	__printf_chk@PLT
	movsd	accuracy(%rip), %xmm0
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	movl	$1, %edi
	popq	%rbp
	.cfi_def_cfa_offset 16
	leaq	.LC5(%rip), %rsi
	movb	$1, %al
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE37:
	.size	write_to_file, .-write_to_file
	.section	.rodata.str1.1
.LC6:
	.string	"g"
.LC7:
	.string	"file"
.LC8:
	.string	"Incorrect input"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB36:
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
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	movl	%eax, %ebp
	call	rand@PLT
	movl	$4, %ecx
	movl	%eax, %r8d
	movl	%ebp, %eax
	cltd
	idivl	%ecx
	movl	%r8d, %eax
	movl	$90000, %ecx
	incl	%edx
	cvtsi2sdl	%edx, %xmm0
	cltd
	idivl	%ecx
	addl	$10000, %edx
	cvtsi2sdl	%edx, %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, accuracy(%rip)
	cmpl	$3, %r12d
	jne	.L6
	movq	8(%rbx), %rdi
	leaq	.LC6(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	call	rand@PLT
	movl	%eax, %ebp
	xorl	%eax, %eax
	call	algorithm_pi@PLT
	movl	%ebp, %eax
	movl	$8, %ecx
	movq	16(%rbx), %rdi
	cltd
	idivl	%ecx
	leal	1(%rdx), %esi
	jmp	.L10
.L6:
	cmpl	$4, %r12d
	jne	.L7
	movq	8(%rbx), %rdi
	leaq	.LC7(%rip), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	movq	16(%rbx), %rdi
	call	files@PLT
	movl	%eax, %ebp
	xorl	%eax, %eax
	call	algorithm_pi@PLT
	movq	24(%rbx), %rdi
	movl	%ebp, %esi
.L10:
	call	write_to_file
	jmp	.L8
.L7:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
.L8:
	popq	%rbx
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE36:
	.size	main, .-main
	.globl	accuracy
	.bss
	.align 8
	.type	accuracy, @object
	.size	accuracy, 8
accuracy:
	.zero	8
