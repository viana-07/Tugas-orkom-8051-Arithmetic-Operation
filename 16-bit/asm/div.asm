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

	; === DIVISION 16-bit ===
	; 0025H / 0004H = 0009H remainder 0001H
	; method: repeated subtraction
	;
	; dividend  = 0025H
	; divisor   = 0004H
	; quotient  = 0009H
	; remainder = 0001H

	; remainder = dividend
	mov 50h, #25h
	mov 51h, #00h

	; divisor
	mov 52h, #04h
	mov 53h, #00h

	; quotient
	mov 54h, #00h
	mov 55h, #00h

div_loop:
	; temp = remainder - divisor
	clr c

	mov a, 50h
	subb a, 52h
	mov 56h, a

	mov a, 51h
	subb a, 53h
	mov 57h, a

	; if borrow, remainder < divisor, division is done
	jc div_done

	; remainder = temp
	mov a, 56h
	mov 50h, a

	mov a, 57h
	mov 51h, a

	; quotient = quotient + 1
	inc 54h
	mov a, 54h
	jnz div_loop

	inc 55h
	jmp div_loop

div_done:
	; output quotient
	mov a, 54h
	mov p0, a

	mov a, 55h
	mov p1, a

	; output remainder
	mov a, 50h
	mov p2, a

	mov a, 51h
	mov p3, a

	jmp ende

j_ext0:	reti
j_tim0:	reti
j_ext1:	reti
j_tim1:	reti
j_siu:	reti

ende:	jmp $

	end
