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

	; === SUBTRACTION 16-bit ===
	; 1234H - 00F2H = 1142H
	; low byte  : 34H - F2H = 42H, borrow = 1
	; high byte : 12H - 00H - borrow = 11H

	clr c

	mov a, #34h
	subb a, #0f2h
	mov 42h, a
	mov p0, a

	mov a, #12h
	subb a, #00h
	mov 43h, a
	mov p1, a

	jmp ende

j_ext0:	reti
j_tim0:	reti
j_ext1:	reti
j_tim1:	reti
j_siu:	reti

ende:	jmp $

	end
