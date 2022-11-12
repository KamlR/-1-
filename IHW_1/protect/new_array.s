	.file	"new_array.c"
	.intel_syntax noprefix # Используем синтаксис в стиле Intel
	.text # Начало секции
	.globl	new_array 
	.type	new_array, @function
new_array:
	endbr64
	push	rbp # / Пролог функции (1/2). Сохранили предыдущий rbp на стек.
	mov	rbp, rsp # \Пролог функции (2/2). Вместо rbp записали rsp.
	mov	QWORD PTR -24[rbp], rdi # из rdi положили по адресу rbp[-24] массив
	mov	DWORD PTR -28[rbp], esi # значение, которое передали в функцию (n) кладём в rbp[-28]
	mov	DWORD PTR -8[rbp], -1 # в rbp[-8] кладём j=-1
	mov	r13d, 0 # в регистр r13d кладём flag=0
	mov	r12d, 0 # в r12d записали счётчик i
	jmp	.L2 # переход к метке L2
.L5:
	mov	eax, r12d
	cdqe
	lea	rdx, 0[0+rax*4] # запись адреса в rdx
	mov	rax, QWORD PTR -24[rbp] # в rax переложили массив
	add	rax, rdx
	mov	eax, DWORD PTR [rax] # в eax поместили элемент массива
	test	eax, eax # выполнение логической операции И
	jle	.L3 # елси элемент будет <= нуля, то переходим сразу к след итерации цикла
	cmp	r13d, 0 # сравнение переменной flag c 0
	jne	.L3 # если флаг не 0, то переходиим к метке, которая перекинет на след. итерацию цикла
	add	r13d, 1 # добавление к переменной flag 1
	mov	eax, r12d 
	mov	DWORD PTR -8[rbp], eax
	jmp	.L4 # переходим к метке L4
.L3:
	add	r12d, 1 # прибавление 1 к счётчику цикла
.L2:
	mov	eax, r12d
	cmp	eax, DWORD PTR -28[rbp] # сравниваем n c i
	jl	.L5 # если i меньше n, то переходим к метке L5
.L4:
	mov	r14d, 0 # переменной index присвоился 0, знчение лежит в регистре r14d
	mov	eax, DWORD PTR -28[rbp] # переменная n помещается в регистр eax
	sub	eax, 1 # отнимаем 1 от n
	mov	r12d, eax # теперь в r12d лежит n-1
	jmp	.L6 # переходим к метке L6
.L8:
	mov	eax, DWORD PTR -8[rbp] # перемещаем j в eax
	cmp	eax, r12d # сравниваем j c переменной из регистра r12d (т.е i)
	je	.L7 # Если i равно j, то идём к метке L7
	mov	eax, r12d
	cdqe
	lea	rdx, 0[0+rax*4] # получение адреса
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax] # получили элемент массива А
	mov	edx, r14d 
	movsx	rdx, edx # в регистр rdx положили переменную index
	lea	rcx, 0[0+rdx*4]
	lea	rdx, B[rip] # в rdx адрес начала массива B
	mov	DWORD PTR [rcx+rdx], eax # кладём в ячейку массива B элемент из регистра eax (т.е элемент массива A)
	add	r14d, 1 # прибавление к переменной index 1
.L7:
	sub	r12d, 1 # отнимаем от i единицу, т.е переходим к след. итерации цикла
.L6:
	cmp	r12d, 0 # переменная цикла i сравнивается с 0
	jns	.L8 # если SF=0 переходим
	mov	eax, r14d # перемещаем в регистр eax наш индекс нужного элемента
	pop	rbp
	ret
