	.file	"algorithm_pi.c"
	.text
	.globl	timespecDiff
	.type	timespecDiff, @function
timespecDiff:
.LFB14:
	.cfi_startproc
	endbr64
	imulq	$1000000000, %rdi, %rdi
	imulq	$1000000000, %rdx, %rdx
	addq	%rsi, %rdi
	addq	%rcx, %rdx
	movq	%rdi, %rax
	subq	%rdx, %rax
	ret
	.cfi_endproc
.LFE14:
	.size	timespecDiff, .-timespecDiff
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"Algorithm operation time: %ld\n"
	.text
	.globl	algorithm_pi
	.type	algorithm_pi, @function
algorithm_pi:
.LFB13:
	.cfi_startproc
	endbr64
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movl	$1, %edi
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	24(%rsp), %rsi
	call	clock_gettime@PLT
	movsd	.LC0(%rip), %xmm2
	xorps	%xmm0, %xmm0
	movaps	%xmm2, %xmm1
.L3:
	movsd	.LC4(%rip), %xmm3
	subsd	%xmm1, %xmm3
	comisd	accuracy(%rip), %xmm3
	jbe	.L8
	addsd	.LC2(%rip), %xmm0
	movsd	%xmm2, 8(%rsp)
	call	sqrt@PLT
	movsd	.LC3(%rip), %xmm1
	movsd	8(%rsp), %xmm2
	mulsd	%xmm0, %xmm1
	mulsd	%xmm1, %xmm2
	movsd	.LC2(%rip), %xmm1
	divsd	%xmm2, %xmm1
	jmp	.L3
.L8:
	leaq	40(%rsp), %rsi
	movl	$1, %edi
	movsd	%xmm1, 8(%rsp)
	call	clock_gettime@PLT
	movq	24(%rsp), %rdx
	movq	40(%rsp), %rdi
	movq	48(%rsp), %rsi
	movq	32(%rsp), %rcx
	call	timespecDiff
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movsd	8(%rsp), %xmm1
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	je	.L5
	call	__stack_chk_fail@PLT
.L5:
	movaps	%xmm1, %xmm0
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	algorithm_pi, .-algorithm_pi
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1073741824
	.align 8
.LC3:
	.long	0
	.long	1071644672
	.align 8
.LC4:
	.long	1412426040
	.long	1074340347
