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

	; SUB 8-bit
	; 25h - 13h = 12h

	clr c
	mov a, #25h
	subb a, #13h
	mov 31h, a
	mov p1, a

	jmp ende

j_ext0: reti
j_tim0: reti
j_ext1: reti
j_tim1: reti
j_siu: 	reti

ende:	jmp $

	end
