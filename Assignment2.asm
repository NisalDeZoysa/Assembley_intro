;------------ Macro : displayText --------------
%macro displayText 2 
	mov rax,4		; move 4 to rax register to initiate text write
	mov rbx,1		; 0 - standart input (key board), 1 - standard output (console)
	mov rcx, %1		; starting point of the char array
	mov rdx, %2		; size of the char array 
	int 0x80
%endmacro

;-------------- getText Macro -------------------
%macro getText 2
	mov rax,3		; move 4 to rax register to initiate text write
	mov rbx,1		; 0 - standart input (key board), 1 - standard output (console)
	mov rcx, %1		; starting point of the char array
	mov rdx, %2		; size of the char array 
	int 0x80
%endmacro
;------------ Section : Initialized Memory Allocation --------------
section .data

Text1 db "Enter Single Digit Number:", 0;  define number1
Size1 equ $ - Text1 ;

;------------ Section : Uninitialized Memory Allocation ------------
section .bss

input	resb 2 ; input

result1 resb 8 ; result 


;------------ Section : Program Code  ------------------------------
section .text

global _start

_start: 
		mov rsi, 2
		
LOOP:	cmp rsi,0
		je EXITLOOP
		displayText Text1, Size1
		getText input,2
		mov r8b, [input]
		sub r8,0x30
		push r8
		dec rsi
		jmp LOOP

EXITLOOP:		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
exitProgram:
		mov rax, 1 		; System exit call rax = 1 and rbx = 0
		mov rbx, 0
		int 0x80



