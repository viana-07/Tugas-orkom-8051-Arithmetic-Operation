ljmp start

i_ext0:	ljmp j_ext0
	nop
	nop
	nop
	nop
	nop
i_tim0:	ljmp j_tim0
	nop
	nop
	nop
	nop
	nop
i_ext1:	ljmp j_ext1
	nop
	nop
	nop
	nop
	nop
i_tim1:	ljmp j_tim1
	nop
	nop
	nop
	nop
	nop
i_siu:	ljmp j_siu

start:
	mov sp, #70h

	; === ADDITION: 25H + 10H = 35H ===
	mov a, #25h
	add a, #10h
	mov 30h, a
	mov p0, a

	; === SUBTRACTION: 25H - 10H = 15H ===
	mov a, #25h
	clr c
	subb a, #10h
	mov 31h, a
	mov p1, a

	; === MULTIPLICATION: 12H x 04H = 48H ===
	mov a, #12h
	mov b, #04h
	mul ab
	mov 32h, a
	mov 33h, b
	mov p2, a

	; === DIVISION: 25H ÷ 04H = 09H sisa 01H ===
	mov a, #25h
	mov b, #04h
	div ab
	mov 34h, a
	mov 35h, b
	mov p3, a

	jmp ende

j_ext0:	reti
j_tim0:	reti
j_ext1:	reti
j_tim1:	reti
j_siu:	reti

ende:	jmp $
	end
