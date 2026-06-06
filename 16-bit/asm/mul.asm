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

	; === MULTIPLICATION 16-bit ===
	; 0012H x 0004H = 0048H
	; method: repeated addition
	;
	; multiplicand = 0012H
	; multiplier   = 0004H
	; result       = 0048H

	; multiplicand low and high
	mov 44h, #12h
	mov 45h, #00h

	; multiplier low and high
	mov 48h, #04h
	mov 49h, #00h

	; result low and high
	mov 46h, #00h
	mov 47h, #00h

mul_loop:
	; check multiplier == 0000H
	mov a, 48h
	orl a, 49h
	jz mul_done

	; result = result + multiplicand
	clr c

	mov a, 46h
	add a, 44h
	mov 46h, a

	mov a, 47h
	addc a, 45h
	mov 47h, a

	; multiplier = multiplier - 1
	mov a, 48h
	jnz dec_low

	dec 49h

dec_low:
	dec 48h

	jmp mul_loop

mul_done:
	mov a, 46h
	mov p0, a

	mov a, 47h
	mov p1, a

	jmp ende

j_ext0:	reti
j_tim0:	reti
j_ext1:	reti
j_tim1:	reti
j_siu:	reti

ende:	jmp $

	end
