

	ORG $1FBDB0
	rtl		;unused byte?
DoReset:		;1FBDB1
	sei			;Disable interrupts
	clc			;Disable emulation mode
	xce
	rep #$30		;A, X, and Y are all now 16 bits
	lda #$0000		;Clear D register
	tad
	ldx #$02FF		;Set stack pointer to $02FF
	txs
	sep #$30		;A, X, and Y are all 8 bits again
	pha			;Set DBR to 0
	plb
	sep #$30		;A, X, and Y are all 8 bits again (residual?)
	jsl ClearRegisters
	jsr $BE41
	rep #$10		;X and Y are 16 bits again
	ldx #$02FF		;Set stack pointer to $02FF (again?)
	txs
	sep #$30		;A, X, and Y are all 8 bits again
	jsl $02E266
	jsl $1FF51C
	jsl $1FF45D
	sep #$20		;A is 8 bits
	lda #$00
	sta $7EA05A
	lda #$00
	sta $1FDF
	bra DoResetPart2

CODE_1FBDEE:		;1FBDEE (soft reset?)
	rep #$30		;A, X, and Y are all now 16 bits
	clc			;Disable emulation mode
	xce
	lda #$0000		;Clear D register
	tad
	ldx #$02FF		;Set stack pointer to $02FF
	txs
	sep #$30		;A, X, and Y are all 8 bits again
	sei
	jsl ClearRegisters
	
	lda $0016D8		;Save some values on the stack before calling
	pha
	lda $1FDF
	pha
	lda $7EA05A
	pha
	lda $1F0F
	pha
	jsr ClearRAM
	pla			;Restore our saved values
	sta $1F0F
	pla
	sta $7EA05A
	pla
	sta $1FDF
	pla
	sta $0016D8
	
	lda #$01
	sta $1F65
	sta $7EF0B3
	jsl $02E266
DoResetPart2:
	jsl $1FF963
	jsl $02E266
	jmp Main	;03BDDF

ClearRAM:		;1FBE41
	php
	sep #$20	;A is 8 bits
	lda #$7E	;Set DBR to $7E
	pha
	plb
	rep #$30	;A, X, and Y are all now 16 bits
	ldx #$2000
ClearRAM_L1:		;Clear page $7E from $2000-$FFFF
	stz $0000,x
	stz $0002,x
	stz $0004,x
	stz $0006,x
	txa
	clc
	adc #$0008
	tax
	bne ClearRAM_L1
	sep #$20	;A is 8 bits again
	lda #$7F	;Set DBR to $7F
	pha
	plb
	rep #$20	;A is 16 bits again
ClearRAM_L2:		;Clear all of page $7F
	stz $0000,x
	stz $0002,x
	stz $0004,x
	stz $0006,x
	txa
	clc
	adc #$0008
	tax
	bne ClearRAM_L2
	sep #$20	;A is 8 bits again
	lda #$70	;Set DBR to $70
	pha
	plb
	rep #$30	;A is 16 bits again
ClearRAM_L3:		;Clear page $70 from $0000-$7FFF
	stz $0000,x
	stz $0002,x
	stz $0004,x
	stz $0006,x
	txa
	clc
	adc #$0008
	tax
	bpl ClearRAM_L3
	sep #$20	;A is 8 bits again
	lda #$00
	pha
	plb
	rep #$20	;A is 16 bits again
	ldx #$1CF8
ClearRAM_L4:		;Clear page $00 from $1FF8-$82FF
	stz $0300,x
	stz $0302,x
	stz $0304,x
	stz $0306,x
	txa
	clc
	adc #$0008
	tax
	bpl ClearRAM_L4
	ldx #$00FE
ClearRAM_L5:		;Clear zero page?
	stz $00,x
	dex
	dex
	bpl ClearRAM_L5
	jsl $1FFDFB
	sep #$20	;A is 8 bits again
	lda STAT78	;(213F)
	and #$10
	sta $16F6
	plp
	rts
ClearRegisters:		;1FBED4
	sei
	lda #$01
	sta $16DB
	jsl $03BD8D
	sep #$30	;A, X, and Y are all now 8 bits
	lda #$00
	sta $16DB
	jsl $03BD8D
	sep #$30	;A, X, and Y are all 8 bits again
	lda #$8F
	sta INIDISP	;(2100)
	lda #$00
	sta OBSEL	;(2101)
	sta OAMADDL	;(2102)
	sta OAMADDH	;(2103)
	sta BGMODE	;(2105)
	sta MOSAIC	;(2106)
	sta BG1SC	;(2107)
	sta BG2SC	;(2108)
	sta BG3SC	;(2109)
	sta BG4SC	;(210A)
	sta BG12NBA	;(210B)
	sta BG34NBA	;(210C)
	sta BG1HOFS	;(210D)
	sta BG1HOFS	;(210D)
	sta BG1VOFS	;(210E)
	sta BG1VOFS	;(210E)
	sta BG2HOFS	;(210F)
	sta BG2HOFS	;(210F)
	sta BG2VOFS	;(2110)
	sta BG2VOFS	;(2110)
	sta BG3HOFS	;(2111)
	sta BG3VOFS	;(2112)
	sta BG3VOFS	;(2112)
	sta BG4HOFS	;(2113)
	sta BG4HOFS	;(2113)
	sta BG4VOFS	;(2114)
	sta BG4VOFS	;(2114)
	ldx #$80
	stx VMAIN	;(2115)
	sta VMADDL	;(2116)
	sta VMADDH	;(2117)
	sta M7SEL	;(211A)
	ldx #$01
	sta M7A		;(211B)
	stx M7A		;(211B)
	sta M7B		;(211C)
	sta M7B		;(211C)
	sta M7C		;(211D)
	sta M7C		;(211D)
	sta M7D		;(211E)
	stx M7D		;(211E)
	sta M7X		;(211F)
	sta M7X		;(211F)
	sta M7Y		;(2120)
	sta M7Y		;(2120)
	sta CGADD	;(2121)
	sta CGDATA	;(2122)
	sta W12SEL	;(2123)
	sta W34SEL	;(2124)
	sta WOBJSEL	;(2125)
	sta WH0		;(2126)
	sta WH1		;(2127)
	sta WH2		;(2128)
	sta WH3		;(2129)
	sta WBGLOG	;(212A)
	sta WOBJLOG	;(212B)
	sta TM		;(212C)
	sta TS		;(212D)
	sta TMW		;(212E)
	ldy #$30
	sty CGWSEL	;(2130)
	sta CGADSUB	;(2131)
	ldx #$E0
	stx COLDATA	;(2132)
	sta SETINI	;(2133)
	sta NMITIMEN	;(4200)
	ldx #$FF
	stx WRIO	;(4201)
	sta WRMPYA	;(4202)
	sta WRMPYB	;(4203)
	sta WRDIVL	;(4204)
	sta WRDIVH	;(4205)
	sta WRDIVB	;(4206)
	sta HTIMEL	;(4207)
	sta HTIMEH	;(4208)
	sta VTIMEL	;(4209)
	sta VTIMEH	;(420A)
	sta MDMAEN	;(420B)
	sta HDMAEN	;(420C)
	sta MEMSEL	;(420D)
	rtl

CODE_1FBFDB:		;1FBFDB
	rtl

CODE_1FBFDC:		;1FBFDC
	jsr CODE_1FBFE0
	rtl

CODE_1FBFE0:		;1FBFE0
	phx
	phy
	php
	jsl $1FDBA4
	rep #$20
	phx
	txa
	ldx $121D
CODE_1FBFEE:
	cmp $19,x
	bne CODE_1FBFF4
	stz $19,x
CODE_1FBFF4:
	cmp $06,x
	bne CODE_1FBFFA
	stz $06,x
CODE_1FBFFA:
	cmp $1CDD,x
	bne CODE_1FC002
	stz $1CDD,x
CODE_1FC002:
	cmp $1B,x
	bne CODE_1FC008
	stz $1B,x
CODE_1FC002:
	ldy $00,x
	tyx
	bne CODE_1FBFEE
	plx
	jsl $0AFB8E
	ldy $02,x
	bne CODE_1FC023
	ldy $00,x
	sty $121D
	lda #$0000
	sta $0002,y
	bra CODE_1FC031
CODE_1FC023:
	phx
	lda $00,x
	tax
	stx $00,y
	cmp #$0000
	beq CODE_1FC030
	sty $02,x
CODE_1FC030:
	plx
CODE_1FC031:
	lda $121F
	sta $00,x
	stx $121F
	plp
	ply
	plx
	rts

CODE_1FC03D:		;1FC03D
	php
	rep #$30
	stz $1EFB
	ldx $121D
	beq CODE_1FC09D
	ldy #$0000
CODE_1FC04B:
	phx
	lda $2E,x
	and #$0004
	bne CODE_1FC097
	lda $1E,x
	and #$0001
	bne CODE_1FC097
	lda $2A,x
	and #$00FF
	beq CODE_1FC097
	lda $08,x
	bit #$0001
	bne CODE_1FC097
	phx
	lda $04,x
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
	inc a
	xce
	asl $188A,x
	adc #$000A
	tay
CODE_1FC097:
	plx
	lda $00,x
	tax
	bne CODE_1FC04B
	plp
	rtl

CODE_1FC09F:		;1FC09F