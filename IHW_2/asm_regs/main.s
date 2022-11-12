	.file	"main.c" # название файла с программой
	.intel_syntax noprefix # используем синтаксис в стиле Intel
	.text # начало секции
	.globl	time_count # глобальная переменная для подсчёта времени исполнения алгоритма
	.bss # секция хранения неинициализированных данных
	.align 8
	.type	time_count, @object 
	.size	time_count, 8
time_count:
	.zero	8
	.section	.rodata
.LC0:
	.string	"Incorrect input" # если передано неверное кол-во аргументов через комнадную строку
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp # /Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 16 # \ Пролог функции (3/3). А сам rsp сдвинули на 16 байт
	mov	r12d, edi # из регистра edi в r12d поместили argc (кол-во передаваемых значений в main)
	mov	QWORD PTR -16[rbp], rsi # из rsi на стек по адресу rbp[-16] char *argv[] (данные для функции)
	cmp	r12d, 1 # сравнение argc с 1
	jne	.L2 # если не равны, то переходим к метке L2
	lea	rax, .LC0[rip] 
	mov	rdi, rax # в rax помещаем адрес начальный адрес ячейки строки
	call	puts@PLT # вызов функции для вывода строки
	mov	eax, 0 
	jmp	.L3 # переходим к метке L3
.L2:
	cmp	r12d, 2 # сравнение argc с 2
	jne	.L4 # если не равны, то переходим к метке L4
	mov	eax, 0
	call	generate_choice@PLT # вызов функции для работы с рандомной строкой
	jmp	.L5 # переход к метке L5
.L4:
	cmp	r12d, 3 # сравнение argc с 3
	jne	.L5 # если не равны, то переходим к метке L5
	mov	rax, QWORD PTR -16[rbp] 
	add	rax, 16
	mov	rdx, QWORD PTR [rax] # в rdx лежит аналог argv[2]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax] # в rax лежит аналог argv[1]
	mov	rsi, rdx # в регистре rsi передаётся имя файла для вывода данных 
	mov	rdi, rax # в регистре rdi передаётся имя файла для ввода данных 
	call	work_with_file@PLT # вызов функции для работы с файлом
.L5:
	mov	eax, 0 # перемещаем 0 в регистр eax 
.L3:
	leave
	ret
	.size	main, .-main
	.globl	timespecDiff
	.type	timespecDiff, @function
timespecDiff:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	rax, rsi
	mov	r8, rdi
	mov	rsi, r8
	mov	rdi, r9
	mov	rdi, rax
	mov	QWORD PTR -32[rbp], rsi # из регистра rsi перемещаем на стек timeA.tv_sec по адресу rbp[-32]
	mov	QWORD PTR -24[rbp], rdi # из регистра rdi перемещаем на стек timeA.tv_nsec по адресу rbp[-24]
	mov	QWORD PTR -48[rbp], rdx # из регистра rdx перемещаем на стек timeB.tv_sec по адресу rbp[-48]
	mov	QWORD PTR -40[rbp], rcx # из регистра rcx перемещаем на стек timeB.tv_nsec по адресу rbp[-32]
	mov	rax, QWORD PTR -32[rbp] # переместили в rax timeA.tv_sec
	mov	QWORD PTR -8[rbp], rax 
	mov	rax, QWORD PTR -8[rbp]
	imul	rax, rax, 1000000000 # умножаем nsecA на 10^9 (перевод секунд в наносекунды)
	mov	QWORD PTR -8[rbp], rax # переместили nsecA на стек
	mov	rax, QWORD PTR -24[rbp] # в rax переместили timeA.tv_nsec
	add	QWORD PTR -8[rbp], rax # прибавили к nsecA timeA.tv_nsec
	mov	rax, QWORD PTR -48[rbp] 
	mov	QWORD PTR -16[rbp], rax # переменной nsecB присваиваем timeB.tv_sec
	mov	rax, QWORD PTR -16[rbp]
	imul	rax, rax, 1000000000 # nsecB умножаем на 10^9
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -40[rbp] # в rax перемещаем timeB.tv_nsec
	add	QWORD PTR -16[rbp], rax # складываем nsecB и timeB.tv_nsec
	mov	rax, QWORD PTR -8[rbp] # перемещаем nsecA в регистр rax
	sub	rax, QWORD PTR -16[rbp] # вычитаем из nsecA nsecB
	pop	rbp
	ret
