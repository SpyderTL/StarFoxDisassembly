

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;RESET AND INTERRUPT ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ORG $1FBDB0
CODE_1FBDB0:
	rtl
DoReset:
	sei			; Disable interrupts
	clc			;\Disable emulation mode
	xce			;/
	rep #$30
	lda.w #$0000		;\Clear D register
	tad			;/
	ldx.w #$02FF		;\Set stack pointer to $02FF
	txs			;/
	sep #$30
	pha			;\Set DBR to 0
	plb			;/
	sep #$30
	jsl InitRegisters
	jsr ClearRAM
	rep #$10
	ldx.w #$02FF		;\Set stack pointer to $02FF (again?)
	txs			;/
	sep #$30
	jsl CODE_02E266
	jsl Intro
	jsl Title
	sep #$20
	lda.b #$00
	sta.l $7EA05A
	lda.b #$00
	sta.w $1FDF
	bra DoResetPart2
CODE_1FBDEE:
	rep #$30
	clc			;\Disable emulation mode
	xce			;/
	lda.w #$0000		;\Clear D register
	tad			;/
	ldx.w #$02FF		;\Set stack pointer to $02FF
	txs			;/
	sep #$30
	sei			; Disable interrupts
	jsl InitRegisters
	
	lda.w LevelID		;\Save some values on the stack before calling
	pha			;|
	lda.w $1FDF		;|
	pha			;|
	lda.l $7EA05A		;|
	pha			;|
	lda.w $1F0F		;|
	pha			;/
	jsr ClearRAM
	pla			;\Restore our saved values
	sta.w $1F0F		;|
	pla			;|
	sta.l $7EA05A		;|
	pla			;|
	sta.w $1FDF		;|
	pla			;|
	sta.w LevelID		;/
	
	lda.b #$01
	sta.w $1F65
	sta.l $7EF0B3
	jsl CODE_02E266
DoResetPart2:
	jsl Controls
	jsl CODE_02E266
	jmp Map
ClearRAM:
	php			; Save processor status
	sep #$20
	lda.b #$7E		;\Set DBR to $7E
	pha			;|
	plb			;/
	rep #$30
	ldx.w #$2000
ClearRAM_Bank7EHi:		;\Clear bank $7E from $2000-$FFFF
	stz.w $0000,x		;|
	stz.w $0002,x		;|
	stz.w $0004,x		;|
	stz.w $0006,x		;|
	txa			;|
	clc			;|
	adc.w #$0008		;|
	tax			;|
	bne ClearRAM_Bank7EHi	;/
	sep #$20
	lda.b #$7F		;\Set DBR to $7F
	pha			;|
	plb			;/
	rep #$20
ClearRAM_Bank7F:		;\Clear all of bank $7F
	stz.w $0000,x		;|
	stz.w $0002,x		;|
	stz.w $0004,x		;|
	stz.w $0006,x		;|
	txa			;|
	clc			;|
	adc.w #$0008		;|
	tax			;|
	bne ClearRAM_Bank7F	;/
	sep #$20
	lda.b #$70		;\Set DBR to $70
	pha			;|
	plb			;/
	rep #$30
ClearRAM_Bank70:		;\Clear bank $70 from $0000-$7FFF
	stz.w $0000,x		;|
	stz.w $0002,x		;|
	stz.w $0004,x		;|
	stz.w $0006,x		;|
	txa			;|
	clc			;|
	adc.w #$0008		;|
	tax			;|
	bpl ClearRAM_Bank70	;/
	sep #$20
	lda.b #$00		;\Set DBR to $00
	pha			;|
	plb			;/
	rep #$20
	ldx.w #$1CF8
ClearRAM_Bank00Misc:		;\Clear bank $00 from $1FF8-$82FF
	stz.w $0300,x		;|
	stz.w $0302,x		;|
	stz.w $0304,x		;|
	stz.w $0306,x		;|
	txa			;|
	clc			;|
	adc.w #$0008		;|
	tax			;|
	bpl ClearRAM_Bank00Misc	;/
	ldx.w #$00FE
ClearRAM_ZeroPage:		;\Clear zero page
	stz.b $00,x		;|
	dex			;|
	dex			;|
	bpl ClearRAM_ZeroPage	;/
	jsl CopyCodeToRam
	sep #$20
	lda STAT78
	and.b #$10
	sta.w $16F6
	plp			;\Restore processor status and return
	rts			;/
InitRegisters:
	sei
	lda.b #$01
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$30
	lda.b #$00
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$30
	lda.b #$8F
	sta INIDISP
	lda.b #$00		;\Clear a bunch of registers (why not just use stz here?)
	sta.w OBSEL		;|
	sta.w OAMADDL		;|
	sta.w OAMADDH		;|
	sta.w BGMODE		;|
	sta.w MOSAIC		;|
	sta.w BG1SC		;|
	sta.w BG2SC		;|
	sta.w BG3SC		;|
	sta.w BG4SC		;|
	sta.w BG12NBA		;|
	sta.w BG34NBA		;|
	sta.w BG1HOFS		;|
	sta.w BG1HOFS		;|
	sta.w BG1VOFS		;|
	sta.w BG1VOFS		;|
	sta.w BG2HOFS		;|
	sta.w BG2HOFS		;|
	sta.w BG2VOFS		;|
	sta.w BG2VOFS		;|
	sta.w BG3HOFS		;|
	sta.w BG3VOFS		;|
	sta.w BG3VOFS		;|
	sta.w BG4HOFS		;|
	sta.w BG4HOFS		;|
	sta.w BG4VOFS		;|
	sta.w BG4VOFS		;/
	ldx.b #$80		;\Init VRAM write registers
	stx.w VMAIN		;|
	sta.w VMADDL		;|
	sta.w VMADDH		;/
	sta.w M7SEL		;\Init Mode 7 registers
	ldx.b #$01		;|
	sta.w M7A		;|
	stx.w M7A		;|
	sta.w M7B		;|
	sta.w M7B		;|
	sta.w M7C		;|
	sta.w M7C		;|
	sta.w M7D		;|
	stx.w M7D		;|
	sta.w M7X		;|
	sta.w M7X		;|
	sta.w M7Y		;|
	sta.w M7Y		;/
	sta.w CGADD
	sta.w CGDATA
	sta.w W12SEL
	sta.w W34SEL
	sta.w WOBJSEL
	sta.w WH0
	sta.w WH1
	sta.w WH2
	sta.w WH3
	sta.w WBGLOG
	sta.w WOBJLOG
	sta.w TM
	sta.w TS
	sta.w TMW
	ldy.b #$30
	sty.w CGWSEL
	sta.w CGADSUB
	ldx.b #$E0
	stx.w COLDATA
	sta.w SETINI
	sta.w NMITIMEN
	ldx.b #$FF
	stx.w WRIO
	sta.w WRMPYA
	sta.w WRMPYB
	sta.w WRDIVL
	sta.w WRDIVH
	sta.w WRDIVB
	sta.w HTIMEL
	sta.w HTIMEH
	sta.w VTIMEL
	sta.w VTIMEH
	sta.w MDMAEN
	sta.w HDMAEN
	sta.w MEMSEL
	rtl
CODE_1FBFDB:
	rtl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;OBJECT MANAGEMENT ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CODE_1FBFDC:
	jsr CODE_1FBFE0
	rtl
CODE_1FBFE0:
	phx
	phy
	php
	jsl CODE_1FDBA4
	rep #$20
	phx
	txa
	ldx.w FirstObject
CODE_1FBFEE:
	cmp.b $19,x
	bne CODE_1FBFF4
	stz.b $19,x
CODE_1FBFF4:
	cmp.b $06,x
	bne CODE_1FBFFA
	stz.b $06,x
CODE_1FBFFA:
	cmp.w $1CDD,x
	bne CODE_1FC002
	stz.w $1CDD,x
CODE_1FC002:
	cmp.b $1B,x
	bne CODE_1FC008
	stz.b $1B,x
CODE_1FC002:
	ldy.b $00,x
	tyx
	bne CODE_1FBFEE
	plx
	jsl CODE_0AFB8E
	ldy.b $02,x
	bne CODE_1FC023
	ldy.b $00,x
	sty.w FirstObject
	lda.w #$0000
	sta.w $0002,y
	bra CODE_1FC031
CODE_1FC023:
	phx
	lda.b $00,x
	tax
	stx.b $00,y
	cmp.w #$0000
	beq CODE_1FC030
	sty.b $02,x
CODE_1FC030:
	plx
CODE_1FC031:
	lda.w FirstFreeObject
	sta.b $00,x
	stx.w FirstFreeObject
	plp
	ply
	plx
	rts
CODE_1FC03D:
	php
	rep.b #$30
	stz.w $1EFB
	ldx.w FirstObject
	beq CODE_1FC09D
	ldy.w #$0000
CODE_1FC04B:
	phx
	lda.b $2E,x
	and.w #$0004
	bne CODE_1FC097
	lda.b $1E,x
	and.w #$0001
	bne CODE_1FC097
	lda.b $2A,x
	and.w #$00FF
	beq CODE_1FC097
	lda.b $08,x
	bit.w #$0001
	bne CODE_1FC097
	phx
	lda.b $04,x
	tyx
	tay
	pla
	sta.l $7E2EC4,x
	lda.w $0008,y
	sta.l $7E2EC6,x
	lda.w $000A,x
	sta.l $7E2EC8,x
	lda.w $000C,x
	sta.l $7E2ECA,x
	lda.w $000E,x
	sta.l $7E2ECC,x
	inc
	xce
	asl.l $188A,x
	adc.l #$000A
	tay
CODE_1FC097:
	plx
	lda.b $00,x
	tax
	bne CODE_1FC04B
	plp
	rtl

CODE_1FC09F:
	lda.b $14,x
	sta.b $7E
	phb
	stx.b $76
	sty.b $78
	stz.b $08
	stz.b $09
	lda.b $13,x
	tax
	sep
	lda.b #$00
	pha
	plb
	lda.w SineTable8,x
	sta.b $7A
	lda.w SineTable8+$40,x
	sta.b $7B
	lda.b $7E
	bmi CODE_1FC0D8
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC0FA
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC108
CODE_1FC0D8:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC0EA
	sta.w WRMPYB
	nop
	jmp CODE_1FC102
CODE_1FC0EA:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC108
CODE_1FC0F8:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC108:
	tax
	ldx.b #$00
	sta.b $02
	cmp.b #$00
	bpl CODE_1FC112
	dex
CODE_1FC112:
	stx.b $03
	lda.b $7E
	bmi CODE_1FC12D
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC14F
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC15D
CODE_1FC12D:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC13F
	sta.w WRMPYB
	nop
	jmp CODE_1FC157
CODE_1FC13F:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC15D
CODE_1FC14F:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC157:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC15D:
	tax
	ldx.b #$00
	sta.b $90
	cmp.b #$00
	bpl CODE_1FC167
	dex
CODE_1FC167:
	stx.b $91
	rep #$10
	ldx.b $78
	ldy.b $78
	plb
	rtl
CODE_1FC171:
	lda.b $15,x
	sta.b $7E
	lda.b $13,x
CODE_1FC177:
	stx.b $76
	sty.b $78
	stz.b $08
	stz.b $09
	eor.b #$FF
	inc
	tax
	sep #$10
	phb
	lda.b #$00
	pha
	plb
	inx
	iny
	lda.w SineTable8,x
	sta.b $7A
	lda.w SineTable8+$40,x
	sta.b $7B
CODE_1FC196:
	lda.b $7E
	bmi CODE_1FC1AF
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC1D1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC1DF
CODE_1FC1AF:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC1C1
	sta.w WRMPYB
	nop
	jmp CODE_1FC1D9
CODE_1FC1C1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC1DF
CODE_1FC1D1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC1D9:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC1DF:
	tax
	ldx.b #$00
	sta.b $02
	cmp.b #$00
	bpl CODE_1FC1E9
	dex
CODE_1FC1E9:
	stx.b $03
	lda.b $7E
	bmi CODE_1FC204
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC226
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC234
CODE_1FC204:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC216
	sta.w WRMPYB
	nop
	jmp CODE_1FC22E
CODE_1FC216:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC234
CODE_1FC226:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC22E:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC234:
	tax
	ldx.b #$00
	sta.b $90
	cmp.b #$00
	bpl CODE_1FC23E
	dex
CODE_1FC23E:
	stx.b $91
	rep #$10
	ldx.b $76
	ldy.b $78
	plb
	rtl
CODE_1FC248:
	lda.b $15,x
	sta.b $7E
	stz.b $03
	stz.b $09
	stz.b $91
	stx.b $76
	sty.b $78
	lda.b $13,x
	tay
	lda.b $12,x
	eor.b #$FF
	inc
	tax
	sep #$10
	phb
	lda.b #$00
	pha
	plb
	lda.w SineTable8,y
	sta.b $7A
	lda.w SineTable8+$40,y
	sta.b $7B
	lda.w SineTable8,x
	sta.b $82
	lda.w SineTable8+$40,x
	sta.b $83
	lda.b $7E
	bmi CODE_1FC293
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC2B5
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC2C3
CODE_1FC293:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC2A5
	sta.w WRMPYB
	nop
	jmp CODE_1FC2BD
CODE_1FC2A5:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC2C3
CODE_1FC2B5:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC2BD:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC2C3:
	tax
	sta.b $02
	lda.b $02
	bmi CODE_1FC2DF
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC301
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC30F
CODE_1FC2DF:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC2F1
	sta.w WRMPYB
	nop
	jmp CODE_1FC309
CODE_1FC2F1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	sta.w RDMPYH
	jmp CODE_1FC30F
CODE_1FC301:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC309:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC30F:
	tax
	sta.b $02
	cmp.b #$00
	bpl CODE_1FC318
	dec.b $03
CODE_1FC318:
	lda.b $7E
	bmi CODE_1FC331
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC353
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC361
CODE_1FC331:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC343
	sta.w WRMPYB
	nop
	jmp CODE_1FC35B
CODE_1FC343:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC361
CODE_1FC353:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC35B:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC361:
	tax
	sta.b $90
	lda.b $90
	bmi CODE_1FC37D
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC39F
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC3AD
CODE_1FC37D:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC38F
	sta.w WRMPYB
	nop
	jmp CODE_1FC3A7
CODE_1FC38F:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC3AD
CODE_1FC39F:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC3A7:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC3AD:
	tax
	sta.b $90
	cmp.b #$00
	bpl CODE_1FC3B6
	dec.b $91
CODE_1FC3B6:
	lda.b $7E
	bmi CODE_1FC3CF
	asl
	sta.w WRMPYA
	lda.b $82
	bmi CODE_1FC3F1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC3FF
CODE_1FC3CF:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $82
	bmi CODE_1FC3E1
	sta.w WRMPYA
	nop
	jmp CODE_1FC3F9
CODE_1FC3E1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC3FF
CODE_1FC3F1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC3F9:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC3FF:
	tax
	sta.b $08
	cmp.b #$00
	bpl CODE_1FC408
	dec.b $09
CODE_1FC408:
	rep #$10
	ldx.b $76
	ldy.b $78
	plb
	rtl
CODE_1FC410:
	lda.b $15,x
	sta.b $7E
	lda.b $13,x
	sta.w $15A7
	lda.b $12,x
	sta.w $16A6
CODE_1FC41E:
	stz.b $03
	stz.b $09
	stz.b $91
	stx.b $76
	sty.b $78
	phb
	lda.b #$00
	pha
	plb
	lda.w $15A7
	eor.b #$FF
	inc
	tay
	lda.w $15A6
	tax
	sep #$10
	lda.w SineTable8,y
	sta.b $7A
	lda.w SineTable8+$40,y
	sta.b $7B
	lda.w SineTable8,x
	sta.b $82
	lda.w SineTable8+$40,x
	sta.b $83
	lda.b $7E
	bmi CODE_1FC467
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC489
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC497
CODE_1FC467:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC479
	sta.w WRMPYB
	nop
	jmp CODE_1FC491
CODE_1FC479:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC497
CODE_1FC489:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC491:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC497:
	tax
	sta.b $02
	lda.b $02
	bmi CODE_1FC4B3
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC4D5
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC4E3
CODE_1FC4B3:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC4C5
	sta.w WRMPYB
	nop
	jmp CODE_1FC4DD
CODE_1FC4C5:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC4E3
CODE_1FC4D5:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC4DD:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC4E3:
	tax
	sta.b $02
	cmp.b #$00
	bpl CODE_1FC4EC
	dec.b $03
CODE_1FC4EC:
	lda.b $7E
	bmi CODE_1FC505
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC527
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC535
CODE_1FC505:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC517
	sta.w WRMPYB
	nop
	jmp CODE_1FC52F:
CODE_1FC517:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC535
CODE_1FC527:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC52F:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC535:
	tax
	sta.b $90
	lda.b $90
	bmi CODE_1FC551
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC573
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC581
CODE_1FC551:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC563
	sta.w WRMPYB
	nop
	jmp CODE_1FC57B
CODE_1FC563:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC581
CODE_1FC573:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC57B:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC581:
	tax
	sta.b $90
	cmp.b #$00
	bpl CODE_1FC58A
	dec.b $91
CODE_1FC58A:
	lda.b $7E
	bmi CODE_1FC5A3
	asl
	sta.w WRMPYA
	lda.b $82
	bmi CODE_1FC5C5
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC5D3
CODE_1FC5A3:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $82
	bmi CODE_1FC5B5
	sta.w WRMPYB
	nop
	jmp CODE_1FC5CD
CODE_1FC5B5:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC5D3
CODE_1FC5C5:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC5CD:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC5D3:
	tax
	sta.b $08
	cmp.b #$00
	bpl CODE_1FC5DC
	dec.b $08+1
CODE_1FC5DC:
	rep #$10
	ldx.b TempIndX
	ldy.b TempIndY
	plb
	rtl
CODE_1FC5E4:
	sta.b $7E
	stx.b $76
	sty.b $78
	stz.b $08
	stz.b $08+1
	sec
	lda #$40
	sbc.b $13,x
	tax
	sep #$10
	phb
	lda.b #$00
	pha
	plb
	inx
	lda.w SineTable8,x
	sta.b $7A
	lda.w SineTable8+$40,x
	sta.b $7B
	lda.b $7E
	bmi CODE_1FC61F
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC641
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC64F
CODE_1FC61F:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7A
	bmi CODE_1FC631
	sta.w WRMPYB
	nop
	jmp CODE_1FC649
CODE_1FC631:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC64F
CODE_1FC641:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC649:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC64F:
	tax
	ldx #$00
	sta.b $02
	cmp.b #$00
	bpl CODE_1FC659
	dex
CODE_1FC659:
	stx.b $02+1
	lda.b $7E
	bmi CODE_1FC674
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC696
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC6A4
CODE_1FC674:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $7B
	bmi CODE_1FC686
	sta.w WRMPYB
	nop
	jmp CODE_1FC69E
CODE_1FC686:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC6A4
CODE_1FC696:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC69E:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC6A4:
	tax
	lda.b #$00
	sta.b $90
	cmp.b #$00
	bpl CODE_1FC6AE
	dex
CODE_1FC6AE:
	stx.b $90+1
	rep #$10
	ldx.b $76
	ldy.b $78
	plb
	rtl
CODE_1FC6B8:
	sta.b $7E
	stx.b TempIndX
	sty.b TempIndY
	stz.b $08
	stz.b $08+1
	lda.b $13,x
	tax
	sep #$10
	phb
	lda.b #$00
	pha
	plb
	inx
	lda.w SineTable8,x
	sta.b $82
	lda.w SineTable8+$40,x
	sta.b $83
	lda.b $7E
	bmi CODE_1FC6F0
	asl
	sta.w WRMPYA
	lda.b $82
	bmi CODE_1FC712
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC720
CODE_1FC6F0:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $82
	bmi CODE_1FC702
	sta.w WRMPYB
	nop
	jmp CODE_1FC71A
CODE_1FC702:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC720
CODE_1FC712:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC71A:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC720:
	tax
	ldx #$00
	sta.b $02
	cmp.b #$00
	bpl CODE_1FC72A
	dex
CODE_1FC72A:
	stx.b $02+1
	lda.b $7E
	bmi CODE_1FC745
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC767
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC775
CODE_1FC745:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b $83
	bmi CODE_1FC757
	sta.w WRMPYB
	nop
	jmp CODE_1FC76F
CODE_1FC757:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp CODE_1FC775
CODE_1FC767:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
CODE_1FC76F:
	lda.b #$00
	sec
	sbc.w RDMPYH
CODE_1FC775:
	tax
	ldx #$00
	sta.b $90
	cmp.b #$00
	bpl CODE_1FC77F
	dex
CODE_1FC77F:
	stx.b $90+1
	rep #$20
	ldx TempIndX
	ldy TempIndY
	plb
	rtl
;Routines to apply object velocity to position
ApplyTempVelocityShift2:
	rep #$20
	asl.b $02
	asl.b $08
	asl.b $90
	asl.b $02
	asl.b $08
	asl.b $90
	bra DoApplyTempVelocity
ApplyTempVelocityShift1:
	rep #$20
	asl.b $02
	asl.b $08
	asl.b $90
ApplyTempVelocity:
	rep #$20
DoApplyTempVelocity:
	lda.b $0C,x
	clc
	adc.b $02
	sta.b $0C,x
	lda.b $0E,x
	clc
	adc.b $08
	sta.b $0E,x
	lda.b $10,x
	clc
	adc.b $90
	sta.b $10,x
	sep #$20
	rtl
ApplyObjectVelocity:
	rep #$20
	lda.b $0C,x
	clc
	adc.b $2F,x
	sta.b $0C,x
	lda.b $0E,x
	clc
	adc.b $31,x
	sta.b $0E,x
	lda.b $10,x
	clc
	adc.b $33,x
	sta.b $10,x
	sep #$20
	rtl
;Object getter routines
GetObjectByID:
	stx.b $3A
	ldx FirstCandidate		;\Load X with first candidate to check...
	beq GetObjectByID_NoSelf	;/...if null, return null
	cmp #$00			;\If desired ID is 0, just get any empty object
	beq GetObjectByID_Any		;/
	txy
GetObjectByID_CheckObj:
	cmp.b $04,x			;\Check this object for a match
	beq GetObjectByID_Match		;/
GetObjectByID_NextCand:
	ldy.b $00,x			;\Get next object...
	tyx				;|
	bne GetObjectByID_CheckObj	;/...and try again
GetObjectByID_Match:
	cpx.b $3A			;\If candidate is self, try again
	beq GetObjectByID_NextCand	;/
	ldy.b $00,x			;\Set first candidate to next object...
	sty FirstCandidate		;|
	txy				;|
	ldx.b $3A			;|
	rtl				;/...and return
GetObjectByID_NoSelf:
	ldy #$0000			;\Return null
	sty FirstCandidate		;|
	ldx.b $3A			;|
	rtl				;/
GetObjectByID_Any:
	ldy.b $00,x			;\If next object is null...
	beq GetObjectByID_NoSelf	;/...return null
	tyx				;\Get next object...
	cpx.b $3A			;|if self...
	beq GetObjectByID_Any		;/...try again
	lda.b $1F,x			;\If some flag is set...
	and #$0008			;|
	beq GetObjectByID_Any		;/...try again
	stx FirstCandidate		;\Set first candidate to next object...
	ldx.b $3A			;|
	rtl				;/...and return
CODE_1FC817:
	cmp #$0000
	beq CODE_1FC84C
	stx.b $3A
	ldx FirstCandidate
	beq GetObjectByID_NoSelf
	txy
CODE_1FC824:
	cmp.b $04,x
	beq CODE_1FC82D
CODE_1FC828:
	ldy.b $00,x
	tyx
	bne CODE_1FC824
CODE_1FC82D:
	cpx.b $3A
	beq CODE_1FC828
	sta TempNewChildObjUse
	sep #$20
	lda.b $1D,x
	and.b $02
	rep #$20
	bne CODE_1FC843
	lda TempNewChildObjUse
	bra CODE_1FC828
CODE_1FC843:
	ldy.b $00,x
	sty FirstCandidate
	txy
	ldx.b $3A
	rtl
CODE_1FC84C:
	stx.b $3A
	ldx FirstCandidate
	beq CODE_1FC7F8
	txy
	sep #$20
CODE_1FC856:
	cpx.b $3A
	beq CODE_1FC860
	lda.b $1D,x
	and.b $02
	bne CODE_1FC865
CODE_1FC860:
	ldy.b $00,x
	tyx
	bne CODE_1FC856
CODE_1FC865:
	ldy.b $00,x
	sty FirstCandidate
	txy
	ldx.b $3A
	rep #$20
	rtl
CODE_1FC870:
	stx.b $04
	ldx FirstCandidate
	bne CODE_1FC87A
	brl CODE_1FC8B3
CODE_1FC87A:
	cmp.b #$00
	beq CODE_1FC8B9
	sta.b $0A
	stz.b $3C
CODE_1FC883:
	cpx.b $04
	beq CODE_1FC8A4
	lda.b $04,x
	cmp.b $0A
	bne CODE_1FC8A4
	ldy.b $04
	jsl CODE_1FD0AB
	rep #$20
	lda $1250
	cmp.b $3A
	bpl CODE_1FC8A4
	cmp.b $3E
	bmi CODE_1FC8A4
	sta.b $3A
	stx.b $3C
CODE_1FC8A4:
	ldy.b $00,x
	tyx
	bne CODE_1FC883
	ldy.b $00,x
	sty FirstCandidate
	ldy.b $3C
	ldx.b $04
	rtl
CODE_1FC8B3:
	ldy #$0000
	ldx.b $04
	rtl
CODE_1FC8B9:
	stz.b $3C
CODE_1FC8BB:
	cpx.b $04
	beq CODE_1FC8DD
	lda.b $1F,x
	and #$0008
	beq CODE_1FC8DD
	ldy.b $04
	jsl CODE_1FD0AB
	rep #$20
	lda $1250
	cmp.b $3A
	bpl CODE_1FC8DD
	cmp.b $3E
	bmi CODE_1FC8DD
	sta.b $3A
	stx.b $3C
CODE_1FC8DD:
	ldy.b $00,x
	tyx
	bne CODE_1FC8BB
	sty FirstCandidate
	ldy.b $3C
	ldx.b $04
	rtl
CODE_1FC8EA:
	stx.b $04
	ldx FirstCandidate
	beq CODE_1FC8B3
	cmp #$0000
	beq CODE_1FC925
	sta.b $0A
	stz.b $3C
CODE_1FC8FA:
	cpx.b $04
	beq CODE_1FC917
	lda.b $04,x
	cmp.b $0A
	bne CODE_1FC917
	ldy.b $04
	jsl CODE_1FD0AB
	rep #$20
CODE_1FC90C:
	lda $1250
	cmp.b $3A
	bpl CODE_1FC917
	cmp.b $3E
	bpl CODE_1FC91C
CODE_1FC917:
	ldy.b $00,x
	tyx
	bne CODE_1FC8FA
CODE_1FC91C:
	ldy.b $00,x
	sty FirstCandidate
	txy
	ldx.b $04
	rtl
CODE_1FC925:
	cpx.b $04
	beq CODE_1FC943
	lda.b $1F,x
	and #$0008
	beq CODE_1FC943
	ldy.b $04
	jsl CODE_1FD0AB
	rep #$20
	lda $1250
	cmp.b $3A
	bpl CODE_1FC943
	cmp.b $3E
	bpl CODE_1FC948
CODE_1FC943:
	ldy.b $00,x
	tyx
	bne CODE_1FC925
CODE_1FC948:
	ldy.b $00,x
	sty FirstCandidate
	txy
	ldx.b $04
	rtl
CODE_1FC951:
	php
	ldy FirstObject
CODE_1FC955:
	tyx
	cmp.b $04,x
	beq CODE_1FC961
	ldy.b $00,x
	bne CODE_1FC955
	ldx #$0000
CODE_1FC961:
	plp
	rtl
CODE_1FC963:
	php
	ldy FirstObject
	stz TempNewChildObjUse
CODE_1FC96A:
	tyx
	cmp.b $04,x
	bne CODE_1FC972
	inc TempNewChildObjUse
CODE_1FC972:
	ldy.b $00,x
	bne CODE_1FC96A
	lda TempNewChildObjUse
	plp
	rtl

CODE_1FC97B:
	
	
	
	
;Object processing routines
ProcObject:
	php
	rep #$30
	cpx $156B
	bne ProcObject_L1
	brl ProcObject_Return
ProcObject_L1:
	lda.b $2E,x
	and #$FFFB
	sta.b $2E,x
	lda.b $0C,x
	sta $1513
	lda.b $0E,x
	sta $1515
	lda.b $10,x
	sta $1517
	sep #$20
	stx $123A
	lda.b $2A,x
	bne ProcObject_L4
	lda.b $09,x
	and #$10
	beq ProcObject_L2
	jmp ProcObject_L4
ProcObject_L2:
	rep #$20
	lda $7E1CD6,x
	beq ProcObject_L3
	sep #$20
	lda.b $1E,x
	and #$02
	bne ProcObject_L6
ProcObject_L3:
	sep #$20
	lda $7E1CD2,x
	sta $1244
	rep #$20
	lda $7E1CD0,x
	bne ProcObject_L8
	sep #$20
ProcObject_L4:
	lda.b $09,x
	and #$EF
	sta.b $09,x
	lda.b $1D,x
	and #$80
	beq ProcObject_L5
	lda $7E1CD5,x
	sta $1244
	rep #$20
	lda $7E1CD3,x
	bne ProcObject_L8
	sep #$20
	lda.b $1D,x
	and #$7F
	sta.b $1D,x
	bra ProcObject_L7
ProcObject_L5:
	lda.b $1E,x
	and #$02
	beq ProcObject_L7
ProcObject_L6:
	lda.b $1E,x
	and #$FD
	sta.b $1E,x
	lda $7E1CD8,x
	sta $1244
	rep #$20
	lda $7E1CD6,x
	bne $1FD30F
	sep #$20
ProcObject_L7:
	lda.b $18,x
	sta $1244
	rep #$20
	lda.b $16,x
	beq ProcObject_Exit
ProcObject_L8:
	sta $1242
	sep #$20
	lda.b #BANKOF(STACKIFY(ProcObject_Return))
	pha
	rep #$20
	lda.w #STACKIFY(ProcObject_Return)
	pha
	sep #$20
	lda $1244
	pha
	rep #$20
	stz $1521
	lda $1242
	dec
	pha
	sep #$20
	rtl
ProcObject_Return:
	sep #$20
	lda $14C9
ProcObject_Exit:
	plp
	rtl
CODE_1FD337:
	sep #$20
	stz NMITIMEN
	stz HDMAEN
	stz TM
	stz TS
	pha
CODE_1FD346:
	stz HDMAEN
	lda #$80
	sta INIDISP
	pla
	stz CGADD
	sta CGDATA
	inc
	sta CGDATA
	inc
	and #$0F
	pha
	lda $120E
	sta HDMAEN
	lda #$0F
	sta INIDISP
	nop
	nop
	nop
	nop
	bra CODE_1FD346
ClearObject:
	phx
	tyx
	ply
	lda.b #$00
	phy
	phx
	ldy #$0032
ClearObject_L1:
	sta.b $04,x
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
	lda.b $08,x
	ora #$10
	sta.b $08,x
	lda.b $09,x
	ora #$08
	sta.b $09,x
	lda.b $2E,x
	ora #$04
	sta.b $2E,x
	lda.b $1F,x
	ora #$08
	sta.b $1F,x
	phx
	tyx
	ply
	rtl
	
	
	
	
	
	
	
	
	
	
	
CopyPositionIndXToIndY:
	rep #$20
	lda.b $0C,x
	sta $000C,y
	lda.b $0E,x
	sta $000E,y
	lda.b $10,x
	sta $0010,y
	sep #$20
	rtl
CopyPositionIndYToIndX:
	rep #$20
	lda $000C,y
	sta.b $0C,x
	lda $000E,y
	sta.b $0E,x
	lda $0010,y
	sta.b $10,x
	sep #$20
	rtl
CopyRotationIndXToIndY:
	lda.b $12,x
	sta $0012,y
	lda.b $13,x
	sta $0013,y
	lda.b $14,x
	sta $0015,y
	rtl
CopyRotationIndYToIndX:
	lda $0012,y
	sta.b $12,x
	lda $0013,y
	sta.b $13,x
	lda $0014,y
	sta.b $14,x
	rtl
MoveObjectAgainstRails:
	rep #$20
	lda TrueZVel
	sec
	sbc RailOffset
	clc
	adc.b $10,x
	sta.b $10,x
	sep #$20
	rtl
MoveObjectAgainstRailsIndY:
	rep #$20
	lda TrueZVel
	sec
	sbc RailOffset
	clc
	adc $0010,y
	sta $0010,y
	sep #$20
	rtl
ClearVelocity:
	rep #$20		;\
	stz.b $2F,x		;|Store zero in velocity X element...
	stz.b $31,x		;|...same for Y...
	stz.b $33,x		;|...same for Z...
	sep #$20		;|
	stz.b $15,x		;|...and store zero in unknown object property $15
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
	
	
	
	
	
MoveObjectAlongRails:
	rep #$20		;\
	lda.b $10,x		;|Add rail offset to Z position
	clc			;|
	adc RailOffset		;|
	sta.b $10,x		;|
	sep #$20		;|
	rtl			;/
MoveObjectAlongRailsIndY:
	rep #$20		;\
	lda.b $0010,y		;|Add rail offset to Z position
	clc			;|
	adc RailOffset		;|
	sta.b $0010,y		;|
	sep #$20		;|
	rtl			;/
CODE_1FDC85:
	rts
CODE_1FDC86:
	rts
CODE_1FDC87:
	rtl
CODE_1FDC88:
	rts
	
	
	
BehF1_TitleHighPolyArwing:
	lda #$EF		;\Init X Rotation
	sta.b $12,x		;/
	lda #$60		;\Init Y Rotation
	sta.b $13,x		;/
	lda #$00		;\Init Z Rotation
	sta.b $14,x		;/
	;Set object behavior function pointer to skip this initialization
	rep #$20
	lda.w #BehF1_TitleHighPolyArwing_Main
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(BehF1_TitleHighPolyArwing_Main)
	sta.b $18,x
BehF1_TitleHighPolyArwing_Main:
	lda.b $14,x		;\Rotate about local Z
	clc			;|
	adc #$02		;|
	sta.b $14,x		;/
	jsl MoveObjectAlongRails
	rtl
	;Compressed tilemap
	INCBIN "graphics/compressed/venom.mapz"		;1FF963
Controls:
	php
	sep #$20
	rep #$10
	jsl LoadAudio_Controls
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
	lda.b #$00
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
	sta RenderHUDFlag
	lda #$0040
	sta $700034
	lda #$0030
	sta $700036
	sep #$20
	lda #$01
	sta $1F0D
	stz $15BB
	stz $15BC
	stz Pad1HiCur
	stz Pad1HiPrev
	lda $1FDF
	beq Controls_L1
	brl Controls_L5
Controls_L1:
	lda $7EA05A
	beq Controls_L2
	brl Controls_L5
Controls_L2:
	sep #$20
	lda $14D6
	and #$1F
	sta $14D6
Controls_L3:
	jsl CODE_02FD84
	rep #$20
	stz $15AF
	jsl CODE_03DBD0
	jsr CODE_1FFD54
	sep #$20
	lda Pad1Down+1
	bit #$20
	beq Controls_L4
	lda $1F0F
	inc
	and #$03
	sta $1F0F
	lda #$11
	jsl PushSoundEffectToQueue
Controls_L4:
	jsr CODE_1FFDAC
	rep #$20
	lda $15BB
	cmp #$0010
	bcc Controls_L3
	sep #$20
	lda Pad1Down+1
	bit #$10
	beq Controls_L3
	lda #$10
	jsl PushSoundEffectToQueue
Controls_L5:
	sep #$20
	lda TIMEUP
	cli
Controls_L6:
	jsl CODE_02FD84
	jsr ControlsOAM
	jsr CODE_1FFD54
	jsr CODE_1FFDAC
	sep #$20
	lda $14D6
	ora #$60
	sta $14D6
	lda Pad1Down+1
	bit #$20
	beq Controls_L7
	lda $7EA05A
	eor #$01
	sta $7EA05A
	lda #$11
	jsl PushSoundEffectToQueue
Controls_L7:
	lda $7EA05A
	beq Controls_L8
	lda PadDown+1
	bit #$08
	beq Controls_L8
	lda.b #$00
	sta $7EA05A
	lda #$11
	jsl PushSoundEffectToQueue
Controls_L8:
	lda $7EA05A
	bne Controls_L9
	lda Pad1Down+1
	bit #$04
	beq Controls_L9
	lda #$01
	sta $7EA05A
	lda #$11
	jsl PushSoundEffectToQueue
Controls_L9:
	lda Pad1Down
	bit #$40
	beq Controls_L10
	brl Controls_L2
Controls_L10:
	lda Pad1Down+1
	bit #$40
	beq Controls_L11
	brl Controls_L2
Controls_L11:
	lda Pad1Down
	bit #$80
	bne Controls_L12
	lda Pad1Down+1
	bit #$80
	bne Controls_L12
	lda Pad1Down+1
	bit #$10
	bne Controls_L12
	brl Controls_L6
Controls_L12:
	sep #$20
	lda #$10
	jsl PushSoundEffectToQueue
	lda #$F1
	sta MusicID
	stz MusicLoaded
	lda #$FF
	sta FadeMode
Controls_L13:
	jsl CODE_02FD84
	jsr ControlsOAM
	jsr CODE_1FFD54
	sep #$20
	lda FadeMode
	and #$FF
	bne Controls_L13
	stz $1F0D
	lda $7EA05A
	beq Controls_L14
	brl Controls_L20
Controls_L14:
	jsl CODE_02E266
	sep #$20
	rep #$10
	lda #$0D
	ldx #$6DC0
	sta LevelScriptBank
	stx LevelScriptPointer
	jsl CODE_02E2CC
	sep #$20
	lda #$01
	sta Lives
	stz $15BB
	stz $15BC
Controls_L15:
	jsl CODE_02FD84
	jsl $02D956
	jsl CODE_03EA26
	rep #$20
	lda $15BB
	cmp #$0014
	bcc Controls_L15
	sep #$20
	lda $1FD2
	cmp #$0A
	beq Controls_L18
	lda $14D1
	and #$08
	beq Controls_L16
	lda $14D7
	bit #$80
	bne Controls_L15
Controls_L16:
	lda Pad1Down+1
	bit #$10
	beq Controls_L15
	sep #$20
	lda #$F1
	sta MusicID
	stz MusicLoaded
	lda #$FF
	sta FadeMode
Controls_L17:
	jsl CODE_02FD84
	jsl $02D956
	sep #$20
	lda FadeMode
	and #$FF
	bne Controls_L17
	jsl CODE_02E266
	sep #$20
	lda #$01
	sta $7EA05A
	sta $1FDF
	bra Controls_L19
Controls_L18:
	jsl CODE_02E266
	sep #$20
	lda.b #$00
	sta $7EA05A
	lda #$01
	sta $1FDF
Controls_L19:
	stz $1FD2
	plp
	jmp Controls
Controls_L20:
	plp
	rtl
ControlsOAM:
	rep #$30
	ldx.w #$0000
	stx.w OAMBufferPtr
	ldx.w #$0000
	lda.l $7EA05A
	beq ControlsOAM_L1
	ldx.w #$0078
ControlsOAM_L1:
	ldy.w OAMBufferPtr
	ldx.w #$97A8
	sta TempNewChildObjUse
ControlsOAM_L2:
	lda.w TempNewChildObjUse
	sta.w OAMBuffer,y
	lda.w ControlsOAMData,x
	clc
	adc.w #$3080
	sta.w OAMBuffer+2,y
	iny
	iny
	iny
	iny
	inx
	inx
	lda.w TempNewChildObjUse
	clc
	adc.w #$0008
	sta.w TempNewChildObjUse
	and.w #$00FF
	cmp.w #$00F8
	bne ControlsOAM_L2
	lda.w TempNewChildObjUse
	and.w #$FF00
	clc
	adc.w #$0800
	cmp.w #$C700
	beq.w ControlsOAM_L3
	ora.w #$00A8
	sta.w TempNewChildObjUse
	bra ControlsOAM_L2
ControlsOAM_L3:
	sty.w OAMBufferPtr
	jsl CODE_03DBD0
	rts
ControlsOAMData:
	DW $0000,$0001,$0001,$0001,$0001,$0001,$0001,$0001
	DW $0001,$4000,$0002,$0020,$0004,$0005,$0006,$0007
	DW $0008,$0009,$000A,$4020,$0002,$8020,$000B,$000C
	DW $000D,$000E,$000F,$0010,$0011,$4002,$0002,$0003
	DW $0012,$0013,$0014,$0015,$0016,$0017,$0018,$4002
	DW $0002,$0003,$0019,$001A,$001B,$001C,$001D,$001E
	DW $001F,$4002,$8000,$8001,$8001,$8001,$8001,$8001
	DW $8001,$8001,$8001,$C000,$0000,$0001,$0001,$0001
	DW $0001,$0001,$0001,$0001,$0001,$4000,$0002,$0003
	DW $0004,$0005,$0006,$0007,$0008,$0009,$000A,$4002
	DW $0002,$0003,$000B,$000C,$000D,$000E,$000F,$0010
	DW $0011,$4002,$0002,$0020,$0012,$0013,$0014,$0015
	DW $0016,$0017,$0018,$4002,$0002,$8020,$0019,$001A
	DW $001B,$001C,$001D,$001E,$001F,$4002,$8000,$8001
	DW $8001,$8001,$8001,$8001,$8001,$8001,$8001,$C000
CODE_1FFD54:
	jsl $02D956
CODE_1FFD58:
	lda.b CurNMITask
	bne CODE_1FFD58
	sep #$20
	rep #$10
	ldx.w $16AB
	cpx.w #$0039
	bne CODE_1FFD73
	lda.b #$28
	sta.w $1FDA
	stz.w $16AB
	stz.w $16AC
CODE_1FFD73:
	lda.b #$03
	sta.w NovaBombs
	ldx.w PlayerObject
	lda.b $15,x
	sta.b TempRotZ
	lda.b $12,x
	asl
	sta.w TempRotX
	lda.b $13,x
	sta.w TempRotY
	jsl CODE_1FC41E
	rep #$20
	lda.w $1FD4
	clc
	adc.b TempVecX
	sta.w $1FD4
	lda.w $1FD6
	clc
	adc.b TempVecY
	sta.w $1FD6
	lda.w $1FD8
	clc
	adc.b TempVecZ
	sta.w $1FD8
	rts
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
	ldx.w #(CopiedCodeBEnd-CopiedCodeB-1+$6C)	;\Copy second code section to RAM
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
	lda.b #$00
	pha
	plb
	lda.w SCMRMirror
	ora.b #$18
	sta.w SCMR
	jsl RunNMITask
	sep #$20
	inc.w $1200
	lda.w TIMEUP
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
	lda.b #$00
	pha
	plb
	lda.w SCMRMirror
	sta.w SCMR
	jsl CODE_1FBFDB
	lda.w SCMRMirror
	ora.b #$18
	sta.w SCMR
	sep #$20
	lda.w RDNMI
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
