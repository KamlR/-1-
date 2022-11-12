	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Incorrect input"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rcx
	.cfi_def_cfa_offset 16
	cmpl	$1, %edi
	jne	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	jmp	.L3
.L2:
	cmpl	$2, %edi
	jne	.L4
	xorl	%eax, %eax
	call	generate_choice@PLT
	jmp	.L3
.L4:
	cmpl	$3, %edi
	jne	.L3
	movq	16(%rsi), %r8
	movq	8(%rsi), %rdi
	movq	%r8, %rsi
	call	work_with_file@PLT
.L3:
	xorl	%eax, %eax
	popq	%rdx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
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
	.globl	time_count
	.bss
	.align 8
	.type	time_count, @object
	.size	time_count, 8
time_count:
	.zero	8
