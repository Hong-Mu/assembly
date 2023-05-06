COMMENT	!
	배열을 16진수 단위로 왼쪽으로 이동시키는 프로그램
!

include c:\irvine32\irvine32.inc

.data
array DWORD 648B2165h, 8C943A29h, 6DFA4B86h, 91F76C04h, 8BAF9857h
line_break BYTE 10, 0

.code
shld_example PROC
	mov		bl, 4
	mov		esi, OFFSET array
	mov		ecx, (LENGTHOF array) - 1

	mov		edx, OFFSET line_break

L1:	push	ecx
	mov		eax, [esi + TYPE DWORD]
	mov		cl, bl
	shld	[esi], eax, cl

	push	eax							; 중간 결과 출력
	mov		eax, [esi]
	call	WriteHex
	call	WriteString
	pop		eax

	add		esi, TYPE DWORD
	pop		ecx
	loop	L1

	shl		DWORD PTR [esi], 4
	
	exit

shld_example ENDP

END shld_example