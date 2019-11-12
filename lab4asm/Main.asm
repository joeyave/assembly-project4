TITLE lab2

.386
.model flat, stdcall
.stack 4096
	ExitProcess PROTO, dwExitCode:DWORD

.data
	FirstArr db -128, 55, 87, 85, 82, 78, 49, 39, 98, 4, 95, 38, 41, 81, 53, 89, 10, 74, 40, 2
	SecondArr db 127, 53, 94, -11, -59, 39, -80, 19, 24, 46, -2, -30, 0, 82, 87, 13, -52, 63, 84, 50, 33, 93, -92, -53, 54, 99, -29, -60, 62, -51
	ResultArr dw 20 dup(?)
	MinDif dw ?

.code
_main proc
	comment *дано два целочисленных массива длиной 20 и 30 элементов
	соответственно. для каждого элемента первого массива определить самый 
	близкий элемент второго массива, т. е. такой, для которого значение
	|a[i] - b[j]| минимально.*

	mov ecx, 20
	mov esi, 0

	outer:
		push ecx
		mov MinDif, 255
		mov edi, 0
		mov ecx, 30

		inner:
			movsx ax, FirstArr[esi]
			movsx bx, SecondArr[edi]
			sub ax, bx

			cmp ax, 0
			jg greater
			neg ax

			greater: cmp ax, MinDif
			jg skip
			mov MinDif, ax
			mov edx, edi
			skip:
			inc edi
		loop inner

		movsx ax, SecondArr[edx]
		mov ResultArr[esi], ax

		inc esi
		pop ecx
	loop outer

	INVOKE ExitProcess, 0
_main ENDP
END _main