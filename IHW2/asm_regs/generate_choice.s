	.file	"generate_choice.c" # название файла программы 
	.intel_syntax noprefix # использование синтаксиса в стиле intel
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"In the generator mode, a random string length and a random string will be obtained" # подсказка пользователю при выводе
.LC1:
	.string	"number of vowels: %d\n" # подсказка пользователю при выводе (кол-во гласных)
.LC2:
	.string	"numbers of consonants: %d\n" # подсказка пользователю при выводе (кол-во согласных)
	.align 8
.LC3:
	.string	"Algorithm operation time: %ld\n" # подсказка пользователю при выводе (время работы алгоритма)
	.text
	.globl	generate_choice
	.type	generate_choice, @function
generate_choice:
	endbr64
	push	rbp # /Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 144 # \ Пролог функции (3/3). А сам rsp сдвинули на 144 байт
	movabs	rax, 8020745225322717505
	mov	QWORD PTR -93[rbp], rax # строка гласных
	mov	DWORD PTR -85[rbp], 2035905877
	mov	BYTE PTR -81[rbp], 0
	movabs	rax, 7369688085124309570
	movabs	rdx, 7803729122135926599
	mov	QWORD PTR -144[rbp], rax # строка согласных
	mov	QWORD PTR -136[rbp], rdx
	movabs	rax, 8093089813505076043
	movabs	rdx, 8382451608680821073
	mov	QWORD PTR -128[rbp], rax
	mov	QWORD PTR -120[rbp], rdx
	movabs	rax, 8816491541885843030
	mov	QWORD PTR -112[rbp], rax
	mov	BYTE PTR -104[rbp], 0
	mov	r13d, 0 # на стек сохранили кол-во гласных, сейчас 0
	mov	r14d, 0 # # на стек сохранили кол-во согласных, сейчас 0
	mov	edi, 0 # переместили в edi 0, null в коде си
	call	time@PLT # вызов функции time, данные передаются через регистр edi
	mov	edi, eax # возвращаемое значение положили в edi
	call	srand@PLT # вызвали функцию srand, данные передаются через регистр edi
	lea	rax, .LC0[rip]
	mov	rdi, rax 
	call	puts@PLT # вызов функции печати на экран, строка для печати передаётся через rdi
	call	rand@PLT # вызов функции rand, не принимает параметров
	movsx	rdx, eax # сгенерированное число поместили к rd
	imul	rdx, rdx, 1374389535 
	shr	rdx, 32 # смещение содержимого в регистре числа на 32 бита вправо
	sar	edx, 5 # смещение содержимого регистра  edx на 5 бит вправо
	mov	ecx, eax
	sar	ecx, 31 # смещение содержимого регистра  edx на 31 бит вправо
	sub	edx, ecx # сложение содержимого регистров edx и ecx
	imul	ecx, edx, 100 # поместили результат умножения на 100 в ecx
	sub	eax, ecx 
	mov	edx, eax
	lea	eax, 1[rdx]
	mov	r12d, eax # на стек записали длину строки
	mov	eax, r12d
	cdqe
	mov	rdi, rax
	call	malloc@PLT # вызов функции malloc, длину строки передаём через rdi
	mov	QWORD PTR -32[rbp], rax # вернули адрес на первый байт памяти строки
	mov	DWORD PTR -12[rbp], 0 # поместили 0 на стек по адресу rbp[-12]
	jmp	.L2 # переходим к метке L2
.L3:
	call	rand@PLT # вызов функции rand, не принимает параметров
	movsx	rdx, eax # возвращаемое значение положили в rdx
	imul	rdx, rdx, -1401515643
	shr	rdx, 32 # содержимое регистра сдивинули на 32 бита вправо
	add	edx, eax # к содержимому регитстра edx добавили содержимое регистра eax
	sar	edx, 6 # арихметический сдвиг содержимого edx вправо на 6 бит
	mov	ecx, eax 
	sar	ecx, 31 # арихметический сдвиг содержимого ecx вправо на 6 бит
	sub	edx, ecx
	imul	ecx, edx, 95 
	sub	eax, ecx
	mov	edx, eax
	lea	eax, 32[rdx] # в eax переместили адрес полученного символа
	mov	DWORD PTR -36[rbp], eax # адрес символа положили на стек по адресу rbp[-36]
	mov	eax, DWORD PTR -12[rbp] 
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -36[rbp]
	mov	BYTE PTR [rax], dl # записали символ в массив символов по адресу нашего счётчика
	add	DWORD PTR -12[rbp], 1 # увеличение счётчка цикла на 1 (в си - i)
.L2:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, r12d # сравнение счётчика цикла с длиной строки
	jl	.L3 # если счётчик цикла всё ещё меньше, то переходим к метке L3
	lea	rax, -64[rbp] 
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT # вызов функции подсчёта времени
	mov	DWORD PTR -16[rbp], 0 # переместили 0 на стек по адресу rbp[-16], счётчик цикла
	jmp	.L4 # переход к метке L4
.L7:
	mov	eax, DWORD PTR -16[rbp] 
	movsx	rdx, eax #  счётчик цикла переместили в rdx
	mov	rax, QWORD PTR -32[rbp] # строку переместили в rax 
	add	rax, rdx
	movzx	eax, BYTE PTR [rax] 
	movsx	edx, al 
	lea	rax, -93[rbp]
	mov	esi, edx # через регистр esi передаём номер символа 
	mov	rdi, rax # через rdi передаём адрес на строку
	call	strchr@PLT # вызов функции поиска элемента в строке 
	test	rax, rax # проверка на null возращаемого значения
	je	.L5 # если null, то идём к метке L5
	add	r13d, 1 # кол-во гласных на 1 увеличили
.L5:
	mov	eax, DWORD PTR -16[rbp]
	movsx	rdx, eax # переместили счётчик цикла в rdx
	mov	rax, QWORD PTR -32[rbp] # строку переместили в rax
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	lea	rax, -144[rbp]
	mov	esi, edx # через регистр esi передаём номер символа 
	mov	rdi, rax # через rdi передаём адрес на строку
	call	strchr@PLT # вызов функции поиска элемента в строке 
	test	rax, rax # проверка на null возращаемого значения
	je	.L6 # если null, то идём к метке L6
	add	r14d, 1 # кол-во согласных на 1 увеличили
.L6:
	add	DWORD PTR -16[rbp], 1 # увеличили счётчик цикла на 1
.L4:
	mov	eax, DWORD PTR -16[rbp] 
	cmp	eax, r12d # сравнение счётчика цикла с длиной строки
	jl	.L7 # если счётчик цикла всё ещё меньше, то переходим к метке L3
	lea	rax, -80[rbp] 
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT # вызов функции замера времени
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rdi, QWORD PTR -80[rbp]
	mov	rsi, QWORD PTR -72[rbp]
	mov	rcx, rdx # время начала работы алгоритма
	mov	rdx, rax # время окончания работы алгоритма
	call	timespecDiff@PLT # вызов функции подсчёта разницы во времени, параметры в rcx и rdx
	mov	rdx, QWORD PTR time_count[rip] 
	add	rax, rdx
	mov	QWORD PTR time_count[rip], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax 
	call	puts@PLT # вызов функции печати в консоль, через rdi передаём строку для печати
	mov	eax, r13d
	mov	esi, eax # кол-во гласных положили в esi
	lea	rax, .LC1[rip]
	mov	rdi, rax # в rdi информация для пользователя 
	mov	eax, 0
	call	printf@PLT # вызов функции печати в консоль, через rdi и esi передаём параметры 
	mov	eax, r14d
	mov	esi, eax # в esi сохранили кол-во гласных
	lea	rax, .LC2[rip]
	mov	rdi, rax # в rdi информация для пользователя 
	mov	eax, 0
	call	printf@PLT # вызов функции печати в консоль, через rdi и esi передаём параметры 
	mov	rax, QWORD PTR time_count[rip]
	mov	rsi, rax # в rsi время работы программы
	lea	rax, .LC3[rip]
	mov	rdi, rax # в rdi информация для пользователя
	mov	eax, 0
	call	printf@PLT # вызов функции печати в консоль, через rdi и rsi передаём параметры
	nop
	leave
	ret
