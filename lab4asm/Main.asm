TITLE lab2

.386
.model flat, stdcall
.stack 4096
	ExitProcess PROTO, dwExitCode:DWORD

.data
	FirstArr db 53, 55, 87, 85, 82, 78, 49, 39, 98, 4, 95, 38, 41, 81, 53, 89, 10, 74, 40, 2
	SecondArr db 52, 53, 94, -11, -59, 39, -80, 19, 24, 46, -2, -30, 0, 82, 87, 13, -52, 63, 84, 50, 33, 93, -92, -53, 54, 99, -29, -60, 62, -51
	ResultArr db 20 dup(?)
	mindif db 127

.code
_main proc
	comment *дано два целочисленных массива длиной 20 и 30 элементов
	соответственно. для каждого элемента первого массива определить самый 
	близкий элемент второго массива, т. е. такой, для которого значение
	|a[i] - b[j]| минимально.*

	mov ecx, 20
	mov esi, 0

	outer:
		push cx
		mov mindif, 127
		mov edi, 0
		mov ecx, 30

		inner:
			mov al, FirstArr[esi]
			sub al, SecondArr[edi]

			cmp al, 0
			jg greater
			neg al

			greater: cmp al, mindif
			jge skip
			mov mindif, al

			skip:
			inc edi
		loop inner

		mov al, mindif
		mov ResultArr[esi], al
		inc esi

		pop cx
	loop outer

	INVOKE ExitProcess, 0
_main ENDP
END _main