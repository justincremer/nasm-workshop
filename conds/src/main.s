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
	print msg, msg_len
	mov ecx, [num1]
	cmp ecx, [num2]
	jg comp_third
	mov ecx, [num2]
	call comp_third

comp_third:
	cmp ecx, [num3]
	jg _exit
	mov ecx, [num3]    ; set num3 if > ecx
	call _exit
	
_exit:
	mov edx, 2
	int 0x80             ; print ecx (largest number)
	print nl, nl_len     ; print newline
	
	mov eax, 1	         ; system call number (sys_exit)
	int 0x80	         ; call kernel
	
section	.data
	msg db "The largest number is: ",
	msg_len equ $ - msg
	
	nl db 0xA, 0xD
	nl_len equ $ - nl

	num1 dd '100'
	num2 dd '50'
	num3 dd '150'
	
section	.bss

