	.file	"main.c" # название файла с программой
	.intel_syntax noprefix # используем синтаксис в стиле Intel
	.text
	.globl	accuracy # глобальная переменная точности вычилений
	.bss
	.align 8
	.type	accuracy, @object
	.size	accuracy, 8
accuracy:
	.zero	8
	.section	.rodata
.LC0:
	.string	"g" # указывает, что будет выполнена генерация 
.LC1:
	.string	"file" # указывает, что будет выполнен ввод из файла
.LC2:
	.string	"Incorrect input" # неправильный ввод аргуменотов командной строки
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp # /Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 80 # \ Пролог функции (3/3). А сам rsp сдвинули на 80 байт
	mov	r12d, edi # в регистр r12d положили argc (кол-во аргументов командной строки)
	mov	QWORD PTR -80[rbp], rsi # указатель на char
	lea	rax, .LC0[rip]
	mov	QWORD PTR -8[rbp], rax # на стек по адресу rbp[-8] положили строку, отвечающую за генерицию 
	lea	rax, .LC1[rip]
	mov	QWORD PTR -16[rbp], rax # на стек по адресу rbp[-16] положили строку, отвечающую за ввод из файла
	mov	edi, 0 
	call	time@PLT # вызываем функцию time, передаём 0, т.е NULL
	mov	edi, eax # вернули значение через eax
	call	srand@PLT # вызываем функцию srand, через edi передаём параметр 
	call	rand@PLT # вызываем функцию rand, она не принимает параметров
	cdq
	shr	edx, 30 # сдвиг на 30 бит вправо содержимого edx 
	add	eax, edx 
	and	eax, 3
	sub	eax, edx
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movq	xmm4, xmm0 # в регистр xmm4 переместили number
	call	rand@PLT # снова вызвали функцию rand
	movsx	rdx, eax
	imul	rdx, rdx, 1563749871
	shr	rdx, 32
	sar	edx, 15
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 90000
	sub	eax, ecx
	mov	edx, eax
	lea	eax, 10000[rdx]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movq	xmm5, xmm0 # в регистр xmm5 переместили del
	movsd	xmm0, xmm4
	divsd	xmm0, xmm5 # поделили number на del
	movsd	QWORD PTR accuracy[rip], xmm0 # результат деления положили в глоб. переменную, отвечающую за точность вычислений
	cmp	r12d, 3 # сравниваем argc с 3
	jne	.L2 # если не равны, то переходим к метке L2
	mov	rax, QWORD PTR -80[rbp] 
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rsi, rdx # через rsi передаём строку "g"
	mov	rdi, rax # через rdi передаём строку из аргументов командной строки
	call	strcmp@PLT # вызвали функцию сравнения строк (передаваемые параметры подписаны выше)
	test	eax, eax # проверяем, что функция вернула 0
	jne	.L2 # если не 0, то сразу переходим к метке L2
	call	rand@PLT # вызываем функцию rand
	cdq
	shr	edx, 29
	add	eax, edx
	and	eax, 7
	sub	eax, edx
	add	eax, 1
	mov	DWORD PTR -36[rbp], eax # на стек по адресу rbp[-36] записали decimal_places (кол-во знаков после запятой)
	mov	eax, 0
	call	algorithm_pi@PLT # вызывали функцию подсчёта числа пи
	movq	rax, xmm0 
	mov	QWORD PTR -48[rbp], rax # на стек положили result_pi
	mov	rax, QWORD PTR -80[rbp]  
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	ecx, DWORD PTR -36[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	esi, ecx # через rsi передаём decimal_places
	movq	xmm0, rdx # через xmm0 передаём посчитанное приближённо число pi
	mov	rdi, rax # через rdi передаём имя файла для записи
	call	write_to_file # вызов функции записи в файл, переданные параметры описаны выше
	jmp	.L3
.L2:
	cmp	r12d, 4 # сравниваем argc с 4
	jne	.L4 # если не равны, то переходим к метке L4
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rsi, rdx # через rsi передаём строку "file"
	mov	rdi, rax # через rdi передаём строку из аргументов командной строки
	call	strcmp@PLT # вызов функции сравнения двух строк (переданные параметры указаны выше)
	test	eax, eax # сравнение с 0
	jne	.L4 # если не 0, то переходим к метке L4
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	mov	eax, 0
	call	files@PLT # вызов функции чтения из файла, параметр передаётся через rdi
	mov	DWORD PTR -36[rbp], eax # decimal_places записали на стек
	mov	eax, 0
	call	algorithm_pi@PLT # вызвали функцию подсчёта приближённого числа пи
	movq	rax, xmm0 # вернули значение через xmm0
	mov	QWORD PTR -56[rbp], rax 
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	ecx, DWORD PTR -36[rbp]
	mov	rdx, QWORD PTR -56[rbp]
	mov	esi, ecx # через esi передаём decimal_places
	movq	xmm0, rdx # через xmm0 передаём приближённое число пи
	mov	rdi, rax # через rdi передаём имя файла
	call	write_to_file # вызов функции записи в файл (переданные параметры описаны выше)
	jmp	.L3 # переходим к метке L3
.L4:
	lea	rax, .LC2[rip] 
	mov	rdi, rax
	call	puts@PLT # вызываем метод печати в консоль (нужную строку передаём через rdi)
	mov	eax, 0
	jmp	.L5
.L3:
	mov	eax, 0
.L5:
	leave
	ret
	.size	main, .-main
	.section	.rodata
.LC3:
	.string	"w" # запись в файл
.LC4:
	.string	"Problems with file" # если при обращении к потоку возникли проблемы
.LC5:
	.string	"%.*lf\n" # формат вывода
.LC6:
	.string	"result: %.*lf\n" # формат вывода
.LC7:
	.string	"number of decimal places: %d\n" # подсказка пользователю (кол-во знаков после запятой)
	.align 8
.LC8:
	.string	"accuracy of calculations: %lf\n" # подсказка пользователю (точность подсчёта)
	.text
	.globl	write_to_file
	.type	write_to_file, @function
write_to_file:
	endbr64
	push	rbp # /Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 48 # \ Пролог функции (3/3). А сам rsp сдвинули на 48 байт
	mov	QWORD PTR -24[rbp], rdi # на стек положили имя файла для записи по адресу rbp[-24]
	movsd	QWORD PTR -32[rbp], xmm0 # на стек положили по адресу rbp[-32] положили result_pi
	mov	DWORD PTR -36[rbp], esi # на стек по адресу rbp[-36] положили decimal_places
	mov	rax, QWORD PTR -24[rbp] 
	lea	rdx, .LC3[rip]
	mov	rsi, rdx # через rsi передаём строку "w"
	mov	rdi, rax # через rdi передаём имя файла, в который будем записывать
	call	fopen@PLT # вызов функции fopen (переданные параметры описаны выше)
	mov	QWORD PTR -8[rbp], rax # через rax вернули указатель на поток вывода
	cmp	QWORD PTR -8[rbp], 0 # сравнили с NULL
	jne	.L7 # если не NULL, то переходим к метке L7
	lea	rax, .LC4[rip] 
	mov	rdi, rax # через rdi передаём строку для вывода
	call	puts@PLT # вызов функции печати в консоль
	jmp	.L6 # переходим к метке L6
.L7:
	mov	rcx, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -36[rbp] # через edx передаём decimal_places
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rcx # через xmm0 передаём result_pi
	lea	rcx, .LC5[rip]
	mov	rsi, rcx # через rsi передаём строку формата вывода
	mov	rdi, rax # через rdi передали указатель на поток
	mov	eax, 1
	call	fprintf@PLT # вызов функции записи в файл (переданные параметры указаны выше)
	mov	rax, QWORD PTR -8[rbp] 
	mov	rdi, rax
	call	fclose@PLT # вызов функции закрытия потока, через rdi передаём указатель на поток
	mov	rdx, QWORD PTR -32[rbp] 
	mov	eax, DWORD PTR -36[rbp]
	movq	xmm0, rdx # через xmm0 передаём result_pi
	mov	esi, eax # через esi передаём decimal_places
	lea	rax, .LC6[rip] 
	mov	rdi, rax # через rdi передаём строку формата вывода
	mov	eax, 1
	call	printf@PLT # вызов функции печати в консоль (переданные параметры описаны выше)
	mov	eax, DWORD PTR -36[rbp]
	mov	esi, eax # через esi передаём decimal_places
	lea	rax, .LC7[rip] 
	mov	rdi, rax # через rdi передаём строку с подсказкой для пользователя
	mov	eax, 0
	call	printf@PLT # вызов функции печати в консоль (переданные параметры описаны выше)
	mov	rax, QWORD PTR accuracy[rip]
	movq	xmm0, rax # через xmm0 передаём точность подсчётов
	lea	rax, .LC8[rip]
	mov	rdi, rax # через rdi передаём строку с подсказкой для пользователя
	mov	eax, 1
	call	printf@PLT # вызов функции печати в консоль (переданные параметры описаны выше)
.L6:
	leave
	ret
