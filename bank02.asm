	;THE FOLLOWING CODE GETS COPIED TO RAM AT $7E3193 (ORIGINALLY AT $028000)
CopiedCodeB:
	BASE $7E3193
CopiedCodeBBase:
RunNMITask:
	ldx.b CurNMITask
	jmp (NMITaskJumpTable,x)
NMITaskJumpTable:
	DW NMITask00_NoNMITask
	DW NMITask02
	DW NMITask04
	DW NMITask06
	DW NMITask08
	DW NMITask0A
	DW NMITask0C
	DW NMITask0E
	DW NMITask10
	DW NMITask12
	DW NMITask14
	DW NMITask16
	DW NMITask18
	DW NMITask1A
	DW NMITask1C
	DW NMITask1E
	DW NMITask20
	DW NMITask22
	DW NMITask24_InitializeMode1
	DW NMITask26_InitializeMode2
NMITask24_InitializeMode1:
	rep #$10
	lda.b #$0A
	sta.w HDMAENMirror
	sta.w HDMAEN
	lda.b #$01
	sta.w BGMODE
	stz.w Unknown_18C2
	lda.b #$13
	sta.w TM
	lda.b #$74
	sta.w BG3SC
	lda.b #$07
	sta.w BG34NBA
	stz.w BG2VOFS
	stz.w BG2VOFS
	stz.w Unknown_18B8
	stz.w Unknown_1F0E
	stz.w Unknown_1F0B
	stz.w Unknown_16A2
	lda.b #$01
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	rep #$20
	lda.w #$8FAA
	sta.w $004F
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0080
	sta.l $7001B0
	stz.w Unknown_1EEB
	stz.w Unknown_1F09
	stz.w VerticalScrollBase2
	lda.w #$0000
	sta.l Unknown_7EA05C
	sep #$20
	stz.w Unknown_1FC6
	stz.w Unknown_1EF1
	stz.w Unknown_1FE4
	stz.b CurNMITask
	rtl
NMITask26_InitializeMode2:
	rep #$10
	lda.b #$0A
	sta.w HDMAENMirror
	sta.w HDMAEN
	lda.b #$02
	sta.w BGMODE
	stz.w Unknown_18C2
	lda.b #$13
	sta.w TM
	stz.w BG3SC
	stz.w BG3HOFS
	stz.w BG3HOFS
	stz.w BG3VOFS
	stz.w BG3VOFS
	lda.b #$2F
	sta.w BG3SC
	lda.b #$E0
	sta.w BG3HOFS
	stz.w BG3VOFS
	stz.w BG2VOFS
	stz.w BG2VOFS
	stz.w Unknown_18B8
	stz.w Unknown_1F0E
	stz.w Unknown_1F0B
	stz.w Unknown_16A2
	lda.b #$01
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	rep #$20
	lda.w #$8FAA
	sta.l $700050
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0080
	sta.l $7001B0
	stz.w Unknown_1EEB
	stz.w Unknown_1F09
	stz.w VerticalScrollBase2
	lda.w #$0000
	sta.l Unknown_7EA05C
	sep #$20
	stz.w Unknown_1FE4
	stz.w Unknown_1FC6
	stz.w Unknown_1EF1
	stz.b CurNMITask
	rtl
NMITask10:
	rep #$10
	lda.b #$22					;\DMA to CGRAM
	sta.w BBAD0					;|
	lda.b #$00					;|
	sta.w CGADD					;|
	ldx.w Unknown_1892				;|
	stx.w A1T0L					;|
	lda.w Unknown_1892+2				;|
	sta.w A1B0					;|
	ldx.w Unknown_1895				;|
	stx.w DAS0L					;|
	stz.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	ldx.w Unknown_188A				;|
	stx.w VMADDL					;|
	ldx.b #$2800					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w Unknown_188C				;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	inc.b CurNMITask
	inc.b CurNMITask
	rtl
NMITask12:
	rep #$10
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	ldx.w Unknown_188E				;|
	stx.w VMADDL					;|
	ldx.w #$4000					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w Unknown_1890				;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	lda.b #$22					;\DMA to CGRAM
	sta.w BBAD0					;|
	lda.b #$70					;|
	sta.w CGADD					;|
	rep #$20					;|
	lda.w #$857E					;|
	sta.w A1T0L					;|
	sep #$20					;|
	lda.b #$7E					;|
	sta.w A1B0					;|
	ldx.w #$0020					;|
	stx.w DAS0L					;|
	stz.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	stz.b CurNMITask
	rtl
NMITask16:
	rep #$10
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	ldx.w Unknown_188A				;|
	stx.w VMADDL					;|
	ldx.w #$2800					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w Unknown_188C				;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	ldx.w Unknown_188E				;|
	stx.w VMADDL					;|
	ldx.w #$4000					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w Unknown_1890				;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	stz.b CurNMITask
	rtl
NMITask14:
	rep #$10
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	ldx.w Unknown_188A				;|
	stx.w VMADDL					;|
	ldx.w #$2800					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w Unknown_188C				;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	stz.b CurNMITask
	rtl
NMITask22:
	lda.w Unknown_1FE5
	bne NMITask22_Not0
	brl NMITask22_L12
NMITask22_Not0:
	dec
	bne NMITask22_Not1
	brl NMITask22_L9
NMITask22_Not1:
	dec
	bne NMITask22_Not2
	brl NMITask22_L8
NMITask22_Not2:
	dec
	bne NMITask22_Not3
	brl NMITask22_L7
NMITask22_Not3:
	rep #$10
	ldx.b $4C
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	stx.w VMADDL					;|
	ldx.w #$2C00					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w #$4000					;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	rep #$20
	lda.w #$0000
	cmp.b BG12NBAMirror
	beq NMITask22_L5
	sta.b BG12NBAMirror
	lda.w #$3000
	sta.b BG12NBAMirror2
	bra NMITask22_L6
NMITask22_L5:
	sta.b BG12NBAMirror2
	lda.w #$3000
	sta.b BG12NBAMirror
NMITask22_L6:
	sep #$20
	lda.b BG12NBAMirror+1
	lsr
	lsr
	lsr
	lsr
	ora.b #$50
	sta.w BG12NBA
	stz.w Unknown_1FE5
	brl NMITask22_L12
NMITask22_L7:
	rep #$10
	ldx.w #$6020
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD7					;|
	stx.w VMADDL					;|
	ldx.w #$4C00					;|
	stx.w A1T7L					;|
	lda.b #$70					;|
	sta.w A1B7					;|
	ldx.w #$1000					;|
	stx.w DAS7L					;|
	lda.b #$01					;|
	sta.w DMAP7					;|
	lda.b #$80					;|
	sta.w MDMAEN					;/
	bra NMITask22_L10
NMITask22_L8:
	rep #$10
	ldx.w #$5820
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD7					;|
	stx.w VMADDL					;|
	ldx.w #$3C00					;|
	stx.w A1T7L					;|
	lda.b #$70					;|
	sta.w A1B7					;|
	ldx.w #$1000					;|
	stx.w DAS7L					;|
	lda.b #$01					;|
	sta.w DMAP7					;|
	lda.b #$80					;|
	sta.w MDMAEN					;/
	bra NMITask22_L10
NMITask22_L9:
	rep #$10
	ldx.w #$5020
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD7					;|
	stx.w VMADDL					;|
	ldx.w #$2C00					;|
	stx.w A1T7L					;|
	lda.b #$70					;|
	sta.w A1B7					;|
	ldx.w #$1000					;|
	stx.w DAS7L					;|
	lda.b #$01					;|
	sta.w DMAP7					;|
	lda.b #$80					;|
	sta.w MDMAEN					;/
	bra NMITask22_L10
NMITask22_L10:
	lda.w Unknown_1FE5
	inc
	cmp.b #$04
	bne NMITask22_L11
	lda.b #$00
NMITask22_L11:
	sta.w Unknown_1FE5
NMITask22_L12:
	lda.l Unknown_7EF0C6
	cmp.b #$FF
	beq NMITask22_L13
	and.b #$1F
	beq NMITask22_L13
	dec
	ora.b #$E0
	sta.w COLDATA
	sta.l Unknown_7EF0C6
NMITask22_L13:
	jsr UpdateMusic
	rtl
NMITask08:
	sep #$20
	lda.b #$01
	sta.b Unknown_FD
	rep #$10
	lda.b #$04					;\DMA to OAM
	sta.w BBAD0					;|
	ldx.w #$0000					;|
	stx.w OAMADDL					;|
	ldx.w #OAMBuffer				;|
	stx.w A1T0L					;|
	lda.b #BANKOF(OAMBuffer)			;|
	sta.w A1B0					;|
	ldx.w #$0070					;|
	stx.w DAS0L					;|
	lda.b #$00					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	lda.w Unknown_1FE5
	bne NMITask08_L1
	brl NMITask08_L8
NMITask08_L1:
	dec
	bne NMITask08_L2
	brl NMITask08_L4
NMITask08_L2:
	dec
	beq NMITask08_L5
	dec
	bne NMITask08_L3
	brl NMITask08_L6
NMITask08_L3:
	rep #$20
	lda.b BG12NBAMirror2
	clc
	adc.w #$1800
	tax
	sep #$20
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	stx.w VMADDL					;|
	ldx.w #$5C00					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w #$1000					;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	brl NMITask08_L7
NMITask08_L4:
	sep #$20
	rep #$10
	ldx.b BG12NBAMirror2
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	stx.w VMADDL					;|
	ldx.w #$2C00					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w #$1000					;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	bra NMITask08_L7
NMITask08_L5:
	rep #$20
	lda.b BG12NBAMirror2
	clc
	adc.w #$0800
	tax
	sep #$20
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	stx.w VMADDL					;|
	ldx.w #$3C00					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w #$1000					;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	bra NMITask08_L7
NMITask08_L6:
	rep #$20
	lda.b BG12NBAMirror2
	clc
	adc.w #$1000
	tax
	sep #$20
	lda.b #$80
	sta.w VMAIN
	lda.b #$18					;\DMA to VRAM
	sta.w BBAD0					;|
	ldx.w #$4C00					;|
	stx.w A1T0L					;|
	lda.b #$70					;|
	sta.w A1B0					;|
	ldx.w #$1000					;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
NMITask08_L7:
	lda.w Unknown_1FE5
	inc
	sta.w Unknown_1FE5
	cmp.b #$05
	bne NMITask08_L8
	stz.w Unknown_1FE5
NMITask08_L8:
	lda.w TempVecZL
	pha
	ldx.w #$0010
	lda.w Unknown_34
	bit.b #$01
	beq NMITask08_L8B
	clc
	adc.b #$40
	sta.w Unknown_34
	rol
	bcc NMITask08_L8B
	rep #$20
	stz.w OAMBuffer+$00,x
	stz.w OAMBuffer+$04,x
	stz.w OAMBuffer+$08,x
	stz.w OAMBuffer+$0C,x
	stz.w OAMBuffer+$02,x
	stz.w OAMBuffer+$06,x
	stz.w OAMBuffer+$0A,x
	stz.w OAMBuffer+$0E,x
	sep #$20
	brl NMITask08_L19
NMITask08_L8B:
	lda.w Unknown_32+1
	cmp.w Unknown_38+1
	bmi NMITask08_L13
	lda.w Unknown_32
	sec
	sbc.w Unknown_38
	beq NMITask08_L12
	bcc NMITask08_L10
	sta.w TempVecZL
	lda.w Unknown_32+1
	sec
	sbc.w Unknown_38+1
	beq NMITask08_L9
	cmp.w TempVecZL
	bne NMITask08_L12
NMITask08_L9:
	dec.w Unknown_32
	bra NMITask08_L12
NMITask08_L10:
	sta.w TempVecZL
	lda.w Unknown_38+1
	sec
	sbc.w Unknown_32+1
	beq NMITask08_L11
	cmp.w TempVecZL
	bne NMITask08_L12
NMITask08_L11:
	inc.w Unknown_32
NMITask08_L12:
	lda.w Unknown_32+1
	cmp.w Unknown_38+1
	beq NMITask08_L15
	bpl NMITask08_L14
NMITask08_L13:
	inc.w Unknown_32+1
	lda.w Unknown_32
	cmp.w Unknown_38
	beq NMITask08_L15
	inc.w Unknown_32+1
	bra NMITask08_L15
NMITask08_L14:
	dec.w Unknown_32+1
NMITask08_L15:
	lda.w Unknown_32
	clc
	adc.b #$08
	sta.w OAMBuffer+$00,x
	sta.w OAMBuffer+$08,x
	clc
	adc.b #$08
	sta.w OAMBuffer+$04,x
	sta.w OAMBuffer+$0C,x
	lda.w $0033
	clc
	adc.b #$08
	sta.w OAMBuffer+$02,x
	sta.w OAMBuffer+$06,x
	clc
	adc.b #$08
	sta.w OAMBuffer+$0A,x
	sta.w OAMBuffer+$0E,x
	lda.w Unknown_36
	beq NMITask08_L16
	dec
	beq NMITask08_L17
	lda.b #$0D
	bra NMITask08_L18
NMITask08_L16:
	lda.b #$09
	bra NMITask08_L18
NMITask08_L17:
	lda.b #$05
NMITask08_L18:
	sta.w OAMBuffer+$02,x
	inc
	sta.w OAMBuffer+$06,x
	inc
	sta.w OAMBuffer+$0A,x
	inc
	sta.w OAMBuffer+$0E,x
	lda.b #$3E
	sta.w OAMBuffer+$03,x
	sta.w OAMBuffer+$07,x
	sta.w OAMBuffer+$0B,x
	sta.w OAMBuffer+$0F,x
NMITask08_L19:
	lda.w Unused_16ED
	bne NMITask08_L20
	brl NMITask08_L24
NMITask08_L20:
	ldx.w #$0000
	lda.w Unknown_16E4
	sec
	sbc.b #$0F
	sta.w OAMBuffer+$00,x
	sta.w OAMBuffer+$04,x
	clc
	adc.b #$08
	sta.w OAMBuffer+$08,x
	sta.w OAMBuffer+$0C,x
	lda.w $16E6
	sta.w OAMBuffer+$01,x
	sta.w OAMBuffer+$09,x
	clc
	adc.b #$08
	sta.w OAMBuffer+$05,x
	sta.w OAMBuffer+$0D,x
	lda.w OAMBuffer+$02,x
	cmp.b #$11
	bne NMITask08_L21
	lda.b #$15
	bra NMITask08_L22
NMITask08_L21:
	lda.b #$11
NMITask08_L22:
	sta.w OAMBuffer+$02,x
	inc
	sta.w OAMBuffer+$0A,x
	inc
	sta.w OAMBuffer+$06,x
	inc
	sta.w OAMBuffer+$0E,x
	lda.b #$1E
	sta.w OAMBuffer+$03,x
	sta.w OAMBuffer+$07,x
	sta.w OAMBuffer+$0B,x
	sta.w OAMBuffer+$0F,x
	dec.w Unknown_16E4
	dec.w Unknown_16E4
	inc.w Unknown_16E6
	inc.w Unknown_16E6
	lda.w Unknown_16E4
	cmp.b #$12
	bcc NMITask08_L23
	lda.w Unknown_16E6
	cmp.b #$E0
	bcs NMITask08_L23
	brl NMITask08_L30
NMITask08_L23:
	stz.w Unused_16ED
	lda.b #$1E
	sta.w Unknown_16EA+1
	brl NMITask08_L30
NMITask08_L24:
	rep #$20
	lda.b TempVecXG
	pha
	lda.b TempVecZG
	pha
	lda.b TempVecXL
	pha
	lda.w TempVecZL
	pha
	sep #$20
	stz.b TempVecXG
	lda.b #$7D
	sta.b TempVecZG
	lda.w Unknown_16EA+1
	jsr CODE_7E579D
	rep #$20
	lda.b $04
	bit.w #$0080
	beq NMITask08_L25
	ora.w #$FF00
	bra NMITask08_L26
NMITask08_L25:
	and.w #$00FF
NMITask08_L26:
	clc
	adc.w #$0080
	sta.w Unknown_16E4
	lda.w TempVecZL
	bit.w #$0080
	beq NMITask08_L27
	ora.w #$FF00
	bra NMITask08_L28
NMITask08_L27:
	and.w #$00FF
NMITask08_L28:
	clc
	adc.w #$0064
	sta.w Unknown_16E6
	lda.w #$00C8
	sta.w Unknown_16E8
	lda.w Unknown_16EA
	clc
	adc.w #$0010
	sta.w Unknown_16EA
	sep #$20
	lda.w Unknown_16EA+1
	cmp.b #$A0
	bne NMITask08_L29
	lda.b #$01
	sta.w Unused_16ED
	lda.b #$FF
	sta.w Unknown_16E4
	lda.b #$00
	sta.w Unknown_16E6
	stz.w Unknown_16E4+1
	stz.w Unknown_16E6+1
NMITask08_L29:
	rep #$20
	pla
	sta.w TempVecZL
	pla
	sta.b TempVecXL
	pla
	sta.b TempVecZG
	pla
	sta.b TempVecXG
	sep #$20
NMITask08_L30:
	pla
	sta.w TempVecZL
	jsr UpdateMusic
	rtl
NMITask0A:
	rep #$10
	lda.b #$0C
	sta.b CurNMITask
	brl NMITask02_L1
NMITask0C:
	rep #$10
	lda.b #$0E
	sta.b CurNMITask
	brl CODE_7E3B57
NMITask0E:
	rep #$10
NMITask0E_L1:
	sep #$20
	lda.w SLHV
	lda.w OPHCT
	xba
	lda.w OPHCT
	xba
	rep #$20
	and.w #$01FF
	cmp.w #$0032
	bcc NMITask0E_L1
	cmp.w #$0046
	bcs NMITask0E_L1
	sep #$20
	lda.b #$04
	sta.w BBAD0
	ldx.w #$0000
	stx.w OAMADDL
	ldx.w #OAMBuffer
	stx.w A1T0L
	lda.b #BANKOF(OAMBuffer)
	sta.w A1B0
	ldx.w #$012C
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	stz.b CurNMITask
	lda.b $4B
	lsr
	lsr
	lsr
	lsr
	ora.b #$50
	sta.w BG12NBA
	ldx.b $4A
	ldy.b $4C
	stx.b $4C
	sty.b $4A
	lda.b #$80
	sta.w VMAIN
	rep #$20
	lda.w #$731D
	sta.w VMADDL
	lda.w $1898
	clc
	adc.w #$3528
	sta.w VMDATA
	rep #$20
	lda.w JOY1L
	pha
	eor.w Pad1HiPrev
	and.w JOY1L
	sta.w Pad1Down
	lda.w JOY2L
	pha
	eor.w Pad2HiPrev
	and.w JOY2L
	sta.w Pad2Down
	pla
	sta.w Pad2HiPrev
	pla
	sta.w Pad1HiPrev
	sep #$20
	jsr UpdateMusic
	rtl
NMITask18:
	rep #$10
NMITask18_L1:
	sep #$20
	lda.w SLHV
	lda.w OPHCT
	xba
	lda.w OPHCT
	xba
	rep #$20
	and.w #$01FF
	cmp.w #$0032
	bcc NMITask18_L1
	cmp.w #$0046
	bcs NMITask18_L1
	sep #$20
	lda.b #$04
	sta.w BBAD0
	ldx.w #$0000
	stx.w OAMADDL
	ldx.w #OAMBuffer
	stx.w A1T0L
	lda.b #BANKOF(OAMBuffer)
	sta.w A1B0
	ldx.w #$0148
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.b #$13
	sta.w TM
	stz.b CurNMITask
	lda.b BG12NBAMirror+1
	lsr
	lsr
	lsr
	lsr
	ora.b #$50
	sta.w BG12NBA
	ldx.b BG12NBAMirror
	ldy.b BG12NBAMirror2
	stx.b BG12NBAMirror2
	sty.b BG12NBAMirror
	sep #$20
	lda.w Unknown_1F35
	sta.w BG2VOFS
	lda.w Unknown_1F35+1
	sta.w BG2VOFS
	lda.w Unknown_1F37
	sta.w BG2HOFS
	lda.w Unknown_1F37+1
	sta.w BG2HOFS
	stz.w CGADSUB
	stz.w COLDATA
	stz.w WH0
	stz.w WH1
	jsr CODE_7E3E35
	rep #$20
	lda.w Unknown_1FDA
	and.w #$00FF
	beq NMITask18_L5
	lda.w Unknown_15BB
	and.w #$0001
	bne NMITask18_L2
	stz.w Unknown_16C7
	bra NMITask18_L4
NMITask18_L2:
	lda.w Unknown_1FDA
	and.w #$00FF
	cmp.w #$001F
	beq NMITask18_L3
	bcc NMITask18_L3
	lda.w #$001F
NMITask18_L3:
	sta.w Unknown_16C7
	asl
	asl
	asl
	asl
	asl
	sta.w Unknown_1FDB
	asl
	asl
	asl
	asl
	asl
	ora.w Unknown_1FDB
	ora.w Unknown_16C7
	sta.w Unknown_16C7
NMITask18_L4:
	sep #$20
	lda.b #$03
	sta.w CGADD
	lda.b Unknown_16C7
	sta.w CGDATA
	lda.b Unknown_16C7+1
	sta.w CGDATA
	dec.b Unknown_1FDA
NMITask18_L5:
	rep #$20
	lda.w JOY1L
	eor.w Pad1Prev
	and.w JOY1L
	sta.w Pad1Down
	lda.w JOY1L
	sta.w Pad1Prev
	sep #$20
	jsr CODE_7E3DAB
	jsr UpdateMusic
	rtl
NMITask20:
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	lda.b #$01
	sta.w $18AC
	jsr UpdateMusic
	rtl
NMITask1A:
	rep #$10
	lda.b #$1C
	sta.b CurNMITask
	ldx.b $4A
	lda.w SCMRMirror
	and.b #$F7
	sta.w SCMR
	lda.b #$80
	sta.w VMAIN
	lda.b #$18
	sta.w BBAD0
	stx.w VMADDL
	ldx.w #$2C00
	sta.w A1T0L
	lda.b #$70
	sta.w A1B0
	ldx.w #$2A00
	stx.w DAS0L
	lda.b #$01
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.w SCMRMirror
	ora.b #$08
	sta.w SCMR
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	lda.b #$01
	sta.w Unknown_18BB
	jsr UpdateMusic
	rtl
NMITask1C:
	rep #$10
	lda.b #$1E
	sta.b CurNMITask
	rep #$20
	lda.b $4A
	clc
	adc.w #$1500
	tax
	sep #$20
	lda.w SCMRMirror
	and.b #$F7
	sta.w SCMR
	lda.b #$80
	sta.w VMAIN
	lda.b #$18
	sta.w BBAD0
	stx.w VMADDL
	ldx.w #$5600
	stx.w A1T0L
	lda.b #$70
	sta.w A1B0
	ldx.w #$2A00
	stx.w DAS0:
	lda.b #$01
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.w SCMRMirror
	ora.b #$08
	sta.w SCMR
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	lda.b #$02
	sta.w Unknown_18BB
	lda.b $45
	lsr
	lsr
	sta.w SCBR
	jsr UpdateMusic
	rtl
NMITask1E:
	lda.w $1F10
	bne NMITask1E_L1
	rtl
NMITask1E_L1:
	rep #$10
	lda.b BG12NBAMirror+1
	lsr
	lsr
	lsr
	lsr
	ora.b #$50
	sta.w BG12NBA
	ldx.b BG12NBAMirror
	ldy.b BG12NBAMirror2
	stx.b BG12NBAMirror2
	sty.b BG12NBAMirror
	jsr CODE_7E3FA3
	jsr CODE_7E414B
	sep #$20
	rep #$10
	jsr CODE_7E409F
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	rep #$20
	lda.w JOY1L
	pha
	eor.w Pad1HiPrev
	and.w JOY1L
	sta.w Pad1Down
	lda.w JOY2L
	pha
	eor.w Pad2HiPrev
	and.w JOY2L
	sta.w Pad2Down
	pla
	sta.w Pad2HiPrev
	pla
	sta.w Pad1HiPrev
	sep #$20
	jsr UpdateMusic
	lda.b #$20
	sta.b CurNMITask
	rtl
NMITask00_NoNMITask:
	lda.b #$01
	sta.w Unknown_18AC
	jsr UpdateMusic
	rtl
NMITask02:
	rep #$10
	lda.b #$04
	sta.b CurNMITask
NMITask02_L1:
	ldx.b $4A
	lda.w SCMRMirror
	and.b #$F7
	sta.w SCMR
	lda.b #$80
	sta.w VMAIN
	lda.b #$18
	sta.w BBAD0
	stx.w VMADDL
	ldx.w #$2C00
	sta.w A1T0L
	lda.b #$70
	sta.w A1B0
	ldx.w #$2A00
	stx.w DAS0L
	lda.b #$01
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.w SCMRMirror
	ora.b #$08
	sta.w SCMR
	lda.b #$01
	sta.w Unknown_18BB
	jsr UpdateMusic
	rtl
NMITask04:
	rep #$10
	lda.w Unknown_1F0D
	beq NMITask04_L1
	lda.b #$18
	sta.b CurNMITask
	bra NMITask04_L2
NMITask04_L1:
	lda.b #$06
	sta.b CurNMITask
NMITask04_L2:
	rep #$20
	lda.b BG12NBAMirror
	clc
	adc.w #$1500
	tax
	sep #$20
	lda.w SCMRMirror
	and.b #$F7
	sta.w SCMR
	lda.b #$80
	sta.w VMAIN
	lda.b #$18
	sta.w BBAD0
	stx.w VMADDL
	ldx.w #$5600
	stx.w A1T0L
	lda.b #$70
	sta.w A1B0
	ldx.w #$2A00
	stx.w DAS0L
	lda.b #$01
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.w SCMRMirror
	ora.b #$08
	sta.w SCMR
	lda.b #$02
	sta.w Unknown_18BB
	lda.b SCBRMirror+1
	lsr
	lsr
	sta.w SCBR
	jsr UpdateMusic
	rtl
NMITask06:
	lda.w Unknown_1F10
	bne NMITask06_L1
	rtl
NMITask06_L1:
	rep #$10
NMITask06_L2:
	sep #$20
	lda.w SLHV
	lda.w OPHCT
	xba
	lda.w OPHCT
	xba
	rep #$20
	and.w #$01FF
	cmp.w #$0032
	bcc NMITask06_L2
	cmp.w #$0046
	bcs NMITask06_L2
	sep #$20
	lda.b #$04
	sta.w BBAD0
	ldx.w #$0000
	stx.w OAMADDL
	ldx.w #OAMBuffer
	stx.w A1T0L
	lda.b #BANKOF(OAMBuffer)
	sta.w A1B0
	ldx.w #$0148
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.b #$80
	sta.w VMAIN
	lda.b #$18
	sta.w BBAD0
	ldx.w #$2FA0
	sta.w VMADDL
	ldx.w #$18CD
	stx.w A1T0L
	lda.b #$00
	sta.w A1B0
	ldx.w #$0040
	stx.w DAS0L
	lda.b #$01
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.b #$22
	sta.w BBAD0
	lda.b #$00
	sta.w CGADD
	ldx.w #PaletteBuffer
	stx.w A1T0L
	lda.b #BANKOF(PaletteBuffer)
	sta.w A1B0
	ldx.w #$0100
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.w Unknown_1F0E
	beq NMITask06_L3
	jsr CODE_7E408B
	cmp.b #$33
	bcs NMITask06_L3
	lda.b #$22
	sta.w BBAD0
	lda.b #$00
	sta.w CGADD
	ldx.w #$8A4D
	stx.w A1T0L
	lda.b #$7E
	sta.w A1B0
	ldx.w #$0040
	sta.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
NMITask06_L3:
	lda.w Unknown_1F0B
	beq NMITask06_L4
	jsr CODE_7E408B
	cmp.b #$05
	bcs NMITask06_L4
	lda.b #$22
	sta.w BBAD0
	lda.b #$50
	sta.w CGADD
	ldx.w #$8AC9
	stx.w A1T0L
	lda.b #$7E
	sta.w A1B0
	ldx.w #$0020
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
NMITask06_L4:
	lda.b #$24
	sta.w CGADD
	lda.w Unknown_16CD
	beq NMITask06_L5
	lda.b #$E0
	sta.w CGDATA
	lda.b #$7E
	sta.w CGDATA
	bra NMITask06_L6
NMITask06_L5:
	lda.b #$1F
	sta.w CGDATA
	stz.w CGDATA
NMITask06_L6:
	lda.w Unknown_18B8
	beq NMITask06_L7
	lda.w BG3HOFSMirror
	sta BG3HOFS
	lda.w BG3HOFSMirror+1
	sta BG3HOFS
NMITask06_L7:
	ldx.w Unknown_18B4
	ldy.w Unknown_18B6
	stx.w Unknown_18B6
	sty.w Unknown_18B4
	sty.w A1T2L
	jsr CODE_7E414B
	jsr CODE_7E3D36
	lda.b BG12NBAMirror+1
	lsr
	lsr
	lsr
	lsr
	ora.b #$50
	sta.w BG12NBA
	jsr CODE_7E409F
	jsr UpdateMusic
	rep #$20
	lda.w JOY1L
	eor.w Pad1HiPrev
	and.w JOY1L
	sta.w Pad1Down
	jsr CODE_7E3E35
	sep #$20
	lda.w Pad2HiCur
	sta.w Pad2HiPrev
	lda.w Pad2LoCur
	sta.w Pad2LoPrev
	lda.w JOY2L
	sta.w Pad2LoCur
	lda.w JOY2H
	sta.w Pad2HiCur
	jsr CODE_7E3DAB
	ldx.b BG12NBAMirror
	ldy.b BG12NBAMirror2
	stx.b BG12NBAMirror2
	sty.b BG12NBAMirror
	stz.b CurNMITask
	rts
CODE_7E3D36:
	sep #$20
	lda.w Unknown_1FDD
	beq CODE_7E3D56
	lda.w Unknown_1F35
	sta.w BG2VOFS
	lda.w Unknown_1F35+1
	sta.w BG2VOFS
	lda.w Unknown_1F37
	sta.w BG2HOFS
	lda.w Unknown_1F37+1
	sta.w BG2HOFS
	rts
CODE_7E3D56:
	lda.w EngineSoundFlag
	beq CODE_7E3DAA
	rep #$20
	lda.w Unknown_16C5
	lsr
	lsr
	and.w #$003E
	tax
	lda.l UnkData_7E8A0D,x
	tay
	sep #$20
	phb						; Save data bank
	lda.b #$7E					;\Set data bank to $7E
	pha						;|
	plb						;/
	ldx.w #$0000
CODE_7E3D75:
	lda.w $0000,y
	bpl CODE_7E3D90
	and.b #$7F
	sta.l DATA_7E4169+$A91,x
	inx
	lda.b #$18
	sta.l DATA_7E4169+$A91,x
	inx
	lda.b #$01
	sta.l DATA_7E4169+$A91,x
	bra CODE_7E3DA2
CODE_7E3D90:
	sta.l DATA_7E4169+$A91,x
	inx
	lda.b #$18
	sta.l DATA_7E4169+$A91,x
	inx
	lda.b #$00
	sta.l DATA_7E4169+$A91,x
CODE_7E3DA2:
	inx
	iny
	cpx.w #$02A0
	bne CODE_7E3D75
	plb						; Restore data bank
	rts
CODE_7E3DAB:
	lda.w FadeMode
	bne CODE_7E3DB3
	brl CODE_7E3E34
CODE_7E3DB3:
	bpl CODE_7E3DFE
	cmp.b #$FE
	beq CODE_7E3DF4
	cmp.b #$FD
	beq CODE_7E3DEC
	lda.w FadeTimer
	beq CODE_7E3DD6
	dec
	beq CODE_7E3DD6
	sta.l DATA_7E4169+$48B
	sta.l DATA_7E4169+$48D
	sta.l DATA_7E4169+$48F
	sta.w FadeTimer
	bra CODE_7E3E34
CODE_7E3DD6:
	lda.b #$80
	sta.l DATA_7E4169+$48B
	sta.l DATA_7E4169+$48D
	sta.l DATA_7E4169+$48F
	stz.w FadeMode
	stz.w FadeTimer
	bra CODE_7E3E34
CODE_7E3DEC:
	lda.w Unknown_15BB
	and.b #$01
	beq CODE_7E3DBD
	rts
CODE_7E3DFE:
	cmp.b #$02
	beq CODE_7E3E25
	lda.w FadeTimer
CODE_7E3E05:
	cmp.b #$0F
	beq CODE_7E3E1B
	inc
	sta.l $7E45F4
	sta.l $7E45F6
	sta.l $7E45F8
	sta.w FadeTimer
	bra CODE_7E3E34
CODE_7E3E1B:
	stz.w FadeMode
	lda.b #$0F
	sta.w FadeTimer
	bra CODE_7E3E34
CODE_7E3E25:
	lda.w FadeTimer
	cmp.b #$0F
	beq CODE_7E3E1B
	inc
	cmp.b #$0F
	beq CODE_7E3E1B
	inc
	bra CODE_7E3E05
CODE_7E3E34:
	rts
EncodeControlStyleInput:
	sep #$20
	lda.w Pad1HiCur
	sta.w Pad1HiPrev
	lda.w Pad1LoCur
	sta.w Pad1LoPrev
	lda.w ControlStyle
	and.b #$03
	asl
	xba
	lda.b #$00
	xba
	tax
	jmp (ControlStyleInputEncoderFuncTable,x)
ControlStyleInputEncoderFuncTable:
	DW EncodeControlStyleInput_StyleA
	DW EncodeControlStyleInput_StyleB
	DW EncodeControlStyleInput_StyleC
	DW EncodeControlStyleInput_StyleD
EncodeControlStyleInput_StyleA:
	lda.w JOY1L
	sta.w Pad1LoCur
	lda.w JOY1H
	sta.w Pad1HiCur
	rts
EncodeControlStyleInput_StyleB:
	lda.w JOY1L
	sta.w Pad1LoCur
	lda.w JOY1H
	and.b #$C0
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	xba
	lda.b #$00
	xba
	tax
	lda.w JOY1H
	and.b #$3F
	ora.l ControlButtonFlipBYTable,x
	sta.w Pad1HiCur
	rts
EncodeControlStyleInput_StyleC:
	lda.w JOY1L
	sta.w Pad1LoCur
	lda.w JOY1H
	and.b #$0C
	lsr
	lsr
	xba
	lda.b #$00
	xba
	tax
	lda.l ControlButtonFlipUDTable,x
	sta.w Unknown_16C7
	lda.w JOY1H
	and.b #$F3
	ora.w Unknown_16C7
	sta.w Pad1HiCur
	rts
EncodeControlStyleInput_StyleD:
	lda.w JOY1L
	sta.w Pad1LoCur
	lda.w JOY1H
	and.b #$0C
	lsr
	lsr
	xba
	lda.b #$00
	xba
	tax
	lda.l ControlButtonFlipUDTable,x
	sta.w Unknown_16C7
	lda.w JOY1H
	and.b #$33
	ora.w Unknown_16C7
	pha
	lda.w JOY1H
	and.b #$C0
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	xba
	lda.b #$00
	xba
	tax
	lda.l ControlButtonFlipBYTable,x
	sta.w Unknown_16C7
	pla
	ora.w Unknown_16C7
	sta.w Pad1HiCur
	rts
ControlButtonFlipBYTable:
	DB $00,$80,$40,$C0
ControlButtonFlipUDTable:
	DB $00,$08,$04,$0C
UnkFunc_7E3EF7:
	php
	sep #$20
	lda.w Unknown_1F2F
	sta.w BG1HOFS
	lda.w Unknown_1F2F+1
	sta.w BG1HOFS
	lda.w Unknown_1F2D
	sta.w BG1VOFS
	lda.w Unknown_1F2D+1
	sta.w BG1VOFS
	lda.w Unknown_1F2B
	sta.w BG2HOFS
	lda.w Unknown_1F2B+1
	sta.w BG2HOFS
	lda.w Unknown_1F29
	sta.w BG2VOFS
	lda.w Unknown_1F29+1
	sta.w BG2VOFS
	lda.w Unknown_1F27
	sta.w BG3HOFS
	lda.w Unknown_1F27+1
	sta.w BG3HOFS
	lda.w Unknown_1F25
	sta.w BG3VOFS
	lda.w Unknown_1F25+1
	sta.w BG3VOFS
	rep #$30
	lda.w Unknown_1F2F
	ldx.w Unknown_1F3B
	ldy.w #$0002
	jsr CODE_7E4009
	sta.w Unknown_1F2F
	lda.w Unknown_1F2D
	ldx.w Unknown_1F39
	ldy.w #$0001
	jsr CODE_7E4009
	sta.w Unknown_1F2D
	lda.w Unknown_1F2B
	ldx.w Unknown_1F37
	ldy.w #$0002
	jsr CODE_7E4009
	sta.w Unknown_1F2B
	lda.w Unknown_1F29
	ldx.w Unknown_1F35
	ldy.w #$0001
	jsr CODE_7E4009
	sta.w Unknown_1F29
	lda.w Unknown_1F27
	ldx.w Unknown_1F33
	ldy.w #$0004
	jsr CODE_7E4009
	sta.w Unknown_1F27
	lda.w Unknown_1F25
	ldx.w Unknown_1F31
	ldy.w #$0002
	jsr CODE_7E4009
	sta.w Unknown_1F25
	plp
	rts
UnkFunc_7E3FA0:
	php
	plp
	rts
CODE_7E3FA3:
	php
	sep #$20
	rep #$10
	lda.w $1F13
	bit.b #$10
	bne CODE_7E3FB1
	plp
	rts
CODE_7E3FB1:
	ldx.w $1F1D
	ldy.w $1F1F
	sty.w VMADDL
	lda.l CreditsBossPrevTextBuf,x
	inx
	cmp.b #$00
	beq CODE_7E3FFF
	cmp.b #$01
	bne CODE_7E3FDB
	rep #$20
	lda.l CreditsBossPrevTextBuf,x
	inx
	inx
	clc
	adc.w #$7000
	sta.w VMADDL
	tay
	sep #$20
	bra CODE_7E3FBA
CODE_7E3FDB:
	rep #$20
	and.w #$00FF
	phx
	tax
	lda.l CreditsBossPreviewFont-$20,x
	and.w #$00FF
	plx
	ora.w #$2000
	clc
	adc.w #$0100
	sta.w VMDATAL
	sep #$20
	iny
	sty.w $1F1F
	stx.w $1F1D
	plp
	rts
CODE_7E3FFF:
	lda.w CurLoaderTasks
	and.b #$EF
	sta.w CurLoaderTasks
	plp
	rts
CODE_7E4009:
	stx.w $16C7
	cmp.w $16C7
	sty.w $16C7
	beq CODE_7E4020
	bmi CODE_7E401C
	sec
	sbc.w $16C7
	bra CODE_7E4020
CODE_7E401C:
	clc
	adc.w $16C7
CODE_7E4020:
	rts
UpdateMusic:
	php
	sep #$30
	lda.w MusicLoaded
	beq UpdateMusic_Load
	dec
	beq UpdateMusic_L2
	bra UpdateMusic_L3
UpdateMusic_Load:
	lda.w MusicID
	sta.w APUIO0
	inc.w MusicLoaded
	bra UpdateMusic_L3
UpdateMusic_L2:
	lda.w APUIO0
	cmp.w MusicID
	bne UpdateMusic_Load
	stz.w APUIO0
	inc.w MusicLoaded
UpdateMusic_L3:
	lda.w $1F51
	beq UpdateMusic_L4
	cmp.w APUIO3
	bne UpdateMusic_L6
	stz.w $1F51
	stz.w APUIO3
UpdateMusic_L4:
	lda.w $1F52
	bne UpdateMusic_L7
	lda.w SEQueuePtrOld
	cpx.w SEQueuePtr
	beq UpdateMusic_NoSE
	lda.w SoundEffectQueue,x
	sta.w APUIO3
	sta.w $1F51
	lda.w SEQueuePtrOld
	inc
	and.b #$0F
	sta.w SEQueuePtrOld
UpdateMusic_NoSE:
	plp
	rts
UpdateMusic_L6:
	plp
	rts
UpdateMusic_L7:
	sta.w APUIO3
	sta.w $1F51
	stz.w SEQueuePtr
	stz.w SEQueuePtrOld
	stz.w $1F52
	plp
	rts
CODE_7E408B:
	lda.b $EF
	clc
	sbc.b $F0
	sta.b $F0
	sbc.b $F1
	sta.b $F1
	sbc.b $F2
	sta.b $F2
	sbc.b $EF
	sta.b $EF
	rts
CODE_7E409F:
	ldx.w $16A7
	beq CODE_7E40FD
	cpx.w #$1481
	beq CODE_7E4123
	lda.b $06,x
	sta.w CGADSUB
	lda.b $00,x
	beq CODE_7E40B7
	sta.w COLDATA
	bra CODE_7E40D2
CODE_7E40B7:
	lda.b $01,x
	and.b #$1F
	ora.b #$20
	sta.w COLDATA
	lda.b $02,x
	and.b #$1F
	ora.b #$40
	sta.w COLDATA
	lda.b $03,x
	and.b #$1F
	ora.b #$80
	sta.w COLDATA
CODE_7E40D2:
	lda.b $04,x
	sta.w TS
	lda.b $05,x
	bit.b #$30
	bne CODE_7E40F3
	ora.b #$10
	sta.w CGWSEL
	lda.b #$80
	sta.w WOBJSEL
	lda.b #$10
	sta.w WH2
	lda.b #$F0
	sta.w WH3
	bra CODE_7E4111
CODE_7E40F3:
	sta.w CGWSEL
	lda.b #$20
	sta.w WOBJSEL
	bra CODE_7E4111
CODE_7E40FD:
	lda.b #$02
	sta.w CGWSEL
	lda.b #$50
	sta.w CGADSUB
	lda.b #$E0
	sta.w COLDATA
	lda.b #$07
	sta.w TS
CODE_7E4111:
	stz.w W12SEL
	stz.w W34SEL
	stz.w WBGLOG
	lda.b #$0C
	sta.w WOBJLOG
	stz.w TMW
	rts
CODE_7E4123:
	lda.b #$BB
	sta.w W12SEL
	lda.b #$BB
	sta.w W34SEL
	lda.b #$0B
	sta.w WOBJSEL
	lda.b $06,x
	sta.w WBGLOG
	and.b #$03
	sta.w WOBJLOG
	lda.b #$1F
	sta.w TMW
	stz.w CGADD
	stz.w CGDATA
	stz.w CGDATA
	rts
CODE_7E414B:
	php
	rep #$20
	ldx.w $18A5
	lda.w $18A7
	stx.w $18A7
	sta.w $18A5
	sta.w A1T3L
	sep #$20
	lda.w $18A9
	eor.b #$01
	sta.w $18A9
	plp
	rts
	
UnkData_7E4169:
	DB $0F
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$00
UnkData_7E43AD:
	DB $0F
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$01,$00,$FF,$01,$00,$FF,$01
	DB $00,$FF,$00
UnkData_7E45F1:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
RunSuperFXRoutine:
	sta.w PBR
	phb
	lda.b #$00
	pha
	plb
	lda.w SCMRMirror
	ora.b #$18
	sta.w SCMR
	stx.w R15
RunSuperFXRoutine_L1:
	lda.w SFR
	and.b #$20
	bne RunSuperFXRoutine_L1
	lda.w SCMRMirror
	sta.w SCMR
	plb
	rtl
CODE_7E4F0C:
	jml CODE_1FBDEE
RenderSuperFXObjects:
	rep #$30
	lda.w Unknown_14C3
	sta.l $702B22
	lda.w Unknown_1F09
	sta.l $701A2A
	sep #$20
	lda.b #BANKOF(RenderObjects)
	ldx.w #RenderObjects
	sta.w PBR
	lda.w SCMRMirror
	ora.b #$18
	sta.w SCMR
	stx.w R15
	jsr CODE_7E4F4C
	sep #$20
RenderSuperFXObjects_L1:
	lda SFR
	and.b #$20
	bne RenderSuperFXObjects_L1
	lda.w SCMRMirror
	sta.w SCMR
	jsl CODE_02F4FF
	rtl
CODE_7E4F4C:
	jsl CODE_7E4F55
	rts
CODE_7E4F51:
	jsr CODE_7E4FAD
	rtl
CODE_7E4F55:
	phb
	php
	sep #$20
	rep #$10
	ldx.w $121D
CODE_7E4F5E:
	lda.b $1D,x
	and.b #$80
	beq CODE_7E4F68
	jml CODE_7E4F6E
CODE_7E4F68:
	lda.b #$01
	sta.b $2D,x
	bra CODE_7E4F74
CODE_7E4F6E:
	lda.b $1E,x
	ora.b #$02
	sta.b $1E,x
	lda.b $1D,x
	and.b #$7F
	sta.b $1D,x
	rep #$20
	lda.b #$00
	sta.b $1B,x
	sep #$20
	txy
	ldx.b $00,y
	bne CODE_7E4F5E
	sep #$20
	lda.b #$7E
	pha
	plb
	lda.w $1EFB
	beq CODE_7E4FAA
	ldx.w #$0000
CODE_7E4F96:
	phx
	jsr CODE_7E4FAD
	plx
	rep #$20
	txa
	clc
	dec.w $1EFB
	bne CODE_7E4F96
CODE_7E4FAA:
	plp
	plb
	rtl
CODE_7E4FAD:
	stx.b $78
	ldy.w $2EC4,x
	tyx
	stx.b $76
	lda.b $1D,x
	and.b #$80
	beq CODE_7E4FBE
	brl CODE_7E452A3
CODE_7E4FBE:
	ldy.b $04,x
	sty.w $1F03
	ldy.b $78
	stz.w $1EF9
	stz.b $F7
	rep #$20
	lda.w $2EC6,y
	bne CODE_7E4FD4
	brl CODE_7E52A6
CODE_7E4FD4:
	tay
	sep #$20
	stz.w $1EFA
	lda.w $0002,y
	beq CODE_7E5009
	dec
	sta.b $02
	lda.w $1CE7,x
	bpl CODE_7E4FEE
	and.b $02
	beq CODE_7E5009
	bra CODE_7E4FF5
CODE_7E4FEE:
	lda.b $02
	and.w $15BB
	beq CODE_7E5009
CODE_7E4FF5:
	rep #$20
	and.w #$007F
	sta.b $02
	tya
	ldy.b $02
	clc
CODE_7E5000:
	adc.w #$0012
	dey
	bne CODE_7E5000
	tay
	sep #$20
CODE_7E5009:
	lda.w $0009,y
	sta.b $F6
	bit.b #$70
	bne CODE_7E5015
	brl CODE_7E525C
CODE_7E5015:
	bit.b #$10
	beq CODE_7E501C
	brl CODE_7E51E3
CODE_7E501C:
	bit.b #$20
	beq CODE_7E5023
	brl CODE_7E5167
CODE_7E5023:
	bit #$40
	beq CODE_7E502A
	brl CODE_7E50EB
CODE_7E502A:
	lda.w $0003,y
	sta.b $02
	sta.b $04
	lda.w $0005,y
	sta.b $08
	sta.b $0A
	lda.b $14,x
	beq CODE_7E503F
	jsr CODE_7E5ADA
CODE_7E503F:
	lda.b $0A
	sta.b $08
	lda.w $0007,y
	sta.b $90
	sta.w $15C2
	lda.b $12,x
	beq CODE_7E5052
	jsr CODE_7E593D
CODE_7E5052:
	lda.b $04
	sta.b $02
	lda.b $0A
	sta.b $08
	lda.b $13,x
	beq CODE_7E5061
	jsr CODE_7E579D
	rep #$20
CODE_7E5063:
	lda.b $04
	bit.w #$0080
	beq CODE_7E506F
	ora.w #$FF00
	bra CODE_7E5072
CODE_7E506F:
	and.w #$00FF
CODE_7E5072:
	sta.b $02
	lda.b $F6
	and.w #$000F
	beq CODE_7E5088
	sty.b $F8
	tay
	lda.b $02
CODE_7E5080:
	asl
	dey
	bne CODE_7E5080
	ldy.b $F8
	bra CODE_7E508A
CODE_7E5088:
	lda.b $02
CODE_7E508A:
	clc
	adc.b $0D,x
	sta.b $6C
	lda.w $15C2
	bit.w #$0080
	beq CODE_7E509C
	ora.w #$FF00
	bra CODE_7E509F
CODE_7E509C:
	and.w #$00FF
CODE_7E509F:
	sta.b $02
	lda.b $F6
	and.w #$00FF
	beq CODE_7E50B5
	sty.b $F8
	tay
	lda.b $02
CODE_7E50AD:
	asl
	dey
	bne CODE_7E50AD
	ldy.b $F8
	bra CODE_7E50B7
CODE_7E50B5:
	lda.b $02
CODE_7E50B7:
	clc
	adc.b $10,x
	sta.b $6E
	lda.b $0A
	bit.w #$0080
	beq CODE_7E50C8
	ora.w #$FF00
	bra CODE_7E50CB
CODE_7E50C8:
	and.w #$00FF
CODE_7E50CB:
	sta.b $02
	lda.b $F6
	and.w #$000F
	beq CODE_7E50E1
	sty.b $F8
	tay
	lda.b $02
CODE_7E50D9:
	asl
	dey
	bne CODE_7E50D9
	ldy.b $F8
	bra CODE_7E50E3
CODE_7E50E1:
	lda.b $02
CODE_7E50E3:
	clc
	adc.b $0E,x
	sta.b $74
	jmp CODE_7E5276
CODE_7E50EB:
	lda.w $0005,y
	sta.b $08
	sta.b $0A
	lda.w $0007,y
	sta.b $90
	sta.w $15C2
	lda.b $12,x
	beq CODE_7E5101
	jsr CODE_7E593D
CODE_7E5101:
	rep #$20
	lda.b $0A
	bit.w #$0080
	beq CODE_7E510F
	ora.w #$FF00
	bra CODE_7E5112
CODE_7E510F:
	and.w #$00FF
CODE_7E5112:
	sta.b $02
	lda.b $F6
	and.w #$000F
	beq CODE_7E5128
	sty.b $F8
	tay
	lda.b $02
CODE_7E5120:
	asl
	dey
	bne CODE_7E5120
	ldy.b $F8
	bra CODE_7E512A
CODE_7E5128:
	lda.b $02
CODE_7E512A:
	clc
	adc.b $0E,x
	sta.b $74
	lda.w $15C2
	bit.w #$0080
	beq CODE_7E513C
	ora.w #$FF00
	bra CODE_7E513F
CODE_7E513C:
	and.w #$00FF
CODE_7E513F:
	sta.b $02
	lda.b $F6
	and.b #$0F
	beq CODE_7E5155
	sty.b $F8
	tay
	lda.b $02
CODE_7E514D:
	asl
	dey
	bne CODE_7E514D
	ldy.b $F8
	bra CODE_7E5157
CODE_7E5155:
	lda.b $02
CODE_7E5157:
	clc
	adc.b $10,x
	sta.b $6E
	lda.w $0003,y
	clc
	adc.b $0C,x
	sta.b $6C
	jmp CODE_7E5276
CODE_7E5167:
	
	
	
	
	
	
	
	
	
	
	
	
CODE_7E524B:
	lda.b $02
CODE_7E524D:
	clc
	adc.b $0E,x
	sta.b $74
	lda.w $0007,y
	clc
	adc.b $10,x
	sta.b $6E
	bra CODE_7E5276
CODE_7E525C:
	rep #$20
	lda.w $0003,y
	clc
	adc.b $0C,x
	sta.b $6C
	lda.w $0005,y
	clc
	adc.b $0E,x
	sta.b $74
	lda.w $0007,y
	clc
	adc.b $10,x
	sta.b $6E
CODE_7E5276:
	lda.w $000A,y
	sta.w $1258
	lda.w $000C,y
	sta.w $125A
	lda.w $000E,y
	sta.w $125C
	phx
	phy
	sep #$20
	lda.w $0010,y
	sta.w $1EF9
	rep #$20
	jsr CODE_7E52C4
	ply
	plx
	rep #$20
	lda.w $0000,y
	beq CODE_7E52A3
	brl CODE_7E4FD4
CODE_7E52A3:
	sep #$20
	rts
CODE_7E52A6:
	lda.w $2EC8,y
	sta.w $1258
	lda.w $2ECA,y
	sta.w $125A
	lda.w $2ECC,y
	sta.w $125C
	lda.b $0C,x
	sta.b $6C
	lda.b $10,x
	sta.b $6E
	lda.b $0E,x
	sta.b $74
	lda.w $1EFB
	sta.w $1EFD
	ldy.b $78
	sty.w $1EFF
	jmp CODE_7E5788
CODE_7E52D2:
	sep #$20
	sty.w $1EFF
	ldy.w $2EC4,y
	stz.w $1EF8
	rep #$20
	ldy.b $76
	lda.w $001D,y
	and.w #$0080
	beq CODE_7E52EC
	brl CODE_7E5788
CODE_7E52EC:
	lda.w $002E,y
	and.b $2E,x
	and.w #$00F8
	beq CODE_7E52F9
	brl CODE_7E5788
CODE_7E52F9:
	tya
	cmp.b $19,x
	bne CODE_7E5301
	brl CODE_7E5788
CODE_7E5301:
	txa
	tyx
	cmp.b $19,x
	bne CODE_7E530A
	brl CODE_7E5788
CODE_7E530A:
	txy
	tax
	lda.b $0C,x
	sta.b $3A
	lda.b $0E,x
	sta.b $3C
	lda.b $10,x
	sta.b $3E
	lda.b $1F,x
	and.w #$0080
	beq CODE_7E532C
	lda.w $001F,y
	and.w #$0080
	beq CODE_7E532C
	lda.b $04,x
	txy
	bra CODE_7E5337
CODE_7E532C:
	lda.b $04,x
	txy
	cmp.w $1F03
	bne CODE_7E5337
	brl CODE_7E5788
CODE_7E5337:
	ldx.w $1EFF
	lda.w $2EC6,x
	bne CODE_7E5342
	brl CODE_7E570C
CODE_7E5342:
	
	
	
	
	
	
	
	
	
	
	
	
CODE_7E5C6C:
	stz.b $0B
CODE_7E5C6E:
	plp
	plx
	ply
	rts
CopiedSineTable8:
	DB $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1B,$1E,$21,$24,$27,$2A,$2D
	DB $30,$33,$36,$39,$3B,$3E,$41,$43,$46,$49,$4B,$4E,$50,$52,$55,$57
	DB $59,$5B,$5E,$60,$62,$64,$66,$67,$69,$6B,$6C,$6E,$70,$71,$72,$74
	DB $75,$76,$77,$78,$79,$7A,$7B,$7B,$7C,$7D,$7D,$7E,$7E,$7E,$7E,$7E
	DB $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1B,$1E,$21,$24,$27,$2A,$2D
	DB $30,$33,$36,$39,$3B,$3E,$41,$43,$46,$49,$4B,$4E,$50,$52,$55,$57
	DB $59,$5B,$5E,$60,$62,$64,$66,$67,$69,$6B,$6C,$6E,$70,$71,$72,$74
	DB $75,$76,$77,$78,$79,$7A,$7B,$7B,$7C,$7D,$7D,$7E,$7E,$7E,$7E,$7E
	DB $7F,$7E,$7E,$7E,$7E,$7E,$7D,$7D,$7C,$7B,$7B,$7A,$79,$78,$77,$76
	DB $75,$74,$72,$71,$70,$6E,$6C,$6B,$69,$67,$66,$64,$62,$60,$5E,$5B
	DB $59,$57,$55,$52,$50,$4E,$4B,$49,$46,$43,$41,$3E,$3B,$39,$36,$33
	DB $30,$2D,$2A,$27,$24,$21,$1E,$1B,$18,$15,$12,$0F,$0C,$09,$06,$03
	DB $00,$FD,$FA,$F7,$F4,$F1,$EE,$EB,$E8,$E5,$E2,$DF,$DC,$D9,$D6,$D3
	DB $D0,$CD,$CA,$C7,$C5,$C2,$BF,$BD,$BA,$B7,$B5,$B2,$B0,$AE,$AB,$A9
	DB $A7,$A5,$A2,$A0,$9E,$9C,$9A,$99,$97,$95,$94,$92,$90,$8F,$8E,$8C
	DB $8B,$8A,$89,$88,$87,$86,$85,$85,$84,$83,$83,$82,$82,$82,$82,$82
	DB $81,$82,$82,$82,$82,$82,$83,$83,$84,$85,$85,$86,$87,$88,$89,$8A
	DB $8B,$8C,$8E,$8F,$90,$92,$94,$95,$97,$99,$9A,$9C,$9E,$A0,$A2,$A5
	DB $A7,$A9,$AB,$AE,$B0,$B2,$B5,$B7,$BA,$BD,$BF,$C2,$C5,$C7,$CA,$CD
	DB $D0,$D3,$D6,$D9,$DC,$DF,$E2,$E5,$E8,$EB,$EE,$F1,$F4,$F7,$FA,$FD
	DB $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1B,$1E,$21,$24,$27,$2A,$2D
	DB $30,$33,$36,$39,$3B,$3E,$41,$43,$46,$49,$4B,$4E,$50,$52,$55,$57
	DB $59,$5B,$5E,$60,$62,$64,$66,$67,$69,$6B,$6C,$6E,$70,$71,$72,$74
	DB $75,$76,$77,$78,$79,$7A,$7B,$7B,$7C,$7D,$7D,$7E,$7E,$7E,$7E,$7E
UnkData_7E5DB2:
	DB $C4,$5D,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$00,$0A,$00,$14,$00,$01,$FF
	DB $D6,$5D,$00,$DF,$FF,$0D,$00,$00,$00,$10,$05,$00,$05,$00,$0A,$00,$02,$FF
	DB $00,$00,$00,$21,$00,$0D,$00,$00,$00,$10,$05,$00,$05,$00,$0A,$00,$04,$FF
	DB $C4,$5D,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$00,$0A,$00,$0A,$00,$01,$FF
	DB $D6,$5D,$00,$EC,$FF,$0D,$00,$00,$00,$10,$05,$00,$05,$00,$05,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$0D,$00,$00,$00,$10,$05,$00,$05,$00,$05,$00,$04,$FF
	DB $30,$5E,$00,$00,$00,$7E,$FF,$00,$00,$01,$28,$00,$14,$00,$78,$00,$10,$FF
	DB $42,$5E,$00,$6A,$FF,$00,$00,$00,$00,$01,$3C,$00,$B4,$00,$78,$00,$01,$FF
	DB $54,$5E,$00,$96,$00,$00,$00,$00,$00,$01,$3C,$00,$B4,$00,$78,$00,$02,$FF
	DB $66,$5E,$00,$00,$00,$6A,$FF,$00,$00,$01,$5A,$00,$1E,$00,$78,$00,$04,$FF
	DB $86,$5F,$10,$D2,$FF,$00,$00,$88,$FF,$01,$2E,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$CA,$FF,$00,$00,$88,$FF,$01,$26,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$C2,$FF,$00,$00,$88,$FF,$01,$1E,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$BC,$FF,$00,$00,$88,$FF,$01,$18,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$B4,$FF,$00,$00,$88,$FF,$01,$10,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$AE,$FF,$00,$00,$88,$FF,$01,$0A,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$AA,$FF,$00,$00,$88,$FF,$01,$06,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$A8,$FF,$00,$00,$88,$FF,$01,$02,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$A8,$FF,$00,$00,$88,$FF,$01,$02,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$AA,$FF,$00,$00,$88,$FF,$01,$06,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$AE,$FF,$00,$00,$88,$FF,$01,$0A,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$B4,$FF,$00,$00,$88,$FF,$01,$10,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$BC,$FF,$00,$00,$88,$FF,$01,$18,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$C2,$FF,$00,$00,$88,$FF,$01,$1E,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$CA,$FF,$00,$00,$88,$FF,$01,$26,$00,$78,$00,$14,$00,$08,$FF
	DB $86,$5F,$00,$D2,$FF,$00,$00,$88,$FF,$01,$2E,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$10,$D2,$FF,$00,$00,$88,$FF,$01,$2E,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$CA,$FF,$00,$00,$88,$FF,$01,$26,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$C2,$FF,$00,$00,$88,$FF,$01,$1E,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$BC,$FF,$00,$00,$88,$FF,$01,$18,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$B4,$FF,$00,$00,$88,$FF,$01,$10,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$AE,$FF,$00,$00,$88,$FF,$01,$0A,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$AA,$FF,$00,$00,$88,$FF,$01,$06,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$A8,$FF,$00,$00,$88,$FF,$01,$02,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$A8,$FF,$00,$00,$88,$FF,$01,$02,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$AA,$FF,$00,$00,$88,$FF,$01,$06,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$AE,$FF,$00,$00,$88,$FF,$01,$0A,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$B4,$FF,$00,$00,$88,$FF,$01,$10,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$BC,$FF,$00,$00,$88,$FF,$01,$18,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$C2,$FF,$00,$00,$88,$FF,$01,$1E,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$CA,$FF,$00,$00,$88,$FF,$01,$26,$00,$78,$00,$14,$00,$08,$FF
	DB $00,$00,$00,$D2,$FF,$00,$00,$88,$FF,$01,$2E,$00,$78,$00,$14,$00,$08,$FF
	DB $B8,$60,$00,$B2,$FF,$F6,$FF,$00,$00,$10,$0A,$00,$0A,$00,$0A,$00,$01,$FF
	DB $00,$00,$00,$4E,$00,$F6,$FF,$00,$00,$10,$0A,$00,$0A,$00,$0A,$00,$01,$FF
	DB $DC,$60,$00,$C4,$FF,$00,$00,$00,$00,$00,$0A,$00,$46,$00,$50,$00,$01,$FF
	DB $EE,$60,$00,$3C,$00,$00,$00,$00,$00,$00,$0A,$00,$46,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$C4,$FF,$00,$00,$00,$46,$00,$0A,$00,$50,$00,$01,$FF
	DB $12,$61,$00,$B0,$FF,$00,$00,$00,$00,$00,$0A,$00,$64,$00,$50,$00,$01,$FF
	DB $24,$61,$00,$50,$00,$00,$00,$00,$00,$00,$0A,$00,$64,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$9C,$FF,$00,$00,$00,$50,$00,$0A,$00,$50,$00,$01,$FF
	DB $48,$61,$00,$00,$00,$EC,$FF,$00,$00,$00,$8C,$00,$14,$00,$64,$00,$01,$FF
	DB $5A,$61,$00,$00,$00,$C4,$FF,$00,$00,$00,$50,$00,$14,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$88,$FF,$00,$00,$00,$14,$00,$28,$00,$14,$00,$01,$FF
	DB $00,$00,$20,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$42,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$4C,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$5A,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$68,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$7A,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$8C,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$9E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$96,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$84,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$6C,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$54,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$42,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$30,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $BE,$63,$00,$00,$00,$D8,$FF,$00,$00,$02,$18,$00,$14,$00,$18,$00,$02,$FF
	DB $D0,$63,$00,$00,$00,$EC,$FF,$00,$00,$12,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $E2,$63,$00,$00,$00,$E2,$FF,$00,$00,$12,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $F4,$63,$00,$00,$00,$D8,$FF,$00,$00,$12,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $06,$64,$00,$00,$00,$CE,$FF,$00,$00,$12,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $18,$64,$00,$00,$00,$C4,$FF,$00,$00,$12,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $2A,$64,$00,$00,$00,$BA,$FF,$00,$00,$12,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$B0,$FF,$00,$00,$12,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $4E,$64,$00,$00,$00,$00,$00,$28,$00,$02,$18,$00,$14,$00,$18,$00,$02,$FF
	DB $60,$64,$00,$00,$00,$00,$00,$14,$00,$22,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $72,$64,$00,$00,$00,$00,$00,$1E,$00,$22,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $84,$64,$00,$00,$00,$00,$00,$28,$00,$22,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $96,$64,$00,$00,$00,$00,$00,$32,$00,$22,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $A8,$64,$00,$00,$00,$00,$00,$3C,$00,$22,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $BA,$64,$00,$00,$00,$00,$00,$46,$00,$22,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$50,$00,$22,$18,$00,$14,$00,$18,$00,$01,$FF
	DB $00,$00,$08,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$7C,$00,$1E,$00,$01,$FF
	DB $5C,$65,$00,$60,$FF,$00,$00,$00,$00,$01,$28,$00,$94,$00,$1E,$00,$01,$FF
	DB $5C,$65,$00,$60,$FF,$00,$00,$00,$00,$01,$28,$00,$A4,$00,$1E,$00,$01,$FF
	DB $5C,$65,$00,$60,$FF,$00,$00,$00,$00,$01,$28,$00,$BC,$00,$1E,$00,$01,$FF
	DB $5C,$65,$00,$60,$FF,$00,$00,$00,$00,$01,$28,$00,$CC,$00,$1E,$00,$01,$FF
	DB $5C,$65,$00,$60,$FF,$00,$00,$00,$00,$01,$28,$00,$E4,$00,$1E,$00,$01,$FF
	DB $5C,$65,$00,$60,$FF,$00,$00,$00,$00,$01,$28,$00,$F4,$00,$1E,$00,$01,$FF
	DB $5C,$65,$00,$60,$FF,$00,$00,$00,$00,$01,$28,$00,$08,$01,$1E,$00,$01,$FF
	DB $EC,$65,$08,$A0,$00,$00,$00,$00,$00,$01,$28,$00,$7C,$00,$1E,$00,$01,$FF
	DB $EC,$65,$00,$A0,$00,$00,$00,$00,$00,$01,$28,$00,$94,$00,$1E,$00,$01,$FF
	DB $EC,$65,$00,$A0,$00,$00,$00,$00,$00,$01,$28,$00,$A4,$00,$1E,$00,$01,$FF
	DB $EC,$65,$00,$A0,$00,$00,$00,$00,$00,$01,$28,$00,$BC,$00,$1E,$00,$01,$FF
	DB $EC,$65,$00,$A0,$00,$00,$00,$00,$00,$01,$28,$00,$CC,$00,$1E,$00,$01,$FF
	DB $EC,$65,$00,$A0,$00,$00,$00,$00,$00,$01,$28,$00,$E4,$00,$1E,$00,$01,$FF
	DB $EC,$65,$00,$A0,$00,$00,$00,$00,$00,$01,$28,$00,$F4,$00,$1E,$00,$01,$FF
	DB $EC,$65,$00,$A0,$00,$00,$00,$00,$00,$01,$28,$00,$08,$01,$1E,$00,$01,$FF
	DB $00,$00,$08,$00,$00,$C4,$FF,$00,$00,$01,$C8,$00,$3C,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$B0,$FF,$00,$00,$01,$C8,$00,$3C,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$9C,$FF,$00,$00,$01,$C8,$00,$3C,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$88,$FF,$00,$00,$01,$C8,$00,$3C,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$74,$FF,$00,$00,$01,$C8,$00,$3C,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$60,$FF,$00,$00,$01,$C8,$00,$3C,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$4C,$FF,$00,$00,$01,$C8,$00,$3C,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$38,$FF,$00,$00,$01,$C8,$00,$3C,$00,$1E,$00,$01,$FF
	DB $00,$00,$08,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$7C,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$94,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$A4,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$BC,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$CC,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$E4,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$F4,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$C8,$00,$08,$01,$1E,$00,$01,$FF
	DB $1E,$67,$00,$EC,$FF,$00,$00,$00,$00,$22,$10,$00,$78,$01,$10,$00,$01,$FF
	DB $30,$67,$00,$14,$00,$00,$00,$00,$00,$22,$10,$00,$78,$01,$10,$00,$02,$FF
	DB $00,$00,$00,$00,$00,$B0,$FF,$00,$00,$12,$3C,$00,$3C,$00,$3C,$00,$04,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$50,$00,$03,$50,$00,$40,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$48,$FE,$00,$00,$00,$00,$03,$B8,$01,$40,$01,$28,$00,$02,$FF
	DB $00,$00,$00,$B8,$01,$00,$00,$00,$00,$03,$B8,$01,$40,$01,$28,$00,$02,$FF
	DB $8A,$67,$00,$00,$00,$E2,$FF,$00,$00,$10,$41,$00,$28,$00,$28,$00,$02,$FF
	DB $9C,$67,$00,$50,$00,$EC,$FF,$00,$00,$10,$14,$00,$19,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$B0,$FF,$EC,$FF,$00,$00,$10,$14,$00,$19,$00,$32,$00,$01,$FF
	DB $C0,$67,$00,$00,$00,$E2,$FF,$00,$00,$41,$50,$00,$14,$00,$3C,$00,$04,$FF
	DB $D2,$67,$00,$00,$00,$F6,$FF,$00,$00,$41,$50,$00,$14,$00,$3C,$00,$04,$FF
	DB $E4,$67,$00,$00,$00,$0A,$00,$00,$00,$41,$50,$00,$14,$00,$3C,$00,$04,$FF
	DB $F6,$67,$00,$00,$00,$1E,$00,$00,$00,$41,$50,$00,$14,$00,$3C,$00,$04,$FF
	DB $08,$68,$00,$00,$00,$E2,$FF,$00,$00,$40,$F0,$00,$1E,$00,$1E,$00,$01,$FF
	DB $1A,$68,$00,$00,$00,$1E,$00,$00,$00,$40,$F0,$00,$1E,$00,$1E,$00,$02,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$F0,$00,$1E,$00,$1E,$00,$04,$FF
	DB $3E,$68,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$00,$0F,$00,$0F,$00,$01,$FF
	DB $50,$68,$00,$00,$00,$C9,$FF,$37,$00,$10,$0A,$00,$0A,$00,$0A,$00,$02,$FF
	DB $62,$68,$00,$37,$00,$00,$00,$37,$00,$10,$0A,$00,$0A,$00,$0A,$00,$04,$FF
	DB $74,$68,$00,$00,$00,$37,$00,$37,$00,$10,$0A,$00,$0A,$00,$0A,$00,$08,$FF
	DB $00,$00,$00,$C9,$FF,$00,$00,$37,$00,$10,$0A,$00,$0A,$00,$0A,$00,$10,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$C8,$00,$20,$28,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$58,$FF,$23,$00,$23,$30,$00,$28,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$DD,$FF,$00,$00,$13,$28,$00,$78,$00,$50,$00,$01,$FF
	DB $CE,$68,$00,$00,$00,$C0,$03,$31,$00,$25,$80,$02,$E0,$01,$40,$06,$01,$FF
	DB $00,$00,$00,$00,$00,$60,$FF,$A0,$FE,$05,$40,$01,$40,$01,$80,$02,$02,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$50,$00,$22,$50,$00,$3C,$00,$A0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$21,$5A,$00,$46,$00,$C8,$00,$01,$FF
	DB $16,$69,$00,$D8,$FE,$00,$00,$00,$00,$03,$38,$00,$20,$00,$50,$00,$01,$FF
	DB $28,$69,$00,$28,$01,$00,$00,$00,$00,$03,$38,$00,$20,$00,$50,$00,$02,$FF
	DB $3A,$69,$00,$00,$00,$D8,$FE,$00,$00,$03,$20,$00,$38,$00,$50,$00,$04,$FF
	DB $00,$00,$00,$00,$00,$28,$01,$00,$00,$03,$20,$00,$38,$00,$50,$00,$08,$FF
	DB $5E,$69,$00,$00,$00,$60,$00,$60,$FF,$03,$28,$00,$38,$00,$A0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$C8,$FF,$60,$FF,$03,$18,$01,$28,$00,$A0,$00,$01,$FF
	DB $82,$69,$00,$00,$00,$A0,$FF,$60,$FF,$03,$28,$00,$38,$00,$A0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$38,$00,$60,$FF,$03,$18,$01,$28,$00,$A0,$00,$01,$FF
	DB $A6,$69,$00,$60,$00,$00,$00,$60,$FF,$03,$38,$00,$28,$00,$A0,$00,$01,$FF
	DB $00,$00,$00,$C8,$FF,$00,$00,$60,$FF,$03,$28,$00,$18,$01,$A0,$00,$01,$FF
	DB $CA,$69,$00,$A0,$FF,$00,$00,$60,$FF,$03,$38,$00,$28,$00,$A0,$00,$01,$FF
	DB $00,$00,$00,$38,$00,$00,$00,$60,$FF,$03,$28,$00,$18,$01,$A0,$00,$01,$FF
	DB $00,$00,$00,$F6,$FF,$00,$00,$EC,$FF,$23,$50,$00,$A0,$00,$A0,$00,$01,$FF
	DB $00,$6A,$00,$00,$00,$B0,$FF,$E2,$FF,$23,$50,$00,$50,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$28,$00,$07,$00,$23,$28,$00,$28,$00,$50,$00,$02,$FF
	DB $00,$00,$00,$0F,$00,$00,$00,$EC,$FF,$23,$28,$00,$A0,$00,$A0,$00,$01,$FF
	DB $00,$00,$10,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$10,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$00,$00,$23,$78,$00,$78,$00,$68,$01,$01,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$14,$00,$00,$00,$EC,$FF,$23,$78,$00,$78,$00,$A0,$00,$02,$FF
	DB $76,$6C,$00,$00,$00,$88,$FF,$00,$00,$03,$F0,$00,$A0,$00,$A0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$58,$FD,$00,$00,$03,$F0,$00,$A0,$00,$A0,$00,$01,$FF
	DB $9A,$6C,$00,$00,$00,$60,$FF,$E7,$FF,$23,$A0,$00,$50,$00,$78,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$E0,$01,$50,$00,$E0,$01,$01,$FF
	DB $BE,$6C,$00,$00,$00,$00,$00,$00,$00,$00,$2C,$01,$2C,$01,$2C,$01,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$46,$00,$3C,$00,$2D,$00,$02,$FF
	DB $00,$00,$00,$00,$00,$B0,$FF,$14,$00,$22,$50,$00,$50,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$60,$FF,$14,$00,$23,$A0,$00,$A0,$00,$A0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$38,$FF,$14,$00,$22,$50,$00,$C8,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$E8,$FE,$0A,$00,$23,$50,$00,$18,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$38,$FF,$28,$00,$22,$50,$00,$C8,$00,$A0,$00,$01,$FF
	DB $3C,$6D,$00,$1E,$00,$38,$FF,$E2,$FF,$22,$50,$00,$C8,$00,$50,$00,$01,$FF
	DB $4E,$6D,$00,$1E,$00,$A8,$FF,$1E,$00,$22,$50,$00,$58,$00,$50,$00,$01,$FF
	DB $60,$6D,$00,$E2,$FF,$A8,$FF,$E2,$FF,$22,$50,$00,$58,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$E2,$FF,$A8,$FF,$1E,$00,$22,$50,$00,$58,$00,$50,$00,$01,$FF
	DB $84,$6D,$00,$1E,$00,$38,$FF,$00,$00,$22,$50,$00,$C8,$00,$B4,$00,$01,$FF
	DB $96,$6D,$00,$E2,$FF,$A8,$FF,$E2,$FF,$22,$50,$00,$58,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$E2,$FF,$A8,$FF,$1E,$00,$22,$50,$00,$58,$00,$50,$00,$01,$FF
	DB $BA,$6D,$00,$1E,$00,$38,$FF,$E2,$FF,$22,$50,$00,$C8,$00,$50,$00,$01,$FF
	DB $CC,$6D,$00,$1E,$00,$38,$FF,$1E,$00,$22,$50,$00,$C8,$00,$50,$00,$01,$FF
	DB $DE,$6D,$00,$E2,$FF,$38,$FF,$E2,$FF,$22,$50,$00,$C8,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$E2,$FF,$38,$FF,$1E,$00,$22,$50,$00,$C8,$00,$50,$00,$01,$FF
	DB $02,$6E,$00,$00,$00,$00,$00,$00,$00,$03,$38,$00,$70,$00,$20,$03,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$50,$00,$23,$38,$00,$70,$00,$28,$00,$02,$FF
	DB $26,$6E,$00,$00,$00,$F0,$FF,$00,$00,$01,$3C,$00,$10,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$98,$FF,$00,$00,$01,$28,$00,$10,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$C4,$FF,$00,$00,$01,$1A,$00,$1A,$00,$28,$00,$01,$FF
	DB $DA,$6E,$08,$00,$00,$E2,$FF,$00,$00,$00,$5A,$00,$1E,$00,$32,$00,$01,$FF
	DB $DA,$6E,$00,$00,$00,$E9,$FF,$00,$00,$00,$5A,$00,$17,$00,$32,$00,$01,$FF
	DB $DA,$6E,$00,$00,$00,$F0,$FF,$00,$00,$00,$5A,$00,$10,$00,$32,$00,$01,$FF
	DB $DA,$6E,$00,$00,$00,$F7,$FF,$00,$00,$00,$5A,$00,$09,$00,$32,$00,$01,$FF
	DB $DA,$6E,$00,$00,$00,$FE,$FF,$00,$00,$00,$5A,$00,$02,$00,$32,$00,$01,$FF
	DB $DA,$6E,$00,$00,$00,$05,$00,$00,$00,$00,$5A,$00,$FB,$FF,$32,$00,$01,$FF
	DB $DA,$6E,$00,$00,$00,$0C,$00,$00,$00,$00,$5A,$00,$F4,$FF,$32,$00,$01,$FF
	DB $DA,$6E,$00,$00,$00,$13,$00,$00,$00,$00,$5A,$00,$ED,$FF,$32,$00,$01,$FF
	DB $6A,$6F,$08,$00,$00,$1E,$00,$00,$00,$00,$5A,$00,$1E,$00,$32,$00,$01,$FF
	DB $6A,$6F,$00,$00,$00,$17,$00,$00,$00,$00,$5A,$00,$17,$00,$32,$00,$01,$FF
	DB $6A,$6F,$00,$00,$00,$10,$00,$00,$00,$00,$5A,$00,$10,$00,$32,$00,$01,$FF
	DB $6A,$6F,$00,$00,$00,$09,$00,$00,$00,$00,$5A,$00,$09,$00,$32,$00,$01,$FF
	DB $6A,$6F,$00,$00,$00,$02,$00,$00,$00,$00,$5A,$00,$02,$00,$32,$00,$01,$FF
	DB $6A,$6F,$00,$00,$00,$FB,$FF,$00,$00,$00,$5A,$00,$FB,$FF,$32,$00,$01,$FF
	DB $6A,$6F,$00,$00,$00,$F4,$FF,$00,$00,$00,$5A,$00,$F4,$FF,$32,$00,$01,$FF
	DB $6A,$6F,$00,$00,$00,$ED,$FF,$00,$00,$00,$5A,$00,$ED,$FF,$32,$00,$01,$FF
	DB $FA,$6F,$08,$2D,$00,$C4,$FF,$00,$00,$00,$2D,$00,$3C,$00,$32,$00,$01,$FF
	DB $FA,$6F,$00,$34,$00,$C4,$FF,$00,$00,$00,$26,$00,$3C,$00,$32,$00,$01,$FF
	DB $FA,$6F,$00,$3B,$00,$C4,$FF,$00,$00,$00,$1F,$00,$3C,$00,$32,$00,$01,$FF
	DB $FA,$6F,$00,$42,$00,$C4,$FF,$00,$00,$00,$18,$00,$3C,$00,$32,$00,$01,$FF
	DB $FA,$6F,$00,$49,$00,$C4,$FF,$00,$00,$00,$11,$00,$3C,$00,$32,$00,$01,$FF
	DB $FA,$6F,$00,$50,$00,$C4,$FF,$00,$00,$00,$0A,$00,$3C,$00,$32,$00,$01,$FF
	DB $FA,$6F,$00,$57,$00,$C4,$FF,$00,$00,$00,$03,$00,$3C,$00,$32,$00,$01,$FF
	DB $FA,$6F,$00,$5E,$00,$C4,$FF,$00,$00,$00,$FC,$FF,$3C,$00,$32,$00,$01,$FF
	DB $00,$00,$08,$D3,$FF,$C4,$FF,$00,$00,$00,$2D,$00,$3C,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$CC,$FF,$C4,$FF,$00,$00,$00,$26,$00,$3C,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$C5,$FF,$C4,$FF,$00,$00,$00,$1F,$00,$3C,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$BE,$FF,$C4,$FF,$00,$00,$00,$18,$00,$3C,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$B7,$FF,$C4,$FF,$00,$00,$00,$11,$00,$3C,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$B0,$FF,$C4,$FF,$00,$00,$00,$0A,$00,$3C,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$A9,$FF,$C4,$FF,$00,$00,$00,$03,$00,$3C,$00,$32,$00,$01,$FF
	DB $00,$00,$00,$A2,$FF,$C4,$FF,$00,$00,$00,$FC,$FF,$3C,$00,$32,$00,$01,$FF
	DB $9C,$70,$00,$00,$00,$00,$00,$0A,$00,$41,$0A,$00,$0A,$00,$14,$00,$01,$FF
	DB $AE,$70,$00,$00,$00,$00,$00,$1E,$00,$41,$0A,$00,$0A,$00,$14,$00,$01,$FF
	DB $C0,$70,$00,$00,$00,$00,$00,$32,$00,$41,$0A,$00,$0A,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$46,$00,$41,$0A,$00,$0A,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$F8,$FF,$32,$00,$00,$0F,$00,$08,$00,$50,$00,$01,$FF
	DB $F6,$70,$00,$00,$00,$06,$00,$00,$00,$00,$1E,$00,$14,$00,$14,$00,$02,$FF
	DB $08,$71,$00,$00,$00,$0C,$00,$5F,$00,$00,$3A,$00,$34,$00,$55,$00,$01,$FF
	DB $1A,$71,$00,$CE,$FF,$0C,$00,$C9,$FF,$00,$08,$00,$34,$00,$41,$00,$01,$FF
	DB $2C,$71,$00,$32,$00,$0C,$00,$C9,$FF,$00,$08,$00,$34,$00,$41,$00,$01,$FF
	DB $3E,$71,$00,$00,$00,$DE,$FF,$C9,$FF,$00,$3A,$00,$06,$00,$41,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$2C,$00,$C9,$FF,$00,$3A,$00,$14,$00,$41,$00,$01,$FF
	DB $62,$71,$00,$00,$00,$00,$00,$00,$00,$22,$50,$00,$3C,$00,$50,$00,$01,$FF
	DB $74,$71,$00,$D8,$FF,$C8,$00,$14,$00,$22,$28,$00,$50,$00,$78,$00,$02,$FF
	DB $00,$00,$00,$28,$00,$C8,$00,$14,$00,$22,$28,$00,$50,$00,$78,$00,$04,$FF
	DB $98,$71,$00,$00,$00,$00,$00,$00,$00,$00,$1E,$00,$1E,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$BA,$FF,$00,$00,$00,$19,$00,$32,$00,$19,$00,$02,$FF
	DB $E0,$71,$00,$00,$00,$78,$00,$D8,$FF,$02,$28,$00,$28,$00,$28,$00,$02,$FF
	DB $E0,$71,$00,$88,$FF,$00,$00,$D8,$FF,$02,$28,$00,$28,$00,$28,$00,$02,$FF
	DB $E0,$71,$00,$1E,$00,$00,$00,$D8,$FF,$12,$28,$00,$28,$00,$28,$00,$02,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$A0,$00,$A0,$00,$DC,$00,$01,$FF
	DB $04,$72,$00,$00,$00,$00,$00,$00,$00,$02,$3C,$00,$3C,$00,$3C,$00,$01,$FF
	DB $A6,$72,$10,$00,$00,$BF,$FF,$D8,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $A6,$72,$00,$00,$00,$C4,$FF,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $A6,$72,$00,$00,$00,$C9,$FF,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $A6,$72,$00,$00,$00,$D3,$FF,$74,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $A6,$72,$00,$00,$00,$D8,$FF,$60,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $A6,$72,$00,$00,$00,$E0,$FF,$38,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $A6,$72,$00,$00,$00,$E7,$FF,$38,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $A6,$72,$00,$00,$00,$EC,$FF,$10,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $A6,$72,$00,$00,$00,$F6,$FF,$10,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$10,$00,$00,$DD,$FF,$D8,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$00,$00,$00,$E0,$FF,$D4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$00,$00,$00,$E2,$FF,$C4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$00,$00,$00,$E7,$FF,$BC,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$00,$00,$00,$EA,$FF,$C4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$00,$00,$00,$EC,$FF,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$00,$00,$00,$EC,$FF,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$00,$00,$00,$EE,$FF,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $48,$73,$00,$00,$00,$F6,$FF,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$10,$E2,$FF,$11,$00,$D8,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$00,$E4,$FF,$10,$00,$D4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$00,$E6,$FF,$0F,$00,$C4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$00,$EA,$FF,$0C,$00,$BC,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$00,$ED,$FF,$0B,$00,$C4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$00,$EF,$FF,$0A,$00,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$00,$EF,$FF,$0A,$00,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$00,$EF,$FF,$0A,$00,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $EA,$73,$00,$F8,$FF,$06,$00,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$10,$C8,$FF,$20,$00,$D8,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$00,$CC,$FF,$1E,$00,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$00,$D1,$FF,$1B,$00,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$00,$D9,$FF,$16,$00,$74,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$00,$DD,$FF,$14,$00,$60,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$00,$E4,$FF,$10,$00,$38,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$00,$EA,$FF,$0C,$00,$38,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$00,$F0,$FF,$09,$00,$10,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $8C,$74,$00,$F7,$FF,$05,$00,$10,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$10,$1E,$00,$11,$00,$D8,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$00,$1C,$00,$10,$00,$D4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$00,$1A,$00,$0F,$00,$C4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$00,$16,$00,$0C,$00,$BC,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$00,$13,$00,$0B,$00,$C4,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$00,$11,$00,$0A,$00,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$00,$11,$00,$0A,$00,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$00,$11,$00,$0A,$00,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $2E,$75,$00,$08,$00,$06,$00,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$10,$38,$00,$20,$00,$D8,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$34,$00,$1E,$00,$B0,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$2F,$00,$1B,$00,$88,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$27,$00,$16,$00,$74,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$23,$00,$14,$00,$60,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$1C,$00,$10,$00,$38,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$16,$00,$0C,$00,$38,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$10,$00,$09,$00,$10,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$09,$00,$05,$00,$10,$FF,$12,$28,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$08,$00,$00,$00,$00,$00,$00,$00,$5A,$00,$7C,$00,$0F,$00,$01,$FF
	DB $60,$76,$00,$B8,$FF,$00,$00,$00,$00,$00,$12,$00,$4A,$00,$0F,$00,$01,$FF
	DB $60,$76,$00,$B8,$FF,$00,$00,$00,$00,$00,$12,$00,$52,$00,$0F,$00,$01,$FF
	DB $60,$76,$00,$B8,$FF,$00,$00,$00,$00,$00,$12,$00,$5E,$00,$0F,$00,$01,$FF
	DB $60,$76,$00,$B8,$FF,$00,$00,$00,$00,$00,$12,$00,$66,$00,$0F,$00,$01,$FF
	DB $60,$76,$00,$B8,$FF,$00,$00,$00,$00,$00,$12,$00,$72,$00,$0F,$00,$01,$FF
	DB $60,$76,$00,$B8,$FF,$00,$00,$00,$00,$00,$12,$00,$7A,$00,$0F,$00,$01,$FF
	DB $60,$76,$00,$B8,$FF,$00,$00,$00,$00,$00,$12,$00,$84,$00,$0F,$00,$01,$FF
	DB $F0,$76,$08,$48,$00,$00,$00,$00,$00,$00,$12,$00,$3E,$00,$0F,$00,$01,$FF
	DB $F0,$76,$00,$48,$00,$00,$00,$00,$00,$00,$12,$00,$4A,$00,$0F,$00,$01,$FF
	DB $F0,$76,$00,$48,$00,$00,$00,$00,$00,$00,$12,$00,$52,$00,$0F,$00,$01,$FF
	DB $F0,$76,$00,$48,$00,$00,$00,$00,$00,$00,$12,$00,$5E,$00,$0F,$00,$01,$FF
	DB $F0,$76,$00,$48,$00,$00,$00,$00,$00,$00,$12,$00,$66,$00,$0F,$00,$01,$FF
	DB $F0,$76,$00,$48,$00,$00,$00,$00,$00,$00,$12,$00,$72,$00,$0F,$00,$01,$FF
	DB $F0,$76,$00,$48,$00,$00,$00,$00,$00,$00,$12,$00,$7A,$00,$0F,$00,$01,$FF
	DB $F0,$76,$00,$48,$00,$00,$00,$00,$00,$00,$12,$00,$84,$00,$0F,$00,$01,$FF
	DB $00,$00,$08,$00,$00,$E2,$FF,$00,$00,$00,$5A,$00,$1E,$00,$0F,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$D8,$FF,$00,$00,$00,$5A,$00,$1E,$00,$0F,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$CE,$FF,$00,$00,$00,$5A,$00,$1E,$00,$0F,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$C4,$FF,$00,$00,$00,$5A,$00,$1E,$00,$0F,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$BA,$FF,$00,$00,$00,$5A,$00,$1E,$00,$0F,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$B0,$FF,$00,$00,$00,$5A,$00,$1E,$00,$0F,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$A6,$FF,$00,$00,$00,$5A,$00,$1E,$00,$0F,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$9C,$FF,$00,$00,$00,$5A,$00,$1E,$00,$0F,$00,$01,$FF
	DB $00,$00,$20,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$3C,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$64,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$78,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$8C,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$A0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$B4,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$C8,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$DC,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$F0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$F0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$F0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$F0,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$10,$00,$14,$00,$10,$00,$01,$FF
	DB $00,$00,$10,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$0C,$00,$28,$00,$00,$28,$00,$3A,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$19,$00,$14,$00,$00,$28,$00,$05,$00,$0A,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$19,$00,$14,$00,$00,$28,$00,$05,$00,$0A,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$19,$00,$14,$00,$00,$28,$00,$05,$00,$0A,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$19,$00,$14,$00,$00,$28,$00,$05,$00,$0A,$00,$01,$FF
	DB $F2,$7A,$00,$00,$00,$D8,$FF,$28,$00,$23,$50,$00,$50,$00,$78,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$03,$90,$01,$78,$00,$90,$01,$02,$FF
	DB $16,$7B,$00,$B6,$FF,$CA,$FF,$E2,$FF,$01,$0E,$00,$36,$00,$1E,$00,$01,$FF
	DB $28,$7B,$00,$00,$00,$9C,$FF,$E2,$FF,$01,$28,$00,$14,$00,$1E,$00,$01,$FF
	DB $00,$00,$00,$4A,$00,$CA,$FF,$E2,$FF,$01,$0E,$00,$36,$00,$1E,$00,$01,$FF
	DB $00,$00,$10,$00,$00,$00,$00,$00,$00,$00,$14,$00,$06,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$0A,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$1E,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$28,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$32,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$46,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$50,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$5A,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$64,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$6E,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$78,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$78,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$78,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$14,$00,$78,$00,$14,$00,$01,$FF
	DB $6C,$7C,$00,$38,$FF,$88,$FF,$38,$FF,$02,$28,$00,$A0,$00,$C8,$00,$01,$FF
	DB $7E,$7C,$00,$C8,$00,$88,$FF,$38,$FF,$02,$28,$00,$A0,$00,$C8,$00,$01,$FF
	DB $90,$7C,$00,$00,$00,$E8,$FE,$38,$FF,$02,$F0,$00,$28,$00,$C8,$00,$01,$FF
	DB $32,$7D,$10,$50,$00,$9C,$FF,$98,$FE,$02,$50,$00,$2C,$01,$50,$00,$01,$FF
	DB $44,$7D,$00,$58,$00,$88,$FF,$98,$FE,$02,$44,$00,$2C,$01,$50,$00,$01,$FF
	DB $56,$7D,$00,$64,$00,$74,$FF,$98,$FE,$02,$3C,$00,$2C,$01,$50,$00,$01,$FF
	DB $68,$7D,$00,$6C,$00,$60,$FF,$98,$FE,$02,$30,$00,$2C,$01,$50,$00,$01,$FF
	DB $7A,$7D,$00,$78,$00,$4C,$FF,$98,$FE,$02,$28,$00,$2C,$01,$50,$00,$01,$FF
	DB $8C,$7D,$00,$80,$00,$38,$FF,$98,$FE,$02,$20,$00,$2C,$01,$50,$00,$01,$FF
	DB $9E,$7D,$00,$8C,$00,$24,$FF,$98,$FE,$02,$14,$00,$2C,$01,$50,$00,$01,$FF
	DB $B0,$7D,$00,$94,$00,$10,$FF,$98,$FE,$02,$08,$00,$2C,$01,$50,$00,$01,$FF
	DB $C2,$7D,$00,$A0,$00,$FC,$FE,$98,$FE,$02,$00,$00,$2C,$01,$50,$00,$00,$FF
	DB $00,$00,$00,$B0,$FF,$9C,$FF,$98,$FE,$02,$50,$00,$2C,$01,$50,$00,$01,$FE
	DB $00,$00,$00,$A8,$FF,$88,$FF,$98,$FE,$02,$44,$00,$2C,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$9C,$FF,$74,$FF,$98,$FE,$02,$3C,$00,$2C,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$94,$FF,$60,$FF,$98,$FE,$02,$30,$00,$2C,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$88,$FF,$4C,$FF,$98,$FE,$02,$28,$00,$2C,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$80,$FF,$38,$FF,$98,$FE,$02,$20,$00,$2C,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$74,$FF,$24,$FF,$98,$FE,$02,$14,$00,$2C,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$6C,$FF,$10,$FF,$98,$FE,$02,$08,$00,$2C,$01,$50,$00,$01,$FF
	DB $00,$00,$00,$60,$FF,$FC,$FE,$98,$FE,$02,$00,$00,$2C,$01,$50,$00,$00,$FF
	DB $E6,$7D,$00,$F1,$FF,$EA,$FF,$00,$00,$00,$05,$00,$14,$00,$14,$00,$01,$FF
	DB $F8,$7D,$00,$0F,$00,$EA,$FF,$00,$00,$00,$05,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$C7,$FF,$00,$00,$00,$14,$00,$14,$00,$14,$00,$02,$FF
	DB $00,$00,$00,$00,$00,$D8,$FF,$00,$00,$22,$78,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$22,$00,$48,$00,$00,$00,$22,$14,$00,$48,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$DE,$FF,$48,$00,$00,$00,$22,$14,$00,$48,$00,$28,$00,$01,$FF
	DB $52,$7E,$00,$32,$00,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $64,$7E,$00,$1A,$00,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $76,$7E,$00,$02,$00,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $88,$7E,$00,$EA,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $9A,$7E,$00,$D2,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $AC,$7E,$00,$BA,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $BE,$7E,$00,$A2,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $D0,$7E,$00,$8A,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $E2,$7E,$00,$72,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $00,$00,$00,$5A,$FF,$00,$00,$00,$00,$11,$18,$00,$18,$00,$18,$00,$01,$FF
	DB $06,$7F,$00,$13,$00,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $18,$7F,$00,$FB,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $2A,$7F,$00,$E3,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $3C,$7F,$00,$CB,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $4E,$7F,$00,$B3,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $60,$7F,$00,$9B,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $72,$7F,$00,$83,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $84,$7F,$00,$6B,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $96,$7F,$00,$53,$FF,$00,$00,$00,$00,$12,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $00,$00,$00,$3B,$FF,$00,$00,$00,$00,$11,$18,$00,$18,$00,$18,$00,$01,$FF
	DB $BA,$7F,$00,$F4,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $CC,$7F,$00,$DC,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $DE,$7F,$00,$C4,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $F0,$7F,$00,$AC,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $02,$80,$00,$94,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $14,$80,$00,$7C,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $26,$80,$00,$64,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $38,$80,$00,$4C,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $4A,$80,$00,$34,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $00,$00,$00,$1C,$FF,$00,$00,$00,$00,$21,$18,$00,$18,$00,$18,$00,$01,$FF
	DB $6E,$80,$00,$F4,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $80,$80,$00,$DC,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $92,$80,$00,$C4,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $A4,$80,$00,$AC,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $B6,$80,$00,$94,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $C8,$80,$00,$7C,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $DA,$80,$00,$64,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $EC,$80,$00,$4C,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $FE,$80,$00,$34,$FF,$00,$00,$00,$00,$22,$30,$00,$30,$00,$30,$00,$01,$FF
	DB $00,$00,$00,$1C,$FF,$00,$00,$00,$00,$21,$18,$00,$18,$00,$18,$00,$01,$FF
	DB $22,$81,$00,$00,$00,$00,$00,$F0,$00,$04,$E0,$01,$20,$03,$A0,$00,$01,$FF
	DB $34,$81,$00,$C0,$FE,$20,$FE,$00,$00,$04,$A0,$00,$A0,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$40,$01,$20,$FE,$00,$00,$04,$A0,$00,$A0,$00,$A0,$00,$04,$FF
	DB $58,$81,$00,$00,$00,$00,$00,$F0,$00,$04,$E0,$01,$20,$03,$A0,$00,$01,$FF
	DB $6A,$81,$00,$10,$FF,$10,$FF,$00,$00,$04,$A0,$00,$A0,$00,$A0,$00,$02,$FF
	DB $00,$00,$00,$F0,$00,$10,$FF,$00,$00,$04,$A0,$00,$A0,$00,$A0,$00,$04,$FF
	DB $8E,$81,$00,$9C,$FF,$C4,$FF,$00,$00,$02,$14,$00,$3C,$00,$14,$00,$01,$FF
	DB $A0,$81,$00,$64,$00,$C4,$FF,$00,$00,$02,$14,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$74,$FF,$00,$00,$02,$3C,$00,$14,$00,$14,$00,$01,$FF
	DB $C4,$81,$00,$00,$FF,$60,$FF,$28,$00,$03,$38,$00,$A0,$00,$F0,$00,$01,$FF
	DB $D6,$81,$00,$00,$01,$60,$FF,$28,$00,$03,$38,$00,$A0,$00,$F0,$00,$01,$FF
	DB $E8,$81,$00,$00,$00,$88,$FE,$28,$00,$03,$40,$01,$38,$00,$F0,$00,$01,$FF
	DB $00,$00,$08,$00,$00,$E8,$FE,$10,$FF,$03,$C8,$00,$00,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$F8,$FE,$10,$FF,$03,$C8,$00,$10,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$10,$FF,$10,$FF,$03,$C8,$00,$28,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$20,$FF,$10,$FF,$03,$C8,$00,$38,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$38,$FF,$10,$FF,$03,$C8,$00,$50,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$48,$FF,$10,$FF,$03,$C8,$00,$60,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$60,$FF,$10,$FF,$03,$C8,$00,$78,$00,$28,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$70,$FF,$10,$FF,$03,$C8,$00,$88,$00,$28,$00,$01,$FF
	DB $8A,$82,$00,$4C,$FF,$9C,$FF,$00,$00,$02,$14,$00,$64,$00,$DC,$00,$01,$FF
	DB $9C,$82,$00,$B4,$00,$9C,$FF,$00,$00,$02,$14,$00,$64,$00,$DC,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$24,$FF,$00,$00,$02,$C8,$00,$14,$00,$DC,$00,$01,$FF
	DB $00,$00,$0A,$00,$00,$00,$00,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$FB,$FF,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$F6,$FF,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$F1,$FF,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$EC,$FF,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$E7,$FF,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$E2,$FF,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$DD,$FF,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$00,$00,$00,$D8,$FF,$00,$00,$11,$5A,$00,$3C,$00,$50,$00,$01,$FF
	DB $00,$00,$0A,$D3,$FF,$00,$00,$00,$00,$10,$0F,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$19,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$23,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$2D,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$37,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$41,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$4B,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$55,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$5F,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$D3,$FF,$00,$00,$00,$00,$10,$69,$00,$14,$00,$14,$00,$01,$FF
	DB $00,$00,$0A,$EC,$FF,$00,$00,$00,$00,$11,$0A,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$14,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$1E,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$28,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$32,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$3C,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$46,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$50,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$5A,$00,$3C,$00,$14,$00,$01,$FF
	DB $00,$00,$00,$EC,$FF,$00,$00,$00,$00,$11,$64,$00,$3C,$00,$14,$00,$01,$FF
	DB $DC,$84,$00,$00,$00,$CE,$FF,$00,$00,$12,$14,$00,$14,$00,$14,$00,$04,$FF
	DB $EE,$84,$00,$00,$00,$D8,$FF,$00,$00,$12,$14,$00,$14,$00,$14,$00,$04,$FF
	DB $00,$85,$00,$00,$00,$E2,$FF,$00,$00,$12,$14,$00,$14,$00,$14,$00,$04,$FF
	DB $12,$85,$00,$00,$00,$EC,$FF,$00,$00,$12,$14,$00,$14,$00,$14,$00,$01,$FF
	DB $24,$85,$00,$00,$00,$F6,$FF,$00,$00,$12,$14,$00,$14,$00,$14,$00,$01,$FF
	DB $36,$85,$00,$00,$00,$0A,$00,$00,$00,$12,$14,$00,$14,$00,$14,$00,$01,$FF
	DB $48,$85,$00,$00,$00,$14,$00,$00,$00,$12,$14,$00,$14,$00,$14,$00,$01,$FF
	DB $5A,$85,$00,$00,$00,$1E,$00,$00,$00,$12,$14,$00,$14,$00,$14,$00,$02,$FF
	DB $6C,$85,$00,$00,$00,$28,$00,$00,$00,$12,$14,$00,$14,$00,$14,$00,$02,$FF
	DB $00,$00,$00,$00,$00,$32,$00,$00,$00,$12,$14,$00,$14,$00,$14,$00,$02,$FF
SuperFX4BPPPaletteBuffer:
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000
UnkData_7E858E:
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
UnkData_7E859E:
	DB $2A,$9A,$04,$89,$01,$84,$01,$83,$82,$82,$81,$81,$81,$81,$09,$81
	DB $01,$01,$01,$81,$82,$01,$82,$02,$83,$04,$86,$0A,$95,$43,$00,$00
	DB $00
UnkData_7E85BF:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
UnkData_7E8A0D:
	DW UnkData_7E859E
	DW UnkData_7E85BF
	DW DATA_7E85E1
	DW DATA_7E8603
	DW DATA_7E8626
	DW DATA_7E8649
	DW DATA_7E866D
	
	
	
	
	
	
	
UnkData_7E8A4D:
	DB $00,$00,$D1,$00,$B0,$00,$8F,$00,$6E,$00,$4D,$00,$2C,$00,$0B,$00
	DB $0A,$00,$09,$00,$08,$00,$07,$00,$06,$00,$05,$00,$04,$00,$FF,$7F
	DB $00,$00,$D1,$00,$B0,$00,$8F,$00,$6E,$00,$4D,$00,$2C,$00,$0B,$00
	DB $0A,$00,$09,$00,$08,$00,$07,$00,$06,$00,$05,$00,$04,$00,$00,$00
CreditsBossPreviewFont:
	DB $00,$1C,$00,$2C,$2B,$2A,$00,$00,$00,$00,$29,$00,$00,$27,$28,$00
	DB $1D,$1E,$1F,$20,$21,$22,$23,$24,$25,$26,$00,$00,$00,$00,$00,$00
	DB $00,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10
	DB $11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$00,$00,$FF,$7F
UnkData_7E8ACD:
	DB $FE,$36,$BD,$32,$7B,$2E,$79,$2E,$77,$26,$35,$1E,$F3,$15,$B1,$0D
	DB $6E,$01,$EE,$77,$C7,$00,$A6,$00,$85,$00,$43,$00
	END BASE
CopiedCodeBEnd:
MainLoop:
	sep #$20
	rep #$10
	lda.w FrameTimer
	sta.w $16A3
	stz.w FrameTimer
MainLoop_WaitNMITask:
	lda.b CurNMITask
	bne MainLoop_WaitNMITask
	stz.w $1F10
	lda.b #02
	sta.b CurNMITask
	jsr DoProcWipes
	jsl CODE_06BB5C
	jsr DoUpdateTiltScroll
	rep #$30
	lda.w $14FC
	sta.w $16C5
	lda.w $18B8
	beq CODE_02D99D
	ldx.w PlayerTempObject
	lda.b $0C,x
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	dec
	dec
	dec
	dec
	sta BG3HOFSMirror
CODE_02D99D:
	lda.w $16A2
	and.w #$00FF
	beq CODE_02D9E5
	cmp.w #$0001
	beq CODE_02D9C7
	lda.w $16A0
	clc
	adc.w ZTimerVel
	cmp.w #$01F4
	bcc CODE_02D9E2
	lda.w VerticalScrollBase
	cmp.w #$FEDA
	beq CODE_02D9E5
	dec
	sta.w VerticalScrollBase
	lda.w #$0000
	bra CODE_02D9E2
CODE_02D9C7:
	lda.w $16A0
	clc
	adc.w ZTimerVel
	cmp.w #$07D0
	bcc CODE_02D9E2
	lda.w VerticalScrollBase
	cmp.w #$00D4
	beq CODE_02D9E5
	inc
	sta.w VerticalScrollBase
	lda.w #$0000
CODE_02D9E2:
	sta.w $16A0
CODE_02D9E5:
	jsr DoUpdateShearScroll
	jsr DoCopyShearBufferToWram
	jsl CODE_02DB27
	sep #$20
	rep #$10
	lda.w $1FD1
	bne CODE_02D9FB
	inc.w $1F10
CODE_02D9FB:
	lda.w $177A
	bit.b #$01
	beq CODE_02DA05
	brl CODE_02DA08
CODE_02DA05:
	jsr UpdateObjects
CODE_02DA08:
	sep #$20
	lda.w Pad1HiCur
	sta.w $15A4
	lda.w Pad1LoCur
	sta.w $15A5
	jsl CODE_02F934
	jsl CODE_03B269
	jsl CODE_02F6FC
	jsl CODE_02F6DA
	jsl CODE_02F4E6
	jsl CODE_02F6D5
	jsl UpdateOAMBuffer
	jsr CODE_02DD0A
	jsl CODE_1FC03D
	sep #$20
CODE_02DA3B:
	lda.w $18BB
	beq CODE_02DA3B
	lda.w CurLoaderTasks
	beq CODE_02DA48
	jsr DoRunMainLoopLoaderTasks
CODE_02DA48:
	jsl CODE_02DC16
CODE_02DA4C:
	lda.w $18BB
	cmp.b #$02
	bne CODE_02DA4C
	stz.w $18BB
	rep #$30
	lda.w PointEffect
	sta.l $70019E
	beq CODE_02DA65
	jsl CODE_03BAF7
CODE_02DA65:
	jsl RenderSuperFXObjects
	jsr CODE_02E20D
	sep #$20
	lda.w $1FD1
	beq CODE_02DA76
	inc.w $1F10
CODE_02DA76:
	sep #$20
	lda.w FrameTimer
	sta.w $14E3
	lda.w $16A4
	clc
	adc.w $16A3
	sta.w $16A4
	inc.w $16A5
	lda.w $16A4
	cmp.b #$3C
	bcc CODE_02DAA4
	lda.w $16A5
	sta.w $16A6
	stz.w $16A5
	lda.w $16A4
	sec
	sbc.b #$3C
	sta.w $16A4
CODE_02DAA4:
	rtl
RunMainLoopLoaderTasks:
	jsr DoRunMainLoopLoaderTasks
	rtl
DoRunMainLoopLoaderTasks:
	lda.w $18BB
	cmp.b #$02
	bne DoRunMainLoopLoaderTasks
	sei
	lda.b CurNMITask
	stz.b CurNMITask
	pha
	lda.w TIMEUP
	cli
	sep #$20
	lda.w CurLoaderTasks
	bit.b #$01
	beq DoRunMainLoopLoaderTasks_SkRelChkpt
	jsl ReloadCheckpoint
DoRunMainLoopLoaderTasks_SkRelChkpt:
	rep #$30
	lda.w CurLoaderTasks
	bit.w #$0004
	beq DoRunMainLoopLoaderTasks_SkLdPreset
	jsl LoadPreset
DoRunMainLoopLoaderTasks_SkLdPreset:
	rep #$30
	lda.w CurLoaderTasks
	bit.w #$0008
	beq DoRunMainLoopLoaderTasks_SkIntPreset
	jsl InitPresetSettings
DoRunMainLoopLoaderTasks_SkIntPreset:
	sep #$20
	lda.w CurLoaderTasks
	and.b #$F2
	sta.w CurLoaderTasks
	pla
	sta.b CurNMITask
	rts
UpdateObjects:
	inc.w $15BB
	bne UpdateObjects_SkipCarry
	inc.w $15BC
UpdateObjects_SkipCarry:
	phb
	lda.b #$7E
	pha
	plb
	jsl CODE_0681D5
	jsl UpdateZTimer
	ldx FirstObject
UpdateObjects_L2:
	stz.w $1248
	jsl ProcObject
	lda.w $1248
	bne UpdateObjects_L4
	ldy.b $00,x
UpdateObjects_L3:
	tyx
	bne UpdateObjects_L2
	bra UpdateObjects_L5
UpdateObjects_L4:
	ldy.b $00,x
	jsl CODE_1FBFDC
	bra UpdateObjects_L3
UpdateObjects_L5:
	plb
	rts
CODE_02DB27:
	php
	sep #$20
	rep #$10
	jsr CODE_02DB31
	plp
	rtl
CODE_02DB31:
	stz.w $14C6
	lda.w $14C1
	sta.w $14C5
	rep #$20
	beq CODE_02DB4F
	ldx.w #$0008
	lda.w #$1481
CODE_02DB44:
	ror.w $14C5
	bcs CODE_02DB52
	adc.w #$0008
	dex
	bne CODE_02DB44
CODE_02DB4F:
	lda.w #$0000
CODE_02DB52:
	sta.w $16A7
	rts
;;;;;;;;;;;;;;;;;;;;;;;;;
;TILT AND SHEAR ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;
UpdateTiltScroll:
	jsr DoUpdateTiltScroll
	rtl
DoUpdateTiltScroll:
	rep #$30
	stz.w $1951
	lda.w BGTiltFlag
	and.w #$00FF
	bne DoUpdateTiltScroll_BGTiltEn
	rts
DoUpdateTiltScroll_BGTiltEn:
	lda.w BGTiltFlag
	and.w #$00FF
	bne DoUpdateTiltScroll_FGTiltEn
	lda.w #$0000
	bra DoUpdateTiltScroll_SkipLoadAng
DoUpdateTiltScroll_FGTiltEn:
	lda.w PlayerAngZ
	bmi DoUpdateTiltScroll_TiltNeg
DoUpdateTiltScroll_SkipLoadAng:
	xba
	and.w #$0007
	asl
	tax
	lda.l TiltScrollTable,x
	cmp.w PrevTiltScrollIndex
	bne DoUpdateTiltScroll_UpdatePos
	rts
DoUpdateTiltScroll_UpdatePos:
	sta.w PrevTiltScrollIndex
	tax
	ldy.w #$0000
DoUpdateTiltScroll_CopyPos:
	lda.b $00,x
	clc
	adc.w VerticalScroll
	sta.w TiltScrollBuffer,y
	iny
	iny
	inx
	inx
	cpy.w #$0040
	bne DoUpdateTiltScroll_CopyPos
	lda.w #$0001
	sta.w $1951
	rts
DoUpdateTiltScroll_TiltNeg:
	eor.w #$FFFF
	inc
	xba
	and.w #$0007
	asl
	tax
	lda.l TiltScrollTable,x
	cmp.w PrevTiltScrollIndex
	bne DoUpdateTiltScroll_UpdateNeg
	rts
DoUpdateTiltScroll_UpdateNeg:
	sta.w PrevTiltScrollIndex
	clc
	adc.w #$003E
	tax
	ldy.w #$0000
DoUpdateTiltScroll_CopyNeg:
	lda.b $00,x
	clc
	adc.w VerticalScroll
	sta.w TiltScrollBuffer,y
	dex
	dex
	iny
	iny
	cpy.w #$0040
	bne DoUpdateTiltScroll_CopyNeg
	lda.w #$0001
	sta.w $1951
	rts
CopyTiltScrollBuffer:
	php
	sep #$20
	rep #$10
	jsr DoCopyTiltScrollBuffer
	plp
	rtl
DoCopyTiltScrollBuffer:
	lda.b #$80
	sta.w VMAIN
	lda.b #$18
	sta.w BBAD0
	ldx.w #TiltScrollBuffer
	stx.w A1T0L
	stz.w A1B0
	ldx.w #$2FA0
	stx.w VMADDL
	ldx.w #$0040
	stx.w DAS0L
	lda.b #$01
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	rts
RunSuperFXClearUnknownGFX_02DC16:
	php
	sep #$20
	rep #$20
	lda.b #BANKOF(CODE_01B0CB)
	ldx.w #CODE_01B0CB
	jsl RunSuperFXRoutine
	plp
	rtl
RunSuperFXClearUnknownGFX_02DC26:
	php
	sep #$20
	rep #$20
	lda.b #BANKOF(CODE_01B0E2)
	ldx.w #CODE_01B0E2
	jsl RunSuperFXRoutine
	plp
	rtl
UpdateShearScroll:
	jsr DoUpdateShearScroll
	rtl
DoUpdateShearScroll:
	rep #$30
	lda.w ShearScrollFlag
	and.w #$00FF
	bne DoUpdateShearScroll_Enabled
	rts
DoUpdateShearScroll_Enabled:
	ldx.w ShearScrollType
	jmp (ShearScrollJumpTable,x)
ShearScrollJumpTable:
	DW ShearScroll_Normal
	DW ShearScroll_Tunnel2
	DW ShearScroll_Tunnel2
	DW ShearScroll_Tunnel
	DW ShearScroll_Tunnel2
	DW ShearScroll_Normal2
	DW ShearScroll_Warped
	DW ShearScroll_Normal2
ShearScroll_Warped:
	lda.b $C1
	sta.l $7000C6
	sep #$20
	lda.b #BANKOF(CalcShearScroll_Warped)
	ldx.w #CalcShearScroll_Warped
	jsl RunSuperFXRoutine
	rts
ShearScroll_Normal2:
	lda.b $C1
	sta.l $7000C6
	sep #$20
	lda.b #BANKOF(CalcShearScroll_Normal2)
	ldx.w #CalcShearScroll_Normal2
	jsl RunSuperFXRoutine
	rts
ShearScroll_Tunnel:
	lda.b $C1
	sta.l $7000C6
	sep #$20
	lda.b #BANKOF(CalcShearScroll_Tunnel)
	ldx.w #CalcShearScroll_Tunnel
	jsl RunSuperFXRoutine
	rts
ShearScroll_Normal:
	lda.w PlayerAngZ
	sta.l $7000C6
	ldx.w PlayerObject
	lda.b $0C,x
	sta.l InputVecY
	sep #$20
	lda.b #BANKOF(CalcShearScroll_Normal)
	ldx.w #CalcShearScroll_Normal
	jsl RunSuperFXRoutine
	rts
ShearScroll_Tunnel2:
	lda.b $C1
	sta.l $7000C6
	sep #$20
	lda.b #BANKOF(CalcShearScroll_Tunnel2)
	ldx.w #CalcShearScroll_Tunnel2
	jsl RunSuperFXRoutine
	rts
CopyShearBufferToWram:
	jsr DoCopyShearBufferToWram
	rtl
DoCopyShearBufferToWram:
	sep #$30
DoCopyShearBufferToWram_Wait:
	lda.w SLHV
	ldx.w OPHCT
	lda.w OPCHCT
	and.b #$01
	bne DoCopyShearBufferToWram_Wait
	cpx.b #$5A
	bcc DoCopyShearBufferToWram_Wait
	cpx.b #$64
	bcs DoCopyShearBufferToWram_Wait
	rep #$10
	sei
	ldx.w $18B6
	stx.w WMADDL
	stz.w WMADDH
	lda.b #$80
	sta.w BBAD0
	ldx.w #$0222
	stx.w A1T0L
	lda.b #$70
	sta.w A1B0
	ldx.w #$02A0
	stx.w DAS0L
	stz.b DMAP0
	lda.b #$01
	sta.w MDMAEN
	lda.w TIMEUP
	cli
	rts
	
CODE_02DD0A:
	sep #$20
	rep #$10
	ldx.w $1567
	lda.b $2A,x
	bpl CODE_02DD17
	lda.b #$00
CODE_02DD17:
	sta.l $7001B8
	lda.l $7001BA
	beq CODE_02DD35
	lda.l $7001BC
	dec
	dec
	bpl CODE_02DD2F
	lda.b #$00
	sta.l $7001BA
CODE_02DD2F:
	sta.l $7001BC
	bra CODE_02DD4A
CODE_02DD35:
	lda.l $7001BC
	cmp.b #$28
	beq CODE_02DD4A
	lda.l $7001BC
	inc
	sta.l $7001BC
	and.b #$0F
	beq CODE_02DD4A
CODE_02DD4A:
	rts
;;;;;;;;;;;;;;;
;WIPE ROUTINES;
;;;;;;;;;;;;;;;
ProcWipes:
	jsr DoProcWipes
	rtl
DoProcWipes:
	sep #$20
	stz.w $1FD0
	rep #$30
	ldx.w WipePointer
	bne DoProcWipes_L1
	sep #$20
	sep #$20
	lda.w $14C1
	and.b #$7F
	sta.w $14C1
	sep #$20
	rep #$10
	stz.w $1FD1
	rts
DoProcWipes_L1:
	rep #$20
	lda.l WipeScriptData,x
	and.w #$00FF
	txy
	tax
	jmp (WipeSubJumpTable,x)
WipeSubJumpTable:
	DW WipeCommand00_Init
	DW WipeCommand02_SetTimerEx
	DW WipeCommand04_SetBlueEx
	DW WipeCommand06_SetGreenEx
	DW WipeCommand08_SetRedEx
	DW WipeCommand0A_WaitBlue
	DW WipeCommand0C_WaitGreen
	DW WipeCommand0E_WaitRed
	DW WipeCommand10_WaitTimer
	DW WipeCommand12_End
	DW WipeCommand14_Nop
	DW WipeCommand16_SetBlue
	DW WipeCommand18_SetGreen
	DW WipeCommand1A_SetRed
	DW WipeCommand1C_Nop
	DW WipeCommand1E_SetTimer
	DW WipeCommand20
	DW WipeCommand22_SetShape
	DW WipeCommand24
	DW WipeCommand26_Jump
	DW ProcWipes_Sub28_End
WipeCommand26_Jump:
	tyx
	lda.l WipeScriptData+1,x
	sta.w WipePointer
	tax
	jmp DoProcWipes_L1
WipeCommand00_Init:
	tyx
	stz.w WipeTimer
	stz.w WipeTimerTarget
	sep #$20
	stz.w WipeBlueTarget
	stz.w WipeBlue
	stz.w WipeRedTarget
	stz.w WipeRed
	stz.w WipeGreenTarget
	stz.w WipeGreen
	lda.b #$27
	sta.w $1F68
	inx
	stx.w WipePointer
	jmp DoProcWipes_L1
WipeCommand02_SetTimerEx:
	tyx
	lda.l WipeScriptData+1,x
	sta.w WipeTimerTarget
	lda.l WipeScriptData+3,x
	sta.w WipeTimerDelta
	lda.l WipeScriptData+5,x
	sta.w WipeTimerDelta2
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp DoProcWipes_L1
WipeCommand04_SetBlueEx:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	sta.w WipeBlueTarget
	lda.l WipeScriptData+2,x
	sta.w $16BE
	sta.w $16C1
	lda.l WipeScriptData+3,x
	sta.w WipeBlueDelta
	inx
	inx
	inx
	inx
	jmp DoProcWipes_L1
WipeCommand06_SetGreenEx:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	sta.w WipeGreenTarget
	lda.l WipeScriptData+2,x
	sta.w $16BF
	sta.w $16C2
	lda.l WipeScriptData+3,x
	sta.w WipeGreenDelta
	inx
	inx
	inx
	inx
	jmp DoProcWipes_L1
WipeCommand08_SetRedEx:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	sta.w WipeRedTarget
	lda.l WipeScriptData+2,x
	sta.w $16C0
	sta.w $16C3
	lda.l WipeScriptData+3,x
	sta.w WipeRedDelta
	inx
	inx
	inx
	inx
	jmp DoProcWipes_L1
WipeCommand0A_WaitBlue:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	cmp.w WipeBlue
	beq WipeCommand0A_Continue
	brl UpdateWipeColor
WipeCommand0A_Continue:
	inx
	inx
	stx.w $16AF
	jmp DoProcWipes_L1
WipeCommand0C_WaitGreen:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	cmp.w WipeGreen
	beq WipeCommand0C_Continue
	brl UpdateWipeColor
WipeCommand0C_Continue:
	inx
	inx
	stx.w WipePointer
	jmp DoProcWipes_L1
WipeCommand0E_WaitRed:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	cmp.w WipeRed
	beq WipeCommand0E_Continue
	brl UpdateWipeColor
WipeCommand0E_Continue:
	inx
	inx
	stx.w WipePointer
	jmp DoProcWipes_L1
WipeCommand10_WaitTimer:
	tyx
	lda.l WipeScriptData+1,x
	cmp.w WipeTimer
	beq WipeCommand10_Continue
	brl UpdateWipeColor
WipeCommand10_Continue:
	inx
	inx
	stx.w WipePointer
	jmp DoProcWipes_L1
WipeCommand12_End:
	stz.w $16A9
	stz.w WipePointer
	stz.w WipeTimer
	jmp UpdateWipeColor
WipeCommand14_Nop:
	tyx
	inx
	stx.w WipePointer
	jmp UpdateWipeColor
WipeCommand16_SetBlue:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	sta.w WipeBlue
	inx
	inx
	jmp DoProcWipes_L1
WipeCommand18_SetGreen:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	sta.w WipeGreen
	inx
	inx
	jmp DoProcWipes_L1
WipeCommand1A_SetRed:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	sta.w WipeRed
	inx
	inx
	jmp DoProcWipes_L1
WipeCommand1C_Nop:
	tyx
	inx
	stx.w WipePointer
	jmp UpdateWipeColor
WipeCommand1E_SetTimer:
	tyx
	lda.l WipeScriptData+1,x
	sta.w WipeTimer
	inx
	inx
	inx
	jmp DoProcWipes_L1
WipeCommand20:
	tyx
	sep #$20
	lda.l WipeScriptData+1,x
	sta.w $1F68
	inx
	inx
	jmp DoProcWipes_L1
UpdateWipeColor:
	rep #$20
	lda.w WipeTimer
	cmp.w WipeTimerTarget
	beq CODE_02DF47
	bcc CODE_02DF3B
	sec
	sbc.w WipeTimerDelta
	cmp.w WipeTimerTarget
	bcs CODE_02DF47
	lda.w WipeTimerTarget
	bra CODE_02DF47
CODE_02DF3B:
	clc
	adc.w WipeTimerDelta
	cmp.w WipeTimerTarget
	bcc CODE_02DF47
	lda.w WipeTimerTarget
CODE_02DF47:
	cmp.w #$0000
	bne CODE_02DF4F
	lda.w #$0001
CODE_02DF4F:
	sta.w WipeTimer
	sta.l DesiredXRot
	lda.w WipeTimerDelta
	beq CODE_02DF62
	clc
	adc.w WipeTimerDelta2
	sta.w WipeTimerDelta
CODE_02DF62:
	sep #$20
	lda.w $16BE
	dec
	sta.w $16BE
	bne UpdateWipeColor_SkipBlue
	lda.w $16C1
	sta.w $16BE
	lda.w WipeBlue
	cmp.w WipeBlueTarget
	beq UpdateWipeColor_BlueUpd
	bcc UpdateWipeColor_BlueAdd
	sec
	sbc.w WipeBlueDelta
	bpl UpdateWipeColor_BlueOver
	lda.b #$00
UpdateWipeColor_BlueOver:
	cmp.w WipeBlueTarget
	bcs UpdateWipeColor_BlueUpd
	lda.w WipeBlue
	bra UpdateWipeColor_BlueUpd
UpdateWipeColor_BlueAdd:
	clc
	adc.w WipeBlueDelta
	cmp.w WipeBlueTarget
	bcc UpdateWipeColor_BlueUpd
	lda.w WipeBlue
UpdateWipeColor_BlueUpd:
	sta.w WipeBlue
UpdateWipeColor_SkipBlue:
	lda.w $16BF
	dec
	sta.w $16BF
	bne UpdateWipeColor_SkipGreen
	lda.w $16C2
	sta.w $16BF
	lda.w WipeGreen
	cmp.w WipeGreenTarget
	beq UpdateWipeColor_GreenUpd
	bcc UpdateWipeColor_GreenAdd
	sec
	sbc.w WipeGreenDelta
	bpl UpdateWipeColor_GreenOver
	lda.b #$00
UpdateWipeColor_GreenOver:
	cmp.w WipeGreenTarget
	bcs UpdateWipeColor_GreenUpd
	lda.w WipeGreen
	bra UpdateWipeColor_GreenUpd
UpdateWipeColor_GreenAdd:
	clc
	adc.w WipeGreenDelta
	cmp.w WipeGreenTarget
	bcc UpdateWipeColor_GreenUpd
	lda.w WipeGreen
UpdateWipeColor_GreenUpd:
	sta.w WipeGreen
UpdateWipeColor_SkipGreen:
	lda.w $16C0
	dec
	sta.w $16C0
	bne UpdateWipeColor_SkipRed
	lda.w $16C3
	sta.w $16C0
	lda.w WipeRed
	cmp.w WipeRedTarget
	beq UpdateWipeColor_RedUpd
	bcc UpdateWipeColor_RedAdd
	sec
	sbc.w WipeRedDelta
	bpl UpdateWipeColor_RedOver
	lda.b #$00
UpdateWipeColor_RedOver:
	cmp.w WipeRedTarget
	bcs UpdateWipeColor_RedUpd
	lda.w WipeRed
	bra UpdateWipeColor_RedUpd
UpdateWipeColor_RedAdd:
	clc
	adc.w WipeRedDelta
	cmp.w WipeRedTarget
	bcc UpdateWipeColor_RedUpd
	lda.w WipeRed
UpdateWipeColor_RedUpd:
	sta.w WipeRed
UpdateWipeColor_SkipRed:
	rep #$20
	ldx.w $16A9
	beq CODE_02E038
	lda.w #$0000
	jsl CODE_03DC8A
	lda.b $72
	clc
	adc.w #$0010
	sta.b $72
	sta.l OutputVecX
	lda.b $74
	clc
	adc.w #$0010
	sta.l OutputVecY
	bra CODE_02E048
CODE_02E038:
	lda.w #$0080
	sta.l OutputVecX
	sta.b $72
	lda.w #$0070
	sta.l OutputVecY
CODE_02E048:
	sep #$20
	sep #$20
	rep #$10
	lda.w $14C1
	ora.b #$80
	sta.w $14C1
	ldx.w #$14B9
	sep #$20
	rep #$10
	stz.b $00,x
	lda.w WipeBlue
	sta.b $03,x
	lda.w WipeGreen
	sta.b $02,x
	lda.w WipeRed
	sta.b $01,x
	lda.b #$10
	sta.b $05,x
	lda.w $1F68
	sta.b $06,x
	stz.b $04,x
	lda.b #BANKOF(RenderCircularWipe)
	ldx.w #RenderCircularWipe
	jsl RunSuperFXRoutine
CODE_02E082:
	sep #$20
	phb
	lda.b #$7E
	pha
	plb
	ldx.w #$017E
	ldy.w #$0240
	lda.w $18A9
	beq CODE_02E0AB
CODE_02E094:
	lda.l WipeWindowBuffer,x
	sta.w $416B,y
	lda.l WipeWindowBuffer2,x
	sta.w $416A,y
	dey
	dey
	dey
	dex
	dex
	bpl CODE_02E094
	plb
	rts
CODE_02E0AB:
	lda.l WipeWindowBuffer,x
	sta.w $43AF,y
	lda.l WipeWindowBuffer2,x
	sta.w $43AE,y
	dey
	dey
	dey
	dex
	dex
	bpl CODE_02E0AB
	plb
	rts
WipeScriptData:
	DB $00
	DB $00
	DB $02,$C8,$00,$04,$00,$00,$00
	DB $04,$1F,$03,$01
	DB $06,$1F,$03,$01
	DB $16,$0E
	DB $18,$0E
	DB $1A,$0E
	DB $14
	DB $10,$C8,$00
	DB $04,$00,$01,$02
	DB $06,$00,$01,$02
	DB $02,$F4,$01,$04,$00,$00,$00
	DB $14
	DB $0A,$00
	DB $08,$00,$01,$02
	DB $14
	DB $0E,$00
	DB $12
	DB $00
	DB $1E,$29,$01
	DB $16,$1C
	DB $18,$1C
	DB $1A,$1C
	DB $1C
	DB $1E,$00,$00
	DB $02,$09,$00,$09,$00,$00,$00
	DB $04,$1F,$07,$01
	DB $06,$1F,$0F,$01
	DB $08,$1F,$03,$01
	DB $16,$1C
	DB $18,$1C
	DB $1A,$1C
	DB $1C
	DB $02,$87,$00,$09,$00,$00,$00
	DB $08,$00,$01,$02
	DB $14
	DB $10,$87,$00
	DB $02,$29,$01,$09,$00,$00,$00
	DB $04,$00,$01,$01
	DB $06,$00,$01,$01
	DB $08,$00,$01,$01
	DB $16,$0E
	DB $18,$0E
	DB $1A,$0E
	DB $14
	DB $10,$AB,$00
	DB $04,$00,$01,$01
	DB $06,$00,$01,$01
	DB $14
	DB $0A,$00
	DB $02,$0A,$00,$04,$00,$00,$00
	DB $08,$00,$01,$01
	DB $14
	DB $10,$00,$00
	DB $12
	DB $00
	DB $02,$C5,$00,$12,$00,$FF,$FF
	DB $08,$1F,$01,$01
	DB $1A,$0E
	DB $14
	DB $10,$2C,$01
	DB $12
	DB $00
	DB $20,$22
	DB $02,$C8,$00,$04,$00,$00,$00
	DB $04,$1F,$03,$01
	DB $06,$1F,$03,$01
	DB $08,$1F,$03,$01
	DB $16,$0E
	DB $18,$0E
	DB $1A,$0E
	DB $14
	DB $10,$C8,$00
	DB $04,$00,$01,$02
	DB $06,$00,$01,$02
	DB $14
	DB $0A,$00
	DB $08,$00,$01,$02
	DB $14
	DB $0E,$00
	DB $12
	DB $22,$82,$81
	DB $24
	DB $22,$A4,$86
	DB $24
	DB $26,$06,$01
	DB $28
	DB $22,$00,$80
	DB $24
	DB $28
	DB $22,$13,$84
	DB $24
	DB $28
	DB $22,$CA,$86
	DB $24
	DB $28
WipeCommand22_SetShape:
	tyx
	rep #$20
	lda.l WipeScriptData+1,x
	sta.w WipeWindowShape
	inx
	inx
	inx
	stx WipePointer
WipeCommand24:
	sep #$20
	inc.w $1FD0
	rts
ProcWipes_Sub28_End:
	stz.w WipePointer
	sep #$20
	sep #$20
	lda.w $14C1
	and.b #$FE
	sta.w $14C1
	sep #$20
	rep #$10
	rts
UpdateWipeWindow:
	jsr DoUpdateWipeWindow
	rtl
DoUpdateWipeWindow:
	sep #$20
	lda.w $1FD0
	bne CODE_02E215
	rts
CODE_02E215:
	rep #$20
	lda.w WipeWindowShape
	sta.l OutputVecY
	sep #$20
	lda.b #$01
	ldx.w #$D68B
	jsl RunSuperFXRoutine
	rep #$20
	rep #$10
	lda.l OutputVecY
	sta.w WipeWindowShape
	sep #$20
	lda.b #$01
	sta.w $1FD1
	sep #$20
	rep #$10
	lda.w $14C1
	ora.b #$01
	sta.w $14C1
	ldx.w #$1481
	sep #$20
	rep #$10
	lda.l OutputVecX
	sta.b $06,x
	rep #$20
	lda.w WipeWindowShape
	cmp.w #$0001
	bne CODE_02E261
	inc.w WipePointer
CODE_02E261:
	sep #$20
	jmp CODE_02E082
InitPlayerStateEx:
	php
	sep #$20
	lda.b #$28
	sta.w $189F
	sta.w $18A2
	sta.w $18A0
	sta.w $18A1
	sta.w $18A3
	sta.w $18A4
	jsl ReloadPlayerState
	jsl InitPlayerState
	rep #$30
	stz.w $1F69
	stz.w $1FBB
	stz.w $173C
	lda.w #$F0D0
	sta.l InputVecX
	lda.w #$1000
	sta.l InputVecY
	lda.w #$0000
	sta.l $700090
	sep #$20
	lda.b #$17
	sta.l $700064
	lda.b #$01
	ldx.w #$B301
	jsl RunSuperFXRoutine
	rep #$20
	ldx.w #$0000
InitPlayerStateEx_L1:
	lda.l $701000,x
	sta.l $7F0000,x
	inx
	inx
	cpx.w #$2000
	bne InitPlayerStateEx_L1
	plp
	rtl
MainGameInit:
	php
	phb
	sep #$20
	lda.b #$00
	pha
	plb
	sei
	sep #$20
	stz.w HDMAEN
	lda.b #$80
	jsl CODE_02F8DF
	sta.w INIDISP
	stz.w FadeMode
	stz.w FadeTimer
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
	rep #$30
	stz.w $1FD2
	stz.w WipePointer
	stz.w ZTimer
	stz.w PlayerPrevZPos
	stz.w ZTimerVel
	stz.b $C5
	lda.b #$01
	sta.l RenderHUDFlag
	stz.w $1FD2
	stz.w Pad1HiPrev
	stz.w SEQueuePtrOld
	stz.w SEQueuePtr
	stz.w $1F51
	sep #$20
	lda.b #$01
	sta.w $15AC
	stz.w $1956
	stz.w $189D
	stz.w $189E
	stz.w $1F14
	stz.w $1FCD
	stz.w $1FCE
	stz.w $14C1
	stz.w $1FCF
	stz.w $1F52
	stz.w $1F51
	stz.w $1FDE
	jsl ClearObjectList
	jsl CODE_0AF94C
	lda.w LevelScriptBank
	pha
	lda.l InitPlayersScriptPointer+2
	sta.w LevelScriptBank
	rep #$30
	lda.w LevelScriptPointer
	pha
	lda.l InitPlayersScriptPointer
	tax
	jsl RunLevelScript
	sep #$20
	jsl CODE_068004
	rep #$10
	plx
	pla
	sta.w LevelScriptBank
	rep #$20
	stz.w $1FD2
	stx.w LevelScriptPointer
	jsl RunLevelScript
	jsl CODE_02E39A
	jsl CODE_02DB27
	plb
	plp
	rtl
CODE_02E39A:
	php
	rep #$20
	lda.w #$1234
	sta.l $7001FE
	lda.w #$0001
	sta.l ClearFramebufferFlag
	jsl CODE_02F125
	sep #$20
	lda.b #$80
	sta.b $9C
	lda.b #$FF
	sta.w $15BF
	stz.b CurNMITask
	sep #$30
	jsr CODE_02F3FE
	jml CODE_03B82D
MainGame:
	sep #$30
	jsl MainGameInit
MainGame_L1:
	sep #$20
	sep #$20
	lda.w $1FE7
	bne MainGame_SkipPause
	lda.w $14D6
	bit.b #$20
	bne MainGame_SkipPause
	lda.w $14D3
	and.b #$10
	bne MainGame_SkipPause
	lda.w $14DD
	and.b #$20
	bne MainGame_SkipPause
	lda.w Pad1HiPrev
	bit.b #$10
	beq MainGame_SkipPause
	jsr PauseGame
MainGame_SkipPause:
	jsl CODE_02FD84
	jsl CODE_1FBDB0
	jsl MainLoop
	jsl CODE_03EA26
	rep #$20
	lda.w $1FD2
	beq MainGame_L1
	cmp.w #$000A
	bne MainGame_NextStage
	brl MainGame_GameOver
MainGame_NextStage:
	inc.w StageID
	sep #$20
	lda.b #$01
	sta.w $15A8
	stz.w $15AB
	lda.w $1FD2
	cmp.b #$05
	beq MainGame_L5
	cmp.b #$0B
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
UpdatePRNG:
	jsr DoUpdatePRNG
	rtl
DoUpdatePRNG:
	lda.b PRNGBuffer
	clc
	sbc.b PRNGBuffer+1
	sta.b PRNGBuffer+1
	sbc.b PRNGBuffer+2
	sta.b PRNGBuffer+2
	sbc.b PRNGBuffer+3
	sta.b PRNGBuffer+3
	sbc.b PRNGBuffer
	sta.b PRNGBuffer
	rts
Muliply8By16:
	jsr DoMuliply8By16
	rtl
DoMuliply8By16:
	stz.b TempZero
	stz.b TempZero+1
	stz.b TempProduct+1
	lda.b TempMultiplier
	bmi DoMuliply8By16_MerNeg
	asl
	sta.w WRMPYA
	lda.b TempMultiplicand+1
	bmi DoMuliply8By16_MandNeg
	lda.b TempMultiplicand
	sta.w WRMPYB
	nop
	nop
	lda.b TempMultiplicand+1
	jmp DoMuliply8By16_AddRes
DoMuliply8By16_MandNeg:
	lda.b #$00
	sec
	sbc.b TempMultiplicand
	sta.w WRMPYB
	lda.b #$00
	sbc.b TempMultiplicand+1
	jmp DoMuliply8By16_SubRes
DoMuliply8By16_MerNeg:
	eor.b #$FF
	inc
	asl
	sta.w WRMPYA
	lda.b TempMultiplicand+1
	bmi DoMuliply8By16_MandNeg2
	lda.b TempMultiplicand
	sta.w WRMPYB
	nop
	nop
	nop
	lda.b TempMultiplicand+1
DoMuliply8By16_SubRes:
	ldy.w RDMPYH
	sta.w WRMPYB
	sty.b TempProduct
	rep #$20
	lda.b TempZero
	sec
	sbc.w RDMPYL
	sec
	sbc.b TempProduct
	jmp DoMuliply8By16_Exit
DoMuliply8By16_MandNeg2:
	lda.b #$00
	sec
	sbc.b TempMultiplicand
	sta.w WRMPYB
	nop
	nop
	lda.b #$00
	sbc.b TempMultiplicand+1
DoMuliply8By16_AddRes:
	ldy.w RDMPYH
	sta.w WRMPYB
	sty.b TempProduct
	rep #$20
	lda.b TempZero
	adc.w RDMPYL
	clc
	adc.b TempProduct
DoMuliply8By16_Exit:
	sta.b TempProduct
	sep #$20
	rts
RunSuperFXCalculateAtan2:
	jsr DoRunSuperFXCalculateAtan2
	rep #$20
	rtl
DoRunSuperFXCalculateAtan2:
	phx
	php
	rep #$20
	lda.b TempVecX
	sta.l InputVecX
	lda.b TempVecY
	sta.l InputVecY
	sep #$20
	rep #$10
	lda.b #BANKOF(CalculateAtan2)
	ldx.w #CalculateAtan2
	jsl RunSuperFXRoutine
	rep #$20
	lda.l $700040
	plp
	plx
	rts
	
	
	
	
	
	
	
	
	
	
	
	
