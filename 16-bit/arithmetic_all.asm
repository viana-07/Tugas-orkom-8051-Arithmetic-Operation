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

	; === 16-bit ADDITION ===
	; 1234H + 00F2H = 1326H
	; Operand 1 = 12H 34H
	; Operand 2 = 00H F2H
	; Result    = 13H 26H

	clr c

	mov a, #34h
	add a, #0f2h
	mov 40h, a
	mov p0, a

	mov a, #12h
	addc a, #00h
	mov 41h, a
	mov p1, a

	; === 16-bit SUBTRACTION ===
	; 1234H - 00F2H = 1142H
	; Operand 1 = 12H 34H
	; Operand 2 = 00H F2H
	; Result    = 11H 42H

	clr c

	mov a, #34h
	subb a, #0f2h
	mov 42h, a
	mov p2, a

	mov a, #12h
	subb a, #00h
	mov 43h, a
	mov p3, a

	jmp ende

j_ext0:	reti
j_tim0:	reti
j_ext1:	reti
j_tim1:	reti
j_siu:	reti

ende:	jmp $

	end
