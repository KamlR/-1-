	.file	"work_with_file.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"rb"
.LC3:
	.string	"Problems with file"
.LC4:
	.string	"r"
.LC5:
	.string	"w"
.LC6:
	.string	"number of vowels: %d\n"
.LC7:
	.string	"numbers of consonants: %d\n"
.LC8:
	.string	"Algorithm operation time: %ld\n"
.LC0:
	.string	"AaEeIiOoUuYy"
.LC1:
	.string	"BbCcDdFfGgHhJjLlKkMmNnPpQqRrSsTtVvWwXxZz"
	.text
	.globl	work_with_file
	.type	work_with_file, @function
work_with_file:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$13, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%rsi, 8(%rsp)
	leaq	66(%rsp), %rdi
	leaq	.LC0(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	rep movsb
	leaq	79(%rsp), %rdi
	leaq	.LC1(%rip), %rsi
	movl	$41, %ecx
	rep movsb
	leaq	.LC2(%rip), %rsi
	movq	%r12, %rdi
	call	fopen@PLT
	testq	%rax, %rax
	jne	.L2
	movq	120(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	leaq	.LC3(%rip), %rdi
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
.L2:
	.cfi_restore_state
	movl	$2, %edx
	xorl	%esi, %esi
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	fseek@PLT
	movq	%rbp, %rdi
	leaq	66(%rsp), %r14
	leaq	79(%rsp), %r15
	call	ftello@PLT
	movq	%rbp, %rdi
	xorl	%r13d, %r13d
	movq	%rax, %rbx
	call	fclose@PLT
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%r12, %rdi
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rbp
	call	fopen@PLT
	movq	%rax, %r12
.L4:
	movq	%r12, %rdi
	cmpq	%rbx, %r13
	jge	.L18
	call	fgetc@PLT
	movb	%al, 0(%rbp,%r13)
	incq	%r13
	jmp	.L4
.L18:
	call	fclose@PLT
	leaq	32(%rsp), %rsi
	xorl	%r12d, %r12d
	xorl	%r13d, %r13d
	movl	$1, %edi
	call	clock_gettime@PLT
	xorl	%edx, %edx
.L6:
	cmpq	%rbx, %rdx
	jge	.L19
	movsbl	0(%rbp,%rdx), %esi
	movq	%r14, %rdi
	movq	%rdx, 24(%rsp)
	movl	%esi, 20(%rsp)
	call	strchr@PLT
	movl	20(%rsp), %esi
	movq	%r15, %rdi
	cmpq	$1, %rax
	sbbl	$-1, %r13d
	call	strchr@PLT
	movq	24(%rsp), %rdx
	cmpq	$1, %rax
	sbbl	$-1, %r12d
	incq	%rdx
	jmp	.L6
.L19:
	leaq	48(%rsp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rcx
	movq	48(%rsp), %rdi
	movq	56(%rsp), %rsi
	call	timespecDiff@PLT
	movq	8(%rsp), %rdi
	leaq	.LC5(%rip), %rsi
	addq	%rax, time_count(%rip)
	call	fopen@PLT
	movl	%r13d, %ecx
	movl	$1, %esi
	leaq	.LC6(%rip), %rdx
	movq	%rax, %rbp
	movq	%rax, %rdi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	%r12d, %ecx
	movl	$1, %esi
	movq	%rbp, %rdi
	leaq	.LC7(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	time_count(%rip), %rdx
	xorl	%eax, %eax
	movl	$1, %edi
	leaq	.LC8(%rip), %rsi
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movq	120(%rsp), %rax
	subq	%fs:40, %rax
	je	.L10
.L16:
	call	__stack_chk_fail@PLT
.L10:
	addq	$136, %rsp
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
.LFE25:
	.size	work_with_file, .-work_with_file
