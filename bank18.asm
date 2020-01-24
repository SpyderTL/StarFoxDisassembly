	;Unknown bytes
	DB $18,$00,$E8,$3E,$32,$65,$7F,$98,$B2,$CB,$E5,$FC,$19,$32,$4C,$65
	DB $72,$7F,$8C,$98,$A5,$B2,$BF,$CB,$D8,$E5,$F2,$FC,$FF,$27,$00,$04
	;SPC700 code starts here
	ARCH SPC700
	BASE $0400
CODE_188020:
	clrp
	mov x,#$CF
	mov sp,x
	mov a,#$00
	mov x,a
CODE_188027:
	mov (x)+,a
	cmp x,#$E0
	bne CODE_188027
	mov x,#$00
CODE_18802E:
	mov !$0200+x,a
	inc x
	bne CODE_18802E
CODE_188034:
	mov !$0300+x,a
	inc x
	bne CODE_188034
	inc a
	call !$143F
	asl $A2
	eor a,#$E8
	adc a,$C6C5+y
	bbs d.0,
	
	
	END BASE
	
	
	ARCH 65816
	
