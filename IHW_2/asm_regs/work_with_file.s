	.file	"work_with_file.c" # название файла программы
	.intel_syntax noprefix # используем синтаксис в стиле Intel
	.text
	.section	.rodata
.LC0:
	.string	"rb" # открытие файла в бинарном виде для чтения
.LC1:
	.string	"Problems with file" # если не получилось открыть файл
.LC2:
	.string	"r" # открытие файла для чтения 
.LC3:
	.string	"w" # открытие файла для записи
.LC4:
	.string	"number of vowels: %d\n" # вывод кол-ва гласных в строке
.LC5:
	.string	"numbers of consonants: %d\n" # вывод кол-ва согласных в строке
	.align 8
.LC6:
	.string	"Algorithm operation time: %ld\n" # вывод времени работы алгоритма (подсчёт кол-ва гласных и согласных в строке)
	.text
	.globl	work_with_file
	.type	work_with_file, @function
work_with_file:
	endbr64
	push	rbp # /Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 176 # \ Пролог функции (3/3). А сам rsp сдвинули на 176 байт
	mov	QWORD PTR -168[rbp], rdi # по адресу rbp[-168] лежит имя файла для ввода данных 
	mov	QWORD PTR -176[rbp], rsi # по адресу rbp[-176] лежит имя файла для вывода данных
	movabs	rax, 8020745225322717505 
	mov	QWORD PTR -109[rbp], rax # массив char из гласных 
	mov	DWORD PTR -101[rbp], 2035905877
	mov	BYTE PTR -97[rbp], 0
	movabs	rax, 7369688085124309570
	movabs	rdx, 7803729122135926599
	mov	QWORD PTR -160[rbp], rax
	mov	QWORD PTR -152[rbp], rdx
	movabs	rax, 8093089813505076043
	movabs	rdx, 8382451608680821073
	mov	QWORD PTR -144[rbp], rax
	mov	QWORD PTR -136[rbp], rdx
	movabs	rax, 8816491541885843030
	mov	QWORD PTR -128[rbp], rax
	mov	BYTE PTR -120[rbp], 0
	mov	r13d, 0 # переменной count_vowels в си присваиваем 0
	mov	r14d, 0 # переменной count_consonants в си присваиваем 0
	mov	rax, QWORD PTR -168[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx # в rsi передали адрес строки
	mov	rdi, rax # в rdi положили имя файла, из которого будут считываться данные 
	call	fopen@PLT # вызываем функцию fopen
	mov	QWORD PTR -32[rbp], rax # записываем на стек поток, связанный с файлом ввода 
	cmp	QWORD PTR -32[rbp], 0 # проверка на null(в данной интерпретации 0)
	jne	.L2 # если с файлом всё хорошо, то идём к метке L2
	lea	rax, .LC1[rip] # в rax загружаем адрес строки, хранящейся на стеке
	mov	rdi, rax
	call	puts@PLT # если обнуружены проблемы с файлом, то выводим сообщение об ошибке
	jmp	.L1
.L2:
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, 2
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT # вызываем функцию fseek, в esi лежит 0(начальная позиция в файле), в rdi указатель на файловый поток для чтения данных
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	ftello@PLT # вызов функции ftello, в rdi лежит указатель на файловый поток input
	mov	r12, rax # в регистр к12 записали размер строки в файле
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT # закрытие файлового потока, в rdi передали указалетель на файловый поток
	mov	rax, r12
	mov	rdi, rax
	call	malloc@PLT # вызвали функцию динамического выделения памяти (через rdi передали размер, который нужно выделить под строку)
	mov	QWORD PTR -48[rbp], rax # указатель на выделенное место под строку хнранится на стеке по адресу rbp[-48]
	mov	rax, QWORD PTR -168[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT # открываем файл для ввода, при этом в rdi имя файла, в rsi адрес строки
	mov	QWORD PTR -32[rbp], rax # через rax вернули указатель на файловый поток
	mov	QWORD PTR -16[rbp], 0 # на стек поместили 0 по адресу rbp[-16] счётчик цикла
	jmp	.L4 # переход к метке L4
.L5:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fgetc@PLT # читаем символ из файла при помощи fgetc, через rdi передаём указатель на файловый поток
	mov	edx, eax
	mov	rcx, QWORD PTR -16[rbp] 
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rcx # перемещаемся по памяти для обращения к элементам строки
	mov	BYTE PTR [rax], dl # записаваем полученный символ в строку (string в коде на си)
	add	QWORD PTR -16[rbp], 1 # увеличение счётчика цикла на 1
.L4:
	mov	rax, QWORD PTR -16[rbp] 
	cmp	rax, r12 # сравниваем i с размером строки (переменная - file_size в си)
	jl	.L5 # если не достигли длины строки, то переходим к метке L5
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT # закрываем файл, через rdi передаём указатель на файловый поток
	lea	rax, -80[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT # вызов функции clock_gettime, при этом в rsi время работы системы на текущий момент, в edi 1
	mov	QWORD PTR -24[rbp], 0
	jmp	.L6 # Переход к метке L6
.L9:
	mov	rdx, QWORD PTR -24[rbp] 
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx # перемещение указателя в памяти
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	lea	rax, -109[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	strchr@PLT # вызов функции поиска символа в строке, при этом в esi символ, а в rdi строка
	test	rax, rax # проверяем, не равен ли rax 0
	je	.L7 # если 0, то идём к метке L7
	add	r13d, 1 # увеличение кол-ва гласных на 1
.L7:
	mov	rdx, QWORD PTR -24[rbp] 
	mov	rax, QWORD PTR -48[rbp]
	add	rax, rdx # перемещение указателя в памяти
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	lea	rax, -160[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	strchr@PLT # вызов функции поиска символа в строке, при этом в esi символ, а в rdi строка
	test	rax, rax # проврка на 0
	je	.L8 # если 0, то идём к метке L8
	add	r14d, 1 # увеличение кол-ва согласных на 1
.L8:
	add	QWORD PTR -24[rbp], 1 # прибавляем к счётчику 1
.L6:
	mov	rax, QWORD PTR -24[rbp]
	cmp	rax, r12 # сравнение счётчика цикла с кол-вом элементов в файле
	jl	.L9 # если счётчик всё ещё меньше, то переходим к метке L9
	lea	rax, -96[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT # вызов функции clock_gettime, при этом в rsi время работы системы на текущий момент, в edi 1
	mov	rax, QWORD PTR -80[rbp] # время на начало работы алгоритма
	mov	rdx, QWORD PTR -72[rbp] # время на конец работы алгоритма
	mov	rdi, QWORD PTR -96[rbp] 
	mov	rsi, QWORD PTR -88[rbp] 
	mov	rcx, rdx
	mov	rdx, rax
	call	timespecDiff@PLT # вызов функции считающей разницу во времени (в rcx и rdx начало и конец)
	mov	rdx, QWORD PTR time_count[rip] 
	add	rax, rdx # прибавление к глобальной переменной time_count общего времени работы алгоритма
	mov	QWORD PTR time_count[rip], rax 
	mov	rax, QWORD PTR -176[rbp] 
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT # функция, возвращающая указатель на файловый поток (в rdi название файла для вывода данных, в rsi строка, которая указывает на запись в файл)
	mov	QWORD PTR -56[rbp], rax # через регистр rax вернули из функции указатель на файловый поток и записали на стек по адресу rbp[-56]
	mov	edx, r13d # через edx передаём кол-во гласных
	mov	rax, QWORD PTR -56[rbp]
	lea	rcx, .LC4[rip] 
	mov	rsi, rcx # через rsi передаём строку, означает вывод данных в файл 
	mov	rdi, rax # через rdi передаём указатель на файловый поток для записи данных
	mov	eax, 0
	call	fprintf@PLT # вызов функции записи в файлб, для передачи данных используются ругистры edx, rsi, rdi 
	mov	edx, r14d # через edx передаём кол-во согласных
	mov	rax, QWORD PTR -56[rbp] 
	lea	rcx, .LC5[rip]
	mov	rsi, rcx # через rsi передаём строку, означает вывод данных в файл 
	mov	rdi, rax # через rdi передаём указатель на файловый поток
	mov	eax, 0
	call	fprintf@PLT # вызов функции записи в файлб, для передачи данных используются ругистры edx, rsi, rdi 
	mov	rax, QWORD PTR time_count[rip]
	mov	rsi, rax # через rsi передаём время работы алгоритма из условия
	lea	rax, .LC6[rip]
	mov	rdi, rax # через rdi перредаём поясняющую строку
	mov	eax, 0
	call	printf@PLT # вызываем функцию печати данных в консоль (данные передаём в функцию через регистры rsi и rdi)
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	fclose@PLT # вызвали функцию закрытия файлового потока, через rdi передали указатель на файловый поток
.L1:
	leave
	ret
