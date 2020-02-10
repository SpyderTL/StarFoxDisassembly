	;Unknown bytes
	DB $18,$00,$E8,$3E,$32,$65,$7F,$98,$B2,$CB,$E5,$FC,$19,$32,$4C,$65
	DB $72,$7F,$8C,$98,$A5,$B2,$BF,$CB,$D8,$E5,$F2,$FC,$FF,$27,$00,$04
	;SPC700 code starts here
	ARCH SPC700
	BASE $0400
SPC700Start:
	clrp
	mov x,#$CF
	mov sp,x
	mov a,#$00
	mov x,a
SPC700ClearZeroPage:
	mov (x)+,a
	cmp x,#$E0
	bne SPC700ClearZeroPage
	mov x,#$00
SPC700ClearPage2:
	mov $0200+x,a
	inc x
	bne SPC700ClearPage2
SPC700ClearPage3:
	mov $0300+x,a
	inc x
	bne SPC700ClearPage3
	inc a
	call SPC700_0B14
	set5 $48
	mov a,#$96
	mov $03C6,a
	mov a,#$BB
	mov $03CB,a
	call SPC700_0648
	mov a,#$60
	mov y,#$0C
	call SPC700_060D
	mov y,#$1C
	call SPC700_060D
	mov a,#$F0
	mov $00F1,a
	mov a,#$10
	mov $00FA,a
	mov $53,a
	mov a,#$01
	mov $00F1,a
SPC700_0451:
	mov y,#$0A
	cmp y,#$05
	beq SPC700_045E
	bcs SPC700_0461
	cmp ($4C),($4D)
	bne SPC700_046F
SPC700_045E:
	bbs7 $4C,SPC700_046F
SPC700_0461:
	mov a,$0E9B+y
	mov $00F2,a
	mov a,$0EA5,y
	mov x,a
	mov a,(x)
	mov $00F3,a
SPC700_046F:
	dbnz y,$0453
	mov $45,y
	mov $46,y
	mov a,$18
	eor a,$19
	lsr a
	lsr a
	notc
	ror $18
	ror $19
SPC700_0480:
	mov y,$00FD
	beq SPC700_0480
	push y
	mov a,#$38
	mul ya
	clrc
	adc a,$43
	mov $43,a
	bcc SPC700_04B6
	call SPC700_257C
	mov x,#$01
	call SPC700_04ED
	call SPC700_2749
	mov x,#$02
	call SPC700_04ED
	call SPC700_2A1A
	cmp ($4C),($4D)
	beq SPC700_04B6
	inc $03C7
	mov a,$03C7
	lsr a
	bcs SPC700_04B6
	inc $4C
SPC700_04B6:
	mov a,$53
	pop y
	mul ya
	clrc
	adc a,$51
	mov $51,a
	bcc SPC700_04D1
	mov a,$03F8
	bne SPC700_04CE
	call SPC700_07D5
	mov x,#$00
	call SPC700_04FE
SPC700_04CE:
	jmp SPC700_0451
SPC700_04D1:
	mov a,$04
	beq SPC700_04E7
	mov x,#$00
	mov $47,#$01
SPC700_04DA:
	mov a,$31+x
	beq SPC700_04E1
	call SPC700_0DC4
SPC700_04E1:
	inc x
	inc x
	asl $47
	bne SPC700_04DA
SPC700_04E7:
	call SPC700_0614
	jmp SPC700_0451
	
SPC700_04ED:
	mov a,$04+x
	mov $00F4+x,a
SPC700_04F2:
	mov a,$00F4+x
	cmp a,$00F4+x
	bne SPC700_04F2
	mov y,a
	mov $00+x,y
SPC700_04FD:
	ret
	
SPC700_04FE:
	mov a,$04+x
	mov $00F4+x,a
SPC700_0503:
	mov a,$00F4+x
	cmp a,$00F4+x
	bne SPC700_0503
	mov y,a
	mov a,$08+x
	mov $08+x,y
	cbne $08+x,SPC700_0515
	mov y,#$00
SPC700_0515:
	mov $00+x,y
	ret
	
SPC700_0518:
	cmp y,#$CA
	bcc SPC700_0521
	call SPC700_0932
	mov y,#$A4
	cmp y,#$C8
	bcs SPC700_04FD
	mov a,$1A
	and a,$47
	bne SPC700_04FD
	mov a,y
	and a,#$7F
	clrc
	adc a,$50
	clrc
	adc a,$02F0+x
	mov $0361+x,a
	mov a,$0381+x
	mov $0360+x,a
	mov a,$02B1+x
	lsr a
	mov a,#$00
	ror a
	mov $02A0+x,a
	mov a,#$00
	mov $B0+x,a
	mov $0100+x,a
	mov $02D0+x,a
	mov $C0+x,a
	or ($5E),($47)
	or ($45),($47)
	mov a,$0280+x
	mov $A0+x,a
	beq SPC700_057F
	mov a,$0281+x
	mov $A1+x,a
	mov a,$0290+x
	bne SPC700_0575
	mov a,$0361+x
	setc
	sbc a,$0291+x
	mov $0361+x,a
SPC700_0575:
	mov a,$0291+x
	clrc
	adc a,$0361+x
	call SPC700_0B9B
SPC700_057F:
	call SPC700_0BB3
	mov y,#$00
	mov a,$11
	setc
	sbc a,#$34
	bcs SPC700_0594
	mov a,$11
	setc
	sbc a,#$13
	bcs SPC700_0598
	dec y
	asl a
SPC700_0594:
	addw ya,$10
	movw $10,ya
SPC700_0598:
	push x
	mov a,$11
	asl a
	mov y,#$00
	mov x,#$18
	div ya,x
	mov x,a
	mov a,$0EB1+y
	mov $15,a
	mov a,$0EB0+y
	mov $14,a
	mov a,$0EB3+y
	push a
	mov a,$0EB2+y
	pop y
	subw ya,$14
	mov y,$10
	mul ya
	mov a,y
	mov y,#$00
	addw ya,$14
	mov $15,y
	asl a
	rol $15
	mov $14,a
	bra SPC700_05CB
SPC700_05C7:
	lsr $15
	ror a
	inc x
SPC700_05CB:
	cmp x,#$06
	bne SPC700_05C7
	mov $14,a
	pop x
	mov a,$0220+x
	mov y,$15
	mul ya
	movw $16,ya
	mov a,$0220+x
	mov y,$14
	mul ya
	push y
	mov a,$0221+x
	mov y,$14
	mul ya
	addw ya,$16
	movw $16,ya
	mov a,$0221+x
	mov y,$15
	mul ya
	mov y,a
	pop a
	addw ya,$16
	movw $16,ya
	mov a,x
	xcn a
	lsr a
	or a,#$02
	mov y,a
	mov a,$16
	call SPC700_0605
	inc y
	mov a,$17
SPC700_0605:
	push a
	mov a,$47
	and a,$1A
	pop a
	bne SPC700_0613
	mov $00F2,y
	mov $00F3,a
SPC700_0613:
	ret
	
SPC700_0614:
	dec $D0
	mov a,$D0
	and a,#$03
	mov y,#$3F
	mul ya
	mov y,a
	mov $12,#$07
SPC700_0621:
	inc y
	mov x,#$04
SPC700_0624:
	movl c,$0019,6
	eorl c,$0019,5
	rol $18
	rol $19
	mov a,$19
	and a,$03CB
	or a,#$11
	mov $FE00+y,a
	inc y
	mov a,$18
	or a,#$11
	mov $FE00+y,a
	inc y
	dec x
	bne SPC700_0624
	dbnz $12,SPC700_0621
	ret
	
SPC700_0648:
	mov y,#$00
	mov x,#$1B
	mov a,$03C6
SPC700_064F:
	mov $FE00+y,a
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	dec x
	bne SPC700_064F
	inc a
	mov $FE00+y,a
	mov y,#$FE
	mov a,#$00
	mov $3C80,a
	mov $3C81,y
	mov $3C82,a
	mov $3C83,y
	mov a,$18
	or a,$19
	bne SPC700_067A
	inc $18
SPC700_067A:
	ret
	
SPC700_067B:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	END BASE
	ARCH 65816
	;18A81F
	
	
	;Waves
	
