	.file	"generate_choice.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"In the generator mode, a random string length and a random string will be obtained"
.LC1:
	.string	"number of vowels: %d\n"
.LC2:
	.string	"numbers of consonants: %d\n"
	.align 8
.LC3:
	.string	"Algorithm operation time: %ld\n"
	.text
	.globl	generate_choice
	.type	generate_choice, @function
generate_choice:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$8020745225322717505, %rax
	movq	%rax, -77(%rbp)
	movl	$2035905877, -69(%rbp)
	movb	$0, -65(%rbp)
	movabsq	$7369688085124309570, %rax
	movabsq	$7803729122135926599, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movabsq	$8093089813505076043, %rax
	movabsq	$8382451608680821073, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movabsq	$8816491541885843030, %rax
	movq	%rax, -32(%rbp)
	movb	$0, -24(%rbp)
	movl	$0, -144(%rbp)
	movl	$0, -140(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	leal	1(%rdx), %eax
	movl	%eax, -128(%rbp)
	movl	-128(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -120(%rbp)
	movl	$0, -136(%rbp)
	jmp	.L2
.L3:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$-1401515643, %rdx, %rdx
	shrq	$32, %rdx
	addl	%eax, %edx
	sarl	$6, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$95, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	leal	32(%rdx), %eax
	movl	%eax, -124(%rbp)
	movl	-136(%rbp), %eax
	movslq	%eax, %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movl	-124(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, -136(%rbp)
.L2:
	movl	-136(%rbp), %eax
	cmpl	-128(%rbp), %eax
	jl	.L3
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movl	$0, -132(%rbp)
	jmp	.L4
.L7:
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	leaq	-77(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L5
	addl	$1, -144(%rbp)
.L5:
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	leaq	-64(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L6
	addl	$1, -140(%rbp)
.L6:
	addl	$1, -132(%rbp)
.L4:
	movl	-132(%rbp), %eax
	cmpl	-128(%rbp), %eax
	jl	.L7
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-112(%rbp), %rax
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rdi
	movq	-88(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	call	timespecDiff@PLT
	movq	time_count(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, time_count(%rip)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-144(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-140(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	time_count(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	generate_choice, .-generate_choice
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
