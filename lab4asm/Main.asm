TITLE lab2

.386
.model flat, stdcall
.stack 4096
	ExitProcess PROTO, dwExitCode:DWORD

.data
	a db 10,25,35,17,18,30,15,20,12,1
	a1 db 10 dup(?)
	b db 10
	r dw 5 dup(?)
	max db -128

.code
_main proc
		mov cx, 10
		mov esi, 0

	begin:
		mov al, a[si]
		sub al, b
		cmp al, 0
		jg n1
		neg al
	n1:
		mov a1[si], al
		inc si
		loop begin


		mov bx, 0
		mov cx, 5
	cycle:
		push cx
		mov cx, 10
		mov si, 0
		mov max, -128

		cycle1:
			mov al, a1[si]
			cmp max, al
			jge next
			mov max, al
			mov di, si

			next:
				inc si
				loop cycle1

		mov si, bx
		mov a1[di], -128
		inc di
		mov ax, di
		add si, si
		mov r[si], ax
		inc bx
		pop cx
		loop cycle

	INVOKE ExitProcess, 0
_main ENDP
END _main