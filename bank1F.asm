

	
	ORG $1FBDB0
CODE_1FBDB0:
	rtl
DoReset:		;1FBDB1
	sei			; Disable interrupts
	clc			;\Disable emulation mode
	xce			;/
	rep #$30
	lda #$0000		;\Clear D register
	tad			;/
	ldx #$02FF		;\Set stack pointer to $02FF
	txs			;/
	sep #$30
	pha			;\Set DBR to 0
	plb			;/
	sep #$30
	jsl ClearRegisters
	jsr $BE41
	rep #$10
	ldx #$02FF		;\Set stack pointer to $02FF (again?)
	txs			;/
	sep #$30
	jsl CODE_02E266
	jsl CODE_1FF51C
	jsl CODE_1FF45D
	sep #$20
	lda #$00
	sta $7EA05A
	lda #$00
	sta $1FDF
	bra DoResetPart2
CODE_1FBDEE:		;1FBDEE
	rep #$30
	clc			;\Disable emulation mode
	xce			;/
	lda #$0000		;\Clear D register
	tad			;/
	ldx #$02FF		;\Set stack pointer to $02FF
	txs			;/
	sep #$30
	sei			; Disable interrupts
	jsl ClearRegisters
	
	lda $0016D8		;\Save some values on the stack before calling
	pha			;|
	lda $1FDF		;|
	pha			;|
	lda $7EA05A		;|
	pha			;|
	lda $1F0F		;|
	pha			;/
	jsr ClearRAM
	pla			;\Restore our saved values
	sta $1F0F		;|
	pla			;|
	sta $7EA05A		;|
	pla			;|
	sta $1FDF		;|
	pla			;|
	sta $0016D8		;/
	
	lda #$01
	sta $1F65
	sta $7EF0B3
	jsl CODE_02E266
DoResetPart2:
	jsl CODE_1FF963
	jsl CODE_02E266
	jmp Main	;03BDDF

ClearRAM:		;1FBE41
	php			; Save processor status
	sep #$20
	lda #$7E		;\Set DBR to $7E
	pha			;|
	plb			;/
	rep #$30
	ldx #$2000
ClearRAM_L1:			;\Clear page $7E from $2000-$FFFF
	stz $0000,x		;|
	stz $0002,x		;|
	stz $0004,x		;|
	stz $0006,x		;|
	txa			;|
	clc			;|
	adc #$0008		;|
	tax			;|
	bne ClearRAM_L1		;/
	sep #$20
	lda #$7F		;\Set DBR to $7F
	pha			;|
	plb			;/
	rep #$20
ClearRAM_L2:			;\Clear all of page $7F
	stz $0000,x		;|
	stz $0002,x		;|
	stz $0004,x		;|
	stz $0006,x		;|
	txa			;|
	clc			;|
	adc #$0008		;|
	tax			;|
	bne ClearRAM_L2		;/
	sep #$20
	lda #$70		;\Set DBR to $70
	pha			;|
	plb			;/
	rep #$30
ClearRAM_L3:			;\Clear page $70 from $0000-$7FFF
	stz $0000,x		;|
	stz $0002,x		;|
	stz $0004,x		;|
	stz $0006,x		;|
	txa			;|
	clc			;|
	adc #$0008		;|
	tax			;|
	bpl ClearRAM_L3		;/
	sep #$20
	lda #$00		;\Set DBR to $00
	pha			;|
	plb			;/
	rep #$20
	ldx #$1CF8
ClearRAM_L4:			;\Clear page $00 from $1FF8-$82FF
	stz $0300,x		;|
	stz $0302,x		;|
	stz $0304,x		;|
	stz $0306,x		;|
	txa			;|
	clc			;|
	adc #$0008		;|
	tax			;|
	bpl ClearRAM_L4		;/
	ldx #$00FE
ClearRAM_L5:			;\Clear zero page
	stz $00,x		;|
	dex			;|
	dex			;|
	bpl ClearRAM_L5		;/
	jsl $1FFDFB
	sep #$20
	lda STAT78
	and #$10
	sta $16F6
	plp			;\Restore processor status and return
	rts			;/
ClearRegisters:		;1FBED4
	sei
	lda #$01
	sta $16DB
	jsl $03BD8D
	sep #$30
	lda #$00
	sta $16DB
	jsl $03BD8D
	sep #$30
	lda #$8F
	sta INIDISP
	lda #$00		; Why not just use stz here?
	sta OBSEL
	sta OAMADDL
	sta OAMADDH
	sta BGMODE
	sta MOSAIC
	sta BG1SC
	sta BG2SC
	sta BG3SC
	sta BG4SC
	sta BG12NBA
	sta BG34NBA
	sta BG1HOFS
	sta BG1HOFS
	sta BG1VOFS
	sta BG1VOFS
	sta BG2HOFS
	sta BG2HOFS
	sta BG2VOFS
	sta BG2VOFS
	sta BG3HOFS
	sta BG3VOFS
	sta BG3VOFS
	sta BG4HOFS
	sta BG4HOFS
	sta BG4VOFS
	sta BG4VOFS
	ldx #$80
	stx VMAIN
	sta VMADDL
	sta VMADDH
	sta M7SEL
	ldx #$01
	sta M7A
	stx M7A
	sta M7B
	sta M7B
	sta M7C
	sta M7C
	sta M7D
	stx M7D
	sta M7X
	sta M7X
	sta M7Y
	sta M7Y
	sta CGADD
	sta CGDATA
	sta W12SEL
	sta W34SEL
	sta WOBJSEL
	sta WH0
	sta WH1
	sta WH2
	sta WH3
	sta WBGLOG
	sta WOBJLOG
	sta TM
	sta TS
	sta TMW
	ldy #$30
	sty CGWSEL
	sta CGADSUB
	ldx #$E0
	stx COLDATA
	sta SETINI
	sta NMITIMEN
	ldx #$FF
	stx WRIO
	sta WRMPYA
	sta WRMPYB
	sta WRDIVL
	sta WRDIVH
	sta WRDIVB
	sta HTIMEL
	sta HTIMEH
	sta VTIMEL
	sta VTIMEH
	sta MDMAEN
	sta HDMAEN
	sta MEMSEL
	rtl
CODE_1FBFDB:
	rtl
CODE_1FBFDC:
	jsr CODE_1FBFE0
	rtl
CODE_1FBFE0:
	phx
	phy
	php
	jsl $1FDBA4
	rep #$20
	phx
	txa
	ldx $121D
CODE_1FBFEE:
	cmp D,$19,x
	bne CODE_1FBFF4
	stz D,$19,x
CODE_1FBFF4:
	cmp D,$06,x
	bne CODE_1FBFFA
	stz D,$06,x
CODE_1FBFFA:
	cmp $1CDD,x
	bne CODE_1FC002
	stz $1CDD,x
CODE_1FC002:
	cmp D,$1B,x
	bne CODE_1FC008
	stz D,$1B,x
CODE_1FC002:
	ldy D,$00,x
	tyx
	bne CODE_1FBFEE
	plx
	jsl $0AFB8E
	ldy D,$02,x
	bne CODE_1FC023
	ldy D,$00,x
	sty $121D
	lda #$0000
	sta $0002,y
	bra CODE_1FC031
CODE_1FC023:
	phx
	lda D,$00,x
	tax
	stx D,$00,y
	cmp #$0000
	beq CODE_1FC030
	sty D,$02,x
CODE_1FC030:
	plx
CODE_1FC031:
	lda $121F
	sta D,$00,x
	stx $121F
	plp
	ply
	plx
	rts
CODE_1FC03D:
	php
	rep #$30
	stz $1EFB
	ldx $121D
	beq CODE_1FC09D
	ldy #$0000
CODE_1FC04B:
	phx
	lda D,$2E,x
	and #$0004
	bne CODE_1FC097
	lda D,$1E,x
	and #$0001
	bne CODE_1FC097
	lda D,$2A,x
	and #$00FF
	beq CODE_1FC097
	lda D,$08,x
	bit #$0001
	bne CODE_1FC097
	phx
	lda D,$04,x
	tyx
	tay
	pla
	sta $7E2EC4,x
	lda $0008,y
	sta $7E2EC6,x
	lda $000A,x
	sta $7E2EC8,x
	lda $000C,x
	sta $7E2ECA,x
	lda $000E,x
	sta $7E2ECC,x
	inc
	xce
	asl $188A,x
	adc #$000A
	tay
CODE_1FC097:
	plx
	lda D,$00,x
	tax
	bne CODE_1FC04B
	plp
	rtl
CODE_1FC09F:
	lda D,$14,x
	sta D,$7E
	phb
	stx D,$76
	sty D,$78
	stz D,$08
	stz D,$09
	lda D,$13,x
	tax
	sep
	lda #$00
	pha
	plb
	lda $98A5,x
	sta D,$7A
	lda $98E5,x
	sta D,$7B
	lda D,$7E
	bmi CODE_1FC0D8
	asl
	sta WRMPYA
	lda D,$7A
	bmi CODE_1FC0FA
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC108
CODE_1FC0D8:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D,$7A
	bmi CODE_1FC0EA
	sta WRMPYB
	nop
	jmp CODE_1FC102
CODE_1FC0EA:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC108
CODE_1FC0F8:
	lda #$00
	sec
	sbc RDMPYH
CODE_1FC108:
	tax
	ldx #$00
	sta D,$02
	cmp #$00
	bpl CODE_1FC112
	dex
CODE_1FC112:
	stx D,$03
	lda D,$7E
	bmi CODE_1FC12D
	asl
	sta WRMPYA
	lda D,$7B
	bmi CODE_1FC14F
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC15D
CODE_1FC12D:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D,$7B
	bmi CODE_1FC13F
	sta WRMPYB
	nop
	jmp CODE_1FC157
CODE_1FC13F:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC15D
CODE_1FC14F:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
CODE_1FC157:
	lda #$00
	sec
	sbc RDMPYH
CODE_1FC15D:
	tax
	ldx #$00
	sta D,$90
	cmp #$00
	bpl CODE_1FC167
	dex
CODE_1FC167:
	stx D,$91
	rep #$10
	ldx D,$78
	ldy D,$78
	plb
	rtl
CODE_1FC171:
	lda D,$15,x
	sta D,$7E
	lda D,$13,x
CODE_1FC177:
	stx D,$76
	sty D,$78
	stz D,$08
	stz D,$09
	eor #$FF
	inc
	tax
	sep #$10
	phb
	lda #$00
	pha
	plb
	inx
	iny
	lda $98A5,x				;Sine8 Table
	sta D,$7A
	lda $98E5,x				;Sine8 Table + 0x40
	sta D,$7B
CODE_1FC196:
	lda D,$7E
	bmi CODE_1FC1AF
	asl
	sta WRMPYA
	lda D,$7A
	bmi CODE_1FC1D1
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC1DF
CODE_1FC1AF:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D,$7A
	bmi CODE_1FC1C1
	sta WRMPYB
	nop
	jmp CODE_1FC1D9
CODE_1FC1C1:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC1DF
CODE_1FC1D1:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
CODE_1FC1D9:
	lda #$00
	sec
	sbc RDMPYH
CODE_1FC1DF:
	tax
	ldx #$00
	sta D,$02
	cmp #$00
	bpl CODE_1FC1E9
	dex
CODE_1FC1E9:
	stx D,$03
	lda D,$7E
	bmi CODE_1FC204
	asl
	sta WRMPYA
	lda D,$7B
	bmi CODE_1FC226
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC234
CODE_1FC204:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D,$7B
	bmi CODE_1FC216
	sta WRMPYB
	nop
	jmp CODE_1FC22E
CODE_1FC216:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC234
CODE_1FC226:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
CODE_1FC22E:
	lda #$00
	sec
	sbc RDMPYH
CODE_1FC234:
	tax
	ldx #$00
	sta D,$90
	cmp #$00
	bpl CODE_1FC23E
	dex
CODE_1FC23E:
	stx D,$91
	rep #$10
	ldx D,$76
	ldy D,$78
	plb
	rtl
CODE_1FC248:
	lda D,$15,x
	sta D,$7E
	stz D,$03
	stz D,$09
	stz D,$91
	stx D,$76
	sty D,$78
	lda D,$13,x
	tay
	lda D,$12,x
	eor #$FF
	inc
	tax
	sep #$10
	phb
	lda #$00
	pha
	plb
	lda.w SineTable8,y
	sta D,$7A
	lda.w SineTable8+$40,y
	sta D,$7B
	lda.w SineTable8,x
	sta D,$82
	lda.w SineTable8+$40,x
	sta D,$83
	lda D,$7E
	bmi CODE_1FC293
	asl
	sta WRMPYA
	lda D,$7A
	bmi CODE_1FC2B5
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC2C3
CODE_1FC293:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D,$7A
	bmi CODE_1FC2A5
	sta WRMPYB
	nop
	jmp CODE_1FC2BD
CODE_1FC2A5:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC2C3
CODE_1FC2B5:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
CODE_1FC2BD:
	lda #$00
	sec
	sbc RDMPYH
CODE_1FC2C3:
	tax
	sta D,$02
	lda D,$02
	bmi CODE_1FC2DF
	asl
	sta WRMPYA
	lda D,$83
	bmi CODE_1FC301
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC30F
CODE_1FC2DF:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D,$83
	bmi CODE_1FC2F1
	sta WRMPYB
	nop
	jmp CODE_1FC309
CODE_1FC2F1:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC30F
CODE_1FC301:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
CODE_1FC309:
	lda #$00
	sec
	sbc RDMPYH
CODE_1FC30F:
	tax
	sta D,$02
	cmp #$00
	bpl CODE_1FC318
	dec D,$03
CODE_1FC318:
	lda D,$7E
	bmi CODE_1FC331
	asl
	sta WRMPYA
	lda D,$7B
	bmi CODE_1FC353







	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC361
CODE_1FC331:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D,$7B
	bmi CODE_1FC343
	sta WRMPYB
	nop
	jmp CODE_1FC35B
CODE_1FC343:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC361
CODE_1FC353:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda #$00
	sec
	sbc RDMPYH
	tax
	sta D, $90
	lda D, $90
	bmi CODE_1FC37D
	asl
	sta WRMPYA
	lda D, $83
	bmi CODE_1FC39F
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC3AD
CODE_1FC37D:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D,#$83
	bmi CODE_1FC38F
	sta WRMPYB
	nop
	jmp CODE_1FC3A7
CODE_1FC38F:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC3AD
CODE_1FC39F:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda #$00
	sec
	sbc RDMPYH
	tax
	sta D, $90
	cmp #$00
	bpl CODE_1FC3B6
	dec D, $91
	lda D, $7E
	bmi CODE_1FC3CF
	asl
	sta WRMPYA
	lda D, $82
	bmi CODE_1FC3F1
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC3FF
CODE_1FC3CF:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, $82
	bmi CODE_1FC3E1
	sta WRMPYB
	nop
	jmp CODE_1FC3F9
CODE_1FC3E1:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC3FF
CODE_1FC3F1:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda #$00
	sec
	sbc RDMPYH
	tax
	sta D, $08
	cmp #$00
	bpl CODE_1FC408
	dec D, $09
	rep $10
	ldx D, $76
	ldy D, $78
	plb
	rtl

CODE_1FC410:
	lda D, $15, X
	sta D, $7E
	lda D, $13
	sta $15A7
	lda D, #12
	sta $15A6
	stz D, $03
	stz D, $09
	stz D, $91
	stx D, $76
	sty D, $78
	phb
	lda #$00
	pha
	plb
	lda $15A7
	eor #$ff
	inc
	tay
	lda $15A6
	tax
	sep #$10
	lda $98A5, Y		; Sine8 Table
	sta D, $7A
	lda $98E5, Y		; Sine8 Table + 0x40
	sta D, $7B
	lda $98A5, X		; Sine8 Table
	sta D, $82
	lda $98E5, X		; Sine8 Table + 0x40
	sta D, $83
	lda D, $7E
	bmi CODE_1FC467
	asl
	sta WRMPYA
	lda D, $7A
	bmi CODE_1FC489
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC497
CODE_1FC467:
	eor #$ff
	inc
	asl
	sta WRMPYA
	lda D, $7A
	bmi CODE_1FC479
	sta WRMPYB
	nop
	jmp CODE_1FC491
CODE_1FC479:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC497
CODE_1FC489:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda #$00
	sec
	sbc RDMPYH
	tax
	sta D, $02
	lda D, $02
	bmi CODE_1FC4B3
	asl
	sta WRMPYA
	lda D, $83
	bmi CODE_1FC4D5
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC4E3
CODE_1FC4B3:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, $83
	bmi CODE_1FC4C5
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC4E3
CODE_1FC4D5:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	sta #$00
	sec
	sbc RDMPYH
	tax
	sta D, $02
	cmp #$00
	bpl CODE_1FC4EC
CODE_1FC4EA:
	dec D, $03
	lda D, $7E
	bmi CODE_1FC505
	asl
	sta WRMPYA
	lda D, $7B
	bmi CODE_1FC527
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC535
CODE_1FC505:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, $7B
	bmi CODE_1FC517
	sta WRMPYB
	nop
	jmp CODE_1FC52F
CODE_1FC517:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC535
CODE_1FC527:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda #$00
	sec
	sbc RDMPYH
	tax
	sta D, $90
	lda D, $90
	bmi CODE_1FC551
	asl
	sta WRMPYA
	lda D, $83
	bmi CODE_1FC573
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC581
CODE_1FC551:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, $83
	bmi CODE_1FC563
	sta WRMPYB
	nop
	jmp CODE_1FC57B
CODE_1FC563:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_!FC581
CODE_1FC573:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	sta #$00
	sec
	sbc RDMPYH
	tax
	sta D, $90
	cmp #$00
	bpl CODE_!FC58A
	dec D, $91
	lda D, $7E
	bmi CODE_1FC5A3
	asl
	sta WRMPYA
	lda D, $82
	bmi CODE_1FC5C5
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC5D3
CODE_1FC5A3:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, $82
	bmi CODE_1FC5B5
	sta WRMPYB
	nop
	jmp CODE_1FC5CD
CODE_1FC5B5:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC5D3
CODE_1FC5C5:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	sta #$00
	sec
	sbc RDMPYH
	tax
	sta D, $08
	cmp #$00
	bpl CODE_1FC5DC
	dec D, $09
	rep #$10
	stx D, $76
	sty D, $78
	plb
	rtl

CODE_1FC5E4:
	sta D, $7E
	stx D, $76
	sty D, $78
	stz D, $08
	stz D, $09
	sec
	lda #$40
	sbc D, $13, X
	tax
	sep #$10
	phb
	lda #$00
	pha
	plb
	inx
	lda $98A5, X
	sta D, $7A
	lda $98E5, X
	sta D, $7B
	lda D, $7E
	bmi CODE_1FC61F
	asl
	sta WRMPYA
	lda D, $7A
	bmi CODE_1FC641
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC64F
CODE_1FC61F:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, $7A
	bmi CODE_1FC631
	sta WRMPYB
	nop
	jmp CODE_1FC649
CODE_1FC631:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC64F
CODE_1FC641:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda #$00
	sec
	sbc RDMPYH
	tax
	ldx #$00
	sta D, $02
	cmp #$00
	bpl CODE_1FC659
	dex
	stx D, $03
	lda D, $7E
	bmi CODE_1FC674
	asl
	sta WRMPYA
	lda D, $7B
	bmi CODE_1FC696
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC6A4
CODE_1FC674:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, 7B
	bmi CODE_1FC686
	sta WRMPYB
	nop
	jmp CODE_1FC69E
CODE_1FC686:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC6A4
CODE_1FC696:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda 00
	sec
	sbc RDMPYH
	tax
	ldx #$00
	sta D, $90
	cmp #$00
	bpl CODE_1FC6AE
	dex
	stx D, $91
	rep #$10
	ldx $76
	ldy $78
	plb
	rtl

CODE_1FC6B8:
	sta D, $7E
	stx D, $76
	sty D, $78
	stz D, $08
	stz D, $09
	lda D, $13, X
	tax
	sep #$10
	phb
	lda #$00
	pha
	plb
	inx
	lda $98A5, X
	sta D, $7A
	lda $98E5, X
	sta D, $7B
	lda D, $7E
	bmi CODE_1FC6F0
	asl
	sta WRMPYA
	lda D, $7A
	bmi CODE_1FC712
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC720
CODE_1FC6F0:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, $7A
	bmi CODE_1FC702
	sta WRMPYB
	nop
	jmp CODE_1FC71A
CODE_1FC702:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC720
CODE_1FC712:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda #$00
	sec
	sbc RDMPYH
	tax
	ldx #$00
	sta D, $02
	cmp #$00
	bpl CODE_1FC72A
	dex
	stx D, $03
	lda D, $7E
	bmi CODE_1FC745
	asl
	sta WRMPYA
	lda D, $7B
	bmi CODE_1FC767
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC775
CODE_1FC745:
	eor #$FF
	inc
	asl
	sta WRMPYA
	lda D, $7B
	bmi CODE_1FC757
	sta WRMPYB
	nop
	jmp CODE_1FC76F
CODE_1FC757:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	nop
	nop
	lda RDMPYH
	jmp CODE_1FC775
CODE_1FC767:
	eor #$FF
	inc
	sta WRMPYB
	nop
	nop
	lda #$00
	sec
	sbc RDMPYH
	tax
	ldx #$00
	sta D, $90
	cmp #$00
	bpl CODE_1FC77F
	dex
	stx D, $91
	rep #$10
	ldx $76
	ldy $78
	plb
	rtl
	
CODE_1FC789:
ApplyTempVelocityShift2:
	rep #$20
	asl D,$02
	asl D,$08
	asl D,$90
	asl D,$02
	asl D,$08
	asl D,$90
	bra ApplyTempVelocity_L1
ApplyTempVelocityShift1:
	rep #$20
	asl D,$02
	asl D,$08
	asl D,$90
ApplyTempVelocity:
	rep #$20
ApplyTempVelocity_L1:
	lda D,$0C,x
	clc
	adc D,$02
	sta D,$0C,x
	lda D,$0E,x
	clc
	adc D,$08
	sta D,$0E,x
	lda D,$10,x
	clc
	adc D,$90
	sta D,$10,x
	sep #$20
	rtl
ApplyObjectVelocity:
	rep #$20
	lda D,$0C,x
	clc
	adc D,$2F,x
	sta D,$0C,x
	lda D,$0E,x
	clc
	adc D,$31,x
	sta D,$0E,x
	lda D,$10,x
	clc
	adc D,$33,x
	sta D,$10,x
	sep #$20
	rtl
CODE_1FC7D5:
	stx D,$3A
	ldx $14CA
	beq CODE_1FC7F8
	cmp #$00
	beq CODE_1FC801
	txy
CODE_1FC7E2:
	cmp D,$04,x
	beq CODE_1FC7EB
CODE_1FC7E6:
	ldy D,$00,x
	tyx
	bne CODE_1FC7E2
CODE_1FC7EB:
	cpx D,$3A
	beq CODE_1FC7E6
	ldy D,$00,x
	sty $14CA
	txy
	ldx D,$3A
	rtl
CODE_1FC7F8:
	ldy #$000
	sty $14CA
	ldx D,$3A
	rtl
DATA_1FC801:
	
INCBIN "bank1F_1FC801.bin"
	

CODE_1FD36E:
ClearObject:
	phx
	tyx
	ply
	lda #$00
	phy
	phx
	ldy #$0032
ClearObject_L1:
	sta D,$04,x
	inx
	dey
	bne ClearObject_L1
	plx
	phx
	ldy #$0036
ClearObject_L2:
	sta $7E1CCA,x
	inx
	dey
	bne ClearObject_L2
	plx
	ply
	lda D,$08,x
	ora #$10
	sta D,$08,x
	lda D,$09,x
	ora #$08
	sta D,$09,x
	lda D,$2E,x
	ora #$04
	sta D,$2E,x
	lda D,$1F,x
	ora #$08
	sta D,$1F,x
	phx
	tyx
	ply
	rtl
	
	
	
	
	
	
	
CopyPositionIndXToIndY:
	rep #$20
	lda D,$0C,x
	sta $000C,y
	lda D,$0E,x
	sta $000E,y
	lda D,$10,x
	sta $0010,y
	sep #$20
	rtl
CopyPositionIndYToIndX:
	rep #$20
	lda $000C,y
	sta D,$0C,x
	lda $000E,y
	sta D,$0E,x
	lda $0010,y
	sta D,$10,x
	sep #$20
	rtl
CopyRotationIndXToIndY:
	lda D,$12,x
	sta $0012,y
	lda D,$13,x
	sta $0013,y
	lda D,$14,x
	sta $0015,y
	rtl
CopyRotationIndYToIndX:
	lda $0012,y
	sta D,$12,x
	lda $0013,y
	sta D,$13,x
	lda $0014,y
	sta D,$14,x
	rtl
OffsetZPositionIndX:
	rep #$20
	lda $14EA
	sec
	sbc $14F4
	clc
	adc D,$10,x
	sta D,$10,x
	sep #$20
	rtl
OffsetZPositionIndY:
	rep #$20
	lda $14EA
	sec
	sbc $14F4
	clc
	adc $0010,y
	sta $0010,y
	sep #$20
	rtl
ClearVelocityIndX:
	rep #$20		;\
	stz D,$2F,x		;|Store zero in velocity X element...
	stz D,$31,x		;|...same for Y...
	stz D,$33,x		;|...same for Z...
	sep #$20		;|
	stz D,$15,x		;|...and store zero in unknown object property $15
	rtl			;/
ClearVelocityIndY:
	rep #$20		;\
	lda #$0000		;|
	sta $002F,y		;|Store zero in velocity X element...
	sta $0031,y		;|...same for Y...
	sta $0033,y		;|...same for Z...
	sep #$20		;|
	sta $0015,y		;|...and store zero in unknown object property $15
	rtl			;/
	
	
	
	;Compressed tilemap
	INCBIN "graphics/compressed/venom.mapz"		;1FF963
CODE_1FF963:
	php
	sep #$20
	rep #$10
	jsl CODE_03AD73
	sei
	lda #$80
	jsl CODE_02F8DF
	lda #$C8
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda #$BE
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	sep #$20
	lda #$01
	sta $7EF0B3
	lda #$0D
	ldx #$7962
	sta LevelScriptBank
	stx LevelScriptPointer
	jsl CODE_02E2CC
	jsl CODE_03E8B6
	rep #$20
	lda #$0000
	sta $700090
	lda #$001F
	sta $700064
	lda #$B999
	sta $700062
	lda #$6800
	sta $188A
	lda #$1000
	sta $188C
	sep #$20
	jsl DoDecompressTileset
	jsl CODE_7E33BA
	lda #$22
	sta BBAD0
	lda #$80
	sta CGADD
	ldx #$0540
	stx A1T0L
	lda #$7F
	sta A1B0
	ldx #$0100
	stx DAS0L
	lda #$00
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda #$41
	sta $7E45F3
	lda #$43
	sta $7E45F5
	lda #$3A
	sta $7E45F7
	rep #$20
	lda #$0000
	sta $70021C
	lda #$0040
	sta $700034
	lda #$0030
	sta $700036
	sep #$20
	lda #$01
	sta $1F0D
	stz $15BB
	stz $15BC
	stz Pad1Cur+1
	stz Pad1Cur
	lda $1FDF
	beq CODE_1FFA3E
	brl CODE_1FFA95
CODE_1FFA3E:
	lda $7EA05A
	beq CODE_1FFA47
	brl CODE_1FFA95
CODE_1FFA47:
	sep #$20
	lda $14D6
	and #$1F
	sta $14D6
CODE_1FFA51:
	jsl CODE_02FD84
	rep #$20
	stz $15AF
	jsl CODE_03DBD0
	jsr CODE_1FFD54
	sep #$20
	lda Pad1Down+1
	bit #$20
	beqe CODE_1FFA79
	lda $1F0F
	inc
	and #$03
	sta $1F0F
	lda #$11
	jsl CODE_03B7F9
CODE_1FFA79:
	jsr CODE_1FFDAC
	rep #$20
	lda $15BB
	cmp #$0010
	bcc CODE_1FFA51
	sep #$20
	lda Pad1Down+1
	bit #$10
	beq CODE_1FFA51
	lda #$10
	jsl CODE_03B7F9
CODE_1FFA95:
	sep #$20
	lda TIMEUP
	cli
CODE_1FFA9C:
	jsl CODE_02FD84
	jsr CODE_1FFBFF
	jsr CODE_1FFD54
	jsr CODE_1FFDAC
	sep #$20
	lda $14D6
	ora #$60
	sta $14D6
	lda Pad1Down+1
	bit #$20
	beq CODE_1FFACA
	lda $7EA05A
	eor #$01
	sta $7EA05A
	lda #$11
	jsl CODE_03B7F9
CODE_1FFACA:
	lda $7EA05A
	beq CODE_1FFAE3
	lda PadDown+1
	bit #$08
	beq CODE_1FFAE3
	lda #$00
	sta $7EA05A
	lda #$11
	jsl CODE_03B7F9
CODE_1FFAE3:
	lda $7EA05A
	bne CODE_1FFAFC
	lda Pad1Down+1
	bit #$04
	beq CODE_1FFAFC
	lda #$01
	sta $7EA05A
	lda #$11
	jsl CODE_03B7F9
CODE_1FFAFC:
	
	

	lda $1209
	bit #$40
	beq CODE_1FFB06
	jmp CODE_1FFA47
CODE_1FFB06:
	lda $120A
	bit #$40
	beq CODE_1FFB10
	jmp CODE_1FFA47
CODE_1FFB10:
	lda $1209
	bit #$80
	bne CODE_1FFB28
	lda $120A
	bit #$80
	bne CODE_1FFB28
	lda $120A
	bit #$10
	bne CODE_1FFB28
	jmp CODE_1FFA9C
CODE_1FFB28:
	sep #$20
	lda #$10
	jsr CODE_03B7F9
	lda #$F1
	sta $1F47
	stz $1F46
	lda #$FF
	sta $18B2
	jsr CODE_02FD84
	jsr CODE_1FFBFF
	jsr CODE_1FFD54
	sep #$20
	lda $18B2
	and #$FF
	bne CODE_1FFB3D
	stz $1F0D
	lda $7EA05A
	beq CODE_1FFB5C
	jmp CODE_1FFBFD
CODE_1FFB5C:
	jsr CODE_02E266
	sep #$20
	rep #$10
	lda #$0D
	ldx $6DC0
	sta $1FF4
	stx $16FD
	jsr CODE_02E2CC
	sep #$20
	lda #$01
	sta $16EC
	stz $15BB
	stz $15BC
	jsr CODE_02FD84
	jsr CODE_02D956
	jsr CODE_03EA26
	rep #$20
	lda $15BB
	cmp $0014
	bpl $1FFB80
	sep #$20
	lda $1FD2
	cmp $0A
	beq CODE_1FFBE5
	lda $14D1
	and #$08
	beq CODE_1FFBAD
	lda $14D7
	bit #$80
	bne CODE_1FFB80
	lda $120A
	bit #$10
	beq CODE_1FFB80
	sep #$20
	lda #$F1
	sta $1F47
	stz $1F46
	lda #$FF
	sta $18B2
	jsr CODE_02FD84
	jsr CODE_02D956
	sep #$20
	lda $18B2
	and #$FF
	bne CODE_1FFBC3
	jsr CODE_02E266
	sep #$20
	lda #$01
	sta $7EA05A
	sta $1FDF
	jmp CODE_1FFBF6
	jsr CODE_02E266
	sep #$20
	lda #$00
	sta $7EA05A
	lda #$01
	sta $1FDF
	stz $1FD2
	plp
	jmp CODE_1FF963

CODE_1FFBFE:
	rtl

CODE 1FFBFF:
	rep #$30
	ldx #$0000
	stx $15AF
	ldx #$0000
	lda $7EA05A
	beq CODE_1FFC13
	ldx #$0078
	ldy $15AF
	lda $97A8
	sta $14C5
CODE_1FFC1C:
	lda $14C5
	sta $1261, Y
	lda $1FFC64, X
	clc
	adc #$3080
	sta $1263, Y
	iny
	iny
	iny
	iny
	inx
	inx
	lda $14C5
	clc
	adc #$0008
	sta $14C5
	and #$00FF
	cmp #$00F8
	bne CODE_1FFC1C
	lda $14C5
	and #$FF00
	clc
	adc #$0800
	cmp #$C700
	beq CODE_1FFC5C
	or #$00A8
	sta $14C5
	jmp CODE_1FFC1C
CODE_1FFC5C:
	sty $15AF
	jsr CODE_03DBD0
	rts

DATA_1FFC64:

INCBIN "bank1F_1FFC64.bin"

CODE_1FFDAC:
	sep #$20
	rep #$20
	lda $1F0F
	cmp #$01
	beq CODE_1FFDCE
	cmp #$02
	beq CODE_1FFDDD
	cmp #$03
	beq CODE_1FFDEC
	rep #$20
	lda #$0000
	sta $1F35
	lda #$0000
	sta $1F37
	rts
CODE_1FFDCE:
	rep #$20
	lda #$0000
	sta $1F35
	lda #$0100
	sta $1F37
	rts
CODE_1FFDDD:
	rep #$20
	lda #$0100
	sta $1F35
	lda #$0000
	sta $1F37
	rts
CODE_1FFDEC:
	rep #$20
	lda #$0100
	sta $1F35
	lda #$0100
	sta $1F37
	rts
CopyCodeToRam:
	php
	sep #$20
	rep #$10
	ldx.w #(CopiedCodeAEnd-CopiedCodeA-1)		;\Copy first code section to RAM
CopyCodeToRam_L1:					;|
	lda.l CopiedCodeA,x				;|
	sta.l CopiedCodeABase,x				;|
	dex						;|
	bpl CopyCodeToRam_L1				;/
	ldx.w #(CopiedCodeBEnd-CopiedCodeB-1)		;\Copy second code section to RAM
CopyCodeToRam_L2:					;|
	lda.l CopiedCodeB,x				;|
	sta.l CopiedCodeBBase,x				;|
	dex						;|
	bpl CopyCodeToRam_L2				;/
	plp
	rtl
	;THE FOLLOWING CODE GETS COPIED TO RAM AT $7E0101 (ORIGINALLY AT $1FFE1E)
CopiedCodeA:
	BASE $7E0101
CopiedCodeABase:
	jml CODE_1FBDEE
	jml CODE_1FBDEE
	brl NMI_L2
	;This is where the NMI vector points (the IRQ points into a misaligned JML instruction)
NMI:
	nop
	rep #$30
	pha
	lda.l SFR
	bmi NMI_L1
	phb
	sei
	phx
	phy
	sep #$30
	lda #$00
	pha
	plb
	lda SuperFXScreenMode
	ora #$18
	sta SCMR
	jsl RunNMITask
	sep #$20
	inc $1200
	lda TIMEUP
	bra NMI_L3
NMI_L1:
	pla
	rti
NMI_L2:
	rep #$30
	pha
	phb
	phx
	phy
	sep #$20
	lda #$00
	pha
	plb
	lda SuperFXScreenMode
	sta SCMR
	jsl CODE_1FBFDB
	lda SuperFXScreenMode
	ora #$18
	sta SCMR
	sep #$20
	lda RDNMI
NMI_L3:
	rep #$30
	ply
	plx
	plb
	pla
	rti
	END BASE
CopiedCodeAEnd:
	;END OF COPIED CODE
