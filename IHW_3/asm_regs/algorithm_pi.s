	.file	"algorithm_pi.c" # название файла программы
	.intel_syntax noprefix # использование синтаксиса в стиле Intel
	.text
	.section	.rodata
	.align 8
.LC4:
	.string	"Algorithm operation time: %ld\n" # подсказка для пользователя (время работы алгоритма)
	.text
	.globl	algorithm_pi
	.type	algorithm_pi, @function
algorithm_pi:
	endbr64
	push	rbp # /Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # | Пролог функции (2/3). Вместо rbp записали rsp.
	sub	rsp, 80 # \ Пролог функции (3/3). А сам rsp сдвинули на 16 байт
	movsd	xmm0, QWORD PTR .LC0[rip] 
	movsd	QWORD PTR -32[rbp], xmm0 # на стек кладём original_pi по адресу rbp[-32]
	movsd	xmm0, QWORD PTR .LC1[rip] 
	movsd	QWORD PTR -8[rbp], xmm0 # на стек по адресу rbp[-8] кладём not_original_pi
	pxor	xmm0, xmm0
	movq	xmm3, xmm0 # на стек положили sqr_two
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -24[rbp], xmm0 # на стек по адресу rbp[-24] поместили not_result со значением 1
	lea	rax, -64[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT # вызов функции замера времени (переданные параметры указаны выше)
	jmp	.L2 # переход к метке L2
.L3:
	movsd	xmm1, xmm3
	movsd	xmm0, QWORD PTR .LC3[rip] 
	addsd	xmm1, xmm0 # складываем 2+sqr_two
	movq	rax, xmm1
	movq	xmm0, rax # через xmm0 передаём 2+sqr_two
	call	sqrt@PLT # вызов функции sqrt
	movq	rax, xmm0 
	movq	xmm3, rax # положили в sqr_two новый результат
	movsd	xmm0, xmm3
	movsd	xmm1, QWORD PTR .LC3[rip]
	divsd	xmm0, xmm1 # делим sqr_two/2
	movq	xmm2, xmm0 # результат деления помещаем на стек, denominator
	movsd	xmm0, QWORD PTR -24[rbp] 
	mulsd	xmm0, xmm2 # перемножение denominator*not_result
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC3[rip]
	divsd	xmm0, QWORD PTR -24[rbp] # делим 2/not_result
	movsd	QWORD PTR -8[rbp], xmm0 # помещаем результат деления в not_original_pi
.L2:
	movsd	xmm0, QWORD PTR -32[rbp] 
	subsd	xmm0, QWORD PTR -8[rbp] # вычитаю из original_pi - not_original_pi
	movsd	xmm1, QWORD PTR accuracy[rip] 
	comisd	xmm0, xmm1 # сравнивает разность между двумя числами pi и точностью вычислений
	ja	.L3 # если ещё не достигли нужной точности - переходим к метке L3
	lea	rax, -80[rbp] 
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT # вызов функции подсчёта время, окончание алгоритма
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rdi, QWORD PTR -80[rbp]
	mov	rsi, QWORD PTR -72[rbp]
	mov	rcx, rdx # время начала работы алгоритма
	mov	rdx, rax # время окончания работы алгоритма
	call	timespecDiff # вызов функции подсчёта разницы во времени, параметры в rcx и rdx
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rax # через rsi передаём время работы алгоритма
	lea	rax, .LC4[rip]
	mov	rdi, rax # через rdi передаём подсказку для пользователя о времени работы
	mov	eax, 0
	call	printf@PLT # вызов функции печати в консоль (переданные параметры описаны выше)
	movsd	xmm0, QWORD PTR -8[rbp] 
	movq	rax, xmm0
	movq	xmm0, rax # через xmm0 возвращаем значение из функции
	leave
	ret
	.size	algorithm_pi, .-algorithm_pi
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
	.size	timespecDiff, .-timespecDiff
	.section	.rodata
	.align 8
.LC0:
	.long	1412426040
	.long	1074340347
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC3:
	.long	0
	.long	1073741824
