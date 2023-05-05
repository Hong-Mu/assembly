include c:\irvine32\irvine32.inc

.data
myInfo BYTE "19101284, 채홍무",10, 0
prompt BYTE 10, 10, "점수를 입력하세요: ",0
invalid_input BYTE "잘못된 점수를 입력하였습니다.", 0

scores BYTE "ABCDF"

.code
main PROC
	mov edx, OFFSET myInfo
	call WriteString

	input:
		mov esi, OFFSET scores
		mov edx, OFFSET prompt
		call WriteString

		call ReadInt ; 정수 입력 (EAX)

		cmp eax, 90
		jge L2
		inc esi
		
		cmp eax, 80
		jge L2
		inc esi

		cmp eax, 70
		jge L2
		inc esi

		cmp eax, 60
		jge L2
		inc esi

	L2:
		cmp eax, 0
		jl quit

		cmp eax, 100
		jg invalid

		mov al, BYTE PTR [esi]
		call WriteChar

		jmp input
	
	invalid:
		mov edx, OFFSET invalid_input
		call WriteString

		jmp input

	quit:
		exit

main ENDP
END main