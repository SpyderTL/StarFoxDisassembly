	;THE FOLLOWING CODE GETS COPIED TO RAM AT $7E3193 (ORIGINALLY AT $028000)
CopiedCodeB:
	BASE $7E3193
CopiedCodeBBase:
RunNMITask:
	ldx D,CurNMITask
	jmp (NMITaskJumpTable,x)
NMITaskJumpTable:
	DW CODE_7E3AF4	;
	DW CODE_7E3AFD	;
	DW CODE_7E3B46	;
	DW CODE_7E3BAA	;
	DW CODE_7E3510	;
	DW CODE_7E3831	;
	DW CODE_7E383A	;
	DW CODE_7E3843	;
	DW CODE_7E32B2	;
	DW CODE_7E3308	;
	DW CODE_7E33BA	;
	DW CODE_7E335F	;
	DW CODE_7E38DF	;
	DW CODE_7E39EA	;
	DW CODE_7E3A39	;
	DW CODE_7E3A98	;
	DW CODE_7E39DB	;
	DW CODE_7E33EA	;
	DW InitializeMode1
	DW InitializeMode2
InitializeMode1:
	rep #$10
	lda #$0A
	sta $120E
	sta HDMAEN
	lda #$01
	sta BGMODE
	stz $18C2
	lda #$13
	sta TM
	lda #$74
	sta BG3SC
	lda #$07
	sta BG34NBA
	stz BG2VOFS
	stz BG2VOFS
	stz $18B8
	stz $1F0E
	stz $1F0B
	stz $16A2
	lda #$01
	sta $1897
	jsl CODE_02F492
	rep #$20
	lda #$8FAA
	sta $004F
	sep #$20
	rep #$10
	rep #$20
	lda #$0080
	stz $01B0
	stz $1EEB
	stz $1F09
	stz $169E
	lda #$0000
	sta $A05C
	sep #$20
	stz $1FC6
	stz $1EF1
	stz $1FE4
	stz D,CurNMITask
	rtl
InitializeMode2:
	rep #$10
	lda #$0A
	sta $120E
	sta HDMAEN
	lda #$02
	sta BGMODE
	stz $18C2
	lda #$13
	sta TM
	stz BG3SC
	stz BG3HOFS
	stz BG3HOFS
	stz BG3VOFS
	stz BG3VOFS
	lda #$2F
	sta BG3SC
	lda #$E0
	sta BG3HOFS
	stz BG3VOFS
	stz BG2VOFS
	stz BG2VOFS
	stz $18B8
	stz $1F0E
	stz $1F0B
	stz $16A2
	lda #$01
	sta $1897
	jsl CODE_02F492
	rep #$20
	lda #$8FAA
	sta $700050
	sep #$20
	rep #$10
	rep #$20
	lda #$0080
	sta $7001B0
	stz $1EEB
	stz $1F09
	stz $169E
	lda #$0000
	sta $7EA05C
	sep #$20
	stz $7FE4
	stz $1FC6
	stz $1EF1
	stz D,CurNMITask
	rtl
CODE_7E32B2:
	rep #$10
	lda #$22		;\Transfer to CGRAM
	sta BBAD0		;/
	lda #$00
	sta CGADD
	ldx $1892		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda $1894		;|
	sta A1B0		;/
	ldx $1895		;\Set DMA data size
	stx DAS0L		;/
	stz DMAP0		; Set DMA configuration
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188A
	stx VMADDL
	ldx #$2800		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx $188C		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	inc D,CurNMITask
	inc D,CurNMITask
	rtl
CODE_7E3308:
	rep #$10
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188E
	stx VMADDL
	ldx #$4000		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx $1890		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	lda #$22		;\Transfer to CGRAM
	sta BBAD0		;/
	lda #$70
	sta CGADD
	rep #$20
	lda #$857E		;\Set source address (A-Bus)
	sta A1T0L		;|
	sep #$20		;|
	lda #$7E		;|
	sta A1B0		;/
	ldx #$0020		;\Set DMA data size
	stx DAS0L		;/
	stz DMAP0		; Set DMA configuration
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	stz D,CurNMITask
	rtl
CODE_7E335F:
	rep #$10
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188A
	stx VMADDL
	ldx #$2800		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx $188C		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188E
	stx VMADDL
	ldx #$4000		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx $1890		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	stz D,CurNMITask
	rtl
CODE_7E33BA:
	rep #$10
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188A
	stx VMADDL
	ldx #$2800		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx $188C		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	stz D,CurNMITask
	rtl
CODE_7E33EA:
	lda $1FE5
	bne CODE_7E33F2
	brl CODE_7E34F6
CODE_7E33F2:
	dec
	bne CODE_7E33F8
	brl CODE_7E34BA
CODE_7E33F8:
	dec
	bne CODE_7E33FE
	brl CODE_7E348B
CODE_7E33FE:
	dec
	bne CODE_7E3404
	brl CODE_7E345C
CODE_7E3404:
	rep #$10
	ldx D,$4C
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	stx VMADDL
	ldx #$2C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx #$4000		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	rep #$20
	lda #$0000
	cmp D,$4A
	beq CODE_7E3442
	sta D,$4A
	lda #$3000
	sta D,$4C
	bra CODE_7E3449
CODE_7E3442:
	sta D,$4C
	lda #$3000
	sta D,$4A
CODE_7E3449:
	sep #$20
	lda D,$4B
	lsr
	lsr
	lsr
	lsr
	ora #$50
	sta BG12NBA
	stz $1FE5
	brl CODE_7E34F6
CODE_7E345C:
	rep #$10
	ldx #$6020
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD7		;/
	stx VMADDL
	ldx #$4C00		;\Set source address (A-Bus)
	stx A1T7L		;|
	lda #$70		;|
	sta A1B7		;/
	ldx #$1000		;\Set DMA data size
	sta DAS7L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP7		;/
	lda #$80		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E34E9
CODE_7E348B:
	rep #$10
	ldx #$5820
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD7		;/
	stx VMADDL
	ldx #$3C00		;\Set source address (A-Bus)
	stx A1T7L		;|
	lda #$70		;|
	sta A1B7		;/
	ldx #$1000		;\Set DMA data size
	sta DAS7L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP7		;/
	lda #$80		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E34E9
CODE_7E34BA:
	rep #$10
	ldx #$5020
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD7		;/
	stx VMADDL
	ldx #$2C00		;\Set source address (A-Bus)
	stx A1T7L		;|
	lda #$70		;|
	sta A1B7		;/
	ldx #$1000		;\Set DMA data size
	sta DAS7L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP7		;/
	lda #$80		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E34E9
CODE_7E34E9:
	lda $1FE5
	inc
	cmp #$04
	bne CODE_7E34F3
	lda #$00
CODE_7E34F3:
	sta $1FE5
CODE_7E34F6:
	lda $7EF0C6
	cmp #$FF
	beq CODE_7E350C
	and #$1F
	beq CODE_7E350C
	dec
	ora #$E0
	sta COLDATA
	sta $7EF0C6
CODE_7E350C:
	jsr CODE_7E4021
	rtl
CODE_7E3510:
	sep #$20
	lda #$01
	sta D,$FD
	rep #$10
	lda #$04		;\Transfer to OAM
	sta BBAD0		;/
	ldx #$0000
	stx OAMADDL
	ldx #$1261		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$00		;|
	sta A1B0		;/
	ldx #$0070		;\Set DMA data size
	stx DAS0L		;/
	lda #$00		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	lda $1FE5
	bne CODE_7E3546
	brl CODE_7E3631
CODE_7E3546:
	dec
	bne CODE_7E354C
	brl CODE_7E358B
CODE_7E354C:
	dec
	beq CODE_7E35BB
	dec
	bne CODE_7E3555
	brl CODE_7E35F0
CODE_7E3555:
	rep #$20
	lda D,$4C
	clc
	adc #$1800
	tax
	sep #$20
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	stx VMADDL
	ldx #$5C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx #$1000		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	brl CODE_7E3623
CODE_7E358B:
	sep #$20
	rep #$10
	ldx D,$4C
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	stx VMADDL
	ldx #$2C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx #$1000		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E3623
CODE_7E35BB:
	rep #$20
	lda D,$4C
	clc
	adc #$0800
	tax
	sep #$20
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	stx VMADDL
	ldx #$3C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx #$1000		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E3623
CODE_7E35F0:
	rep #$20
	lda D,$4C
	clc
	adc #$1000
	tax
	sep #$20
	lda #$80
	sta VMAIN
	lda #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx #$4C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda #$70		;|
	sta A1B0		;/
	ldx #$1000		;\Set DMA data size
	stx DAS0L		;/
	lda #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda #$01		;\Do DMA
	sta MDMAEN		;/
CODE_7E3623:
	lda $1FE5
	inc
	sta $1FE5
	cmp #$05
	bne CODE_7E3631
	stz $1FE5
CODE_7E3631:
	lda $15C2
	pha
	ldx #$0010
	lda $0034
	bit #$01
	beq CODE_7E3667
	clc
	adc #$40
	sta $0034
	rol
	bcc $3667
	rep #$20
	stz $1261,x
	stz $1265,x
	stz $1269,x
	stz $126D,x
	stz $1263,x
	stz $1267,x
	stz $126B,x
	stz $126F,x
	sep #$20
	brl CODE_7E371A
	lda $0033
	cmp $0039
	bmi CODE_7E36AE
	lda $0032
	sec
	sbc $0038
	beq CODE_7E36A4
	bcc CODE_7E3690
	sta $15C2
	lda $0033
	sec
	sbc $0039
	beq CODE_7E368B
	cmp $15C2
	bne CODE_7E36A4
CODE_7E368B:
	dec $0032
	bra CODE_7E36A4
CODE_7E3690:
	sta $15C2
	lda $003A
	sec
	sbc $0033
	beq CODE_7E36A1
	cmp $15C2
	bne CODE_7E36A4
CODE_7E36A1:
	inc $0032
CODE_7E36A4:
	lda $0033
	cmp $0039
	beq CODE_7E36C1
	bpl CODE_7E36BE
CODE_7E36AE:
	inc $0033
	lda $0032
	cmp $0038
	beq CODE_7E36C1
	inc $0033
	bra CODE_7E36C1
CODE_7E36BE:
	dec $0033
CODE_7E36C1:
	lda $0032
	clc
	adc #$08
	sta $1261,x
	sta $1269,x
	clc
	adc #$08
	sta $1265,x
	sta $126D,x
	lda $0033
	clc
	adc #$08
	sta $1262,x
	sta $1266,x
	clc
	adc #$08
	sta $126A,x
	sta $126E,x
	lda $0036
	beq CODE_7E36F7
	dec
	beq CODE_7E36FB
	lda #$0D
	bra CODE_7E36FD
CODE_7E36C7:
	lda #$09
	bra CODE_7E36FD
CODE_7E36FB:
	lda #$05
CODE_7E36FD:
	sta $1263,x
	inc
	sta $1267,x
	inc
	sta $126B,x
	inc
	sta $126F,x
	lda #$3E
	sta $1264,x
	sta $1268,x
	sta $126C,x
	sta $1270,x
CODE_7E371A:
	lda $16ED
	bne CODE_7E3722
	brl CODE_7E379E
CODE_7E3722:
	ldx #$0000
	lda $16E4
	sec
	sbc #$0F
	sta $1261,x
	sta $1265,x
	clc
	adc #$08
	sta $1269,x
	sta $126D,x
	lda $16E6
	sta $1262,x
	sta $126A,x
	clc
	adc #$08
	sta $1266,x
	sta $126E,x
	lda $1263,x
	cmp #$11
	bne CODE_7E3757
	lda #$15
	bra CODE_7E3759
CODE_7E3757:
	lda #$11
CODE_7E3759:
	sta $1263,x
	inc
	sta $126B,x
	inc
	sta $1267,x
	inc
	sta $126F,x
	lda #$1E
	sta $1264,x
	sta $1268,x
	sta $126C,x
	sta $1270,x
	dec $16E4
	dec $16E4
	inc $16E6
	inc $16E6
	lda $16E4
	cmp #$12
	bcc CODE_7E3793
	lda $16E6
	cmp #$E0
	bcs CODE_7E3793
	brl CODE_7E3829
CODE_7E3793:
	stz $16ED
	lda #$1E
	sta $16EB
	brl CODE_7E3829
CODE_7E379E:
	rep #$20
	lda D,$02
	pha
	lda D,$90
	pha
	lda D,$04
	pha
	lda $15C2
	pha
	sep #$20
	stz D,$02
	lda #$7D
	sta D,$90
	lda $16EB
	jsr CODE_7E579D
	rep #$20
	lda D,$04
	bit #$0080
	beq CODE_7E37C9
	ora #$FF00
	bra CODE_7E37CC
CODE_7E37C9:
	and #$00FF
CODE_7E37CC:
	clc
	adc #$0080
	sta $16E4
	lda $15C2
	bit #$0080
	beq CODE_7E37E0
	ora #$FF00
	bra CODE_7E37E3
CODE_7E37E0:
	and #$00FF
CODE_7E37E3:
	clc
	adc #$0064
	sta $16E6
	lda #$00C8
	sta $16E8
	lda $16EA
	clc
	adc #$0010
	sta $16EA
	sep #$20
	lda $16EB
	cmp #$A0
	bne CODE_7E3818
	lda #$01
	sta $16ED
	lda #$FF
	sta $16E4
	lda #$00
	sta $16E6
	stz $16E5
	stz $16E7
CODE_7E3818:
	rep #$20
	pla
	sta $15C2
	pla
	sta D,$04
	pla
	sta D,$90
	pla
	sta D,$02
	sep #$20
CODE_7E3829:
	pla
	sta $15C2
	jsr CODE_7E4021
	rtl
CODE_7E3831:
	rep #$10
	lda #$0C
	sta D,CurNMITask
	brl CODE_7E3B03
CODE_7E383A:
	rep #$10
	lda #$0E
	sta D,CurNMITask
	brl CODE_7E3B57
CODE_7E3843:
	rep #$10
CODE_7E3845:
	sep #$20
	lda SLHV
	lda OPHCT
	xba
	lda OPHCT
	xba
	rep #$20
	and #$01FF
	cmp #$0032
	bcc CODE_7E3845
	cmp #$0046
	bcs CODE_7E3845
	sep #$20
	lda #$04
	sta BBAD0
	ldx #$0000
	stx OAMADDL
	ldx #$1261
	stx A1T0L
	lda #$00
	sta A1B0
	ldx #$012C
	stx DAS0L
	lda #$00
	sta DMAP0
	lda #$01
	sta MDMAEN
	stz D,CurNMITask
	lda D,$4B
	lsr
	lsr
	lsr
	lsr
	ora #$50
	sta BG12NBA
	ldx D,$4A
	ldy D,$4C
	stx D,$4C
	sty D,$4A
	lda #$80
	sta VMAIN
	rep #$20
	lda #$731D
	sta VMADDL
	lda $1898
	clc
	adc #$3528
	sta VMDATA
	rep #$20
	lda JOY1L
	pha
	eor Pad1Cur
	and JOY1L
	sta Pad1Down
	lda JOY2L
	pha
	eor Pad2Cur
	and JOY2L
	sta Pad2Down
	pla
	sta Pad2Cur
	pla
	sta Pad1Cur
	sep #$20
	jsr CODE_7E4021
	rtl
CODE_7E38DF:
	rep #$10
CODE_7E38E1:
	sep #$20
	lda SLHV
	lda OPHCT
	xba
	lda OPHCT
	xba
	rep #$20
	and #$01FF
	cmp #$0032
	bcc CODE_7E38E1
	cmp #$0046
	bcs CODE_7E38E1
	sep #$20
	lda #$04
	sta BBAD0
	ldx #$0000
	stx OAMADDL
	ldx #$1261
	stx A1T0L
	lda #$00
	sta A1B0
	ldx #$148
	stx DAS0L
	lda #$00
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda #$13
	sta TM
	stz D,CurNMITask
	lda D,$4B
	lsr
	lsr
	lsr
	lsr
	ora #$50
	sta BG12NBA
	ldx D,$4A
	ldy D,$4C
	stx D,$4C
	sty D,$4A
	sep #$20
	lda $1F35
	sta BG2VOFS
	lda $1F36
	sta BG2VOFS
	lda $1F37
	sta BG2HOFS
	lda $1F38
	sta BG2HOFS
	stz CGADSUB
	stz COLDATA
	stz WH0
	stz WH1
	jsr CODE_7E3E35
	rep #$20
	lda $1FDA
	and #$00FF
	beq CODE_7E39BE
	lda $15BB
	and #$0001
	bne CODE_7E397F
	stz $16C7
	bra CODE_7E39A8
CODE_7E397F:
	lda $1FDA
	and #$00FF
	cmp #$001F
	beq CODE_7E398F
	bcc CODE_7E398F
	lda #$001F
CODE_7E398F:
	sta $16C7
	asl
	asl
	asl
	asl
	asl
	sta $1FDB
	asl
	asl
	asl
	asl
	asl
	ora $1FDB
	ora $16C7
	sta $16C7
CODE_7E39A8:
	sep #$20
	lda #$03
	sta CGADD
	lda $16C7
	sta CGDATA
	lda $16C8
	sta CGDATA
	dec $1FDA
CODE_7E39BE:
	rep #$20
	lda JOY1L
	eor $1FFE
	and JOY1L
	sta Pad1Down
	lda JOY1L
	sta $1FFE
	sep #$20
	jsr CODE_7E3DAB
	jsr CODE_7E4021
	rtl
CODE_7E39DB:
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	lda #$01
	sta $18AC
	jsr CODE_7E4021
	rtl
CODE_7E39EA:
	rep #$10
	lda #$1C
	sta D,CurNMITask
	ldx D,$4A
	lda SuperFXScreenMode
	and #$F7
	sta SCMR
	lda #$80
	sta VMAIN
	lda #$18
	sta BBAD0
	stx VMADDL
	ldx #$2C00
	sta A1T0L
	lda #$70
	sta A1B0
	ldx #$2A00
	stx DAS0L
	lda #$01
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda SuperFXScreenMode
	ora #$08
	sta SCMR
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	lda #$01
	sta $18AC
	jsr CODE_7E4021
	rtl
CODE_7E3A39:
	rep #$10
	lda #$1E
	sta D,CurNMITask
	rep #$20
	lda D,$4A
	clc
	adc #$1500
	tax
	sep #$20
	lda SuperFXScreenMode
	and #$F7
	sta SCMR
	lda #$80
	sta VMAIN
	lda #$18
	sta BBAD0
	stx VMADDL
	ldx #$5600
	stx A1T0L
	lda #$70
	sta A1B0
	ldx #$2A00
	stx DAS0:
	lda #$01
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda SuperFXScreenMode
	ora #$08
	sta SCMR
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	lda #$02
	sta $18BB
	lda D,$45
	lsr
	lsr
	sta SCBR
	jsr CODE_7E4021
	rtl
CODE_7E3A98:
	lda $1F10
	bne CODE_7E3A9E
	rtl
CODE_7E3A9E:
	rep #$10
	lda D,$4B
	lsr
	lsr
	lsr
	lsr
	ora #$50
	sta BG12NBA
	ldx D,$4A
	ldy D,$4C
	stx D,$4C
	sty D,$4A
	jsr CODE_7E3FA3
	jsr CODE_7E414B
	sep #$20
	rep #$10
	jsr CODE_7E409F
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	rep #$20
	lda JOY1L
	pha
	eor Pad1Cur
	and JOY1L
	sta Pad1Down
	lda JOY2L
	pha
	eor Pad2Cur
	and JOY2L
	sta Pad2Down
	pla
	sta Pad2Cur
	pla
	sta Pad1Cur
	sep #$20
	jsr CODE_7E4021
	lda #$20
	sta D,CurNMITask
	rtl
CODE_7E3AF4:
	lda #$01
	sta $18AC
	jsr CODE_7E4021
	rtl
CODE_7E3AFD:
	rep #$10
	lda #$04
	sta D,CurNMITask
CODE_7E3B03:
	ldx D,$4A
	lda SuperFXScreenMode
	and #$F7
	sta SCMR
	lda #$80
	sta VMAIN
	lda #$18
	sta BBAD0
	stx VMADDL
	ldx #$2C00
	sta A1T0L
	lda #$70
	sta A1B0
	ldx #$2A00
	stx DAS0L
	lda #$01
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda SuperFXScreenMode
	ora #$08
	sta SCMR
	lda #$01
	sta $18BB
	jsr CODE_7E4021
	rtl
CODE_7E3B46:
	rep #$10
	lda $1F0D
	beq CODE_7E3B53
	lda #$18
	sta D,CurNMITask
	bra CODE_7E3B57
CODE_7E3B53:
	lda #$06
	sta D,CurNMITask
CODE_7E3B57:
	rep #$20
	lda D,$4A
	clc
	adc #$1500
	tax
	sep #$20
	lda SuperFXScreenMode
	and #$F7
	sta SCMR
	lda #$80
	sta VMAIN
	lda #$18
	sta BBAD0
	stx VMADDL
	ldx #$5600
	stx A1T0L
	lda #$70
	sta A1B0
	ldx #$2A00
	stx DAS0L
	lda #$01
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda SuperFXScreenMode
	ora #$08
	sta SCMR
	lda #$02
	sta $18BB
	lda D,$45
	lsr
	lsr
	sta SCBR
	jsr CODE_7E4021
	rtl
CODE_7E3BAA:
	lda $1F10
	bne CODE_7E3BB0
	rtl
CODE_7E3BB0:
	rep #$10
CODE_7E3BB2:
	sep #$20
	lda SLHV
	lda OPHCT
	xba
	lda OPHCT
	xba
	rep #$20
	and #$01FF
	cmp #$0032
	bcc CODE_7E3BB2
	cmp #$0046
	bcs CODE_7E3BB2
	sep #$20
	lda #$04
	sta BBAD0
	ldx #$0000
	stx OAMADDL
	ldx #$1261
	stx A1T0L
	lda #$01
	sta A1B0
	ldx #$0148
	stx DAS0L
	lda #$00
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda #$80
	sta VMAIN
	lda #$18
	sta BBAD0
	ldx #$2FA0
	sta VMADDL
	ldx #$18CD
	stx A1T0L
	lda #$00
	sta A1B0
	ldx #$0040
	stx DAS0L
	lda #$01
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda #$22
	sta BBAD0
	lda #$00
	sta CGADD
	ldx #$1789
	stx A1T0L
	lda #$00
	sta A1B0
	ldx #$0100
	stx DAS0L
	lda #$00
	sta DMAP0
	lda #$01
	sta MDMAEN
	lda $1F0E
	beq CODE_7E3C77
	jsr CODE_7E408B
	cmp #$33
	bcs CODE_7E3C77
	lda #$22
	sta BBAD0
	lda #$00
	sta CGADD
	ldx #$8A4D
	stx A1T0L
	lda #$7E
	sta A1B0
	ldx #$0040
	sta DAS0L
	lda #$00
	sta DMAP0
	lda #$01
	sta MDMAEN
CODE_7E3C77:
	lda $1F0B
	beq CODE_7E3CA8
	jsr CODE_7E408B
	cmp #$05
	bcs CODE_7E3CA8
	lda #$22
	sta BBAD0
	lda #$50
	sta CGADD
	ldx #$8AC9
	stx A1T0L
	lda #$7E
	sta A1B0
	ldx #$0020
	stx DAS0L
	lda #$00
	sta DMAP0
	lda #$01
	sta MDMAEN
CODE_7E3CA8:
	lda #$24
	sta CGADD
	lda $16CD
	beq CODE_7E3CBE
	lda #$E0
	sta CGDATA
	lda #$7E
	sta CGDATA
	bra CODE_7E3CC6:
CODE_7E3CBE:
	lda #$1F
	sta CGDATA
	stz CGDATA
CODE_7E3CC6:
	lda $18B8
	beq CODE_7E3CD7
	lda $18B9
	sta BG3HOFS
	lda $18BA
	sta BG3HOFS
CODE_7E3CD7:
	ldx $18B4
	ldy $18B6
	stx $18B6
	sty $18B4
	sty A1T2L
	jsr CODE_7E414B
	jsr CODE_7E3D36
	lda D,$4B
	lsr
	lsr
	lsr
	lsr
	ora #$50
	sta BG12NBA
	jsr CODE_7E409F
	jsr CODE_7E4021
	rep #$20
	lda JOY1L
	eor Pad1Cur
	and JOY1L
	sta Pad1Down
	jsr CODE_7E3E35
	sep #$20
	lda Pad2Cur+1
	sta Pad2Cur
	lda $1208
	sta $1207
	lda JOY2L
	sta $1208
	lda JOY2H
	sta Pad2Cur+1
	jsr CODE_7E3DAB
	ldx D,$4A
	ldy D,$4C
	stx D,$4C
	sty D,$4A
	stz D,CurNMITask
	rts
CODE_7E3D36:
	sep #$20
	lda $1FDD
	beq CODE_7E3D56
	lda $1F35
	sta BG2VOFS
	lda $1F36
	sta BG2VOFS
	lda $1F37
	sta BG2HOFS
	lda $1F38
	sta BG2HOFS
	rts
CODE_7E3D56:
	lda $16C9
	bqe CODE_7E3DAA
	rep #$20
	lda $16C5
	lsr
	lsr
	and #$003E
	tax
	lda $7E8A0D,x
	tay
	sep #$20
	phb
	lda #$7E
	pha
	plb
	ldx #$0000
CODE_7E3D75:
	lda $0000,y
	bpl CODE_7E3D90
	and #$7F
	sta $7E4BFA,x
	inx
	lda #$18
	sta $7E4BFA,x
	inx
	lda #$01
	sta $7E4BFA,x
	bra CODE_7E3DA2
CODE_7E3D90:
	sta $7E4BFA,x
	inx
	lda #$18
	sta $7E4BFA,x
	inx
	lda #$00
	sta $7E4BFA,x
CODE_7E3DA2:
	inx
	iny
	cpx #$02A0
	bne CODE_7E3D75
	plb
	rts
CODE_7E3DAB:
	lda $18B2
	bne CODE_7E3DB3
	brl CODE_7E3E34
CODE_7E3DB3:
	bpl CODE_7E3DFE
	cmp #$FE
	beq CODE_7E3DF4
	cmp #$FD
	beq CODE_7E3DEC
	lda $18B3
	beq CODE_7E3DD6
	dec
	beq CODE_7E3DD6
	sta $7E45F4
	sta $7E45F6
	sta $7E45F8
	sta $18B3
	bra CODE_7E3E34
CODE_7E3DD6:
	lda #$80
	sta $7E45F4
	sta $7E45F6
	sta $7E45F8
	stz $18B2
	stz $18B3
	bra CODE_7E3E34
CODE_7E3DEC:
	lda $15BB
	and #$01
	beq CODE_7E3DBD
	rts
CODE_7E3DFE:
	cmp #$02
	beq CODE_7E3E25
	lda $18B3
CODE_7E3E05:
	cmp #$0F
	beq CODE_7E3E1B
	inc
	sta $7E45F4
	sta $7E45F6
	sta $7E45F8
	sta $18B3
	bra CODE_7E3E34
CODE_7E3E1B:
	stz $18B2
	lda #$0F
	sta $18B3
	bra CODE_7E3E34
CODE_7E3E25:
	lda $18B3
	cmp #$0F
	beq CODE_7E3E1B
	inc
	cmp #$0F
	beq CODE_7E3E1B
	inc
	bra CODE_7E3E05
CODE_7E3E34:
	rts
CODE_7E3E35:
	sep #$20
	lda Pad1Cur+1
	sta Pad1Cur
	lda $1204
	sta $1203
	lda $1F0F
	and #$03
	asl
	xba
	lda #$00
	xba
	tax
	jmp (DATA_7E3E51,x)
DATA_7E3E51:
	DW DATA_7E3E59
	DW DATA_7E3E66
	DW DATA_7E3E89
	DW DATA_7E3EAE
DATA_7E3E59:
	lda JOY1L
	sta $1204
	lda JOY1H
	sta Pad1Cur+1
	rts
DATA_7E3E66:
	lda JOY1L
	sta $1204
	lda JOY1H
	and #$C0
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	xba
	lda #$00
	xba
	tax
	lda JOY1H
	and #$3F
	ora DATA_7E3EEF,x
	sta Pad1Cur+1
	rts
DATA_7E3E89:
	lda JOY1L
	sta $1204
	lda JOY1H
	and #$0C
	lsr
	lsr
	xba
	lda #$00
	xba
	tax
	lda DATA_7E3EF3,x
	sta $16C7
	lda JOY1H
	and #$F3
	ora $16C7
	sta Pad1Cur+1
	rts
DATA_7E3EAE:
	lda JOY1L
	sta $1204
	lda JOY1H
	and #$0C
	lsr
	lsr
	xba
	lda #$00
	xba
	tax
	lda DATA_7E3EF3,x
	sta $16C7
	lda JOY1H
	and #$33
	ora $16C7
	pha
	lda JOY1H
	and #$C0
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	xba
	lda #$00
	xba
	tax
	lda DATA_7E3EEF,x
	sta $16C7
	pla
	ora $16C7
	sta Pad1Cur+1
	rts
DATA_7E3EEF:
	DB $00,$80,$40,$C0
DATA_7E3EF3:
	DB $00,$08,$04,$0C
CODE_7E3EF7:
	php
	sep #$20
	lda $1F2F
	sta BG1HOFS
	lda $1F30
	sta BG1HOFS
	lda $1F2D
	sta BG1VOFS
	lda $1F2E
	sta BG1VOFS
	lda $1F2B
	sta BG2HOFS
	lda $1F2C
	sta BG2HOFS
	lda $1F29
	sta BG2VOFS
	lda $1F2A
	sta BG2VOFS
	lda $1F27
	sta BG3HOFS
	lda $1F28
	sta BG3HOFS
	lda $1F25
	sta BG3VOFS
	lda $1F26
	sta BG3VOFS
	rep #$30
	lda $1F2F
	ldx $1F3B
	ldy #$0002
	jsr CODE_7E4009
	sta $1F2F
	lda $1F2D
	ldx $1F39
	ldy #$0001
	jsr CODE_7E4009
	sta $1F2D
	lda $1F2B
	ldx $1F37
	ldy #$0002
	jsr CODE_7E4009
	sta $1F2B
	lda $1F29
	ldx $1F35
	ldy #$0001
	jsr CODE_7E4009
	sta $1F29
	lda $1F27
	ldx $1F33
	ldy #$0004
	jsr CODE_7E4009
	sta $1F27
	lda $1F25
	ldx $1F31
	ldy #$0002
	jsr CODE_7E4009
	sta $1F25
	plp
	rts
CODE_7E3FA0:
	php
	plp
	rts
CODE_7E3FA3:
	php
	sep #$20
	rep #$20
	lda $1F13
	bit #$10
	bne CODE_7E3FB1
	plp
	rts
CODE_7E3FB1:
	ldx $1F1D
	ldy $1F1F
	sty VMADDL
	lda $7E9F55,x
	inx
	cmp #$00
	beq CODE_7E3FFF
	cmp #$01
	bne CODE_7E3FDB
	rep #$20
	lda $9F55,x
	inx
	inx
	clc
	adc #$7000
	sta VMADDL
	tay
	sep #$20
	bra CODE_7E3FBA
CODE_7E3FDB:
	rep #$20
	and #$00FF
	phx
	tax
	lda $7E8A6D,x
	and #$00FF
	plx
	ora #$2000
	clc
	adc #$0100
	sta VMDATAL
	sep #$20
	iny
	sty $1F1F
	stx $1F1D
	plp
	rts
CODE_7E3FFF:
	lda $1F13
	and #$EF
	sta $1F13
	plp
	rts
CODE_7E4009:
	stx $16C7
	cmp $16C7
	sty $16C7
	beq CODE_7E4020
	bmi CODE_7E401C
	sec
	sbc $16C7
	bra CODE_7E4020
CODE_7E401C:
	clc
	adc $16C7
CODE_7E4020:
	rts
CODE_7E4021:
	php
	sep #$30
	lda $1F46
	beq CODE_7E402E
	dec
	beq CODE_7E4039
	bra CODE_7E4047
CODE_7E402E:
	lda $1F47
	sta APUIO0
	inc $1F46
	bra CODE_7E4047
CODE_7E4039:
	lda APUIO0
	cmp $1F47
	bne CODE_7E402E
	stz APUIO0
	inc $1F46
	lda $1F51
	beq CODE_7E4057
	cmp APUIO3
	bne CODE_7E4078
	stz $1F51
	stz APUIO3
CODE_7E4057:
	lda $1F52
	bne CODE_7E407A
	lda $1F4F
	cpx $1F4D
	beq CODE_7E4076
	lda $1F53,x
	sta APUIO3
	sta $1F51
	lda $1F4F
	inc
	and #$0F
	sta $1F4F
CODE_7E4076:
	plp
	rts
CODE_7E4078:
	plp
	rts
CODE_7E407A:
	sta APUIO3
	sta $1F51
	stz $1F4D
	stz $1F4F
	stz $1F52
	plp
	rts
CODE_7E408B:
	lda D,$EF
	clc
	sbc D,$F0
	sta D,$F0
	sbc D,$F1
	sta D,$F1
	sbc D,$F2
	sta D,$F2
	sbc D,$EF
	sta D,$EF
	rts
CODE_7E409F:
	ldx $16A7
	beq CODE_7E40FD
	cpx #$1481
	beq CODE_7E4123
	lda D,$06,x
	sta CGADSUB
	lda D,$00,x
	beq CODE_7E40B7
	sta COLDATA
	bra CODE_7E40D2
CODE_7E40B7:
	lda D,$01,x
	and #$1F
	ora #$20
	sta COLDATA
	lda D,$02,x
	and #$1F
	ora #$40
	sta COLDATA
	lda D,$03,x
	and #$1F
	ora #$80
	sta COLDATA
CODE_7E40D2:
	lda D,$04,x
	sta TS
	lda D,$05,x
	bit #$30
	bne CODE_7E40F3
	ora #$10
	sta CGWSEL
	lda #$80
	sta WOBJSEL
	lda #$10
	sta WH2
	lda #$F0
	sta WH3
	bra CODE_7E4111
CODE_7E40F3:
	sta CGWSEL
	lda #$20
	sta WOBJSEL
	bra CODE_7E4111
CODE_7E40FD:
	lda #$02
	sta CGWSEL
	lda #$50
	sta CGADSUB
	lda #$E0
	sta COLDATA
	lda #$07
	sta TS
CODE_7E4111:
	stz W12SEL
	stz W34SEL
	stz WBGLOG
	lda #$0C
	sta WOBJLOG
	stz TMW
	rts
CODE_7E4123:
	lda #$BB
	sta W12SEL
	lda #$BB
	sta W34SEL
	lda #$0B
	sta WOBJSEL
	lda D,$06,x
	sta WBGLOG
	and #$03
	sta WOBJLOG
	lda #$1F
	sta TMW
	stz CGADD
	stz CGDATA
	stz CGDATA
	rts
CODE_7E414B:
	php
	rep #$20
	ldx $18A5
	lda $18A7
	stx $18A7
	sta $18A5
	sta A1T3L
	sep #$20
	lda $18A9
	eor #$01
	sta $18A9
	plp
	rts
	
;Unknown data
	DB $0F,$00
	FILLLONG $0001FF
	FILL $485
	DB $00,$10,$80,$5F,$80,$2D,$80,$32,$80,$7F,$80,$00,$2F,$80,$7F,$0F
	DB $02,$0F,$78,$80,$00,$0F,$80,$46,$0F,$7F,$0F,$03,$0F,$64,$80,$00
	DB $00,$00,$00,$00,$1E,$20,$64,$00
	FILLLONG $800100
	FILL $5DE
	DB $00,$0A,$00
	FILLLONG $000100
	FILL $2EE
	DB $00,$00
	
RunSuperFXRoutine:
	sta PBR
	phb
	lda #$00
	pha
	plb
	lda SuperFXScreenMode
	ora #$18
	sta SCMR
	stx R15
RunSuperFXRoutine_L1:
	lda SFR
	and #$20
	bne RunSuperFXRoutine_L1
	lda SuperFXScreenMode
	sta SCMR
	plb
	rtl
CODE_7E4F0C:
	jml CODE_1FBDEE
RenderSuperFXObjects:
	rep #$30
	lda $14C3
	sta $702B22
	lda $1F09
	sta $701A2A
	sep #$20
	lda #$01
	ldx #$AC1D
	sta PBR
	lda SuperFXScreenMode
	ora #$18
	sta SCMR
	stx R15
	jsr CODE_7E4F4C
	sep #$20
RenderSuperFXObjects_L1:
	lda SFR
	and #$20
	bne RenderSuperFXObjects_L1
	lda SuperFXScreenMode
	sta SCMR
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
	ldx $121D
CODE_7E4F5E:
	lda D,$1D,x
	and #$80
	beq CODE_7E4F68
	jml CODE_7E4F6E
CODE_7E4F68:
	lda #$01
	sta D,$2D,x
	bra CODE_7E4F74
CODE_7E4F6E:
	lda D,$1E,x
	ora #$02
	sta D,$1E,x
	lda D,$1D,x
	and #$7F
	sta D,$1D,x
	rep #$20
	lda #$00
	sta D,$1B,x
	sep #$20
	txy
	ldx D,$00,y
	bne CODE_7E4F5E
	sep #$20
	lda #$7E
	pha
	plb
	lda $1EFB
	beq CODE_7E4FAA
	ldx #$0000
CODE_7E4F96:
	phx
	jsr CODE_7E4FAD
	plx
	rep #$20
	txa
	clc
	dec $1EFB
	bne CODE_7E4F96
CODE_7E4FAA:
	plp
	plb
	rtl
CODE_7E4FAD:
	stx D,$78
	ldy $2EC4,x
	tyx
	stx D,$76
	lda D,$1D,x
	and #$80
	beq CODE_7E4FBE
	brl CODE_7E452A3
CODE_7E4FBE:
	ldy D,$04,x
	sty $1F03
	ldy D,$78
	stz $1EF9
	stz D,$F7
	rep #$20
	lda $2EC6,y
	bne CODE_7E4FD4
	brl CODE_7E52A6
CODE_7E4FD4:
	tay
	sep #$20
	stz $1EFA
	lda $0002,y
	beq CODE_7E5009
	dec
	sta D,$02
	lda $1CE7,x
	bpl CODE_7E4FEE
	and D,$02
	beq CODE_7E5009
	bra CODE_7E4FF5
CODE_7E4FEE:
	lda D,$02
	and $15BB
	beq CODE_7E5009
CODE_7E4FF5:
	rep #$20
	and #$007F
	sta D,$02
	tya
	ldy D,$02
	clc
CODE_7E5000:
	adc #$0012
	dey
	bne CODE_7E5000
	tay
	sep #$20
CODE_7E5009:
	lda $0009,y
	sta D,$F6
	bit #$70
	bne CODE_7E5015
	brl CODE_7E525C
CODE_7E5015:
	bit #$10
	beq CODE_7E501C
	brl CODE_7E51E3
CODE_7E501C:
	bit #$20
	beq CODE_7E5023
	brl CODE_7E5167
CODE_7E5023:
	bit #$40
	beq CODE_7E502A
	brl CODE_7E50EB
CODE_7E502A:
	lda $0003,y
	sta D,$02
	sta D,$04
	lda $0005,y
	sta D,$08
	sta D,$0A
	lda D,$14,x
	beq CODE_7E503F
	jsr CODE_7E5ADA
CODE_7E503F:
	lda D,$0A
	sta D,$08
	lda $0007,y
	sta D,$90
	sta $15C2
	lda D,$12,x
	beq CODE_7E5052
	jsr CODE_7E593D
CODE_7E5052:
	lda D,$04
	sta D,$02
	lda D,$0A
	sta D,$08
	lda D,$13,x
	beq CODE_7E5061
	jsr CODE_7E579D
	rep #$20
CODE_7E5063:
	lda D,$04
	bit #$0080
	beq CODE_7E506F
	ora #$FF00
	bra CODE_7E5072
CODE_7E506F:
	and #$00FF
CODE_7E5072:
	sta D,$02
	lda D,$F6
	and #$000F
	beq CODE_7E5088
	sty D,$F8
	tay
	lda D,$02
CODE_7E5080:
	asl
	dey
	bne CODE_7E5080
	ldy D,$F8
	bra CODE_7E508A
CODE_7E5088:
	lda D,$02
CODE_7E508A:
	clc
	adc D,$0D,x
	sta D,$6C
	lda $15C2
	bit #$0080
	beq CODE_7E509C
	ora #$FF00
	bra CODE_7E509F
CODE_7E509C:
	and #$00FF
CODE_7E509F:
	sta D,$02
	lda D,$F6
	and #$00FF
	beq CODE_7E50B5
	sty D,$F8
	tay
	lda D,$02
CODE_7E50AD:
	asl
	dey
	bne CODE_7E50AD
	ldy D,$F8
	bra CODE_7E50B7
CODE_7E50B5:
	lda D,$02
CODE_7E50B7:
	clc
	adc D,$10,x
	sta D,$6E
	lda D,$0A
	bit #$0080
	beq CODE_7E50C8
	ora #$FF00
	bra CODE_7E50CB
CODE_7E50C8:
	and #$00FF
CODE_7E50CB:
	sta D,$02
	lda D,$F6
	and #$000F
	beq CODE_7E50E1
	sty D,$F8
	tay
	lda D,$02
CODE_7E50D9:
	asl
	dey
	bne CODE_7E50D9
	ldy D,$F8
	bra CODE_7E50E3
CODE_7E50E1:
	lda D,$02
CODE_7E50E3:
	clc
	adc D,$0E,x
	sta D,$74
	jmp CODE_7E5276
CODE_7E50EB:
	lda $0005,y
	sta D,$08
	sta D,$0A
	lda $0007,y
	sta D,$90
	sta $15C2
	lda D,$12,x
	beq CODE_7E5101
	jsr CODE_7E593D
CODE_7E5101:
	rep #$20
	lda D,$0A
	bit #$0080
	beq CODE_7E510F
	ora #$FF00
	bra CODE_7E5112
CODE_7E510F:
	and #$00FF
CODE_7E5112:
	sta D,$02
	lda D,$F6
	and #$000F
	beq CODE_7E5128
	sty D,$F8
	tay
	lda D,$02
CODE_7E5120:
	asl
	dey
	bne CODE_7E5120
	ldy D,$F8
	bra CODE_7E512A
CODE_7E5128:
	lda D,$02
CODE_7E512A:
	clc
	adc D,$0E,x
	sta D,$74
	lda $15C2
	bit #$0080
	beq CODE_7E513C
	ora #$FF00
	bra CODE_7E513F
CODE_7E513C:
	and #$00FF
CODE_7E513F:
	sta D,$02
	lda D,$F6
	and #$0F
	beq CODE_7E5155
	sty D,$F8
	tay
	lda D,$02
CODE_7E514D:
	asl
	dey
	bne CODE_7E514D
	ldy D,$F8
	bra CODE_7E5157
CODE_7E5155:
	lda D,$02
CODE_7E5157:
	clc
	adc D,$10,x
	sta D,$6E
	lda $0003,y
	clc
	adc D,$0C,x
	sta D,$6C
	jmp CODE_7E5276
CODE_7E5167:
	
	
	
	
	
	
	
	
	
	
	
	
CODE_7E524B:
	lda D,$02
CODE_7E524D:
	clc
	adc D,$0E,x
	sta D,$74
	lda $0007,y
	clc
	adc D,$10,x
	sta D,$6E
	bra CODE_7E5276
CODE_7E525C:
	rep #$20
	lda $0003,y
	clc
	adc D,$0C,x
	sta D,$6C
	lda $0005,y
	clc
	adc D,$0E,x
	sta D,$74
	lda $0007,y
	clc
	adc D,$10,x
	sta D,$6E
CODE_7E5276:
	lda $000A,y
	sta $1258
	lda $000C,y
	sta $125A
	lda $000E,y
	sta $125C
	phx
	phy
	sep #$20
	lda $0010,y
	sta $1EF9
	rep #$20
	jsr CODE_7E52C4
	ply
	plx
	rep #$20
	lda $0000,y
	beq CODE_7E52A3
	brl CODE_7E4FD4
CODE_7E52A3:
	sep #$20
	rts
CODE_7E52A6:
	lda $2EC8,y
	sta $1258
	lda $2ECA,y
	sta $125A
	lda $2ECC,y
	sta $125C
	lda D,$0C,x
	sta D,$6C
	lda D,$10,x
	sta D,$6E
	lda D,$0E,x
	sta D,$74
	lda $1EFB
	sta $1EFD
	ldy D,$78
	sty $1EFF
	jmp CODE_7E5788
CODE_7E52D2:
	sep #$20
	sty $1EFF
	ldy $2EC4,y
	stz $1EF8
	rep #$20
	ldy D,$76
	lda $001D,y
	and #$0080
	beq CODE_7E52EC
	brl CODE_7E5788
CODE_7E52EC:
	lda $002E,y
	and D,$2E,x
	and #$00F8
	beq CODE_7E52F9
	brl CODE_7E5788
CODE_7E52F9:
	tya
	cmp D,$19,x
	bne CODE_7E5301
	brl CODE_7E5788
CODE_7E5301:
	txa
	tyxx
	cmp D,$19,x
	bne CODE_7E530A
	brl CODE_7E5788
CODE_7E530A:
	txy
	tax
	lda D,$0C,x
	sta D,$3A
	lda D,$0E,x
	sta D,$3C
	lda D,$10,x
	sta D,$3E
	lda D,$1F,x
	and #$0080
	beq CODE_7E532C
	lda $001F,y
	and #$0080
	beq CODE_7E532C
	lda D,$04,x
	txy
	bra CODE_7E5337
CODE_7E532C:
	lda D,$04,x
	txy
	cmp $1F03
	bne CODE_7E5337
	brl CODE_7E5788
CODE_7E5337:
	ldx $1EFF
	lda $2EC6,x
	bne CODE_7E5342
	brl CODE_7E570C
CODE_7E5342:
	
	
	
	
	
	
	
	
	
	
	
	
CODE_7E5C6C:
	stz D,$0B
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
DATA_7E5DB2:
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
	
	
	
	
	
	
	
	
	END BASE
CopiedCodeBEnd:
	
	
	
	
