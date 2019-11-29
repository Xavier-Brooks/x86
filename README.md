# x86
Upon taking an embedded system class at my university I gained a new appreciation for assembly programming. As a result I sought out a means of learning another assembly language. This project is me following the lessons provided by the website asmtutor to learn x86 assembly on free time.

For this project I used the ubuntu 16.04 command line and nasm assembler to run my programs, Thus the following commands should be used in order to run the program in the command line.
	nasm -f elf "filename.asm" 
	ld -m elf_i386 "filename.o" -o "filename"
	./"filename" 

Below is a link to supportive websites that feature system call and ascii tables that will help with program readability and understanding what bytes control cursor/character editing for programs I write.  

Sys call Table link:http://shell-storm.org/shellcode/files/syscalls.html

Online Ascii Table: http://www.asciitable.com
