	.file	"work_with_file.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"Algorithm operation time: %ld\n"
	.text
	.p2align 4
	.globl	work_with_file
	.type	work_with_file, @function
work_with_file:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
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
	movdqa	.LC7(%rip), %xmm0
	movq	%rsi, 8(%rsp)
	leaq	.LC0(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	movabsq	$8020745225322717505, %rax
	movaps	%xmm0, 64(%rsp)
	movdqa	.LC8(%rip), %xmm0
	movl	$2035905877, 59(%rsp)
	movb	$0, 63(%rsp)
	movb	$0, 104(%rsp)
	movaps	%xmm0, 80(%rsp)
	movq	%rax, 51(%rsp)
	movabsq	$8816491541885843030, %rax
	movq	%rax, 96(%rsp)
	call	fopen@PLT
	testq	%rax, %rax
	je	.L22
	movl	$2, %edx
	xorl	%esi, %esi
	movq	%rax, %r12
	movq	%rax, %rdi
	call	fseek@PLT
	movq	%r12, %rdi
	call	ftello@PLT
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	fclose@PLT
	movq	%rbp, %rdi
	call	malloc@PLT
	movq	%r13, %rdi
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rbx
	call	fopen@PLT
	movq	%rax, %r13
	testq	%rbp, %rbp
	jle	.L4
	addq	%rbx, %rbp
	movq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r13, %rdi
	addq	$1, %r12
	call	fgetc@PLT
	movb	%al, -1(%r12)
	cmpq	%rbp, %r12
	jne	.L5
	movq	%r13, %rdi
	xorl	%r12d, %r12d
	leaq	51(%rsp), %r15
	xorl	%r13d, %r13d
	call	fclose@PLT
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	leaq	64(%rsp), %r14
	call	clock_gettime@PLT
	.p2align 4,,10
	.p2align 3
.L9:
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
	jne	.L9
.L10:
	leaq	32(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	16(%rsp), %rdx
	movq	24(%rsp), %rcx
	movq	32(%rsp), %rdi
	movq	40(%rsp), %rsi
	call	timespecDiff@PLT
	movq	8(%rsp), %rdi
	leaq	.LC3(%rip), %rsi
	addq	%rax, time_count(%rip)
	call	fopen@PLT
	movl	%r12d, %ecx
	movl	$1, %esi
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rbp
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	%r13d, %ecx
	movl	$1, %esi
	movq	%rbp, %rdi
	leaq	.LC5(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	time_count(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	.LC6(%rip), %rsi
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movq	120(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
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
.L4:
	.cfi_restore_state
	movq	%rax, %rdi
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	call	fclose@PLT
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	jmp	.L10
.L19:
	call	__stack_chk_fail@PLT
.L22:
	movq	120(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L19
	addq	$136, %rsp
	.cfi_def_cfa_offset 56
	leaq	.LC1(%rip), %rdi
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
	jmp	puts@PLT
	.cfi_endproc
.LFE35:
	.size	work_with_file, .-work_with_file
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.quad	7369688085124309570
	.quad	7803729122135926599
	.align 16
.LC8:
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
