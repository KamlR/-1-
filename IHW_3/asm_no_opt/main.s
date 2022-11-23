	.file	"main.c"
	.text
	.globl	accuracy
	.bss
	.align 8
	.type	accuracy, @object
	.size	accuracy, 8
accuracy:
	.zero	8
	.section	.rodata
.LC0:
	.string	"g"
.LC1:
	.string	"file"
.LC2:
	.string	"Incorrect input"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -40(%rbp)
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	cltd
	shrl	$30, %edx
	addl	%edx, %eax
	andl	$3, %eax
	subl	%edx, %eax
	addl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -32(%rbp)
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1563749871, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$15, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$90000, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	leal	10000(%rdx), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-32(%rbp), %xmm0
	divsd	-24(%rbp), %xmm0
	movsd	%xmm0, accuracy(%rip)
	cmpl	$3, -68(%rbp)
	jne	.L2
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2
	call	rand@PLT
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	movl	$0, %eax
	call	algorithm_pi@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movl	-52(%rbp), %ecx
	movq	-16(%rbp), %rdx
	movl	%ecx, %esi
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	write_to_file
	jmp	.L3
.L2:
	cmpl	$4, -68(%rbp)
	jne	.L4
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	files@PLT
	movl	%eax, -52(%rbp)
	movl	$0, %eax
	call	algorithm_pi@PLT
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	-80(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movl	-52(%rbp), %ecx
	movq	-8(%rbp), %rdx
	movl	%ecx, %esi
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	write_to_file
	jmp	.L3
.L4:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L5
.L3:
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC3:
	.string	"w"
.LC4:
	.string	"Problems with file"
.LC5:
	.string	"%.*lf\n"
.LC6:
	.string	"result: %.*lf\n"
.LC7:
	.string	"number of decimal places: %d\n"
	.align 8
.LC8:
	.string	"accuracy of calculations: %lf\n"
	.text
	.globl	write_to_file
	.type	write_to_file, @function
write_to_file:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movsd	%xmm0, -32(%rbp)
	movl	%esi, -36(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L7
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L6
.L7:
	movq	-32(%rbp), %rcx
	movl	-36(%rbp), %edx
	movq	-8(%rbp), %rax
	movq	%rcx, %xmm0
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-32(%rbp), %rdx
	movl	-36(%rbp), %eax
	movq	%rdx, %xmm0
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	accuracy(%rip), %rax
	movq	%rax, %xmm0
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	write_to_file, .-write_to_file
