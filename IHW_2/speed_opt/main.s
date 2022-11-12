	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Incorrect input"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	cmpl	$1, %edi
	je	.L7
	cmpl	$2, %edi
	je	.L8
	cmpl	$3, %edi
	je	.L9
.L3:
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	xorl	%eax, %eax
	call	generate_choice@PLT
	jmp	.L3
.L9:
	movq	16(%rsi), %r8
	movq	8(%rsi), %rdi
	movq	%r8, %rsi
	call	work_with_file@PLT
	jmp	.L3
.L7:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	jmp	.L3
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.text
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
	.globl	time_count
	.bss
	.align 8
	.type	time_count, @object
	.size	time_count, 8
time_count:
	.zero	8
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
