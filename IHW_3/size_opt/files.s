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
	.globl	files
	.type	files, @function
files:
.LFB13:
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
	jne	.L2
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	xorl	%eax, %eax
	jmp	.L1
.L2:
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
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	files, .-files
