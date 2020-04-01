	;Continuation of data to transfer
	;Music data
	INCBIN "audio/songs/outofthisdimension.mus":$0790-$1602
	;End of transfer
	DW $0000,$0400
	
	;Transfer $001A bytes to SPC address $FDC8
	DW $001A,$FDC8
	;Data to transfer
	;Music pointers
	DW $E000,$E000,$F8FE,$0000,$0000,$0000,$0000,$0000
	DW $0000,$0000,$0000,$0000,$FCCE
	;Transfer $05A4 bytes to SPC address $E000
	DW $05A4,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/unk1F8E99.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $001A bytes to SPC address $FDC8
	DW $001A,$FDC8
	;Data to transfer
	;Music pointers
	DW $E600,$E600,$F8FE,$0000,$0000,$0000,$0000,$0000
	DW $0000,$0000,$0000,$0000,$FCCE
	;Transfer $05D1 bytes to SPC address $E600
	DW $05D1,$E600
	;Data to transfer
	;Music data
	INCBIN "audio/songs/titaniaboss.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $001A bytes to SPC address $FDC8
	DW $001A,$FDC8
	;Data to transfer
	;Music pointers
	DW $E600,$E600,$F8FE,$0000,$0000,$0000,$0000,$0000
	DW $0000,$0000,$0000,$0000,$FCCE
	;Transfer $04EC bytes to SPC address $E600
	DW $04EC,$E600
	;Data to transfer
	;Music data
	INCBIN "audio/songs/meteorboss.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0004 bytes to SPC address $FDC8
	DW $0004,$FDC8
	;Data to transfer
	;Music pointers
	DW $EC00,$EC0E
	;Transfer $042E bytes to SPC address $EC00
	DW $042E,$EC00
	;Data to transfer
	;Music data
	INCBIN "audio/songs/atomiccoreboss.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0004 bytes to SPC address $FDC8
	DW $0004,$FDC8
	;Data to transfer
	;Music pointers
	DW $EC04,$EC00
	;Transfer $03EB bytes to SPC address $EC00
	DW $03EB,$EC00
	;Data to transfer
	;Music data
	INCBIN "audio/songs/venom12boss.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0004 bytes to SPC address $FDC8
	DW $0004,$FDC8
	;Data to transfer
	;Music pointers
	DW $EAC8,$EAC8
	;Transfer $081D bytes to SPC address $EAC8
	DW $081D,$EAC8
	;Data to transfer
	;Music data
	INCBIN "audio/songs/venom3boss.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0004 bytes to SPC address $FDC8
	DW $0004,$FDCC
	;Data to transfer
	;Music pointers
	DW $F98E,$0000
	;Transfer $0004 bytes to SPC address $FDC8
	DW $0004,$FDE2
	;Data to transfer
	;Music pointers
	DW $F2E5,$F2F3
	;Transfer $081D bytes to SPC address $F2E5
	DW $081D,$F2E5
	;Data to transfer
	;Music data
	INCBIN "audio/songs/androssboss.mus"
	;End of transfer
	DW $0000,$0400
	
	;Compressed tileset
	INCBIN "graphics/compressed/controlsoam.4bpp.chrz"
	
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;RESET AND INTERRUPT ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UnkFunc_1FBDB0:
	rtl
DoReset:
	sei						; Disable interrupts
	clc						;\Disable emulation mode
	xce						;/
	rep #$30
	lda.w #$0000					;\Clear D register
	tad						;/
	ldx.w #$02FF					;\Set stack pointer to $02FF
	txs						;/
	sep #$30
	pha						;\Set DBR to 0
	plb						;/
	sep #$30
	jsl InitRegisters
	jsr ClearRAM
	rep #$10
	ldx.w #$02FF					;\Set stack pointer to $02FF (again?)
	txs						;/
	sep #$30
	jsl InitPlayerStateEx				; Init player state
	jsl Intro					;\Do intro and title
	jsl Title					;/
	sep #$20
	lda.b #$00
	sta.l Unknown_7EA05A
	lda.b #$00
	sta.w Unknown_1FDF
	bra DoResetPart2
UnkFunc_1FBDEE:
	rep #$30
	clc						;\Disable emulation mode
	xce						;/
	lda.w #$0000					;\Clear D register
	tad						;/
	ldx.w #$02FF					;\Set stack pointer to $02FF
	txs						;/
	sep #$30
	sei						; Disable interrupts
	jsl InitRegisters
	
	lda.w LevelID					;\Save some values on the stack before calling
	pha						;|
	lda.w Unknown_1FDF				;|
	pha						;|
	lda.l Unknown_7EA05A				;|
	pha						;|
	lda.w ControlStyle				;|
	pha						;/
	jsr ClearRAM					; Clear out the rest of RAM
	pla						;\Restore our saved values
	sta.w ControlStyle				;|
	pla						;|
	sta.l Unknown_7EA05A				;|
	pla						;|
	sta.w Unknown_1FDF				;|
	pla						;|
	sta.w LevelID					;/
	
	lda.b #$01
	sta.w InitDataSentFlag
	sta.l $7EF0B3
	jsl InitPlayerStateEx				; Init player state
DoResetPart2:
	jsl Controls					; Do controls
	jsl InitPlayerStateEx				; Init player state
	jmp Map						; Do map
ClearRAM:
	php						; Save processor status
	sep #$20
	lda.b #$7E					;\Set DBR to $7E
	pha						;|
	plb						;/
	rep #$30
	ldx.w #$2000
ClearRAM_Bank7EHi:					;\Clear bank $7E from $2000-$FFFF
	stz.w $0000,x					;|
	stz.w $0002,x					;|
	stz.w $0004,x					;|
	stz.w $0006,x					;|
	txa						;|
	clc						;|
	adc.w #$0008					;|
	tax						;|
	bne ClearRAM_Bank7EHi				;/
	sep #$20
	lda.b #$7F					;\Set DBR to $7F
	pha						;|
	plb						;/
	rep #$20
ClearRAM_Bank7F:					;\Clear all of bank $7F
	stz.w $0000,x					;|
	stz.w $0002,x					;|
	stz.w $0004,x					;|
	stz.w $0006,x					;|
	txa						;|
	clc						;|
	adc.w #$0008					;|
	tax						;|
	bne ClearRAM_Bank7F				;/
	sep #$20
	lda.b #$70					;\Set DBR to $70
	pha						;|
	plb						;/
	rep #$30
ClearRAM_Bank70:					;\Clear bank $70 from $0000-$7FFF
	stz.w $0000,x					;|
	stz.w $0002,x					;|
	stz.w $0004,x					;|
	stz.w $0006,x					;|
	txa						;|
	clc						;|
	adc.w #$0008					;|
	tax						;|
	bpl ClearRAM_Bank70				;/
	sep #$20
	lda.b #$00					;\Set DBR to $00
	pha						;|
	plb						;/
	rep #$20
	ldx.w #$1CF8
ClearRAM_Bank00Misc:					;\Clear bank $00 from $1FF8-$82FF
	stz.w $0300,x					;|
	stz.w $0302,x					;|
	stz.w $0304,x					;|
	stz.w $0306,x					;|
	txa						;|
	clc						;|
	adc.w #$0008					;|
	tax						;|
	bpl ClearRAM_Bank00Misc				;/
	ldx.w #$00FE
ClearRAM_ZeroPage:					;\Clear zero page
	stz.b $00,x					;|
	dex						;|
	dex						;|
	bpl ClearRAM_ZeroPage				;/
	jsl CopyCodeToRam				; Copy some code to RAM
	sep #$20					;\Get region
	lda STAT78					;|
	and.b #$10					;|
	sta.w PalFlag					;/
	plp						;\Restore processor status and return
	rts						;/
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
	lda.b #$00					;\Clear a bunch of registers (why not just use stz here?)
	sta.w OBSEL					;|
	sta.w OAMADDL					;|
	sta.w OAMADDH					;|
	sta.w BGMODE					;|
	sta.w MOSAIC					;|
	sta.w BG1SC					;|
	sta.w BG2SC					;|
	sta.w BG3SC					;|
	sta.w BG4SC					;|
	sta.w BG12NBA					;|
	sta.w BG34NBA					;|
	sta.w BG1HOFS					;|
	sta.w BG1HOFS					;|
	sta.w BG1VOFS					;|
	sta.w BG1VOFS					;|
	sta.w BG2HOFS					;|
	sta.w BG2HOFS					;|
	sta.w BG2VOFS					;|
	sta.w BG2VOFS					;|
	sta.w BG3HOFS					;|
	sta.w BG3VOFS					;|
	sta.w BG3VOFS					;|
	sta.w BG4HOFS					;|
	sta.w BG4HOFS					;|
	sta.w BG4VOFS					;|
	sta.w BG4VOFS					;/
	ldx.b #$80					;\Init VRAM write registers
	stx.w VMAIN					;|
	sta.w VMADDL					;|
	sta.w VMADDH					;/
	sta.w M7SEL					;\Init Mode 7 registers
	ldx.b #$01					;|
	sta.w M7A					;|
	stx.w M7A					;|
	sta.w M7B					;|
	sta.w M7B					;|
	sta.w M7C					;|
	sta.w M7C					;|
	sta.w M7D					;|
	stx.w M7D					;|
	sta.w M7X					;|
	sta.w M7X					;|
	sta.w M7Y					;|
	sta.w M7Y					;/
	sta.w CGADD					;\Clear more registers
	sta.w CGDATA					;|
	sta.w W12SEL					;|
	sta.w W34SEL					;|
	sta.w WOBJSEL					;|
	sta.w WH0					;|
	sta.w WH1					;|
	sta.w WH2					;|
	sta.w WH3					;|
	sta.w WBGLOG					;|
	sta.w WOBJLOG					;|
	sta.w TM					;|
	sta.w TS					;|
	sta.w TMW					;/
	ldy.b #$30					;\Init some color math registers
	sty.w CGWSEL					;|
	sta.w CGADSUB					;|
	ldx.b #$E0					;|
	stx.w COLDATA					;/
	sta.w SETINI
	sta.w NMITIMEN
	ldx.b #$FF
	stx.w WRIO
	sta.w WRMPYA					;\Clear even more registers
	sta.w WRMPYB					;|
	sta.w WRDIVL					;|
	sta.w WRDIVH					;|
	sta.w WRDIVB					;|
	sta.w HTIMEL					;|
	sta.w HTIMEH					;|
	sta.w VTIMEL					;|
	sta.w VTIMEH					;|
	sta.w MDMAEN					;|
	sta.w HDMAEN					;|
	sta.w MEMSEL					;/
	rtl
UnkFunc_1FBFDB:
	rtl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;OBJECT MANAGEMENT ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Calls_UnkFunc_1FBFE0:
	jsr UnkFunc_1FBFE0
	rtl
UnkFunc_1FBFE0:
	phx
	phy
	php
	jsl CODE_1FDBA4
	rep #$20
	phx
	txa
	ldx.w FirstObject
UnkFunc_1FBFE0_L1:
	cmp.b $19,x
	bne UnkFunc_1FBFE0_L2
	stz.b $19,x
UnkFunc_1FBFE0_L2:
	cmp.b $06,x
	bne UnkFunc_1FBFE0_L3
	stz.b $06,x
UnkFunc_1FBFE0_L3:
	cmp.w Object2ListRel+$13,x
	bne UnkFunc_1FBFE0_L4
	stz.w Object2ListRel+$13,x
UnkFunc_1FBFE0_L4:
	cmp.b $1B,x
	bne UnkFunc_1FBFE0_L5
	stz.b $1B,x
UnkFunc_1FBFE0_L5:
	ldy.b $00,x
	tyx
	bne UnkFunc_1FBFE0_L1
	plx
	jsl CODE_0AFB8E
	ldy.b $02,x
	bne UnkFunc_1FBFE0_L6
	ldy.b $00,x
	sty.w FirstObject
	lda.w #$0000
	sta.w $0002,y
	bra UnkFunc_1FBFE0_L8
UnkFunc_1FBFE0_L6:
	phx
	lda.b $00,x
	tax
	stx.b $00,y
	cmp.w #$0000
	beq UnkFunc_1FBFE0_L7
	sty.b $02,x
UnkFunc_1FBFE0_L7:
	plx
UnkFunc_1FBFE0_L8:
	lda.w FirstFreeObject
	sta.b $00,x
	stx.w FirstFreeObject
	plp
	ply
	plx
	rts
UpdateModelInfoBuffer:
	php
	rep.b #$30
	stz.w Unknown_1EFB
	ldx.w FirstObject
	beq UpdateModelInfoBuffer_Exit
	ldy.w #$0000
UpdateModelInfoBuffer_Loop:
	phx
	lda.b $2E,x
	and.w #$0004
	bne UpdateModelInfoBuffer_Next
	lda.b $1E,x
	and.w #$0001
	bne UpdateModelInfoBuffer_Next
	lda.b $2A,x
	and.w #$00FF
	beq UpdateModelInfoBuffer_Next
	lda.b $08,x
	bit.w #$0001
	bne UpdateModelInfoBuffer_Next
	phx
	lda.b $04,x
	tyx
	tay
	pla
	sta.l ModelInfo+$00,x
	lda.w $0008,y
	sta.l ModelInfo+$02,x
	lda.w $000A,y
	sta.l ModelInfo+$04,x
	lda.w $000C,y
	sta.l ModelInfo+$06,x
	lda.w $000E,y
	sta.l ModelInfo+$08,x
	inc Unknown_1EFB
	txa
	clc
	adc.w #$000A
	tay
UpdateModelInfoBuffer_Next:
	plx
	lda.b $00,x
	tax
	bne UpdateModelInfoBuffer_Loop
UpdateModelInfoBuffer_Exit:
	plp
	rtl
GetLocalZXBParam15RotateRotY:
	lda.b $15,x
	sta.b TempRotZ
	phb
	stx.b TempRegX
	sty.b TempRegY
	stz.b $08
	stz.b $09
	lda.b $13,x
	tax
	sep
	lda.b #$00
	pha
	plb
	lda.w SineTable8,x
	sta.b TempSin
	lda.w SineTable8+$40,x
	sta.b TempCos
	lda.b TempRotZ
	bmi GetLocalZXBParam15RotateRotY_L1
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi GetLocalZXBParam15RotateRotY_L3
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZXBParam15RotateRotY_L5
GetLocalZXBParam15RotateRotY_L1:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi GetLocalZXBParam15RotateRotY_L2
	sta.w WRMPYB
	nop
	jmp GetLocalZXBParam15RotateRotY_L4
GetLocalZXBParam15RotateRotY_L2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZXBParam15RotateRotY_L5
GetLocalZXBParam15RotateRotY_L3:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalZXBParam15RotateRotY_L4:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalZXBParam15RotateRotY_L5:
	tax
	ldx.b #$00
	sta.b TempVecXG
	cmp.b #$00
	bpl GetLocalZXBParam15RotateRotY_L6
	dex
GetLocalZXBParam15RotateRotY_L6:
	stx.b TempVecXG+1
	lda.b TempRotZ
	bmi GetLocalZXBParam15RotateRotY_L7
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi GetLocalZXBParam15RotateRotY_L9
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZXBParam15RotateRotY_L11
GetLocalZXBParam15RotateRotY_L7:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi GetLocalZXBParam15RotateRotY_L8
	sta.w WRMPYB
	nop
	jmp GetLocalZXBParam15RotateRotY_L10
GetLocalZXBParam15RotateRotY_L8:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZXBParam15RotateRotY_L11
GetLocalZXBParam15RotateRotY_L9:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalZXBParam15RotateRotY_L10:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalZXBParam15RotateRotY_L11:
	tax
	ldx.b #$00
	sta.b TempVecZG
	cmp.b #$00
	bpl GetLocalZXBParam15RotateRotY_L12
	dex
GetLocalZXBParam15RotateRotY_L12:
	stx.b TempVecZG+1
	rep #$10
	ldx.b TempRegY
	ldy.b TempRegY
	plb
	rtl
GetLocalZXBParam15RotateNegRotY:
	lda.b $15,x
	sta.b TempRotZ
	lda.b $13,x
GetLocalZX8RotateNegRotY:
	stx.b TempRegX
	sty.b TempRegY
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
	sta.b TempSin
	lda.w SineTable8+$40,x
	sta.b TempCos
	lda.b TempRotZ
	bmi GetLocalZXRotateNegRotY_L1
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi GetLocalZXRotateNegRotY_L3
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZXRotateNegRotY_L5
GetLocalZXRotateNegRotY_L1:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi GetLocalZXRotateNegRotY_L2
	sta.w WRMPYB
	nop
	jmp GetLocalZXRotateNegRotY_L4
GetLocalZXRotateNegRotY_L2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZXRotateNegRotY_L5
GetLocalZXRotateNegRotY_L3:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalZXRotateNegRotY_L4:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalZXRotateNegRotY_L5:
	tax
	ldx.b #$00
	sta.b TempVecXG
	cmp.b #$00
	bpl GetLocalZXRotateNegRotY_L6
	dex
GetLocalZXRotateNegRotY_L6:
	stx.b TempVecXG+1
	lda.b TempRotZ
	bmi GetLocalZXRotateNegRotY_L7
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi GetLocalZXRotateNegRotY_L9
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZXRotateNegRotY_L11
GetLocalZXRotateNegRotY_L7:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi GetLocalZXRotateNegRotY_L8
	sta.w WRMPYB
	nop
	jmp GetLocalZXRotateNegRotY_L10
GetLocalZXRotateNegRotY_L8:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZXRotateNegRotY_L11
GetLocalZXRotateNegRotY_L9:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalZXRotateNegRotY_L10:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalZXRotateNegRotY_L11:
	tax
	ldx.b #$00
	sta.b TempVecZG
	cmp.b #$00
	bpl GetLocalZXRotateNegRotY_L12
	dex
GetLocalZXRotateNegRotY_L12:
	stx.b TempVecZG+1
	rep #$10
	ldx.b TempRegX
	ldy.b TempRegY
	plb
	rtl
GetLocalXYZBParam15RotateNegRotXRotY:
	lda.b $15,x
	sta.b TempRotZ
	stz.b TempVecXG+1
	stz.b TempVecYG+1
	stz.b TempVecZG+1
	stx.b TempRegX
	sty.b TempRegY
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
	sta.b TempSin
	lda.w SineTable8+$40,y
	sta.b TempCos
	lda.w SineTable8,x
	sta.b TempSinB
	lda.w SineTable8+$40,x
	sta.b TempCosB
	lda.b TempRotZ
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L1
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L3
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L5
GetLocalXYZBParam15RotateNegRotXRotY_L1:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L2
	sta.w WRMPYB
	nop
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L4
GetLocalXYZBParam15RotateNegRotXRotY_L2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L5
GetLocalXYZBParam15RotateNegRotXRotY_L3:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZBParam15RotateNegRotXRotY_L4:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZBParam15RotateNegRotXRotY_L5:
	tax
	sta.b TempVecXG
	lda.b TempVecXG
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L6
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L8
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L10
GetLocalXYZBParam15RotateNegRotXRotY_L6:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L7
	sta.w WRMPYB
	nop
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L9
GetLocalXYZBParam15RotateNegRotXRotY_L7:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	sta.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L10
GetLocalXYZBParam15RotateNegRotXRotY_L8:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZBParam15RotateNegRotXRotY_L9:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZBParam15RotateNegRotXRotY_L10:
	tax
	sta.b TempVecXG
	cmp.b #$00
	bpl GetLocalXYZBParam15RotateNegRotXRotY_L11
	dec.b TempVecXG+1
GetLocalXYZBParam15RotateNegRotXRotY_L11:
	lda.b TempRotZ
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L12
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L14
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L16
GetLocalXYZBParam15RotateNegRotXRotY_L12:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L13
	sta.w WRMPYB
	nop
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L15
GetLocalXYZBParam15RotateNegRotXRotY_L13:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L16
GetLocalXYZBParam15RotateNegRotXRotY_L14:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZBParam15RotateNegRotXRotY_L15:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZBParam15RotateNegRotXRotY_L16:
	tax
	sta.b TempVecZG
	lda.b TempVecZG
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L17
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L19
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L21
GetLocalXYZBParam15RotateNegRotXRotY_L17:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L18
	sta.w WRMPYB
	nop
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L20
GetLocalXYZBParam15RotateNegRotXRotY_L18:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L21
GetLocalXYZBParam15RotateNegRotXRotY_L19:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZBParam15RotateNegRotXRotY_L20:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZBParam15RotateNegRotXRotY_L21:
	tax
	sta.b TempVecZG
	cmp.b #$00
	bpl GetLocalXYZBParam15RotateNegRotXRotY_L22
	dec.b TempVecZG+1
GetLocalXYZBParam15RotateNegRotXRotY_L22:
	lda.b TempRotZ
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L23
	asl
	sta.w WRMPYA
	lda.b TempSinB
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L25
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L27
GetLocalXYZBParam15RotateNegRotXRotY_L23:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempSinB
	bmi GetLocalXYZBParam15RotateNegRotXRotY_L24
	sta.w WRMPYA
	nop
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L26
GetLocalXYZBParam15RotateNegRotXRotY_L24:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZBParam15RotateNegRotXRotY_L27
GetLocalXYZBParam15RotateNegRotXRotY_L25:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZBParam15RotateNegRotXRotY_L26:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZBParam15RotateNegRotXRotY_L27:
	tax
	sta.b TempVecYG
	cmp.b #$00
	bpl GetLocalXYZBParam15RotateNegRotXRotY_L28
	dec.b TempVecYG+1
GetLocalXYZBParam15RotateNegRotXRotY_L28:
	rep #$10
	ldx.b TempRegX
	ldy.b TempRegY
	plb
	rtl
GetTempRotation:
	lda.b $15,x
	sta.b TempRotZ
	lda.b $13,x
	sta.w TempRotY
	lda.b $12,x
	sta.w TempRotX
GetLocalXYZ8RotateRotXNegRotY:
	stz.b TempVecXG+1
	stz.b TempVecYG+1
	stz.b TempVecZG+1
	stx.b TempRegX
	sty.b TempRegY
	phb
	lda.b #$00
	pha
	plb
	lda.w TempRotY
	eor.b #$FF
	inc
	tay
	lda.w TempRotX
	tax
	sep #$10
	lda.w SineTable8,y
	sta.b TempSin
	lda.w SineTable8+$40,y
	sta.b TempCos
	lda.w SineTable8,x
	sta.b TempSinB
	lda.w SineTable8+$40,x
	sta.b TempCosB
	lda.b TempRotZ
	bmi GetLocalXYZ8RotateRotXNegRotY_L1
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi GetLocalXYZ8RotateRotXNegRotY_L3
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L5
GetLocalXYZ8RotateRotXNegRotY_L1:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi GetLocalXYZ8RotateRotXNegRotY_L2
	sta.w WRMPYB
	nop
	jmp GetLocalXYZ8RotateRotXNegRotY_L4
GetLocalXYZ8RotateRotXNegRotY_L2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L5
GetLocalXYZ8RotateRotXNegRotY_L3:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZ8RotateRotXNegRotY_L4:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZ8RotateRotXNegRotY_L5:
	tax
	sta.b TempVecXG
	lda.b TempVecXG
	bmi GetLocalXYZ8RotateRotXNegRotY_L6
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi GetLocalXYZ8RotateRotXNegRotY_L8
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L10
GetLocalXYZ8RotateRotXNegRotY_L6:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi GetLocalXYZ8RotateRotXNegRotY_L7
	sta.w WRMPYB
	nop
	jmp GetLocalXYZ8RotateRotXNegRotY_L9
GetLocalXYZ8RotateRotXNegRotY_L7:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L10
GetLocalXYZ8RotateRotXNegRotY_L8:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZ8RotateRotXNegRotY_L9:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZ8RotateRotXNegRotY_L10:
	tax
	sta.b TempVecXG
	cmp.b #$00
	bpl GetLocalXYZ8RotateRotXNegRotY_L11
	dec.b TempVecXG+1
GetLocalXYZ8RotateRotXNegRotY_L11:
	lda.b TempRotZ
	bmi GetLocalXYZ8RotateRotXNegRotY_L12
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi GetLocalXYZ8RotateRotXNegRotY_L14
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L16
GetLocalXYZ8RotateRotXNegRotY_L12:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi GetLocalXYZ8RotateRotXNegRotY_L13
	sta.w WRMPYB
	nop
	jmp GetLocalXYZ8RotateRotXNegRotY_L15
GetLocalXYZ8RotateRotXNegRotY_L13:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L16
GetLocalXYZ8RotateRotXNegRotY_L14:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZ8RotateRotXNegRotY_L15:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZ8RotateRotXNegRotY_L16:
	tax
	sta.b TempVecZG
	lda.b TempVecZG
	bmi GetLocalXYZ8RotateRotXNegRotY_L17
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi GetLocalXYZ8RotateRotXNegRotY_L19
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L21
GetLocalXYZ8RotateRotXNegRotY_L17:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi GetLocalXYZ8RotateRotXNegRotY_L18
	sta.w WRMPYB
	nop
	jmp GetLocalXYZ8RotateRotXNegRotY_L20
GetLocalXYZ8RotateRotXNegRotY_L18:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L21
GetLocalXYZ8RotateRotXNegRotY_L19:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZ8RotateRotXNegRotY_L20:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZ8RotateRotXNegRotY_L21:
	tax
	sta.b TempVecZG
	cmp.b #$00
	bpl GetLocalXYZ8RotateRotXNegRotY_L22
	dec.b TempVecZG+1
GetLocalXYZ8RotateRotXNegRotY_L22:
	lda.b TempRotZ
	bmi GetLocalXYZ8RotateRotXNegRotY_L23
	asl
	sta.w WRMPYA
	lda.b TempSinB
	bmi GetLocalXYZ8RotateRotXNegRotY_L25
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L27
GetLocalXYZ8RotateRotXNegRotY_L23:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempSinB
	bmi GetLocalXYZ8RotateRotXNegRotY_L24
	sta.w WRMPYB
	nop
	jmp GetLocalXYZ8RotateRotXNegRotY_L26
GetLocalXYZ8RotateRotXNegRotY_L24:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXYZ8RotateRotXNegRotY_L27
GetLocalXYZ8RotateRotXNegRotY_L25:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXYZ8RotateRotXNegRotY_L26:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXYZ8RotateRotXNegRotY_L27:
	tax
	sta.b $08
	cmp.b #$00
	bpl GetLocalXYZ8RotateRotXNegRotY_L28
	dec.b $09
GetLocalXYZ8RotateRotXNegRotY_L28:
	rep #$10
	ldx.b TempIndX
	ldy.b TempIndY
	plb
	rtl
UnkGetLocalFunc_1FC5E4:
	sta.b TempRotZ
	stx.b TempRegX
	sty.b TempRegY
	stz.b TempVecYG
	stz.b TempVecYG+1
	sec
	lda.b #$40
	sbc.b $13,x
	tax
	sep #$10
	phb
	lda.b #$00
	pha
	plb
	inx
	lda.w SineTable8,x
	sta.b TempSin
	lda.w SineTable8+$40,x
	sta.b TempCos
	lda.b TempRotZ
	bmi UnkGetLocalFunc_1FC5E4_L1
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi UnkGetLocalFunc_1FC5E4_L3
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp UnkGetLocalFunc_1FC5E4_L5
UnkGetLocalFunc_1FC5E4_L1:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempSin
	bmi UnkGetLocalFunc_1FC5E4_L2
	sta.w WRMPYB
	nop
	jmp UnkGetLocalFunc_1FC5E4_L4
UnkGetLocalFunc_1FC5E4_L2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp UnkGetLocalFunc_1FC5E4_L5
UnkGetLocalFunc_1FC5E4_L3:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
UnkGetLocalFunc_1FC5E4_L4:
	lda.b #$00
	sec
	sbc.w RDMPYH
UnkGetLocalFunc_1FC5E4_L5:
	tax
	ldx.b #$00
	sta.b TempVecXG
	cmp.b #$00
	bpl UnkGetLocalFunc_1FC5E4_L6
	dex
UnkGetLocalFunc_1FC5E4_L6:
	stx.b TempVecXG+1
	lda.b TempRotZ
	bmi UnkGetLocalFunc_1FC5E4_L7
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi UnkGetLocalFunc_1FC5E4_L9
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp UnkGetLocalFunc_1FC5E4_L11
UnkGetLocalFunc_1FC5E4_L7:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCos
	bmi UnkGetLocalFunc_1FC5E4_L8
	sta.w WRMPYB
	nop
	jmp UnkGetLocalFunc_1FC5E4_L10
UnkGetLocalFunc_1FC5E4_L8:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp UnkGetLocalFunc_1FC5E4_L11
UnkGetLocalFunc_1FC5E4_L9:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
UnkGetLocalFunc_1FC5E4_L10:
	lda.b #$00
	sec
	sbc.w RDMPYH
UnkGetLocalFunc_1FC5E4_L11:
	tax
	lda.b #$00
	sta.b TempVecZG
	cmp.b #$00
	bpl UnkGetLocalFunc_1FC5E4_L12
	dex
UnkGetLocalFunc_1FC5E4_L12:
	stx.b TempVecZG+1
	rep #$10
	ldx.b TempRegX
	ldy.b TempRegY
	plb
	rtl
UnkGetLocalFunc_1FC6B8:
	sta.b TempRotZ
	stx.b TempIndX
	sty.b TempIndY
	stz.b TempVecYG
	stz.b TempVecYG+1
	lda.b $13,x
	tax
	sep #$10
	phb
	lda.b #$00
	pha
	plb
	inx
	lda.w SineTable8,x
	sta.b TempSinB
	lda.w SineTable8+$40,x
	sta.b TempCosB
	lda.b TempRotZ
	bmi UnkGetLocalFunc_1FC6B8_L1
	asl
	sta.w WRMPYA
	lda.b TempSinB
	bmi UnkGetLocalFunc_1FC6B8_L3
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp UnkGetLocalFunc_1FC6B8_L5
UnkGetLocalFunc_1FC6B8_L1:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempSinB
	bmi UnkGetLocalFunc_1FC6B8_L2
	sta.w WRMPYB
	nop
	jmp UnkGetLocalFunc_1FC6B8_L4
UnkGetLocalFunc_1FC6B8_L2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp UnkGetLocalFunc_1FC6B8_L5
UnkGetLocalFunc_1FC6B8_L3:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
UnkGetLocalFunc_1FC6B8_L4:
	lda.b #$00
	sec
	sbc.w RDMPYH
UnkGetLocalFunc_1FC6B8_L5:
	tax
	ldx.b #$00
	sta.b TempVecXG
	cmp.b #$00
	bpl UnkGetLocalFunc_1FC6B8_L6
	dex
UnkGetLocalFunc_1FC6B8_L6:
	stx.b TempVecXG+1
	lda.b TempRotZ
	bmi UnkGetLocalFunc_1FC6B8_L7
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi UnkGetLocalFunc_1FC6B8_L9
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp UnkGetLocalFunc_1FC6B8_L11
UnkGetLocalFunc_1FC6B8_L7:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempCosB
	bmi UnkGetLocalFunc_1FC6B8_L8
	sta.w WRMPYB
	nop
	jmp UnkGetLocalFunc_1FC6B8_L10
UnkGetLocalFunc_1FC6B8_L8:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp UnkGetLocalFunc_1FC6B8_L11
UnkGetLocalFunc_1FC6B8_L9:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
UnkGetLocalFunc_1FC6B8_L10:
	lda.b #$00
	sec
	sbc.w RDMPYH
UnkGetLocalFunc_1FC6B8_L11:
	tax
	ldx.b #$00
	sta.b TempVecZG
	cmp.b #$00
	bpl UnkGetLocalFunc_1FC6B8_L12
	dex
UnkGetLocalFunc_1FC6B8_L12:
	stx.b TempVecZG+1
	rep #$20
	ldx TempIndX
	ldy TempIndY
	plb
	rtl
ApplyTempVelocityShift2:
	rep #$20
	asl.b TempVecXG					;\Shift TempVec global twice
	asl.b TempVecYG					;|
	asl.b TempVecZG					;|
	asl.b TempVecXG					;|
	asl.b TempVecYG					;|
	asl.b TempVecZG					;/
	bra DoApplyTempVelocity
ApplyTempVelocityShift1:
	rep #$20
	asl.b TempVecXG					;\Shift TempVec global once
	asl.b TempVecYG					;|
	asl.b TempVecZG					;/
ApplyTempVelocity:
	rep #$20
DoApplyTempVelocity:
	lda.b $0C,x					;\Add TempVecXG to X position
	clc						;|
	adc.b TempVecXG					;|
	sta.b $0C,x					;/
	lda.b $0E,x					;\Add TempVecYG to Y position
	clc						;|
	adc.b TempVecYG					;|
	sta.b $0E,x					;/
	lda.b $10,x					;\Add TempVecZ Gto Z position
	clc						;|
	adc.b TempVecZG					;|
	sta.b $10,x					;/
	sep #$20
	rtl
ApplyObjectVelocity:
	rep #$20
	lda.b $0C,x					;\Add X velocity to position
	clc						;|
	adc.b $2F,x					;|
	sta.b $0C,x					;/
	lda.b $0E,x					;\Add Y velocity to position
	clc						;|
	adc.b $31,x					;|
	sta.b $0E,x					;/
	lda.b $10,x					;\Add Z velocity to position
	clc						;|
	adc.b $33,x					;|
	sta.b $10,x					;/
	sep #$20
	rtl
GetObjectByIDEx:
	stx.b TempMiscX
	ldx.w FirstCandidate				;\Load X with first candidate to check...
	beq GetObjectByIDEx_NoSelf			;/...if null, return null
	cmp.b #$00					;\If desired ID is 0, just get any empty object
	beq GetObjectByIDEx_Any				;/
	txy
GetObjectByIDEx_CheckObj:
	cmp.b $04,x					;\Check this object for a match
	beq GetObjectByID_Match				;/
GetObjectByIDEx_NextCand:
	ldy.b $00,x					;\Get next object...
	tyx						;|
	bne GetObjectByIDEx_CheckObj			;/...and try again
GetObjectByID_Match:
	cpx.b TempMiscX					;\If candidate is self, try again
	beq GetObjectByIDEx_NextCand			;/
	ldy.b $00,x					;\Set first candidate to next object...
	sty FirstCandidate				;|
	txy						;|
	ldx.b TempMiscX					;|
	rtl						;/...and return
GetObjectByIDEx_NoSelf:
	ldy.w #$0000					;\Return null
	sty.w FirstCandidate				;|
	ldx.b TempMiscX					;|
	rtl						;/
GetObjectByIDEx_Any:
	ldy.b $00,x					;\If next object is null...
	beq GetObjectByIDEx_NoSelf			;/...return null
	tyx						;\Get next object...
	cpx.b TempMiscX					;|if self...
	beq GetObjectByIDEx_Any				;/...try again
	lda.b $1F,x
	and.w #$0008
	beq GetObjectByIDEx_Any
	stx.w FirstCandidate				;\Set first candidate to next object...
	ldx.b TempMiscX					;|
	rtl						;/...and return
GetObjectByIDEx2:
	cmp.w #$0000
	beq GetObjectByIDEx2_Any
	stx.b TempMiscX
	ldx.w FirstCandidate
	beq GetObjectByID_NoSelf
	txy
GetObjectByIDEx2_CheckObj:
	cmp.b $04,x
	beq GetObjectByIDEx2_Match
GetObjectByIDEx2_NextCand:
	ldy.b $00,x
	tyx
	bne GetObjectByIDEx2_CheckObj
GetObjectByIDEx2_Match:
	cpx.b TempMiscX
	beq GetObjectByIDEx2_NextCand
	sta.w TempMiscW
	sep #$20
	lda.b $1D,x
	and.b $02
	rep #$20
	bne GetObjectByIDEx2_L4
	lda.w TempMiscW
	bra GetObjectByIDEx2_NextCand
GetObjectByIDEx2_L4:
	ldy.b $00,x
	sty.w FirstCandidate
	txy
	ldx.b TempMiscX
	rtl
GetObjectByIDEx2_Any:
	stx.b TempMiscX
	ldx.w FirstCandidate
	beq GetObjectByID_NoSelf
	txy
	sep #$20
GetObjectByIDEx2_L6:
	cpx.b TempMiscX
	beq GetObjectByIDEx2_L7
	lda.b $1D,x
	and.b $02
	bne GetObjectByIDEx2_L8
GetObjectByIDEx2_L7:
	ldy.b $00,x
	tyx
	bne GetObjectByIDEx2_L6
GetObjectByIDEx2_L8:
	ldy.b $00,x
	sty.w FirstCandidate
	txy
	ldx.b TempMiscX
	rep #$20
	rtl
GetObjectByIDEx3:
	stx.b $04
	ldx.w FirstCandidate
	bne GetObjectByIDEx3_L1
	brl GetObjectByIDEx3_L4
GetObjectByIDEx3_L1:
	cmp.b #$00
	beq GetObjectByIDEx3_L5
	sta.b $0A
	stz.b TempMiscY
GetObjectByIDEx3_L2:
	cpx.b $04
	beq GetObjectByIDEx3_L3
	lda.b $04,x
	cmp.b $0A
	bne GetObjectByIDEx3_L3
	ldy.b $04
	jsl UnkAngleGetterHelperFunc_1FD0AB
	rep #$20
	lda.w Unknown_1250
	cmp.b TempMiscX
	bpl GetObjectByIDEx3_L3
	cmp.b $3E
	bmi GetObjectByIDEx3_L3
	sta.b TempMiscX
	stx.b TempMiscY
GetObjectByIDEx3_L3:
	ldy.b $00,x
	tyx
	bne GetObjectByIDEx3_L2
	ldy.b $00,x
	sty FirstCandidate
	ldy.b TempMiscY
	ldx.b TempVecXL
	rtl
GetObjectByIDEx3_L4:
	ldy.w #$0000
	ldx.b TempVecXL
	rtl
GetObjectByIDEx3_L5:
	stz.b TempMiscY
GetObjectByIDEx3_L6:
	cpx.b TempVecXL
	beq GetObjectByIDEx3_L7
	lda.b $1F,x
	and.w #$0008
	beq GetObjectByIDEx3_L7
	ldy.b TempVecXL
	jsl CODE_1FD0AB
	rep #$20
	lda.w Unknown_1250
	cmp.b TempMiscX
	bpl GetObjectByIDEx3_L7
	cmp.b $3E
	bmi GetObjectByIDEx3_L7
	sta.b TempMiscX
	stx.b TempMiscY
GetObjectByIDEx3_L7:
	ldy.b $00,x
	tyx
	bne GetObjectByIDEx3_L6
	sty.w FirstCandidate
	ldy.b TempMiscY
	ldx.b TempVecXL
	rtl
GetObjectByIDEx4:
	stx.b TempVecXL
	ldx.w FirstCandidate
	beq GetObjectByIDEx3_L4
	cmp.w #$0000
	beq GetObjectByIDEx4_L4
	sta.b TempVecYL
	stz.b TempMiscY
GetObjectByIDEx4_L1:
	cpx.b TempVecXL
	beq GetObjectByIDEx4_L2
	lda.b $04,x
	cmp.b TempVecYL
	bne GetObjectByIDEx4_L2
	ldy.b TempVecXL
	jsl CODE_1FD0AB
	rep #$20
	lda.w Unknown_1250
	cmp.b TempMiscX
	bpl GetObjectByIDEx4_L2
	cmp.b $3E
	bpl GetObjectByIDEx4_L3
GetObjectByIDEx4_L2:
	ldy.b $00,x
	tyx
	bne GetObjectByIDEx4_L1
GetObjectByIDEx4_L3:
	ldy.b $00,x
	sty FirstCandidate
	txy
	ldx.b TempVecXL
	rtl
GetObjectByIDEx4_L4:
	cpx.b TempVecXL
	beq GetObjectByIDEx4_L5
	lda.b $1F,x
	and.w #$0008
	beq GetObjectByIDEx4_L5
	ldy.b TempVecXL
	jsl UnkAngleGetterHelperFunc_1FD0AB
	rep #$20
	lda.w $1250
	cmp.b TempMiscX
	bpl GetObjectByIDEx4_L5
	cmp.b $3E
	bpl GetObjectByIDEx4_L6
GetObjectByIDEx4_L5:
	ldy.b $00,x
	tyx
	bne GetObjectByIDEx4_L4
GetObjectByIDEx4_L6:
	ldy.b $00,x
	sty.w FirstCandidate
	txy
	ldx.b TempVecXL
	rtl
GetObjectByID:
	php
	ldy.w FirstObject
GetObjectByID_Next:
	tyx
	cmp.b $04,x
	beq GetObjectByID_Match
	ldy.b $00,x
	bne GetObjectByID_Next
	ldx.w #$0000
GetObjectByID_Match:
	plp
	rtl
CountObjectsWithID:
	php
	ldy.w FirstObject
	stz TempMiscW
CountObjectsWithID_Next:
	tyx
	cmp.b $04,x
	bne CountObjectsWithID_SkInc
	inc.w TempMiscW
CountObjectsWithID_SkInc:
	ldy.b $00,x
	bne CountObjectsWithID_Next
	lda.w TempMiscW
	plp
	rtl
GetLocalZX8RotateNegY:
	phy
	phx
	php
	phb
	sep #$10
	eor.b #$FF
	inc
	tax
	lda.b #$00
	pha
	plb
	lda.w SineTable8+$40,x
	sta.w TempCosP2C8
	lda.w SineTable8,x
	sta.w TempSinP2C8
	lda.b TempVecXG
	bmi GetLocalZX8RotateNegY_NegInpXX
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalZX8RotateNegY_NegInpCosX1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZX8RotateNegY_StResX
GetLocalZX8RotateNegY_NegInpXX:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalZX8RotateNegY_NegInpCosX2
	sta.w WRMPYB
	nop
	jmp GetLocalZX8RotateNegY_NegResXX
GetLocalZX8RotateNegY_NegInpCosX2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZX8RotateNegY_StResX
GetLocalZX8RotateNegY_NegInpCosX1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalZX8RotateNegY_NegResXX:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalZX8RotateNegY_StResX:
	tax
	stx.b TempVecXL
	lda.b TempVecZG
	bmi GetLocalZX8RotateNegY_NegInpXZ
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalZX8RotateNegY_NegInpSinX1
	sta.w WRMPYA
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZX8RotateNegY_AccResX
GetLocalZX8RotateNegY_NegInpXZ:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalZX8RotateNegY_NegInpSinX2
	sta.w WRMPYB
	nop
	jmp GetLocalZX8RotateNegY_NegResXZ
GetLocalZX8RotateNegY_NegInpSinX2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDPMYH
	jmp GetLocalZX8RotateNegY_AccResX
GetLocalZX8RotateNegY_NegInpSinX1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalZX8RotateNegY_NegResXZ:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalZX8RotateNegY_AccResX:
	tax
	txa
	clc
	adc.b TempVecXL
	sta.b TempVecXL
	bit.b #$80
	beq GetLocalZX8RotateNegY_PosResX
	lda.b #$FF
	sta.b TempVecXL+1
	bra GetLocalZX8RotateNegY_SkSexResX
GetLocalZX8RotateNegY_PosResX:
	stz.b TempVecXL+1
GetLocalZX8RotateNegY_SkSexResX:
	lda.b TempVecXG
	bmi GetLocalZX8RotateNegY_NegInpZX
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalZX8RotateNegY_NegInpSinZ1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZX8RotateNegY_StResZ
GetLocalZX8RotateNegY_NegInpZX:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalZX8RotateNegY_NegInpSinZ2
	sta.w WRMPYB
	nop
	jmp GetLocalZX8RotateNegY_NegResZX
GetLocalZX8RotateNegY_NegInpSinZ2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZX8RotateNegY_StResZ
GetLocalZX8RotateNegY_NegInpSinZ1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalZX8RotateNegY_NegResZX:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalZX8RotateNegY_StResZ:
	tax
	txa
	eor.b #$FF
	inc
	sta.w TempVecZL
	lda.b TempVecZG
	bmi GetLocalZX8RotateNegY_NegInpZZ
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalZX8RotateNegY_NegInpCosZ1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZX8RotateNegY_AccResZ
GetLocalZX8RotateNegY_NegInpZZ:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalZX8RotateNegY_NegInpCosZ2
	sta.w WRMPYB
	nop
	jmp GetLocalZX8RotateNegY_NegResZZ
GetLocalZX8RotateNegY_NegInpCosZ2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalZX8RotateNegY_AccResZ
GetLocalZX8RotateNegY_NegInpCosZ1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalZX8RotateNegY_NegResZZ:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalZX8RotateNegY_AccResZ:
	tax
	txa
	clc
	adc.w TempVecZL
	sta.w TempVecZL
	bit.b #$80
	beq GetLocalZX8RotateNegY_PosResZ
	lda.b #$FF
	sta.w TempVecZL+1
	bra GetLocalZX8RotateNegY_SkSexResZ
GetLocalZX8RotateNegY_PosResZ:
	stz.w TempVecZL+1
GetLocalZX8RotateNegY_SkSexResZ:
	plb
	plp
	plx
	ply
	rtl
GetLocalYZ8RotateX:
	phy
	phx
	php
	phb
	sep #$10
	tax
	lda.b #$00
	pha
	plb
	lda.w SineTable8+$40,x
	sta.w TempCosP2C8
	lda.w SineTable8,x
	sta.w TempSinP2C8
	lda.b TempVecYG
	bmi GetLocalYZ8RotateX_NegInpYY
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalYZ8RotateX_NegInpCosY1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalYZ8RotateX_StResY
GetLocalYZ8RotateX_NegInpYY:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalYZ8RotateX_NegInpCosY2
	sta.w WRMPYB
	nop
	jmp GetLocalYZ8RotateX_NegResYY
GetLocalYZ8RotateX_NegInpCosY2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalYZ8RotateX_StResY
GetLocalYZ8RotateX_NegInpCosY1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalYZ8RotateX_NegResYY:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalYZ8RotateX_StResY:
	tax
	stx.b TempVecYL
	lda.b TempVecZG
	bmi GetLocalYZ8RotateX_NegInpYZ
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalYZ8RotateX_NegSinY1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalYZ8RotateX_AccResY
GetLocalYZ8RotateX_NegInpYZ:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalYZ8RotateX_NegSinY2
	sta.w WRMPYB
	nop
	jmp GetLocalYZ8RotateX_NegResYZ
GetLocalYZ8RotateX_NegSinY2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalYZ8RotateX_AccResY
GetLocalYZ8RotateX_NegSinY1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalYZ8RotateX_NegResYZ:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalYZ8RotateX_AccResY:
	tax
	txa
	clc
	adc.b TempVecYL
	sta.b TempVecYL
	bit.b #$80
	beq GetLocalYZ8RotateX_PosResY
	lda.b #$FF
	sta.b TempVecYL+1
	bra GetLocalYZ8RotateX_SkSexResY
GetLocalYZ8RotateX_PosResY:
	stz.b TempVecYL+1
GetLocalYZ8RotateX_SkSexResY:
	lda.b TempVecYG
	bmi GetLocalYZ8RotateX_NegInpZY
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalYZ8RotateX_NegSinZ1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalYZ8RotateX_StResZ
GetLocalYZ8RotateX_NegInpZY:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalYZ8RotateX_NegSinZ2
	sta.w WRMPYB
	nop
	jmp GetLocalYZ8RotateX_NegResZY
GetLocalYZ8RotateX_NegSinZ2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalYZ8RotateX_StResZ
GetLocalYZ8RotateX_NegSinZ1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalYZ8RotateX_NegResZY:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalYZ8RotateX_StResZ:
	tax
	txa
	eor.b #$FF
	inc
	sta.w TempVecZL
	lda.b TempVecZG
	bmi GetLocalYZ8RotateX_NegInpZZ
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalYZ8RotateX_NegCosZ1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalYZ8RotateX_AccResZ
GetLocalYZ8RotateX_NegInpZZ:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalYZ8RotateX_NegCosZ2
	sta.w WRMPYB
	nop
	jmp GetLocalYZ8RotateX_NegResZZ
GetLocalYZ8RotateX_NegCosZ2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalYZ8RotateX_AccResZ
GetLocalYZ8RotateX_NegCosZ1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalYZ8RotateX_NegResZZ:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalYZ8RotateX_AccResZ:
	tax
	txa
	clc
	adc.w TempVecZL
	sta.w TempVecZL
	bit.b #$80
	beq GetLocalYZ8RotateX_PosResZ
	lda.b #$FF
	sta.w TempVecZL+1
	bra GetLocalYZ8RotateX_SkSexResZ
GetLocalYZ8RotateX_PosResZ:
	stz.w TempVecZL+1
GetLocalYZ8RotateX_SkSexResZ:
	plb
	plp
	ply
	plx
	rtl
GetLocalXY8RotateZ:
	phy
	phx
	php
	phb
	sep #$10
	tax
	lda.b #$00
	pha
	plb
	lda.w SineTable8+$40,x
	sta.w TempCosP2C8
	lda.w SineTable8,x
	sta.w TempSinP2C8
	lda.b TempVecXG
	bmi GetLocalXY8RotateZ_NegInpXX
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalXY8RotateZ_NegCosX1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXY8RotateZ_StResX
GetLocalXY8RotateZ_NegInpXX:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalXY8RotateZ_NegCosX2
	sta.w WRMPYB
	nop
	jmp GetLocalXY8RotateZ_NegResXX
GetLocalXY8RotateZ_NegCosX2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXY8RotateZ_StResX
GetLocalXY8RotateZ_NegCosX1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXY8RotateZ_NegResXX:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXY8RotateZ_StResX:
	tax
	stx.b TempVecXL
	lda.b TempVecYG
	bmi GetLocalXY8RotateZ_NegInpXY
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalXY8RotateZ_NegSinX1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXY8RotateZ_AccResX
GetLocalXY8RotateZ_NegInpXY:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalXY8RotateZ_NegSinX2
	sta.w WRMPYB
	nop
	jmp GetLocalXY8RotateZ_NegResXY
GetLocalXY8RotateZ_NegSinX2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXY8RotateZ_AccResX
GetLocalXY8RotateZ_NegSinX1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXY8RotateZ_NegResXY:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXY8RotateZ_AccResX:
	tax
	txa
	clc
	adc.b TempVecXL
	sta.b TempVecXL
	bit.b #$80
	beq GetLocalXY8RotateZ_PosResX
	lda.b #$FF
	sta.b TempVecXL+1
	bra GetLocalXY8RotateZ_SkSexResX
GetLocalXY8RotateZ_PosResX:
	stz.b TempVecXL+1
GetLocalXY8RotateZ_SkSexResX:
	lda.b TempVecXG
	bmi GetLocalXY8RotateZ_NegInpYX
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalXY8RotateZ_NegSinY1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXY8RotateZ_StResY
GetLocalXY8RotateZ_NegInpYX:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempSinP2C8
	bmi GetLocalXY8RotateZ_NegSinY2
	sta.w WRMPYB
	nop
	jmp GetLocalXY8RotateZ_NegResYX
GetLocalXY8RotateZ_NegSinY2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXY8RotateZ_StResY
GetLocalXY8RotateZ_NegSinY1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXY8RotateZ_NegResYX:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXY8RotateZ_StResY:
	tax
	txa
	eor.b #$FF
	inc
	sta.b TempVecYL
	lda.b TempVecYG
	bmi GetLocalXY8RotateZ_NegInpYY
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalXY8RotateZ_NegCosY1
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXY8RotateZ_AccResY
GetLocalXY8RotateZ_NegInpYY:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.w TempCosP2C8
	bmi GetLocalXY8RotateZ_NegCosY2
	sta.w WRMPYB
	nop
	jmp GetLocalXY8RotateZ_NegResYY
GetLocalXY8RotateZ_NegCosY2:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
	nop
	nop
	lda.w RDMPYH
	jmp GetLocalXY8RotateZ_AccResY
GetLocalXY8RotateZ_NegCosY1:
	eor.b #$FF
	inc
	sta.w WRMPYB
	nop
	nop
GetLocalXY8RotateZ_NegResYY:
	lda.b #$00
	sec
	sbc.w RDMPYH
GetLocalXY8RotateZ_AccResY:
	tax
	txa
	clc
	adc.b TempVecYL
	sta.b tempVecYL
	bit.b #$80
	beq GetLocalXY8RotateZ_PosResY
	lda.b #$FF
	sta.b tempVecYL+1
	bra GetLocalXY8RotateZ_SkSexResY
GetLocalXY8RotateZ_PosResY:
	stz.b TempVecYL+1
GetLocalXY8RotateZ_SkSexResY:
	plb
	plp
	plx
	ply
	rtl
GetLocalZX16RotateY:
	stx.b TempMiscX
	sty.b TempMiscY
	php
	phb
	sep #$10
	tax
	lda.b #$00
	pha
	plb
	lda.w SineTable8,x
	sta.w TempSinP2C16
	lda.w SineTable8+$40,x
	sta.w TempCosP2C16
	lda.b TempVecXG
	sta.b TempMultiplicand
	lda.b TempVecXG+1
	sta.b TempMultiplicand+1
	lda.w TempSinP2C16
	sta.b TempMultiplier
	jsl Muliply8By16
	lda.b TempProduct
	sta.w TempVecZL
	lda.b TempProduct+1
	sta.w TempVecZL+1
	lda.b TempVecZG
	sta.b TempMultiplicand
	lda.b TempVecZG+1
	sta.b TempMultiplicand+1
	lda.w TempCosP2C16
	sta.b TempMultiplier
	jsl Muliply8By16
	lda.b TempProduct
	clc
	adc.w TempVecZL
	sta.w TempVecZL
	lda.b TempProduct+1
	adc.w TempVecZL+1
	sta.w TempVecZL+1
	lda.b TempVecZG
	sta.b TempMultiplicand
	lda.b TempVecZG+1
	sta.b TempMultiplicand+1
	lda.w TempSinP2C16
	sta.b TempMultiplier
	jsl Muliply8By16
	lda.b TempProduct
	sta.b TempVecXL
	lda.b TempProduct+1
	sta.b TempVecXL+1
	lda.b TempVecXG
	sta.b TempMultiplicand
	lda.b TempVecXG+1
	sta.b TempMultiplicand+1
	lda.w TempCosP2C16
	sta.b TempMultiplier
	jsl Muliply8By16
	lda.b TempProduct
	clc
	adc.b TempVecXL
	sta.b TempVecXL
	lda.b TempProduct+1
	adc.b TempVecXL+1
	sta.b TempVecXL+1
	plb
	plp
	ldy.b TempMiscY
	ldx.b TempMiscX
	rtl
GetLocalYZ16RotateNegX:
	stx.b TempMiscX
	sty.b TempMiscY
	php
	phb
	sep #$10
	tax
	lda.b #$00
	pha
	plb
	lda.w SineTable8,x
	sta.w TempSinP2C16
	lda.w SineTable8+$40,x
	sta.w TempCosP2C16
	lda.b TempVecYG
	sta.b TempMultiplicand
	lda.b TempVecYG+1
	sta.b TempMultiplicand+1
	lda.w TempSinP2C16
	sta.b TempMultiplier
	jsl Muliply8By16
	lda.b TempProduct
	sta.w TempVecZL
	lda.b TempProduct+1
	sta.w TempVecZL+1
	lda.b TempVecZG
	sta.b TempMultiplicand
	lda.b TempVecZG+1
	sta.b TempMultiplicand+1
	lda.w TempCosP2C16
	sta.b TempMultiplier
	jsl Muliply8By16
	lda.b TempProduct
	clc
	adc.w TempVecZL
	sta.w TempVecZL
	lda.b TempProduct+1
	adc.w TempVecZL+1
	sta.w TempVecZL+1
	lda.b TempVecZG
	sta.b TempMultiplicand
	lda.b TempVecZG+1
	sta.b TempMultiplicand+1
	lda.w TempSinP2C16
	sta.b TempMultiplier
	jsl Muliply8By16
	lda.b TempProduct
	sta.b TempVecYL
	lda.b TempProduct+1
	sta.b TempVecYL+1
	lda.b TempVecYG
	sta.b TempMultiplicand
	lda.b TempVecYG+1
	sta.b TempMultiplicand+1
	lda.w TempCosP2C16
	sta.b TempMultiplier
	jsl Muliply8By16
	lda.b TempProduct
	clc
	adc.b TempVecYL
	sta.b TempVecYL
	lda.b TempProduct+1
	adc.b TempVecYL+1
	sta.b TempVecYL+1
	plb
	plp
	ldy.b TempMiscY
	ldx.b TempMiscX
	rtl
UnkAngleGetterFunc_1FCF1B:
	phx
	phy
	jsl UnkAngleGetterHelperFunc_1FD0AB
	rep #$20
	lda.b TempVecXG
	clc
	adc.b TempVecXL
	sta.b TempVecXG
	lda.b TempVecYG
	clc
	adc.w TempVecZL
	sta.b TempVecYG
	jsl RunSuperFXCalculateAtan2
	rep #$20
	xba
	and.w #$00FF
	sep #$20
	rep #$10
	ply
	plx
	rtl
FaceTargetLocalPtExY:
	phx
	phy
	jsl CalcLatXZ
	jsl RunSuperFXCalculateAtan2
	rep #$20
	xba
	and.w #$00FF
	sep #$20
	rep #$10
	ply
	plx
	rtl
CalcLatXZEx:
	rep #$20
	lda.w $000C,y
	clc
	adc.b TempVecXL
	sec
	sbc.b $0C,x
	sta.b TempVecXG
	bpl CalcLatXZEx_L1
	lda.w #$0000
	sec
	sbc.b TempVecXG
CalcLatXZEx_L1:
	sta.w Unknown_1250
	lda.w $0010,y
	clc
	adc.w TempVecZL
	sec
	sbc.b $10,x
	sta.b TempVecYG
	bmi CalcLatXZEx_L2
	clc
	adc.w Unknown_1250
	bra CalcLatXZEx_L3
CalcLatXZEx_L2:
	sec
	lda.w Unknown_1250
	sbc.b TempVecYG
CalcLatXZEx_L3:
	sta.w Unknown_1250
	sep #$20
	rtl
CalcLatXZ:
	rep #$20
	lda.b TempVecXL
	sec
	sbc.b $0C,x
	sta.b TempVecXG
	bpl CalcLatXZ_L1
	lda.w #$0000
	sec
	sbc.b TempVecXG
CalcLatXZ_L1:
	sta.w Unknown_1250
	lda.w TempVecZL
	sec
	sbc.b $10,x
	sta.b TempVecYG
	bmi CalcLatXZ_L2
	clc
	adc.w Unknown_1250
	bra CalcLatXZ_L3
CalcLatXZ_L2:
	sec
	lda.w Unknown_1250
	sbc.b TempVecYG
CalcLatXZ_L3:
	sta.w Unknown_1250
	sep #$20
	rtl
CalcLatXY:
	rep #$20
	lda.b TempVecXL
	sec
	sbc.b $0C,x
	sta.b TempVecXG
	bpl CalcLatXY_L1
	lda.w #$0000
	sec
	sbc.b TempVecXG
CalcLatXY_L1:
	sta.w Unknown_1250
	lda.b TempVecYL
	sec
	sbc.b $0E,x
	sta.b TempVecYG
	bmi CalcLatXY_L2
	clc
	adc.w Unknown_1250
	bra CalcLatXY_L3
CalcLatXY_L2:
	sec
	lda.w Unknown_1250
	sbc.b TempVecYG
CalcLatXY_L3:
	sta.w Unknown_1250
	sep #$20
	rtl
AddAuxVelocity:
	rep #$20
	stx.b TempMiscX
	tyx
	ldy.b TempMiscX
	lda.b $2F,x
	sta.b TempVecXG
	lda.b $31,x
	sta.b TempVecYG
	lda.b $33,x
	sta.b TempVecZG
	stx.b TempMiscX
	tyx
	ldy.b TempMiscX
	lda.b $2F,x
	clc
	adc.b TempVecXG
	sta.b $2F
	lda.b $31,x
	clc
	adc.b TempVecYG
	sta.b $31
	lda.b $33,x
	clc
	adc.b TempVecZG
	sta.b $33
	sep #$20
	rtl
FaceTargetObjectY:
	phx
	phy
	rep #$20
	lda.w $000C,y
	sec
	sbc.b $0C,x
	sta.b TempVecXG
	lda.w $0010,y
	sec
	sbc.b $10,x
	sta.b TempVecYG
	jsl RunSuperFXCalculateAtan2
	rep #$30
	ply
	plx
	rtl
UnkAngleGetterFunc_1FD03E:
	phx
	phy
	jsl UnkAngleGetterHelperFunc_1FD0AB
	rep #$20
	lda.w Unknown_1250
	sta.b TempVecYG
	lda.w $000E,y
	sec
	sbc.b $0E,x
	sta.b TempVecXG
	jsl RunSuperFXCalculateAtan2
	rep #$30
	ply
	plx
	rtl
FaceTargetLocalPtExLat:
	phx
	phy
	jsl CalcLatXZ
	rep #$20
	lda.w Unknown_1250
	sta.b TempVecYG
	lda.w TempVecYL
	sec
	sbc.b $000E,x
	sta.b TempVecXG
	jsl RunSuperFXCalculateAtan2
	rep #$20
	sta.b TempMiscX
	xba
	and.w #$00FF
	sep #$20
	rep #$10
	ply
	plx
	rtl
FaceTargetLocalPtY:
	phx
	phy
	rep #$20
	lda.w TempVecXL
	sec
	sbc.b $0C,x
	sta.b TempVecXG
	lda.w TempVecZL
	sec
	sbc.b $10,x
	sta.b TempVecYG
	jsl RunSuperFXCalculateAtan2
	rep #$20
	sta.b TempMiscX
	xba
	and.w #$00FF
	sep #$20
	rep #$10
	ply
	plx
	rtl
UnkAngleGetterHelperFunc_1FD0AB:
	rep #$20
	lda.w $000C,y
	sec
	sbc.b $0C,x
	bpl UnkAngleGetterHelperFunc_1FD0AB_L1
	eor.w #$FFFF
	inc
UnkAngleGetterHelperFunc_1FD0AB_L1:
	sta.b TempVecXG
	lda.w $0010,y
	sec
	sbc.b $10,x
	bpl UnkAngleGetterHelperFunc_1FD0AB_L2
	eor.w #$FFFF
	inc
UnkAngleGetterHelperFunc_1FD0AB_L2:
	sta.b TempVecYG
	rep #$20
	lda.b TempVecXG
	cmp.w #$8000
	ror
	sta.w TempVecXG
	lda.b TempVecYG
	cmp.w #$8000
	ror
	sta.w TempVecYG
	lda.b TempVecYG
	clc
	adc.b TempVecXG
	asl
	sta.w Unknown_1250
	lda.b TempVecYG
	cmp.b TempVecXG
	bmi UnkAngleGetterHelperFunc_1FD0AB_L3
	lda.b TempVecYG
	bra UnkAngleGetterHelperFunc_1FD0AB_L4
UnkAngleGetterHelperFunc_1FD0AB_L3:
	lda.b TempVecXG
UnkAngleGetterHelperFunc_1FD0AB_L4:
	clc
	adc.w Unknown_1250
	sta.b TempVecXG
	asl
	asl
	sta.b TempVecYG
	lda.b TempVecXG
	cmp.w #$8000
	ror
	clc
	adc.b TempVecYG
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.w Unknown_1250
	sep #$20
	rtl
GetXYManhattanDistanceToObject:
	rep #$20
	lda.w $000C,y
	sec
	sbc.b $0C,x
	sta.b TempVecXG
	bpl GetXYDistToObj_SkipNegX
	lda.w #$0000
	sec
	sbc.b TempVecXG
GetXYDistToObj_SkipNegX:
	sta.w TempXYManhattanDistance
	lda.w $000E,y
	sec
	sbc.b $0E,x
	sta.b TempVecYG
	bmi GetXYDistToObj_SkipPosY
	clc
	adc.w TempXYManhattanDistance
	bra GetXYDistToObj_StRet
GetXYDistToObj_SkipPosY:
	sec
	lda.w TempXYManhattanDistance
	sbc.b TempVecYG
GetXYDistToObj_StRet:
	sta.w TempXYManhattanDistance
	sep #$20
	rtl
ShootProjectile:
	pha
	lda.w Unknown_14D2
	and.b #$01
	bne ShootProjectile_L2
	pla
ShootProjectile_L1:
	stx.b TempMiscX
	sep #$30
	sta.w TempMiscW
	asl
	clc
	adc.w TempMiscW
	tax
	lda.l ProjectileFunctionTable+4,x
	pha
	rep #$20
	lda.l ProjectileFunctionTable+2,x
	dec
	pha
	sep #$20
	rep #$10
	ldx.b TempMiscX
	rtl
ShootProjectile_L2:
	pla
	cpx.w PlayerObject
	beq ShootProjectile_L1
	ldy.w #$0000
	rtl
ProjectileFunctionTable:
	PROJFUNCPTR($FE20,0)
	PROJFUNCPTR($0000,Projectile02)
	PROJFUNCPTR($01E0,Projectile04)
	PROJFUNCPTR($03C0,Projectile06)
	PROJFUNCPTR($05A0,Projectile08)
	PROJFUNCPTR($0780,Projectile0A)
	PROJFUNCPTR($0960,Projectile0C)
	PROJFUNCPTR($0B40,Projectile0E)
	PROJFUNCPTR($0D20,Projectile10)
	PROJFUNCPTR($0F00,Projectile12)
	PROJFUNCPTR($10E0,Projectile14)
	PROJFUNCPTR($12C0,Projectile16)
	PROJFUNCPTR($14A0,Projectile18)
	PROJFUNCPTR($1680,Projectile1A)
	PROJFUNCPTR($1860,Projectile1C)
	PROJFUNCPTR($1A40,Projectile1E)
	PROJFUNCPTR($1C20,Projectile20)
	PROJFUNCPTR($1E00,Projectile22_38)
	PROJFUNCPTR($1FE0,Projectile24)
	PROJFUNCPTR($21C0,Projectile26)
	PROJFUNCPTR($23A0,Projectile28)
	PROJFUNCPTR($2580,Projectile2A)
	PROJFUNCPTR($2760,Projectile2C)
	PROJFUNCPTR($2940,Projectile2E)
	PROJFUNCPTR($2B20,Projectile30)
	PROJFUNCPTR($2D00,Projectile32)
	PROJFUNCPTR($2EE0,Projectile34)
	PROJFUNCPTR($30C0,Projectile36)
	PROJFUNCPTR($32A0,Projectile22_38)
	PROJFUNCPTR($3480,Projectile3A)
	PROJFUNCPTR($3660,Projectile3C)
	PROJFUNCPTR($3840,Projectile3E)
DamageObject:
	dec.b $2D,x
	beq DamageObject_L1
	jml DamageObject_L6
DamageObject_L1:
	lda.w Unknown_14D8
	and.b #$01
	bne DamageObject_L2
	jml DamageObject_L3
DamageObject_L2:
	lda.b TempVecXG
	cmp.b #$08
	bne DamageObject_L3
	cmp.b #$80
	ror
	sta.b TempVecXG
DamageObject_L3:
	lda.b $2A,x
	bmi DamageObject_L5
	sec
	sbc.b TempVecXG
	bpl DamageObject_L4
	lda.b #$00
DamageObject_L4:
	sta.b $2A,x
DamageObject_L5:
	lda.w TempMiscW
	sta.b $2D,x
DamageObject_L6:
	rtl
ProcObject:
	php
	rep #$30
	cpx.w Unknown_156B
	bne ProcObject_L1
	brl ProcObject_Return
ProcObject_L1:
	lda.b $2E,x
	and.w #$FFFB
	sta.b $2E,x
	lda.b $0C,x
	sta.w TempObjX
	lda.b $0E,x
	sta.w TempObjY
	lda.b $10,x
	sta.w TempObjZ
	sep #$20
	stx.w CurProcObject
	lda.b $2A,x
	bne ProcObject_L4
	lda.b $09,x
	and.b #$10
	beq ProcObject_L2
	jmp ProcObject_L4
ProcObject_L2:
	rep #$20
	lda.l Object2ListRel+$0C,x
	beq ProcObject_L3
	sep #$20
	lda.b $1E,x
	and.b #$02
	bne ProcObject_L6
ProcObject_L3:
	sep #$20
	lda.l Object2ListRel+$08,x
	sta BehFuncPtrTemp+2
	rep #$20
	lda.l Object2ListRel+$06,x
	bne ProcObject_L8
	sep #$20
ProcObject_L4:
	lda.b $09,x
	and.b #$EF
	sta.b $09,x
	lda.b $1D,x
	and.b #$80
	beq ProcObject_L5
	lda.l Object2ListRel+$0B,x
	sta BehFuncPtrTemp+2
	rep #$20
	lda.l Object2ListRel+$09,x
	bne ProcObject_L8
	sep #$20
	lda.b $1D,x
	and.b #$7F
	sta.b $1D,x
	bra ProcObject_L7
ProcObject_L5:
	lda.b $1E,x
	and.b #$02
	beq ProcObject_L7
ProcObject_L6:
	lda.b $1E,x
	and.b #$FD
	sta.b $1E,x
	lda.l Object2ListRel+$0E,x
	sta.w BehFuncPtrTemp+2
	rep #$20
	lda.l Object2ListRel+$0C,x
	bne ProcObject_L8
	sep #$20
ProcObject_L7:
	lda.b $18,x
	sta.w BehFuncPtrTemp+2
	rep #$20
	lda.b $16,x
	beq ProcObject_Exit
ProcObject_L8:
	sta.w BehFuncPtrTemp
	sep #$20
	lda.b #BANKOF(STACKIFY(ProcObject_Return))
	pha
	rep #$20
	lda.w #STACKIFY(ProcObject_Return)
	pha
	sep #$20
	lda.w BehFuncPtrTemp+2
	pha
	rep #$20
	stz.w Unused_1521
	lda.w BehFuncPtrTemp
	dec
	pha
	sep #$20
	rtl
ProcObject_Return:
	sep #$20
	lda.w Unknown_14C9
ProcObject_Exit:
	plp
	rtl
;Not sure what this is/was for, probably unused
UnusedInfiniteCGRAMXfer:
	sep #$20
	stz.w NMITIMEN
	stz.w HDMAEN
	stz.w TM
	stz.w TS
	pha
UnusedInfiniteCGRAMXfer_Loop:
	stz.w HDMAEN
	lda.b #$80
	sta.w INIDISP
	pla
	stz.w CGADD
	sta.w CGDATA
	inc
	sta.w CGDATA
	inc
	and.b #$0F
	pha
	lda.w HDMAENMirror
	sta.w HDMAEN
	lda.b #$0F
	sta.w INIDISP
	nop
	nop
	nop
	nop
	bra UnusedInfiniteCGRAMXfer_Loop
ClearObject:
	phx
	tyx
	ply
	lda.b #$00
	phy
	phx
	ldy.w #$0032
ClearObject_L1:
	sta.b $04,x
	inx
	dey
	bne ClearObject_L1
	plx
	phx
	ldy.w #$0036
ClearObject_L2:
	sta.l Object2ListRel,x
	inx
	dey
	bne ClearObject_L2
	plx
	ply
	lda.b $08,x
	ora.b #$10
	sta.b $08,x
	lda.b $09,x
	ora.b #$08
	sta.b $09,x
	lda.b $2E,x
	ora.b #$04
	sta.b $2E,x
	lda.b $1F,x
	ora.b #$08
	sta.b $1F,x
	phx
	tyx
	ply
	rtl
FindFreeObject:
	rep #$20
	txy
	ldx.w FirstFreeObject
	bne FindFreeObject_L1
	sep #$20
	tyx
	jmp FindFreeObject_L5
FindFreeObject_L1:
	lda.b $00,x
	sta.w FirstFreeObject
	tya
	bne FindFreeObject_L2
	lda.w FirstObject
	sta.b $00,x
	stz.b $02,x
	stx.w FirstObject
	bra FindFreeObject_L3
FindFreeObject_L2:
	lda.w $0000,y
	sta.b $00,x
	stx.b $00,y
	sty.b $02,x
FindFreeObject_L3:
	ldy.b $00,x
	beq FindFreeObject_L4
	stx.b $02,y
FindFreeObject_L4:
	sep #$20
	sec
	rtl
FindFreeObject_L5:
	clc
	rtl
UnkObjUtilFunc_1FD3E0:
	rep #$10
	phx
	ldx.w FirstObject
	beq UnkObjUtilFunc_1FD3E0_L3
UnkObjUtilFunc_1FD3E0_L1:
	ldy.b $00,x
	sep #$20
	lda.b $20,x
	and.b #$01
	bne UnkObjUtilFunc_1FD3E0_L2
	phy
	jsl Calls_UnkFunc_1FBFE0
	ply
UnkObjUtilFunc_1FD3E0_L2:
	tyx
	bne UnkObjUtilFunc_1FD3E0_L1
UnkObjUtilFunc_1FD3E0_L3:
	plx
	rtl
UnkObjUtilFunc_1FD3FD:
	rep #$10
	phx
	ldx.w FirstObject
	beq UnkObjUtilFunc_1FD3FD_L3
UnkObjUtilFunc_1FD3FD_L1:
	ldy.b $00,x
	sep #$20
	lda.b $1F,x
	and.b #$08
	beq UnkObjUtilFunc_1FD3FD_L2
	phy
	jsl Calls_UnkFunc_1FBFE0
	ply
UnkObjUtilFunc_1FD3FD_L2:
	tyx
	bne UnkObjUtilFunc_1FD3FD_L1
UnkObjUtilFunc_1FD3FD_L3:
	plx
	rtl
SetDefaultDestroyColiFuncPtrs:
	rep #$20
	lda.w #ColiCommonEnemy
	sta.w Object2ListRel+$09,x
	lda.w #DestroyCommonEnemy
	sta.w Object2ListRel+$06,x
	sep #$20
	lda.b #BANKOF(ColiCommonEnemy)
	sta.w Object2ListRel+$0B,x
	lda.b #BANKOF(DestroyCommonEnemy)
	sta.w Object2ListRel+$08,x
	rtl
SetDefaultDestroyColiFuncPtrsAux:
	rep #$20
	lda.w #ColiCommonEnemy
	sta.w Object2ListRel+$09,y
	lda.w #DestroyCommonEnemy
	sta.w Object2ListRel+$06,y
	sep #$20
	lda.b #BANKOF(ColiCommonEnemy)
	sta.w Object2ListRel+$0B,y
	lda.b #BANKOF(DestroyCommonEnemy)
	sta.w Object2ListRel+$08,y
	rtl
SetNullDestroyColiFuncPtrs:
	rep #$20
	lda.w #$0000
	sta.w Object2ListRel+$09,x
	sta.w Object2ListRel+$06,x
	sep #$20
	sta.w Object2ListRel+$0B,x
	sta.w Object2ListRel+$08,x
	rtl
SetNullDestroyColiFuncPtrsAux:
	rep #$20
	lda.w #$0000
	sta.w Object2ListRel+$09,y
	sta.w Object2ListRel+$06,y
	sep #$20
	sta.w Object2ListRel+$0B,y
	sta.w Object2ListRel+$08,y
	rtl
ApplyTempVelocityLocalTo:
	lda.b $0C,x
	clc
	adc.b TempVecXL
	sta.w $000C,y
	lda.b $10,x
	clc
	adc.b TempVecZL
	sta.w $0010,y
	lda.b $0E,x
	clc
	adc.b TempVecYL
	sta.w $000E,y
	rtl
MultiplyBy9_16:
	cmp.w #$8000
	ror
	sta.b TempMiscX
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	clc
	adc.b TempMiscX
	rtl
MultiplyBy5_8:
	cmp.w #$8000
	ror
	sta.b TempMiscX
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	clc
	adc.b TempMiscX
	rtl
MultiplyBy3_4:
	cmp.w #$8000
	ror
	sta.b TempMiscX
	cmp.w #$8000
	ror
	clc
	adc.b TempMiscX
	rtl
MultiplyBy7_8:
	cmp.w #$8000
	ror
	sta.b TempMiscX
	cmp.w #$8000
	ror
	sta.b TempMiscY
	cmp.w #$8000
	ror
	clc
	adc.b TempMiscX
	clc
	adc.b TempMiscY
	rtl
MultiplyBy15_16:
	cmp.w #$8000
	ror
	sta.b TempMiscX
	cmp.w #$8000
	ror
	sta.b TempMiscY
	cmp.w #$8000
	ror
	sta.w TempMiscW
	cmp.w #$8000
	ror
	clc
	adc.w TempMiscW
	clc
	adc.b TempMiscX
	clc
	adc.b TempMiscY
	rtl
UnkFunc_1FD501:
	lda.b $08,x
	and.b #$40
	bne UnkFunc_1FD501_L1
	jml UnkFunc_1FD501_L3
UnkFunc_1FD501_L1:
	phy
	rep #$20
	lda.w Object2ListRel+$13,x
	beq UnkFunc_1FD501_L2
	tay
	lda.w #$0000
	sta.w Object2ListRel+$13,x
	sep #$20
	lda.b $08,x
	and.b #$BF
	sta.b $08,x
	phx
	tyx
	ply
	jsl Calls_UnkFunc_1FBFE0
	phx
	tyx
	ply
UnkFunc_1FD501_L2:
	sep #$20
	ply
UnkFunc_1FD501_L3:
	cpx CurProcObject
	bne UnkFunc_1FD501_L4
	inc.w Unknown_1248
	bra UnkFunc_1FD501_L5
UnkFunc_1FD501_L4:
	jsl Calls_UnkFunc_1FBFE0
UnkFunc_1FD501_L5:
	rtl
Calls_UnkFunc_1FD501:
	phx
	tyx
	ply
	jsl UnkFunc_1FD501
	phx
	tyx
	ply
	rtl
CreateChildObject:
	stx.b TempMiscX
	jsl FindFreeObject
	bcs CreateChildObject_L1
	ldy.w #$0000
	ldx.b TempMiscX
	clc
	rtl
CreateChildObject_L1:
	txy
	ldx.b TempMiscX
	sep #$20
	jsl ClearObject
	rep #$20
	lda.w TempMiscW
	sta.w $0004,y
	sep #$20
	sec
	rtl
LinkChildObject:
	sta.w TempMiscW
	lda.w TempMiscW
	sta.w $0022,y
	stx.b $06,y
	rep #$20
	lda.w #$0000
	sta.w $0026,y
	sep #$20
	rep #$20
	sty.b TempMiscX
	txa
LinkChildObject_L1:
	tay
	lda.w $0026,y
	bne LinkChildObject_L1
	lda.b TempMiscX
	sta.w $0026,y
	ldy.b TempMiscX
	sep #$20
	lda.b $20,x
	ora.b #FLAGS20_ISPARENT
	sta.b $20,x
	lda.w $0020,y
	ora.b #FLAGS20_ISCHILD
	sta.w $0020,y
	rtl
SetTempVelocity:
	jsl CODE_1FC41E
	rep #$20
	lda.b TempVecXG
	sta.b $2E,x
	lda.b TempVecYG
	sta.b $31,x
	lda.b TempVecZG
	sta.b $33,x
	sep #$20
	rtl
SetTempVelocityShift1:
	jsl CODE_1FC41E
	rep #$20
	lda.b TempVecXG
	asl
	sta.b $2E,x
	lda.b TempVecYG
	asl
	sta.b $31,x
	lda.b TempVecZG
	asl
	sta.b $33,x
	sep #$20
	rtl
SetTempVelocityShift2:
	jsl CODE_1FC41E
	rep #$20
	lda.b TempVecXG
	asl
	asl
	sta.b $2E,x
	lda.b TempVecYG
	asl
	asl
	sta.b $31,x
	lda.b TempVecZG
	asl
	asl
	sta.b $33,x
	sep #$20
	rtl
SetTempVelocityShift3:
	jsl CODE_1FC41E
	rep #$20
	lda.b TempVecXG
	asl
	asl
	asl
	sta.b $2E,x
	lda.b TempVecYG
	asl
	asl
	asl
	sta.b $31,x
	lda.b TempVecZG
	asl
	asl
	asl
	sta.b $33,x
	sep #$20
	rtl
UnkFunc_1FD60D:
	sta.b TempMiscX
	lda.b $15,x
	sec
	sbc.w TempMiscW
	beq UnkFunc_1FD60D_L5
	bpl UnkFunc_1FD60D_L1
	eor.b #$FF
	inc
UnkFunc_1FD60D_L1:
	cmp.b TempMiscX
	bpl UnkFunc_1FD60D_L2
	lda.w TempMiscW
	bra UnkFunc_1FD60D_L4
UnkFunc_1FD60D_L2:
	lda.b $15,x
	cmp.w TempMiscW
	beq UnkFunc_1FD60D_L4
	bmi UnkFunc_1FD60D_L3
	sec
	sbc.b TempMiscX
	bra UnkFunc_1FD60D_L4
UnkFunc_1FD60D_L3:
	clc
	adc.b TempMiscX
UnkFunc_1FD60D_L4:
	sta.b $15,x
	clc
	rtl
UnkFunc_1FD60D_L5:
	sec
	rtl
Clamp2Shift16:
	cmp.b TempMiscX
	bne Clamp2Shift16_Ne
	jml ClampShiftEq
Clamp2Shift16_Ne:
	sec
	sbc.b TempMiscX
	cmp.w #$0000
	bmi Clamp2Shift16_Neg
	cmp.w #$0002
	bpl Clamp2Shift16_Sh
	lda.w #$0002
	bra Clamp2Shift16_Sh
Clamp2Shift16_Neg:
	cmp.w #$FFFE
	bmi Clamp2Shift16_Sh
	lda.w #$FFFE
Clamp2Shift16_Sh:
	cmp.w #$8000
	ror
	bpl Clamp2Shift16_SkC
	adc.w #$0000
Clamp2Shift16_SkC:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp4Shift16:
	cmp.b TempMiscX
	bme Clamp4Shift16_Ne
	jml ClampShiftEq
Clamp4Shift16_Ne:
	sec
	sbc.b TempMiscX
	cmp.w #$0000
	bmi Clamp4Shift16_Neg
	cmp.w #$0004
	bpl Clamp4Shift16_Sh
	lda.w #$0004
	bra Clamp4Shift16_Sh
Clamp4Shift16_Neg:
	cmp.w #$FFFC
	bmi Clamp4Shift16_Sh
	lda.w #$FFFC
Clamp4Shift16_Sh:
	cmp.w #$8000
	ror
	bpl Clamp4Shift16_SkC1
	adc.w #$0000
Clamp4Shift16_SkC1:
	cmp.w #$8000
	ror
	bpl Clamp4Shift16_SkC2
	adc.w #$0000
Clamp4Shift16_SkC2:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp8Shift16:
	cmp.b TempMiscX
	bne Clamp8Shift16_Ne
	jml ClampShiftEq
Clamp8Shift16_Ne:
	sec
	sbc.b TempMiscX
	cmp.w #$0000
	bmi Clamp8Shift16_Neg
	cmp.w #$0008
	bpl Clamp8Shift16_Sh
	lda.w #$0008
	bra Clamp8Shift16_Sh
Clamp8Shift16_Neg:
	cmp.w #$FFF8
	bmi Clamp8Shift16_Sh
	lda.w #$FFF8
Clamp8Shift16_Sh:
	cmp.w #$8000
	ror
	bpl Clamp8Shift16_SkC1
	adc.w #$0000
Clamp8Shift16_SkC1:
	cmp.w #$8000
	ror
	bpl Clamp8Shift16_SkC2
	adc.w #$0000
Clamp8Shift16_SkC2:
	cmp.w #$8000
	ror
	bpl Clamp8Shift16_SkC3
	adc.w #$0000
Clamp8Shift16_SkC3:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp16Shift16:
	cmp.b TempMiscX
	bne Clamp16Shift16_Ne
	jml ClampShiftEq
Clamp16Shift16_Ne:
	sec
	sbc.b TempMiscX
	cmp.w #$0000
	bmi Clamp16Shift16_Neg
	cmp.w #$0010
	bpl Clamp16Shift16_Sh
	lda.w #$0010
	bra Clamp16Shift16_Sh
Clamp16Shift16_Neg:
	cmp.w #$FFF0
	bmi Clamp16Shift16_Sh
	lda.w #$FFF0
Clamp16Shift16_Sh:
	cmp.w #$8000
	ror
	bpl Clamp16Shift16_SkC1
	adc.w #$0000
Clamp16Shift16_SkC1:
	cmp.w #$8000
	ror
	bpl Clamp16Shift16_SkC2
	adc.w #$0000
Clamp16Shift16_SkC2:
	cmp.w #$8000
	ror
	bpl Clamp16Shift16_SkC3
	adc.w #$0000
Clamp16Shift16_SkC3:
	cmp.w #$8000
	ror
	bpl Clamp16Shift16_SkC4
	adc.w #$0000
Clamp16Shift16_SkC4:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp32Shift16:
	cmp.b TempMiscX
	bne Clamp32Shift16_Ne
	jml ClampShiftEq
Clamp32Shift16_Ne:
	sec
	sbc.b TempMiscX
	cmp.w #$0000
	bmi Clamp32Shift16_Neg
	cmp.w #$0020
	bpl Clamp32Shift16_Sh
	lda.w #$0020
	bra Clamp32Shift16_Sh
Clamp32Shift16_Neg:
	cmp.w #$FFE0
	bmi Clamp32Shift16_Sh
	lda.w #$FFE0
Clamp32Shift16_Sh:
	cmp.w #$8000
	ror
	bpl Clamp32Shift16_SkC1
	adc.w #$0000
Clamp32Shift16_SkC1:
	cmp.w #$8000
	ror
	bpl Clamp32Shift16_SkC2
	adc.w #$0000
Clamp32Shift16_SkC2:
	cmp.w #$8000
	ror
	bpl Clamp32Shift16_SkC3
	adc.w #$0000
Clamp32Shift16_SkC4:
	cmp.w #$8000
	ror
	bpl Clamp32Shift16_SkC5
	adc.w #$0000
Clamp32Shift16_SkC5:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp64Shift16:
	cmp.b TempMiscX
	bne Clamp64Shift16_Ne
	jml ClampShiftEq
Clamp64Shift16_Ne:
	sec
	sbc.b TempMiscX
	cmp.w #$0000
	bmi Clamp64Shift16_Neg
	cmp.w #$0040
	bpl Clamp64Shift16_Sh
	lda.w #$0040
	bra Clamp64Shift16_Sh
Clamp64Shift16_Neg:
	cmp.w #$FFC0
	bmi Clamp64Shift16_Sh
	lda.w #$FFC0
Clamp64Shift16_Sh:
	cmp.w #$8000
	ror
	bpl Clamp64Shift16_SkC1
	adc.w #$0000
Clamp64Shift16_SkC1:
	cmp.w #$8000
	ror
	bpl Clamp64Shift16_SkC2
	adc.w #$0000
Clamp64Shift16_SkC2:
	cmp.w #$8000
	ror
	bpl Clamp64Shift16_SkC3
	adc.w #$0000
Clamp64Shift16_SkC3:
	cmp.w #$8000
	ror
	bpl Clamp64Shift16_SkC4
	adc.w #$0000
Clamp64Shift16_SkC4:
	cmp.w #$8000
	ror
	bpl Clamp64Shift16_SkC5
	adc.w #$0000
Clamp64Shift16_SkC5:
	cmp.w #$8000
	ror
	bpl Clamp64Shift16_SkC6
	adc.w #$0000
Clamp64Shift16_SkC6:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp128Shift16:
	cmp.b TempMiscX
	bne Clamp128Shift16_Ne
	jml ClampShiftEq
Clamp128Shift16_Ne:
	sec
	sbc.b TempMiscX
	cmp.w #$0000
	bmi Clamp128Shift16_Neg
	cmp.w #$0080
	bpl Clamp128Shift16_Sh
	lda.w #$0080
	bra Clamp128Shift16_Sh
Clamp128Shift16_Neg:
	cmp.w #$FF80
	bmi Clamp128Shift16_Sh
	lda.w #$FF80
Clamp128Shift16_Sh:
	cmp.w #$8000
	ror
	bpl Clamp128Shift16_SkC1
	adc.w #$0000
Clamp128Shift16_SkC1:
	cmp.w #$8000
	ror
	bpl Clamp128Shift16_SkC2
	adc.w #$0000
Clamp128Shift16_SkC2:
	cmp.w #$8000
	ror
	bpl Clamp128Shift16_SkC3
	adc.w #$0000
Clamp128Shift16_SkC3:
	cmp.w #$8000
	ror
	bpl Clamp128Shift16_SkC4
	adc.w #$0000
Clamp128Shift16_SkC4:
	cmp.w #$8000
	ror
	bpl Clamp128Shift16_SkC5
	adc.w #$0000
Clamp128Shift16_SkC5:
	cmp.w #$8000
	ror
	bpl Clamp128Shift16_SkC6
	adc.w #$0000
Clamp128Shift16_SkC6:
	cmp.w #$8000
	ror
	bpl Clamp128Shift16_SkC7
	adc.w #$0000
Clamp128Shift16_SkC7:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp2Shift8:
	cmp.b TempMiscX
	bne Clamp2Shift8_Ne
	jml ClampShiftEq
Clamp2Shift8_Ne:
	sec
	sbc.b TempMiscX
	cmp.b #$00
	bmi Clamp2Shift8_Neg
	cmp.b #$02
	bpl Clamp2Shift8_Sh
	lda.b #$02
	bra Clamp2Shift8_Sh
Clamp2Shift8_Neg:
	cmp.b #$FE
	bmi Clamp2Shift8_Sh
	lda.b #$FE
Clamp2Shift8_Sh:
	cmp.b #$80
	ror
	bpl Clamp2Shift8_SkC
	adc.b #$00
Clamp2Shift8_SkC:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp4Shift8:
	cmp.b TempMiscX
	bne Clamp4Shift8_Ne
	jml ClampShiftEq
Clamp4Shift8_Ne:
	sec
	sbc.b TempMiscX
	cmp.b #$00
	bmi Clamp4Shift8_Neg
	cmp.b #$04
	bpl Clamp4Shift8_Sh
	lda.b #$04
	bra Clamp4Shift8_Sh
Clamp4Shift8_Neg:
	cmp.b #$FC
	bmi Clamp4Shift8_Sh
	lda.b #$FC
Clamp4Shift8_Sh:
	cmp.b #$80
	ror
	bpl Clamp4Shift8_SkC1
	adc.b #$00
Clamp4Shift8_SkC1:
	cmp.b #$80
	ror
	bpl Clamp4Shift8_SkC2
	adc.b #$00
Clamp4Shift8_SkC2:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp8Shift8:
	cmp.b TempMiscX
	bne Clamp16Shift8_Ne
	jml ClampShiftEq
Clamp16Shift8_Ne:
	sec
	sbc.b TempMiscX
	cmp.b #$00
	bmi Clamp16Shift8_Neg
	cmp.b #$10
	bpl Clamp16Shift8_Sh
	lda.b #$10
	bra Clamp16Shift8_Sh
Clamp16Shift8_Neg:
	cmp.b #$F0
	bmi Clamp16Shift8_Sh
	lda.b #$F0
Clamp16Shift8_Sh:
	cmp.b #$80
	ror
	bpl Clamp16Shift8_SkC1
	adc.b #$00
Clamp16Shift8_SkC1:
	cmp.b #$80
	ror
	bpl Clamp16Shift8_SkC2
	adc.b #$00
Clamp16Shift8_SkC2:
	cmp.b #$80
	ror
	bpl Clamp16Shift8_SkC3
	adc.b #$00
Clamp16Shift8_SkC3:
	cmp.b #$80
	ror
	bpl Clamp16Shift8_SkC4
	adc.b #$00
Clamp16Shift8_SkC4:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp32Shift8:
	cmp.b TempMiscX
	bne Clamp32Shift8_Ne
	jml ClampShiftEq
Clamp32Shift8_Ne:
	sec
	sbc.b TempMiscX
	cmp.b #$00
	bmi Clamp32Shift8_Neg
	cmp.b #$20
	bpl Clamp32Shift8_Sh
	lda.b #$20
	bra Clamp32Shift8_Sh
Clamp32Shift8_Neg:
	cmp.b #$E0
	bmi Clamp32Shift8_Sh
	lda.b #$E0
Clamp32Shift8_Sh:
	cmp.b #$80
	ror
	bpl Clamp32Shift8_SkC1
	adc.b #$00
Clamp32Shift8_SkC1:
	cmp.b #$80
	ror
	bpl Clamp32Shift8_SkC2
	adc.b #$00
Clamp32Shift8_SkC2:
	cmp.b #$80
	ror
	bpl Clamp32Shift8_SkC3
	adc.b #$00
Clamp32Shift8_SkC3:
	cmp.b #$80
	ror
	bpl Clamp32Shift8_SkC4
	adc.b #$00
Clamp32Shift8_SkC4:
	cmp.b #$80
	ror
	bpl Clamp32Shift8_SkC5
	adc.b #$00
Clamp32Shift8_SkC5:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp64Shift8:
	cmp.b TempMiscX
	bne Clamp64Shift8_Ne
	jml ClampShiftEq
Clamp64Shift8_Ne:
	sec
	sbc.b TempMiscX
	cmp.b #$00
	bmi Clamp64Shift8_Neg
	cmp.b #$40
	bpl Clamp64Shift8_Sh
	lda.b #$40
	bra Clamp64Shift8_Sh
Clamp64Shift8_Neg:
	cmp.b #$C0
	bmi Clamp64Shift8_Sh
	lda.b #$C0
Clamp64Shift8_Sh:
	cmp.b #$80
	ror
	bpl Clamp64Shift8_SkC1
	adc.b #$00
Clamp64Shift8_SkC1:
	cmp.b #$80
	ror
	bpl Clamp64Shift8_SkC2
	adc.b #$00
Clamp64Shift8_SkC2:
	cmp.b #$80
	ror
	bpl Clamp64Shift8_SkC3
	adc.b #$00
Clamp64Shift8_SkC3:
	cmp.b #$80
	ror
	bpl Clamp64Shift8_SkC4
	adc.b #$00
Clamp64Shift8_SkC4:
	cmp.b #$80
	ror
	bpl Clamp64Shift8_SkC5
	adc.b #$00
Clamp64Shift8_SkC5:
	cmp.b #$80
	ror
	bpl Clamp64Shift8_SkC6
	adc.b #$00
Clamp64Shift8_SkC6:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
Clamp128Shift8:
	cmp.b TempMiscX
	bne Clamp128Shift8_Ne
	jml ClampShiftEq
Clamp128Shift8_Ne:
	sec
	sbc.b TempMiscX
	cmp.b #$00
	bmi Clamp128Shift8_Neg
	cmp.b #$80
	bpl Clamp128Shift8_Sh
	lda.b #$80
	bra Clamp128Shift8_Sh
Clamp128Shift8_Neg:
	cmp.b #$80
	bmi Clamp128Shift8_Sh
	lda.b #$80
Clamp128Shift8_Sh:
	cmp.b #$80
	ror
	bpl Clamp128Shift8_SkC1
	adc.b #$00
Clamp128Shift8_SkC1:
	cmp.b #$80
	ror
	bpl Clamp128Shift8_SkC2
	adc.b #$00
Clamp128Shift8_SkC2:
	cmp.b #$80
	ror
	bpl Clamp128Shift8_SkC3
	adc.b #$00
Clamp128Shift8_SkC3:
	cmp.b #$80
	ror
	bpl Clamp128Shift8_SkC4
	adc.b #$00
Clamp128Shift8_SkC4:
	cmp.b #$80
	ror
	bpl Clamp128Shift8_SkC5
	adc.b #$00
Clamp128Shift8_SkC5:
	cmp.b #$80
	ror
	bpl Clamp128Shift8_SkC6
	adc.b #$00
Clamp128Shift8_SkC6:
	cmp.b #$80
	ror
	bpl Clamp128Shift8_SkC7
	adc.b #$00
Clamp128Shift8_SkC7:
	clc
	adc.b TempMiscX
	sta.b TempMiscX
	brl ClampShiftNe
ClampShiftNe:
	lda.b TempMiscX
	clc
	rtl
ClampShiftEq:
	lda.b TempMiscX
	sec
	rtl
SetDefaultDestroyFuncPtr:
	rep #$20
	lda.w #DestroyCommonEnemy
	sta.w Object2ListRel+$06,x
	sep #$20
	lda.b #BANKOF(DestroyCommonEnemy)
	sta.w Object2ListRel+$08,x
	rtl
SetDefaultDestroyFuncPtrS:
	phx
	tyx
	ply
	rep #$20
	lda.w #DestroyCommonEnemy
	sta.w Object2ListRel+$06,x
	sep #$20
	lda.b #BANKOF(DestroyCommonEnemy)
	sta.w Object2ListRel+$08,x
	phx
	tyx
	ply
	rtl
UnkFunc_1FDA57:
	rep #$20
	lda.b $0C,x
	sec
	sbc.w Unknown_150D
	sta.w TempMiscW
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sep #$20
	clc
	adc.b $14,x
	sta.b $14,x
	lda.w Unknown_15BB
	clc
	adc.w CurProcObject
	and.b #$03
	beq UnkFunc_1FDA57_L1
	jml UnkFunc_1FDA57_L5
UnkFunc_1FDA57_L1:
	lda.w TempMiscW+1
	bmi UnkFunc_1FDA57_L2
	inc.b $14,x
	bra UnkFunc_1FDA57_L3
UnkFunc_1FDA57_L2:
	dec.b $14,x
UnkFunc_1FDA57_L3:
	rep #$20
	lda.b $0E,x
	sec
	sbc.w Unknown_150F
	sep #$20
	bmi UnkFunc_1FDA57_L4
	lda.b $13,x
	clc
	adc.b #$01
	sta.b $13,x
	bra UnkFunc_1FDA57_L5
UnkFunc_1FDA57_L4:
	lda.b $13,x
	sec
	sbc.b #$01
	sta.b $13,x
UnkFunc_1FDA57_L5:
	rtl
UnkFunc_1FDAB8:
	lda.b TempVecXG
	sta.w TempRotX
	lda.b TempVecZG
	sta.b TempRotZ
	lda.b #$40
	sta.w TempRotY
	jsl GetLocalXYZ8RotateRotXNegRotY
	rep #$20
	lda.b TempVecXG
	sta.b $2F,x
	lda.b TempVecYG
	sta.b $31,x
	stz.b $31,x
	sep #$20
	rtl
CopyPositionTo:
	rep #$20
	lda.b $0C,x
	sta.w $000C,y
	lda.b $0E,x
	sta.w $000E,y
	lda.b $10,x
	sta.w $0010,y
	sep #$20
	rtl
CopyPositionFrom:
	rep #$20
	lda.w $000C,y
	sta.b $0C,x
	lda.w $000E,y
	sta.b $0E,x
	lda.w $0010,y
	sta.b $10,x
	sep #$20
	rtl
CopyRotationTo:
	lda.b $12,x
	sta.w $0012,y
	lda.b $13,x
	sta.w $0013,y
	lda.b $14,x
	sta.w $0015,y
	rtl
CopyRotationFrom:
	lda.w $0012,y
	sta.b $12,x
	lda.w $0013,y
	sta.b $13,x
	lda.w $0014,y
	sta.b $14,x
	rtl
OffsetObjectZPositionEx:
	rep #$20
	lda.w $14EA
	sec
	sbc.w $14F4
	clc
	adc.b $10,x
	sta.b $10,x
	sep #$20
	rtl
OffsetObjectZPositionExAux:
	rep #$20
	lda.w $14EA
	sec
	sbc.w $14F4
	clc
	adc.w $0010,y
	sta.w $0010,y
	sep #$20
	rtl
ClearVelocity:
	rep #$20					;\
	stz.b $2F,x					;|Store zero in velocity X element...
	stz.b $31,x					;|...same for Y...
	stz.b $33,x					;|...same for Z...
	sep #$20					;|
	stz.b $15,x					;|...and store zero in unknown object property $15
	rtl						;/
ClearVelocityAux:
	rep #$20					;\
	lda.w #$0000					;|
	sta.w $002F,y					;|Store zero in velocity X element...
	sta.w $0031,y					;|...same for Y...
	sta.w $0033,y					;|...same for Z...
	sep #$20					;|
	sta.w $0015,y					;|...and store zero in unknown object property $15
	rtl						;/
UnkFunc_1FDB66:
	lda.w Object2ListRel+$12,x
	inc
	sta.w Object2ListRel+$12,x
	brl UnkFunc_1FDBA0
UnkFunc_1FDB70:
	lda.b #$00
	sta.w Object2ListRel+$12,x
	brl UnkFunc_1FDBA0
UnkFunc_1FDB78:
	lda.b #$01
	sta.w Object2ListRel+$12,x
	brl UnkFunc_1FDBA0
UnkFunc_1FDB80:
	lda.b #$02
	sta.w Object2ListRel+$12,x
	brl UnkFunc_1FDBA0
UnkFunc_1FDB88:
	lda.b #$03
	sta.w Object2ListRel+$12,x
	brl UnkFunc_1FDBA0
UnkFunc_1FDB90:
	lda.b #$04
	sta.w Object2ListRel+$12,x
	brl UnkFunc_1FDBA0
UnkFunc_1FDB98:
	lda.b #$05
	sta.w Object2ListRel+$12,x
	brl UnkFunc_1FDBA0
UnkFunc_1FDBA0:
	jml RunObjectBehFunc
UnkFunc_1FDBA4:
	sep #$20
	lda.b $20,x
	and.b #$10
	bne UnkFunc_1FDBA4_L1
	jml UnkFunc_1FDBA4_L5
UnkFunc_1FDBA4_L1:
	ldy.b $06,x
	lda.b $20,x
	and.b #$3F
	sta.b $20,x
	rep #$20
	stx.b TempMiscY
	phy
UnkFunc_1FDBA4_L2:
	lda.w $0026,y
	beq UnkFunc_1FDBA4_L4
	cmp.b TempMiscY
	beq UnkFunc_1FDBA4_L3
	tay
	bra UnkFunc_1FDBA4_L2
UnkFunc_1FDBA4_L3:
	lda.b $26,x
	sta.w $0026,y
UnkFunc_1FDBA4_L4:
	ply
	sep #$20
UnkFunc_1FDBA4_L5:
	lda.b $20,x
	and.b #$40
	bne UnkFunc_1FDBA4_L6
	jml UnkFunc_1FDBA4_L12
UnkFunc_1FDBA4_L6:
	lda.w $0020,y
	and.b #$FB
	sta.w $0020,y
	stz.w TempMiscW
	phy
	phx
UnkFunc_1FDBA4_L7:
	ldy.b $26,x
	beq UnkFunc_1FDBA4_L8
	inc.w TempMiscW
	tyx
	bra UnkFunc_1FDBA4_L7
UnkFunc_1FDBA4_L8:
	plx
	ply
	lda.w TempMiscW
	beq UnkFunc_1FDBA4_L12
UnkFunc_1FDBA4_L9:
	sta.w TempMiscW
	lda.w TempMiscW
	jsl UnkFunc_1FDC40
	cpy.w #$0000
	bne UnkFunc_1FDBA4_L10
	jml UnkFunc_1FDBA4_L11
UnkFunc_1FDBA4_L10:
	lda.w $0020,y
	and.b #$EF
	sta.w $0020,y
	rep #$20
	lda.w #$0000
	sta.w $0006,y
	sep #$20
UnkFunc_1FDBA4_L11:
	lda.w $14C5
	dec
	bne CODE_1FDBF9
UnkFunc_1FDBA4_L12:
	rtl
RunObjectBehFunc:
	lda.b $18,x
	pha
	rep #$20
	bne RunObjectBehFunc_L1
	lda.b $16,x
	beq RunObjectBehFunc_L2
	dec
	pha
	sep #$20
	rtl
RunObjectBehFunc_L1:
	lda.b $16,x
	dec
	pha
	sep #$20
	rtl
RunObjectBehFunc_L2:
	sep #$20
	pla
	rtl
UnkFunc_1FDC40:
	sta.w Unknown_1FE6
	phx
UnkFunc_1FDC40_L1:
	ldy.b $26,x
	beq UnkFunc_1FDC40_L2
	lda.w $0022,y
	cmp.w Unknown_1FE6
	beq UnkFunc_1FDC40_L2
	tyx
	bra UnkFunc_1FDC40_L1
UnkFunc_1FDC40_L2:
	plx
	rtl
UnkFunc_1FDC55:
	sta.w Unknown_1FE6
	phy
UnkFunc_1FDC55_L1:
	ldx.b $26,y
	beq CODE_1FDC67
	lda.b $22,x
	cmp.w Unknown_1FE6
	beq CODE_1FDC67
	txy
	bra CODE_1FDC59
UnkFunc_1FDC55_L2:
	ply
	rtl
OffsetObjectZPosition:
	rep #$20					;\Offset Z position
	lda.b $10,x					;|
	clc						;|
	adc.w $14F4					;|
	sta.b $10,x					;|
	sep #$20					;|
	rtl						;/
OffsetObjectZPositionAux:
	rep #$20					;\Offset Z position
	lda.b $0010,y					;|
	clc						;|
	adc.w $14F4					;|
	sta.b $0010,y					;|
	sep #$20					;|
	rtl						;/
CODE_1FDC85:
	rts
CODE_1FDC86:
	rts
CODE_1FDC87:
	rtl
CODE_1FDC88:
	rts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CREDITS BOSS PREVIEW ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CreditsBossPreview:
	php
	jsl CODE_02E39A
	jsl CODE_03E8B6
	sep #$20
	rep #$10
	sei
	lda.b #$80
	jsl CODE_02F8DF
	lda.b #$6E
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$64
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$12
	sta.w MusicID
	stz.w MusicLoaded
	stz.w Unknown_15A8
	sep #$20
	rep #$10
	stz.w Pad1HiPrev
	stz.w Pad2HiPrev
	stz.w Pad1Down
	stz.w Pad2Down
	rep #$20
	lda.w #$0000
	sta.w Unknown_1F2F
	sta.w Unknown_1F3B
	lda.w #$0000
	sta.w Unknown_1F2D
	sta.w Unknown_1F39
	lda.w #$0000
	sta.w Unknown_1F2B
	sta.w Unknown_1F37
	lda.w #$0100
	sta.w Unknown_1F29
	sta.w Unknown_1F35
	lda.w #$0080
	sta.w Unknown_1F27
	sta.w Unknown_1F33
	lda.w #$FFEF
	sta.w Unknown_1F25
	sta.w Unknown_1F31
	stz.w Unknown_1F21
	ldx.w Unknown_1F69
	lda.w #$FFFF
	sta.w Unknown_1F6B,x
	ldx.w #$0000
	stx.w Unknown_1F69
	stz.w PointEffect
	stz.w WipePointer
	sep #$20
	rep #$10
	stz.w Unknown_15BB
	lda.b #$09
	sta.w BGMODE
	lda.b #$07
	sta.w TM
	stz.w Unknown_14C1
	lda.b #$06
	sta.w BG34NBA
	lda.b #$71
	sta.w BG34NBA
	rep #$20
	lda.w #$0000
	sta.l $700090
	lda.w #$0014
	sta.l InputPtr+2
	lda.w #$E362
	sta.l InputPtr
	lda.w #$5C00
	sta.w Unknown_188A
	lda.w #$1800
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
	jsl NMITask14
	rep #$20
	lda.w #$00C0
	sta.l $700090
	lda.w #$0014
	sta.l InputPtr+2
	lda.w #$E43E
	sta.l InputPtr
	sep #$20
	jsl DoDecompressTileset
	jsl NMITask14
	rep #$20
	lda.w #$0000
	sta.l $700090
	lda.w #$0014
	sta.l InputPtr+2
	lda.w #$E272
	sta.l InputPtr
	lda.w #$6800
	sta.w Unknown_188A
	lda.w #$1000
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
	jsl NMITask14
	lda.b #$20
	sta.b CurNMITask
	lda.b #$01
	sta.w Unknown_1FCF
	lda.w TIMEUP
	cli
CreditsBossPreview_L1:
	jsr UnkCreditsBossPrevFunc_1FDF19
	jsr UnkCreditsBossPrevFunc_1FE167
	jsr UnkCreditsBossPrevFunc_1FDE13
	sep #$20
	lda.w Unknown_1962
	bne CreditsBossPreview_L2
	lda.b #$0E
	sta.w FadeTimer
	lda.b #$01
	sta.w FadeMode
	bra CreditsBossPreview_L1
CreditsBossPreview_L2:
	cmp.b #$01
	beq CreditsBossPreview_L3
	dec.w Unknown_1962
	bra CreditsBossPreview_L1
CreditsBossPreview_L3:
	rep #$20
	lda.w #$0113
	sta.w WipePointer
	sep #$20
	dec.w Unknown_1962
	bra CreditsBossPreview_L1
Calls_UnkCreditsBossPrevFunc_1FDE13:
	jsr UnkCreditsBossPrevFunc_1FDE13
	rtl
UnkCreditsBossPrevFunc_1FDE13:
	sep #$20
	rep #$10
UnkCreditsBossPrevFunc_1FDE13_L1:
	lda.b CurNMITask
	cmp.b #$20
	bne UnkCreditsBossPrevFunc_1FDE13_L1
	stz.w Unknown_1F10
	lda.b #$1A
	sta.b CurNMITask
	jsl ProcWipes
	
	
	
	
	
	
	
	
	
LoadCreditsBossPreviewBG_Blue:
	lda.b #$22
	sta.w BBAD0
	lda.b #$00
	sta.w CGADD
	ldx.w #$1280
	stx.w A1T0L
	lda.b #$7F
	sta.w A1B0
	ldx.w #$0200
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	jmp LoadCreditsBossPreviewBG
LoadCreditsBossPreviewBG_Gray:
	lda.b #$22
	sta.w BBAD0
	lda.b #$00
	sta.w CGADD
	ldx.w #$11A0
	stx.w A1T0L
	lda.b #$7F
	sta.w A1B0
	ldx.w #$0200
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
LoadCreditsBossPreviewBG:
	rep #$20
	lda.w #$0100
	sta.l $700090
	lda.w #$0014
	sta.l InputPtr+2
	lda.w #$E2C2
	sta.l InputPtr
	lda.w #$7000
	sta.w Unknown_188A
	lda.w #$1000
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
LoadCreditsBossPreviewBG_Wait:
	lda.b CurNMITask
	beq LoadCreditsBossPreviewBG_NextTask
	cmp.b #$20
	bne LoadCreditsBossPreviewBG_Wait
LoadCreditsBossPreviewBG_NextTask:
	lda.b #$14
	sta.b CurNMITask
LoadCreditsBossPreviewBG_Wait2:
	lda.b CurNMITask
	beq LoadCreditsBossPreviewBG_FinishTasks
	cmp.b #$20
	bne LoadCreditsBossPreviewBG_Wait2
LoadCreditsBossPreviewBG_FinishTasks:
	stz.w CGADD
	stz.w CGDATA
	stz.w CGDATA
	lda.b #$01
	jsl WriteSuperFX4BPPPalette
	lda.b #$8A
	sta.l $70004E
	lda.b #$8B
	sta.l $70004F
	rep #$20
	lda.w #$8FAA
	sta.l $700050
	sep #$20
	rep #$10
	rts
PrintCreditsBossPreviewText:
	php
	sep #$20
	rep #$10
PrintCreditsBossPreviewText_Loop:
	lda.l CreditsBossPreviewTextData,x
	inx
	cmp.b #$00
	beq PrintCreditsBossPreviewText_Exit
	cmp.b #$01
	bne PrintCreditsBossPreviewText_LoadData
	rep #$20
	lda.l CreditsBossPreviewTextData,x
	inx
	inx
	clc
	adc.w #$7000
	sta VMADDL
	sep #$20
	bra PrintCreditsBossPreviewText_Loop
PrintCreditsBossPreviewText_LoadData:
	rep #$20
	and.w #$00FF
	txy
	tax
	lda.l CreditsBossPreviewFont-$20,x
	and.w #$00FF
	ora.w #$2000
	clc
	adc.w #$0100
	sta.w VMDATAL
	sep #$20
	bra PrintCreditsBossPreviewText_Loop
PrintCreditsBossPreviewText_Exit:
	plp
	rts
UnkCreditsBossPrevFunc_1FE167:
	rep #$30
	jmp (Unknown_1F1B)
UnkCreditsBossPrevFunc_1FE16C:
	php
	rep #$20
	lda.w #$0030
	sta.w Unknown_1F3B
	lda.w #$0018
	sta.w Unknown_1F39
	lda.w #$0118
	sta.w Unknown_1F35
	lda.w #$00E0
	sta.w Unknown_1F33
	lda.w #$001F
	sta.w Unknown_1F31
	plp
	rts
UnkCreditsBossPrevFunc_1FE18F:
	php
	rep #$20
	lda.w #$0000
	sta.w Unknown_1F3B
	lda.w #$0000
	sta.w Unknown_1F39
	lda.w #$0100
	sta.w Unknown_1F35
	lda.w #$0080
	sta.w Unknown_1F33
	lda.w #$FFEF
	sta.w Unknown_1F31
	plp
	rts
UnkCreditsBossPrevFunc_1FE1B2:
	php
	rep #$20
	lda.w #$FFD0
	sta.w Unknown_1F3B
	lda.w #$0018
	sta.w Unknown_1F39
	lda.w #$0118
	sta.w Unknown_1F35
	lda.w #$0020
	sta.w Unknown_1F33
	lda.w #$001F
	sta.w Unknown_1F31
	plp
	rts
UnkCreditsBossPrevFunc_1FE1D5:
	
	
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;INTRO/TITLE/CONTROLS ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Title:
	php
Title_Reinit:
	sep #$20
	rep #$10
	sei
	lda.b #$01
	sta.l $7EF0B3
	lda.b #$0D					;\Set level script pointer
	ldx.w #$7918					;|
	sta.w LevelScriptBank				;|
	stx.w LevelScriptPointer			;/
	jsl CODE_02E2CC
	lda.w $14D8
	and.b #$FD
	sta.w $14D8
	jsl CODE_03E8B6
	rep #$20
	lda.w #$0000					;\Disable HUD
	sta.l RenderHUDFlag				;/
	sta.w $1FFC
	stz.w $15BB
	rep #$20					;\Set wait timer
	lda.w #$0370					;|
	pha						;/
Title_Loop:
	jsl CODE_02FD84
	jsl MainLoop
	sep #$20					;\Override default BG3 priority
	lda.b #$09					;|
	sta.w BGMODE					;/
	rep #$20					;\Decrement wait timer...
	pla						;|
	dec						;|
	beq Title_ReloadIntro				;|...if zero, branch to reload intro
	pha						;/
	lda.w $15BB
	cmp.w #$0028
	bcc Title_Loop
	sep #$20					;\If Start not pressed...
	lda.w Pad1HiCur					;|
	bit.b #$10					;|
	beq Title_Loop					;/...loop back
	rep #$20					;\Play "select" sound effect
	pla						;|
	sep #$20					;|
	lda.b #$10					;|
	jsl PushSoundEffectToQueue			;/
	lda.b #$F1					;\Clear music...
	sta.w MusicID					;|
	stz.w MusicLoaded				;|
	lda.b #$FD					;|...and init fade out
	sta.w FadeMode					;/
Title_WaitFade:
	jsl CODE_02FD84
	jsl MainLoop
	sep #$20					;\Override default BG3 priority
	lda.b #$09					;|
	sta.w BGMODE					;/
	lda.w FadeMode
	and.w #$00FF
	bne Title_WaitFade
	plp
	rtl
Title_ReloadIntro:
	sep #$20					;\Clear music...
	lda.b #$F1					;|
	sta.w MusicID					;|
	stz.w MusicLoaded				;|
	lda.b #$FD					;|...and init fade out
	sta.w FadeMode					;/
Title_WaitFade2:
	jsl CODE_02FD84
	jsl MainLoop
	sep #$20					;\Override default BG3 priority
	lda.b #$09					;|
	sta.w BGMODE					;/
	lda.w FadeMode
	and.w #$00FF
	bne Title_WaitFade2
	jsl Intro					; Redo intro
	jmp Title_Reinit				; Redo title
Intro:
	sep #$20
	rep #$10
	jsl LoadAudio_InitData
	sep #$20
	rep #$10
	ldx.w #$0000
Intro_WaitAudioInit:
	dex
	bne Intro_WaitAudioInit
	jsl LoadAudio_Intro
	sei
	lda.b #$0D					;\Set level script pointer
	ldx.w #$7796					;|
	sta.w LevelScriptBank				;|
	stx.w LevelScriptPointer			;/
	jsl CODE_02E2CC
	lda.w $14D8
	and.b #$FD
	sta.w $14D8
	jsl CODE_03E8B6
	lda.b #$00					;\Disable HUD
	sta.l RenderHUDFlag				;/
	sta.w $1FFC
	sta.l $7EF0B3
	stz.w $15BB
Intro_Loop:
	jsl CODE_02FD84
	jsl MainLoop
	sep #$20
	lda.w $15BB
	cmp.b #$1E
	bcc Intro_Loop
	lda.w $1FFC
	bne Intro_FadeOut
	lda.w Pad1HiCur
	ora.w Pad1LoCur
	beq Intro_Loop
Intro_FadeOut:
	lda.b #$FE
	sta.w FadeMode
	lda.b #$0B
	sta.w FadeTimer
Intro_WaitFade:
	jsl CODE_02FD84
	jsl MainLoop
	sep #$20
	lda.w FadeMode
	bne Intro_WaitFade
	rtl
BehF1_TitleHighPolyArwing:
	lda.b #$EF					;\Init X Rotation
	sta.b $12,x					;/
	lda.b #$60					;\Init Y Rotation
	sta.b $13,x					;/
	lda.b #$00					;\Init Z Rotation
	sta.b $14,x					;/
	rep #$20					;\Set object behavior routine pointer to BehF1_TitleHighPolyArwingLoop
	lda.w #BehF1_TitleHighPolyArwingLoop		;|
	sta.b $16,x					;|
	sep #$20					;|
	lda.b #BANKOF(BehF1_TitleHighPolyArwingLoop)	;|
	sta.b $18,x					;/
BehF1_TitleHighPolyArwingLoop:
	lda.b $14,x					;\Rotate about local Z
	clc						;|
	adc.b #$02					;|
	sta.b $14,x					;/
	jsl OffsetObjectZPosition
	rtl
	
	;Compressed tilemap
	INCBIN "graphics/compressed/venom.mapz"
	
Controls:
	php
	sep #$20
	rep #$10
	jsl LoadAudio_Controls
	sei
	lda.b #$80
	jsl CODE_02F8DF
	lda.b #$C8
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$BE
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	sep #$20
	lda.b #$01
	sta.l Unknown_7EF0B3
	lda.b #$0D					;\Set level script pointer
	ldx.w #$7962					;|
	sta.w LevelScriptBank				;|
	stx.w LevelScriptPointer			;/
	jsl MainGameInit
	jsl CODE_03E8B6
	rep #$20
	lda.w #$0000
	sta.l $700090
	lda.w #$001F
	sta.l InputPtr+2
	lda.w #$B999
	sta.l InputPtr
	lda.w #$6800
	sta.w $188A
	lda.w #$1000
	sta.w $188C
	sep #$20
	jsl DoDecompressTileset
	jsl NMITask14
	lda.b #$22
	sta.w BBAD0
	lda.b #$80
	sta.w CGADD
	ldx.w #$0540
	stx.w A1T0L
	lda.b #$7F
	sta.w A1B0
	ldx.w #$0100
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.b #$41
	sta.l $7E45F3
	lda.b #$43
	sta.l $7E45F5
	lda.b #$3A
	sta.l $7E45F7
	rep #$20
	lda.w #$0000
	sta.l RenderHUDFlag
	lda.w #$0040
	sta.l UnknownGSU_034
	lda.w #$0030
	sta.l UnknownGSU_036
	sep #$20
	lda.b #$01
	sta.w Unknown_1F0D
	stz.w Unknown_15BB
	stz.w Unknown_15BB+1
	stz.w Pad1HiCur
	stz.w Pad1HiPrev
	lda.w Unknown_1FDF
	beq Controls_L1
	brl Controls_L5
Controls_L1:
	lda.l Unknown_7EA05A
	beq Controls_L2
	brl Controls_L5
Controls_L2:
	sep #$20
	lda.w Unknown_14D6
	and.b #$1F
	sta.w Unknown_14D6
Controls_L3:
	jsl CODE_02FD84
	rep #$20
	stz.w OAMBufferPtr
	jsl ClearOAMBuffer
	jsr UnkControlsFunc_1FFD54
	sep #$20
	lda.w Pad1Down+1
	bit.b #$20
	beq Controls_NextStyle
	lda.w ControlStyle
	inc
	and.b #$03
	sta.w ControlStyle
	lda.b #$11
	jsl PushSoundEffectToQueue
Controls_NextStyle:
	jsr Controls_SetLayer2Scroll
	rep #$20
	lda.w Unknown_15BB
	cmp.w #$0010
	bcc Controls_L3
	sep #$20
	lda.w Pad1Down+1
	bit.b #$10
	beq Controls_L3
	lda.b #$10
	jsl PushSoundEffectToQueue
Controls_L5:
	sep #$20
	lda.w TIMEUP
	cli
Controls_L6:
	jsl CODE_02FD84
	jsr ControlsOAM
	jsr UnkControlsFunc_1FFD54
	jsr Controls_SetLayer2Scroll
	sep #$20
	lda.w Unknown_14D6
	ora.b #$60
	sta.w Unknown_14D6
	lda.w Pad1Down+1
	bit.b #$20
	beq Controls_L7
	lda.l Unknown_7EA05A
	eor.b #$01
	sta.l Unknown_7EA05A
	lda.b #$11
	jsl PushSoundEffectToQueue
Controls_L7:
	lda.l Unknown_7EA05A
	beq Controls_L8
	lda.w PadDown+1
	bit.b #$08
	beq Controls_L8
	lda.b #$00
	sta.l Unknown_7EA05A
	lda.w #$11
	jsl PushSoundEffectToQueue
Controls_L8:
	lda.l Unknown_7EA05A
	bne Controls_L9
	lda.w Pad1Down+1
	bit.b #$04
	beq Controls_L9
	lda.b #$01
	sta.l Unknown_7EA05A
	lda.b #$11
	jsl PushSoundEffectToQueue
Controls_L9:
	lda.w Pad1Down
	bit.b #$40
	beq Controls_L10
	brl Controls_L2
Controls_L10:
	lda.w Pad1Down+1
	bit.b #$40
	beq Controls_L11
	brl Controls_L2
Controls_L11:
	lda.w Pad1Down
	bit.b #$80
	bne Controls_L12
	lda.w Pad1Down+1
	bit.b #$80
	bne Controls_L12
	lda.w Pad1Down+1
	bit.b #$10
	bne Controls_L12
	brl Controls_L6
Controls_L12:
	sep #$20
	lda.b #$10
	jsl PushSoundEffectToQueue
	lda.b #$F1
	sta.w MusicID
	stz.w MusicLoaded
	lda.b #$FF
	sta.w FadeMode
Controls_L13:
	jsl CODE_02FD84
	jsr ControlsOAM
	jsr UnkControlsFunc_1FFD54
	sep #$20
	lda.w FadeMode
	and.b #$FF
	bne Controls_L13
	stz.w Unknown_1F0D
	lda.l Unknown_7EA05A
	beq Controls_L14
	brl Controls_L20
Controls_L14:
	jsl InitPlayerStateEx				; Init player
	sep #$20
	rep #$10
	lda.b #$0D
	ldx.w #$6DC0
	sta.w LevelScriptBank
	stx.w LevelScriptPointer
	jsl CODE_02E2CC
	sep #$20
	lda.b #$01
	sta.w Lives
	stz.w Unknown_15BB
	stz.w Unknown_15BB+1
Controls_L15:
	jsl CODE_02FD84
	jsl MainLoop
	jsl CODE_03EA26
	rep #$20
	lda.w Unknown_15BB
	cmp.w #$0014
	bcc Controls_L15
	sep #$20
	lda.w Unknown_1FD2
	cmp.b #$0A
	beq Controls_L18
	lda.w Unknown_14D1
	and.b #$08
	beq Controls_L16
	lda.w Unknown_14D7
	bit.b #$80
	bne Controls_L15
Controls_L16:
	lda.w Pad1Down+1
	bit.b #$10
	beq Controls_L15
	sep #$20
	lda.b #$F1
	sta.w MusicID
	stz.w MusicLoaded
	lda.b #$FF
	sta.w FadeMode
Controls_L17:
	jsl CODE_02FD84
	jsl MainLoop
	sep #$20
	lda.w FadeMode
	and.b #$FF
	bne Controls_L17
	jsl InitPlayerStateEx				; Init player
	sep #$20
	lda.b #$01
	sta.l Unknown_7EA05A
	sta.w Unknown_1FDF
	bra Controls_L19
Controls_L18:
	jsl InitPlayerStateEx				; Init player
	sep #$20
	lda.b #$00
	sta.l Unknown_7EA05A
	lda.b #$01
	sta.w Unknown_1FDF
Controls_L19:
	stz.w Unknown_1FD2
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
	lda.l Unknown_7EA05A
	beq ControlsOAM_L1
	ldx.w #$0078
ControlsOAM_L1:
	ldy.w OAMBufferPtr
	ldx.w #$97A8
	sta TempMiscW
ControlsOAM_L2:
	lda.w TempMiscW
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
	lda.w TempMiscW
	clc
	adc.w #$0008
	sta.w TempMiscW
	and.w #$00FF
	cmp.w #$00F8
	bne ControlsOAM_L2
	lda.w TempMiscW
	and.w #$FF00
	clc
	adc.w #$0800
	cmp.w #$C700
	beq.w ControlsOAM_L3
	ora.w #$00A8
	sta.w TempMiscW
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
UnkControlsFunc_1FFD54:
	jsl MainLoop
UnkControlsFunc_1FFD54_Wait:
	lda.b CurNMITask
	bne UnkControlsFunc_1FFD54_Wait
	sep #$20
	rep #$10
	ldx.w $16AB
	cpx.w #$0039
	bne UnkControlsFunc_1FFD54_L2
	lda.b #$28
	sta.w $1FDA
	stz.w $16AB
	stz.w $16AC
UnkControlsFunc_1FFD54_L2:
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
	jsl GetLocalXYZ8RotateRotXNegRotY
	rep #$20
	lda.w Unknown_1FD4
	clc
	adc.b TempVecXG
	sta.w Unknown_1FD4
	lda.w Unknown_1FD6
	clc
	adc.b TempVecYG
	sta.w Unknown_1FD6
	lda.w Unknown_1FD8
	clc
	adc.b TempVecZG
	sta.w Unknown_1FD8
	rts
Controls_SetLayer2Scroll:
	sep #$20
	rep #$20
	lda.w ControlStyle
	cmp.b #$01
	beq Controls_SetLayer2Scroll_StyleB
	cmp.b #$02
	beq Controls_SetLayer2Scroll_StyleC
	cmp.b #$03
	beq Controls_SetLayer2Scroll_StyleD
	rep #$20
	lda.w #$0000
	sta.w Unknown_1F35
	lda.w #$0000
	sta.w Unknown_1F37
	rts
Controls_SetLayer2Scroll_StyleB:
	rep #$20
	lda.w #$0000
	sta.w Unknown_1F35
	lda.w #$0100
	sta.w Unknown_1F37
	rts
Controls_SetLayer2Scroll_StyleC:
	rep #$20
	lda.w #$0100
	sta.w Unknown_1F35
	lda.w #$0000
	sta.w Unknown_1F37
	rts
Controls_SetLayer2Scroll_StyleD:
	rep #$20
	lda.w #$0100
	sta.w Unknown_1F35
	lda.w #$0100
	sta.w Unknown_1F37
	rts
	
;Copying code to RAM
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
