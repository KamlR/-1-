	.file	"generate_choice.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"In the generator mode, a random string length and a random string will be obtained"
.LC3:
	.string	"number of vowels: %d\n"
.LC4:
	.string	"numbers of consonants: %d\n"
.LC5:
	.string	"Algorithm operation time: %ld\n"
.LC0:
	.string	"AaEeIiOoUuYy"
.LC1:
	.string	"BbCcDdFfGgHhJjLlKkMmNnPpQqRrSsTtVvWwXxZz"
	.text
	.globl	generate_choice
	.type	generate_choice, @function
generate_choice:
.LFB36:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rsi
	movl	$13, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	$95, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	leaq	50(%rsp), %rdi
	leaq	50(%rsp), %r14
	rep movsb
	leaq	63(%rsp), %rdi
	leaq	.LC1(%rip), %rsi
	movl	$41, %ecx
	rep movsb
	xorl	%edi, %edi
	leaq	63(%rsp), %r15
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	call	rand@PLT
	movl	$100, %ecx
	cltd
	idivl	%ecx
	leal	1(%rdx), %ebx
	movslq	%ebx, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
.L2:
	cmpl	%r12d, %ebx
	jle	.L15
	call	rand@PLT
	cltd
	idivl	%r13d
	addl	$32, %edx
	movb	%dl, 0(%rbp,%r12)
	incq	%r12
	jmp	.L2
.L15:
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	call	clock_gettime@PLT
	xorl	%edx, %edx
.L4:
	cmpl	%edx, %ebx
	jle	.L16
	movsbl	0(%rbp,%rdx), %esi
	movq	%r14, %rdi
	movq	%rdx, 8(%rsp)
	movl	%esi, 4(%rsp)
	call	strchr@PLT
	movl	4(%rsp), %esi
	movq	%r15, %rdi
	cmpq	$1, %rax
	sbbl	$-1, %r13d
	call	strchr@PLT
	movq	8(%rsp), %rdx
	cmpq	$1, %rax
	sbbl	$-1, %r12d
	incq	%rdx
	jmp	.L4
.L16:
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rsi
	movq	32(%rsp), %rdi
	call	timespecDiff@PLT
	movq	%rbp, %rdi
	addq	%rax, time_count(%rip)
	call	puts@PLT
	movl	%r13d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rsi
	call	__printf_chk@PLT
	movl	%r12d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC4(%rip), %rsi
	call	__printf_chk@PLT
	movq	time_count(%rip), %rdx
	xorl	%eax, %eax
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	104(%rsp), %rax
	subq	%fs:40, %rax
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	addq	$120, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE36:
	.size	generate_choice, .-generate_choice
