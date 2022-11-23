	.file	"algorithm_pi.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"Algorithm operation time: %ld\n"
	.text
	.p2align 4
	.globl	algorithm_pi
	.type	algorithm_pi, @function
algorithm_pi:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movl	$1, %edi
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	movsd	accuracy(%rip), %xmm5
	movsd	.LC2(%rip), %xmm0
	comisd	%xmm5, %xmm0
	jbe	.L13
	pxor	%xmm6, %xmm6
	movsd	.LC0(%rip), %xmm1
	movsd	.LC3(%rip), %xmm3
	movsd	.LC4(%rip), %xmm8
	movsd	.LC5(%rip), %xmm7
	movapd	%xmm6, %xmm0
	.p2align 4,,10
	.p2align 3
.L8:
	addsd	%xmm3, %xmm0
	ucomisd	%xmm0, %xmm6
	ja	.L14
	sqrtsd	%xmm0, %xmm0
	movapd	%xmm7, %xmm4
	movapd	%xmm0, %xmm2
	mulsd	%xmm8, %xmm2
	mulsd	%xmm2, %xmm1
	movapd	%xmm3, %xmm2
	divsd	%xmm1, %xmm2
	subsd	%xmm2, %xmm4
	comisd	%xmm5, %xmm4
	ja	.L8
.L2:
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	movsd	%xmm2, (%rsp)
	call	clock_gettime@PLT
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	imulq	$1000000000, 32(%rsp), %rdx
	addq	40(%rsp), %rdx
	imulq	$1000000000, 16(%rsp), %rax
	addq	24(%rsp), %rax
	subq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movsd	(%rsp), %xmm2
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L17
	movapd	%xmm2, %xmm0
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	.cfi_restore_state
	movsd	.LC0(%rip), %xmm2
	jmp	.L2
.L14:
	movsd	%xmm5, 8(%rsp)
	movsd	%xmm1, (%rsp)
	call	sqrt@PLT
	movq	.LC4(%rip), %rax
	movsd	(%rsp), %xmm1
	pxor	%xmm6, %xmm6
	movapd	%xmm0, %xmm2
	movsd	8(%rsp), %xmm5
	movq	%rax, %xmm8
	movq	.LC3(%rip), %rax
	mulsd	%xmm8, %xmm2
	movq	%rax, %xmm3
	mulsd	%xmm2, %xmm1
	movq	%rax, %xmm2
	movq	.LC5(%rip), %rax
	movq	%rax, %xmm4
	movq	%rax, %xmm7
	divsd	%xmm1, %xmm2
	subsd	%xmm2, %xmm4
	comisd	%xmm5, %xmm4
	ja	.L8
	jmp	.L2
.L17:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	algorithm_pi, .-algorithm_pi
	.p2align 4
	.globl	timespecDiff
	.type	timespecDiff, @function
timespecDiff:
.LFB24:
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
.LFE24:
	.size	timespecDiff, .-timespecDiff
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	1412426040
	.long	1073816059
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.align 8
.LC4:
	.long	0
	.long	1071644672
	.align 8
.LC5:
	.long	1412426040
	.long	1074340347
