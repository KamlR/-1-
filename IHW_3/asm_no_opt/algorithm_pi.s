	.file	"algorithm_pi.c"
	.text
	.section	.rodata
	.align 8
.LC4:
	.string	"Algorithm operation time: %ld\n"
	.text
	.globl	algorithm_pi
	.type	algorithm_pi, @function
algorithm_pi:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -96(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -80(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	jmp	.L2
.L3:
	movsd	-88(%rbp), %xmm1
	movsd	.LC3(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	movq	%xmm0, %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movsd	.LC3(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-80(%rbp), %xmm0
	mulsd	-56(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	movsd	.LC3(%rip), %xmm0
	divsd	-80(%rbp), %xmm0
	movsd	%xmm0, -96(%rbp)
.L2:
	movsd	-72(%rbp), %xmm0
	subsd	-96(%rbp), %xmm0
	movsd	accuracy(%rip), %xmm1
	comisd	%xmm1, %xmm0
	ja	.L3
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	call	timespecDiff
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movsd	-96(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	algorithm_pi, .-algorithm_pi
	.globl	timespecDiff
	.type	timespecDiff, @function
timespecDiff:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rsi, %rax
	movq	%rdi, %r8
	movq	%r8, %rsi
	movq	%r9, %rdi
	movq	%rax, %rdi
	movq	%rsi, -32(%rbp)
	movq	%rdi, -24(%rbp)
	movq	%rdx, -48(%rbp)
	movq	%rcx, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	imulq	$1000000000, %rax, %rax
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	addq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	imulq	$1000000000, %rax, %rax
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	addq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	subq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	timespecDiff, .-timespecDiff
	.section	.rodata
	.align 8
.LC0:
	.long	1412426040
	.long	1074340347
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1073741824
