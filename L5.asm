%include 'functions.asm'	;allows this asm program to call subroutine from external files

section .data
msg db "Hello World! how are you.", 0Ah ;defines bytes in memory for each character in the string and the carriage return

section .txt
global _start: ;tells the program where to start execution

_start:

	mov eax, msg
	call sprint
	call quit
	ret
