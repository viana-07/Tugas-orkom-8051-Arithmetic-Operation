	ljmp start

i_ext0: ljmp j_ext0
	nop
	nop
	nop
	nop
	nop

i_tim0: ljmp j_tim0
	nop
	nop
	nop
	nop
	nop

i_ext1: ljmp j_ext1
	nop
	nop
	nop
	nop
	nop

i_tim1: ljmp j_tim1
	nop
	nop
	nop
	nop
	nop

i_siu: 	ljmp j_siu

start:
	mov sp, #70h

	; DIV 8-bit
	; 25h / 04h = 09h remainder 01h

	mov a, #25h
	mov b, #04h
	div ab

	mov 34h, a
	mov 35h, b
	mov p1, a
	mov p2, b

	jmp ende

j_ext0: reti
j_tim0: reti
j_ext1: reti
j_tim1: reti
j_siu: 	reti

ende:	jmp $

	end
