	.file	"write_array.c"
	.intel_syntax noprefix # Используем синтаксис в стиле Intel
	.text # Начало секции
	.section	.rodata # Переходим в секцию .rodata
.LC0:
	.string	"w" # Строка, которая указывает на запись в файл
.LC1:
	.string	"%d " # строка формата
.LC2:
	.string	"%d" # строка формата
	.text
	.globl	write_array 
	.type	write_array, @function
write_array:
	endbr64
	push	rbp # /Пролог функции (1/3). Сохранили rbp на стек.
	mov	rbp, rsp # |Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 32 # \Пролог функции (3/3). А сам rsp сдвинули на 32 байта
	mov	r14d, edi # перенесли значение index из регистра edi в регистр r14d
	mov	QWORD PTR -32[rbp], rsi # имя файла из регистра на стек
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT # вызов функции fopen (в rsi строка "w", в rdi имя файла для вывода)
	mov	QWORD PTR -16[rbp], rax 
	mov	r12d, 0 # счётчик цикла i=0, помещаем в регистр r12d
	jmp	.L2 # Переход к метке L2
.L5:
	mov	eax, r14d # переместили в eax значение переменной index
	sub	eax, 1 # отняли от index 1
	cmp	r12d, eax # сравнили i и index
	je	.L3 # если равны, то идём к метке L3
	mov	eax, r12d
	cdqe
	lea	rdx, 0[0+rax*4] # вычисляет адрес (rax*4)[0], который равен rax*4
	lea	rax, B[rip] # адрес начала массива положили в rax
	mov	edx, DWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC1[rip] 
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT # вызываем функции fprintf(в rsi строка формата вывода, в rdi поток для записи, в edx лежит элемент массива B)
	jmp	.L4 # переходим к метке L4
.L3:
	mov	eax, r12d
	cdqe
	lea	rdx, 0[0+rax*4] # вычисляет адрес (rax*4)[0], который равен rax*4
	lea	rax, B[rip] # адрес начала массива положили в rax
	mov	edx, DWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -16[rbp] # поток для записи в rax
	lea	rcx, .LC2[rip] # в rcx помещаем адрес строки формата
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT # вызов функции записи данных в файл (в rsi лежит адрес для строки формата, в rdi поток для записи, в edx лежит элемент массива B)
.L4:
	add	r12d, 1 # отнимаем 1 от счётчика i
.L2:
	mov	eax, r12d
	cmp	eax, r14d # сравниваем index и i
	jl	.L5 # елси i<index, то переходим к L5
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	ret
