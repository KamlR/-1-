	.file	"files.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"Problems with file"
.LC2:
	.string	"%d"
	.text
	.p2align 4
	.globl	files
	.type	files, @function
files:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rsi
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L7
	movq	%rax, %rdi
	movq	%rax, %rbp
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	call	__isoc99_fscanf@PLT
	movq	%rbp, %rdi
	call	fclose@PLT
	movl	4(%rsp), %eax
.L1:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L8
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L7:
	.cfi_restore_state
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	xorl	%eax, %eax
	jmp	.L1
.L8:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	files, .-files
