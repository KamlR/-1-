	.file	"generate_choice.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"In the generator mode, a random string length and a random string will be obtained"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"number of vowels: %d\n"
.LC2:
	.string	"numbers of consonants: %d\n"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Algorithm operation time: %ld\n"
	.text
	.p2align 4
	.globl	generate_choice
	.type	generate_choice, @function
generate_choice:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	xorl	%edi, %edi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movdqa	.LC4(%rip), %xmm0
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	movabsq	$8020745225322717505, %rax
	movl	$2035905877, 59(%rsp)
	movaps	%xmm0, 64(%rsp)
	movdqa	.LC5(%rip), %xmm0
	movb	$0, 63(%rsp)
	movaps	%xmm0, 80(%rsp)
	movb	$0, 104(%rsp)
	movq	%rax, 51(%rsp)
	movabsq	$8816491541885843030, %rax
	movq	%rax, 96(%rsp)
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	call	rand@PLT
	movslq	%eax, %rbp
	cltd
	imulq	$1374389535, %rbp, %rbp
	sarq	$37, %rbp
	subl	%edx, %ebp
	imull	$100, %ebp, %edx
	subl	%edx, %eax
	movl	%eax, %ebp
	leal	1(%rbp), %ebx
	movslq	%ebx, %rdi
	call	malloc@PLT
	movq	%rax, 8(%rsp)
	testl	%ebx, %ebx
	jle	.L2
	movq	%rax, %r12
	movq	%rax, %rbx
	leaq	1(%rax,%rbp), %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	call	rand@PLT
	addq	$1, %r12
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$-1401515643, %rdx, %rdx
	sarl	$31, %ecx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$6, %edx
	subl	%ecx, %edx
	imull	$95, %edx, %edx
	subl	%edx, %eax
	addl	$32, %eax
	movb	%al, -1(%r12)
	cmpq	%rbp, %r12
	jne	.L3
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	clock_gettime@PLT
	leaq	51(%rsp), %r15
	leaq	64(%rsp), %r14
	.p2align 4,,10
	.p2align 3
.L7:
	movsbl	(%rbx), %esi
	movq	%r15, %rdi
	movl	%esi, 4(%rsp)
	call	strchr@PLT
	movl	4(%rsp), %esi
	movq	%r14, %rdi
	cmpq	$1, %rax
	sbbl	$-1, %r12d
	call	strchr@PLT
	cmpq	$1, %rax
	sbbl	$-1, %r13d
	addq	$1, %rbx
	cmpq	%rbp, %rbx
	jne	.L7
.L8:
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	40(%rsp), %rsi
	movq	32(%rsp), %rdi
	call	timespecDiff@PLT
	movq	8(%rsp), %rdi
	addq	%rax, time_count(%rip)
	call	puts@PLT
	movl	%r12d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rsi
	call	__printf_chk@PLT
	movl	%r13d, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	movq	time_count(%rip), %rdx
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	120(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L20
	addq	$136, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	clock_gettime@PLT
	jmp	.L8
.L20:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	generate_choice, .-generate_choice
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.quad	7369688085124309570
	.quad	7803729122135926599
	.align 16
.LC5:
	.quad	8093089813505076043
	.quad	8382451608680821073
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
