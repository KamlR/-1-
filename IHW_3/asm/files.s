	.file	"files.c" # название файла программы
	.intel_syntax noprefix # использование синтаксиса в стиле Intel
	.text
	.section	.rodata
.LC0:
	.string	"r" # строка означает, что файл открыт на чтение
.LC1:
	.string	"Problems with file" # если вдруг при открытии файла возникла ошибка
.LC2:
	.string	"%d" # строка формата
	.text
	.globl	files
	.type	files, @function
files:
	endbr64
	push	rbp # /Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 32 # \ Пролог функции (3/3). А сам rsp сдвинули на 32 байта
	mov	QWORD PTR -24[rbp], rdi # на стек положили название файла для чтения
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx # через rsi передаём "r"
	mov	rdi, rax # через rdi передаём имя файла
	call	fopen@PLT # вызов функции открытия файла (переданные параметры указаны выше )
	mov	QWORD PTR -8[rbp], rax # через rax вернули указатель на поток и положили на стек
	cmp	QWORD PTR -8[rbp], 0 # сравниваем указатель с NULL
	jne	.L2 # если не равно 0, то переходим к L2
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT # вызов функции печати в консоль (через rdi передали строку с информацией для пользователя)
	mov	eax, 0
	jmp	.L4 # переход к метке L4
.L2:
	lea	rdx, -12[rbp] # через rdx передаём ссылку на переменную, в которую читаем данные
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx # через rsi передаём формат строки
	mov	rdi, rax # через rdi передаём указатель на поток
	mov	eax, 0
	call	__isoc99_fscanf@PLT # вызов функции записи в файл (переданные параметры описаны выше)
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT # вызов функции закрытия файла (через rdi передаём указатель поток)
	mov	eax, DWORD PTR -12[rbp] # возвращаемое значение передаём через регистр eax
.L4:
	leave
	ret
