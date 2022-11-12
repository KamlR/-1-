        .intel_syntax noprefix # Используем синтаксис в стиле Intel
	.text # Начало секции
	.globl	A # Глобальный массив A
	.bss # Секция хранения неинициализированных данных
	.align 32
	.type	A, @object
	.size	A, 4194304 # Размер массива
A:
	.zero	4194304 
	.globl	B # Глобальный массив В
	.align 32
	.type	B, @object 
	.size	B, 4194304
B:
	.zero	4194304
	.section	.rodata # Переходим в секцию .rodata
.LC0:
	.string	"%d" # …прямо перед тем, как положить в файл строку "%d\0"
.LC1:
	.string	"Incorrect data" # Строка, которая выводится, если введён некорректный размер
.LC2:
	.string	"r" # Строка, которая указывает на то, что данные будут читаться из файла
	.text
	.globl	main # Объявляем и экспортируем вовне символ `main`
	.type	main, @function
main:
	endbr64 
	push	rbp # /Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 48 # \ Пролог функции (3/3). А сам rsp сдвинули на 48 байт
	mov	DWORD PTR -36[rbp], edi # rbp[-36] := edi — это первый аргумент, `argc` (rdi)
	mov	QWORD PTR -48[rbp], rsi # rbp[-48] := rsi — это второй аргумент, `argv` (rsi)
	mov	r13d, 1000 # в регистре r13d хранится max_size (максимально возможный размер массива)
	lea	rax, -24[rbp] # переменная n, отвечающая за размер массива
	mov	rsi, rax 
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0 # обнуление eax
	call	__isoc99_scanf@PLT # Вызывает функцию `scanf`. В этот момент в регистрах: rax=0, rdi=rip[.LC0], rsi=rbp[-24]
	mov	eax, DWORD PTR -24[rbp] # В eax записали значение n
	cmp	r13d, eax # сравниваем n и max_size (если n больше, то идём к метке L2)
	jl	.L2 # если n больше max_size, то идём к метке L2
	mov	eax, DWORD PTR -24[rbp] # max_size перемещаем в регистр eax
	test	eax, eax
	jg	.L3 # если max_size оказалось больше, то идём к метке L3
.L2:
	lea	rax, .LC1[rip] # помещаем адрес строки "Incorrect input" в регистр rax
	mov	rdi, rax
	mov	eax, 0 # обнуляем eax
	call	printf@PLT # вызываем printf (в rdi лежит наша строка)
	mov	eax, 0
	jmp	.L4 # идём к метке L4, где и завершаем программу
.L3:
	mov	rax, QWORD PTR -48[rbp] # положили в rax второй аргумент командной строки
	add	rax, 8 
	mov	rax, QWORD PTR [rax] # в rax положили имя файла, из которого надо читать данные 
	lea	rdx, .LC2[rip] # имя файла будет открыто для чтения ("r")
	mov	rsi, rdx
	mov	rdi, rax 
	call	fopen@PLT # вызываем функцию отрытия файла (в rsi "r", в rdi имя файла, из которого читаю)
	mov	QWORD PTR -16[rbp], rax # поток, который связан с файлом ввода находится по адресу rbp[-16]
	mov	r12d, 0 # в r12d лежит счётчик цикла i=0 на данный момент
	jmp	.L5 # переходим к метке L5
.L6:
	mov	eax, r12d # помещаем счётчик i в eax из r12d
	cdqe
	lea	rdx, 0[0+rax*4] # /rdx := rax * 4
	lea	rax, A[rip] # rax := &rip[ARRAY]
	add	rdx, rax 
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC0[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT # вызываем функицию чтения из файла (в rdx ячейка массива, в rsi формат ввода данных, в rdi поток)
	add	r12d, 1 # увеличение счётчика i на 1
.L5:
	mov	eax, DWORD PTR -24[rbp] # перемещаем n в eax
	cmp	r12d, eax # сравниваем значение в регистре eax (n) и счётчик i в регистре r12d
	jl	.L6 # переходим к метке L6, елси i<n
	mov	rax, QWORD PTR -16[rbp] 
	mov	rdi, rax
	call	fclose@PLT # вызываем функцию закрытия файла (в rdi поток, который был привязан к файлу ввода)
	mov	eax, DWORD PTR -24[rbp]
	mov	esi, eax
	lea	rax, A[rip]
	mov	rdi, rax
	call	new_array@PLT # вызываем функцию new_array(в esi лежит n, через rdi передаю элемент массива)
	mov	DWORD PTR -20[rbp], eax # из eax записываем в rpb[-20] index, хранит индекс первого положительного элемента массива A
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -20[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	write_array@PLT # вызываем write_array(в rsi лежит имя файла, в который будем записывать, в edi индекс исключаемого элемента)
	mov	eax, 0
.L4:
	leave
	ret
