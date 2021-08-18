%macro print 2
	mov edx, %2          ; length 
	mov ecx, %1			 ; text
	mov ebx, 1	         ; file descriptor (stdout)
	mov eax, 4	         ; system call number (sys_write)
	int 0x80	         ; call kernel
%endmacro

section	.text
global _start

_start:
	mov ecx, [num1]
	mov edx, [num2]
	call comp_move

	mov edx, [num3]	
	call comp_move
	
	mov [largest], ecx
	call _exit

comp_move:
	cmp ecx, edx
	jg _skip
	mov ecx, edx

_skip:

_exit:
	print msg, msg_len
	print largest, 2
	print nl, nl_len	

	mov eax, 1     		 ; sys_exit
	int 80h

section	.data
	msg db "The largest digit is: ", 
	msg_len equ $ - msg

	nl db 0xA, 0xD
	nl_len equ $ - nl
	
	num1 dd '31'
	num2 dd '22'
	num3 dd '47'

segment .bss
	largest resb 2

