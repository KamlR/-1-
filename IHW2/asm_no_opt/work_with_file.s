	.file	"work_with_file.c"
	.text
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"Problems with file"
.LC2:
	.string	"r"
.LC3:
	.string	"w"
.LC4:
	.string	"number of vowels: %d\n"
.LC5:
	.string	"numbers of consonants: %d\n"
	.align 8
.LC6:
	.string	"Algorithm operation time: %ld\n"
	.text
	.globl	work_with_file
	.type	work_with_file, @function
work_with_file:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%rdi, -184(%rbp)
	movq	%rsi, -192(%rbp)
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
	movl	$0, -168(%rbp)
	movl	$0, -164(%rbp)
	movq	-184(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -144(%rbp)
	cmpq	$0, -144(%rbp)
	jne	.L2
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L1
.L2:
	movq	-144(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	ftello@PLT
	movq	%rax, -136(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -128(%rbp)
	movq	-184(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -144(%rbp)
	movq	$0, -160(%rbp)
	jmp	.L4
.L5:
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movl	%eax, %edx
	movq	-160(%rbp), %rcx
	movq	-128(%rbp), %rax
	addq	%rcx, %rax
	movb	%dl, (%rax)
	addq	$1, -160(%rbp)
.L4:
	movq	-160(%rbp), %rax
	cmpq	-136(%rbp), %rax
	jl	.L5
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	$0, -152(%rbp)
	jmp	.L6
.L9:
	movq	-152(%rbp), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	leaq	-77(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L7
	addl	$1, -168(%rbp)
.L7:
	movq	-152(%rbp), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	leaq	-64(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	testq	%rax, %rax
	je	.L8
	addl	$1, -164(%rbp)
.L8:
	addq	$1, -152(%rbp)
.L6:
	movq	-152(%rbp), %rax
	cmpq	-136(%rbp), %rax
	jl	.L9
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
	movq	-192(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -120(%rbp)
	movl	-168(%rbp), %edx
	movq	-120(%rbp), %rax
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	-164(%rbp), %edx
	movq	-120(%rbp), %rax
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	time_count(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L1:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	work_with_file, .-work_with_file
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
