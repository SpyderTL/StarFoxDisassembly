	BASE $7E3193
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
	lda.b #$0A
	sta $120E
	sta HDMAEN
	lda.b #$01
	sta BGMODE
	stz $18C2
	lda.b #$13
	sta TM
	lda.b #$74
	sta BG3SC
	lda.b #$07
	sta BG34NBA
	stz BG2VOFS
	stz BG2VOFS
	stz $18B8
	stz $1F0E
	stz $1F0B
	stz $16A2
	lda.b #$01
	sta $1897
	jsl CODE_02F492
	rep #$20
	lda.w #$8FAA
	sta $004F
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0080
	stz $01B0
	stz $1EEB
	stz $1F09
	stz $169E
	lda.w #$0000
	sta $A05C
	sep #$20
	stz $1FC6
	stz $1EF1
	stz $1FE4
	stz D,CurNMITask
	rtl
InitializeMode2:
	rep #$10
	lda.b #$0A
	sta $120E
	sta HDMAEN
	lda.b #$02
	sta BGMODE
	stz $18C2
	lda.b #$13
	sta TM
	stz BG3SC
	stz BG3HOFS
	stz BG3HOFS
	stz BG3VOFS
	stz BG3VOFS
	lda.b #$2F
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
	lda.b #$01
	sta $1897
	jsl CODE_02F492
	rep #$20
	lda.w #$8FAA
	sta $700050
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0080
	sta $7001B0
	stz $1EEB
	stz $1F09
	stz $169E
	lda.w #$0000
	sta $7EA05C
	sep #$20
	stz $7FE4
	stz $1FC6
	stz $1EF1
	stz D,CurNMITask
	rtl
CODE_7E32B2:
	rep #$10
	lda.b #$22		;\Transfer to CGRAM
	sta BBAD0		;/
	lda.b #$00
	sta CGADD
	ldx $1892		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda $1894		;|
	sta A1B0		;/
	ldx $1895		;\Set DMA data size
	stx DAS0L		;/
	stz DMAP0		; Set DMA configuration
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188A
	stx VMADDL
	ldx #$2800		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx $188C		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	inc D,CurNMITask
	inc D,CurNMITask
	rtl
CODE_7E3308:
	rep #$10
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188E
	stx VMADDL
	ldx.w #$4000		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx $1890		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	lda.b #$22		;\Transfer to CGRAM
	sta BBAD0		;/
	lda.b #$70
	sta CGADD
	rep #$20
	lda.w #$857E		;\Set source address (A-Bus)
	sta A1T0L		;|
	sep #$20		;|
	lda.b #$7E		;|
	sta A1B0		;/
	ldx.w #$0020		;\Set DMA data size
	stx DAS0L		;/
	stz DMAP0		; Set DMA configuration
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	stz D,CurNMITask
	rtl
CODE_7E335F:
	rep #$10
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188A
	stx VMADDL
	ldx.w #$2800		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx $188C		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188E
	stx VMADDL
	ldx #$4000		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx $1890		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	stz D,CurNMITask
	rtl
CODE_7E33BA:
	rep #$10
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx $188A
	stx VMADDL
	ldx.w #$2800		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx $188C		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
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
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	stx VMADDL
	ldx.w #$2C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx.w #$4000		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	rep #$20
	lda.w #$0000
	cmp D,$4A
	beq CODE_7E3442
	sta D,$4A
	lda.w #$3000
	sta D,$4C
	bra CODE_7E3449
CODE_7E3442:
	sta D,$4C
	lda.w #$3000
	sta D,$4A
CODE_7E3449:
	sep #$20
	lda D,$4B
	lsr
	lsr
	lsr
	lsr
	ora.b #$50
	sta BG12NBA
	stz $1FE5
	brl CODE_7E34F6
CODE_7E345C:
	rep #$10
	ldx.w #$6020
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD7		;/
	stx VMADDL
	ldx.w #$4C00		;\Set source address (A-Bus)
	stx A1T7L		;|
	lda.b #$70		;|
	sta A1B7		;/
	ldx.w #$1000		;\Set DMA data size
	sta DAS7L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP7		;/
	lda.b #$80		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E34E9
CODE_7E348B:
	rep #$10
	ldx.w #$5820
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD7		;/
	stx VMADDL
	ldx.w #$3C00		;\Set source address (A-Bus)
	stx A1T7L		;|
	lda.b #$70		;|
	sta A1B7		;/
	ldx.w #$1000		;\Set DMA data size
	sta DAS7L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP7		;/
	lda.b #$80		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E34E9
CODE_7E34BA:
	rep #$10
	ldx.w #$5020
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD7		;/
	stx VMADDL
	ldx.w #$2C00		;\Set source address (A-Bus)
	stx A1T7L		;|
	lda.b #$70		;|
	sta A1B7		;/
	ldx.w #$1000		;\Set DMA data size
	sta DAS7L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP7		;/
	lda.b #$80		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E34E9
CODE_7E34E9:
	lda $1FE5
	inc
	cmp.b #$04
	bne CODE_7E34F3
	lda.b #$00
CODE_7E34F3:
	sta $1FE5
CODE_7E34F6:
	lda $7EF0C6
	cmp.b #$FF
	beq CODE_7E350C
	and.b #$1F
	beq CODE_7E350C
	dec
	ora.b #$E0
	sta COLDATA
	sta $7EF0C6
CODE_7E350C:
	jsr CODE_7E4021
	rtl
CODE_7E3510:
	sep #$20
	lda.b #$01
	sta D,$FD
	rep #$10
	lda.b #$04		;\Transfer to OAM
	sta BBAD0		;/
	ldx.w #$0000
	stx OAMADDL
	ldx.w #$1261		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$00		;|
	sta A1B0		;/
	ldx.w #$0070		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$00		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
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
	adc.w #$1800
	tax
	sep #$20
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	stx VMADDL
	ldx.w #$5C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx.w #$1000		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	brl CODE_7E3623
CODE_7E358B:
	sep #$20
	rep #$10
	ldx D,$4C
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	stx VMADDL
	ldx.w #$2C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx.w #$1000		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E3623
CODE_7E35BB:
	rep #$20
	lda D,$4C
	clc
	adc.w #$0800
	tax
	sep #$20
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	stx VMADDL
	ldx.w #$3C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx.w #$1000		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
	bra CODE_7E3623
CODE_7E35F0:
	rep #$20
	lda D,$4C
	clc
	adc.w #$1000
	tax
	sep #$20
	lda.b #$80
	sta VMAIN
	lda.b #$18		;\Transfer to VRAM
	sta BBAD0		;/
	ldx.w #$4C00		;\Set source address (A-Bus)
	stx A1T0L		;|
	lda.b #$70		;|
	sta A1B0		;/
	ldx.w #$1000		;\Set DMA data size
	stx DAS0L		;/
	lda.b #$01		;\Set DMA configuration
	sta DMAP0		;/
	lda.b #$01		;\Do DMA
	sta MDMAEN		;/
CODE_7E3623:
	lda $1FE5
	inc
	sta $1FE5
	cmp.b #$05
	bne CODE_7E3631
	stz $1FE5
CODE_7E3631:
	lda $15C2
	pha
	ldx.w #$0010
	lda $0034
	bit.b #$01
	beq CODE_7E3667
	clc
	adc.b #$40
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
	adc.b #$08
	sta $1261,x
	sta $1269,x
	clc
	adc.b #$08
	sta $1265,x
	sta $126D,x
	lda $0033
	clc
	adc.b #$08
	sta $1262,x
	sta $1266,x
	clc
	adc.b #$08
	sta $126A,x
	sta $126E,x
	lda $0036
	beq CODE_7E36F7
	dec
	beq CODE_7E36FB
	lda.b #$0D
	bra CODE_7E36FD
CODE_7E36C7:
	lda.b #$09
	bra CODE_7E36FD
CODE_7E36FB:
	lda.b #$05
CODE_7E36FD:
	sta $1263,x
	inc
	sta $1267,x
	inc
	sta $126B,x
	inc
	sta $126F,x
	lda.b #$3E
	sta $1264,x
	sta $1268,x
	sta $126C,x
	sta $1270,x
CODE_7E371A:
	lda $16ED
	bne CODE_7E3722
	brl CODE_7E379E
CODE_7E3722:
	ldx.w #$0000
	lda $16E4
	sec
	sbc.b #$0F
	sta $1261,x
	sta $1265,x
	clc
	adc.b #$08
	sta $1269,x
	sta $126D,x
	lda $16E6
	sta $1262,x
	sta $126A,x
	clc
	adc.b #$08
	sta $1266,x
	sta $126E,x
	lda $1263,x
	cmp.b #$11
	bne CODE_7E3757
	lda.b #$15
	bra CODE_7E3759
CODE_7E3757:
	lda.b #$11
CODE_7E3759:
	sta $1263,x
	inc
	sta $126B,x
	inc
	sta $1267,x
	inc
	sta $126F,x
	lda.b #$1E
	sta $1264,x
	sta $1268,x
	sta $126C,x
	sta $1270,x
	dec $16E4
	dec $16E4
	inc $16E6
	inc $16E6
	lda $16E4
	cmp.b #$12
	bcc CODE_7E3793
	lda $16E6
	cmp.b #$E0
	bcs CODE_7E3793
	brl CODE_7E3829
CODE_7E3793:
	stz $16ED
	lda.b #$1E
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
	lda.b #$7D
	sta D,$90
	lda $16EB
	jsr CODE_7E579D
	rep #$20
	lda D,$04
	bit.w #$0080
	beq CODE_7E37C9
	ora.w #$FF00
	bra CODE_7E37CC
CODE_7E37C9:
	and.w #$00FF
CODE_7E37CC:
	clc
	adc.w #$0080
	sta $16E4
	lda $15C2
	bit.w #$0080
	beq CODE_7E37E0
	ora.w #$FF00
	bra CODE_7E37E3
CODE_7E37E0:
	and.w #$00FF
CODE_7E37E3:
	clc
	adc.w #$0064
	sta $16E6
	lda.w #$00C8
	sta $16E8
	lda $16EA
	clc
	adc.w #$0010
	sta $16EA
	sep #$20
	lda $16EB
	cmp.b #$A0
	bne CODE_7E3818
	lda.b #$01
	sta $16ED
	lda.b #$FF
	sta $16E4
	lda.b #$00
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
	lda.b #$0C
	sta D,CurNMITask
	brl CODE_7E3B03
CODE_7E383A:
	rep #$10
	lda.b #$0E
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
	and.w #$01FF
	cmp.w #$0032
	bcc CODE_7E3845
	cmp.w #$0046
	bcs CODE_7E3845
	sep #$20
	lda.b #$04
	sta BBAD0
	ldx.w #$0000
	stx OAMADDL
	ldx #$1261
	stx A1T0L
	lda.b #$00
	sta A1B0
	ldx #$012C
	stx DAS0L
	lda.b #$00
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	stz D,CurNMITask
	lda D,$4B
	lsr
	lsr
	lsr
	lsr
	ora.b #$50
	sta BG12NBA
	ldx D,$4A
	ldy D,$4C
	stx D,$4C
	sty D,$4A
	lda.b #$80
	sta VMAIN
	rep #$20
	lda.w #$731D
	sta VMADDL
	lda $1898
	clc
	adc.w #$3528
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
	and.w #$01FF
	cmp.w #$0032
	bcc CODE_7E38E1
	cmp.w #$0046
	bcs CODE_7E38E1
	sep #$20
	lda.b #$04
	sta BBAD0
	ldx.w #$0000
	stx OAMADDL
	ldx.w #$1261
	stx A1T0L
	lda.b #$00
	sta A1B0
	ldx.w #$148
	stx DAS0L
	lda.b #$00
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	lda.b #$13
	sta TM
	stz D,CurNMITask
	lda D,$4B
	lsr
	lsr
	lsr
	lsr
	ora.b #$50
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
	and.w #$00FF
	beq CODE_7E39BE
	lda $15BB
	and.w #$0001
	bne CODE_7E397F
	stz $16C7
	bra CODE_7E39A8
CODE_7E397F:
	lda $1FDA
	and.w #$00FF
	cmp.w #$001F
	beq CODE_7E398F
	bcc CODE_7E398F
	lda.w #$001F
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
	lda.b #$03
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
	lda.b #$01
	sta $18AC
	jsr CODE_7E4021
	rtl
CODE_7E39EA:
	rep #$10
	lda.b #$1C
	sta D,CurNMITask
	ldx D,$4A
	lda SuperFXScreenMode
	and.b #$F7
	sta SCMR
	lda.b #$80
	sta VMAIN
	lda.b #$18
	sta BBAD0
	stx VMADDL
	ldx #$2C00
	sta A1T0L
	lda.b #$70
	sta A1B0
	ldx.w #$2A00
	stx DAS0L
	lda.b #$01
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	lda SuperFXScreenMode
	ora.b #$08
	sta SCMR
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	lda.b #$01
	sta $18AC
	jsr CODE_7E4021
	rtl
CODE_7E3A39:
	rep #$10
	lda.b #$1E
	sta D,CurNMITask
	rep #$20
	lda D,$4A
	clc
	adc.w #$1500
	tax
	sep #$20
	lda SuperFXScreenMode
	and.b #$F7
	sta SCMR
	lda.b #$80
	sta VMAIN
	lda.b #$18
	sta BBAD0
	stx VMADDL
	ldx.w #$5600
	stx A1T0L
	lda.b #$70
	sta A1B0
	ldx.w #$2A00
	stx DAS0:
	lda.b #$01
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	lda SuperFXScreenMode
	ora.b #$08
	sta SCMR
	jsr CODE_7E3EF7
	jsr CODE_7E3DAB
	lda.b #$02
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
	ora.b #$50
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
	lda.b #$20
	sta D,CurNMITask
	rtl
CODE_7E3AF4:
	lda.b #$01
	sta $18AC
	jsr CODE_7E4021
	rtl
CODE_7E3AFD:
	rep #$10
	lda.b #$04
	sta D,CurNMITask
CODE_7E3B03:
	ldx D,$4A
	lda SuperFXScreenMode
	and.b #$F7
	sta SCMR
	lda.b #$80
	sta VMAIN
	lda.b #$18
	sta BBAD0
	stx VMADDL
	ldx.w #$2C00
	sta A1T0L
	lda.b #$70
	sta A1B0
	ldx.w #$2A00
	stx DAS0L
	lda.b #$01
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	lda SuperFXScreenMode
	ora.b #$08
	sta SCMR
	lda.b #$01
	sta $18BB
	jsr CODE_7E4021
	rtl
CODE_7E3B46:
	rep #$10
	lda $1F0D
	beq CODE_7E3B53
	lda.b #$18
	sta D,CurNMITask
	bra CODE_7E3B57
CODE_7E3B53:
	lda.b #$06
	sta D,CurNMITask
CODE_7E3B57:
	rep #$20
	lda D,$4A
	clc
	adc.w #$1500
	tax
	sep #$20
	lda SuperFXScreenMode
	and.b #$F7
	sta SCMR
	lda.b #$80
	sta VMAIN
	lda.b #$18
	sta BBAD0
	stx VMADDL
	ldx.w #$5600
	stx A1T0L
	lda.b #$70
	sta A1B0
	ldx.w #$2A00
	stx DAS0L
	lda.b #$01
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	lda SuperFXScreenMode
	ora.b #$08
	sta SCMR
	lda.b #$02
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
	and.w #$01FF
	cmp.w #$0032
	bcc CODE_7E3BB2
	cmp.w #$0046
	bcs CODE_7E3BB2
	sep #$20
	lda.b #$04
	sta BBAD0
	ldx.w #$0000
	stx OAMADDL
	ldx.w #$1261
	stx A1T0L
	lda.b #$01
	sta A1B0
	ldx.w #$0148
	stx DAS0L
	lda.b #$00
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	lda.b #$80
	sta VMAIN
	lda.b #$18
	sta BBAD0
	ldx.w #$2FA0
	sta VMADDL
	ldx.w #$18CD
	stx A1T0L
	lda.b #$00
	sta A1B0
	ldx.w #$0040
	stx DAS0L
	lda.b #$01
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	lda.b #$22
	sta BBAD0
	lda.b #$00
	sta CGADD
	ldx.w #$1789
	stx A1T0L
	lda.b #$00
	sta A1B0
	ldx.w #$0100
	stx DAS0L
	lda.b #$00
	sta DMAP0
	lda.b #$01
	sta MDMAEN
	lda $1F0E
	beq CODE_7E3C77
	jsr CODE_7E408B
	cmp.b #$33
	bcs CODE_7E3C77
	lda.b #$22
	sta BBAD0
	lda.b #$00
	sta CGADD
	ldx.w #$8A4D
	stx A1T0L
	lda.b #$7E
	sta A1B0
	ldx.w #$0040
	sta DAS0L
	lda.b #$00
	sta DMAP0
	lda.b #$01
	sta MDMAEN
CODE_7E3C77:
	lda $1F0B
	beq CODE_7E3CA8
	jsr CODE_7E408B
	cmp.b #$05
	bcs CODE_7E3CA8
	lda.b #$22
	sta BBAD0
	lda.b #$50
	sta CGADD
	ldx.w #$8AC9
	stx A1T0L
	lda.b #$7E
	sta A1B0
	ldx.w #$0020
	stx DAS0L
	lda.b #$00
	sta DMAP0
	lda.b #$01
	sta MDMAEN
CODE_7E3CA8:
	lda.b #$24
	sta CGADD
	lda $16CD
	beq CODE_7E3CBE
	lda.b #$E0
	sta CGDATA
	lda.b #$7E
	sta CGDATA
	bra CODE_7E3CC6:
CODE_7E3CBE:
	lda.b #$1F
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
	and.w #$003E
	tax
	lda $7E8A0D,x
	tay
	sep #$20
	phb
	lda.b #$7E
	pha
	plb
	ldx.w #$0000
CODE_7E3D75:
	lda $0000,y
	bpl CODE_7E3D90
	and.b #$7F
	sta $7E4BFA,x
	inx
	lda.b #$18
	sta $7E4BFA,x
	inx
	lda.b #$01
	sta $7E4BFA,x
	bra CODE_7E3DA2
CODE_7E3D90:
	sta $7E4BFA,x
	inx
	lda.b #$18
	sta $7E4BFA,x
	inx
	lda.b #$00
	sta $7E4BFA,x
CODE_7E3DA2:
	inx
	iny
	cpx.w #$02A0
	bne CODE_7E3D75
	plb
	rts
CODE_7E3DAB:
	lda $18B2
	bne CODE_7E3DB3
	brl CODE_7E3E34
CODE_7E3DB3:
	bpl CODE_7E3DFE
	cmp.b #$FE
	beq CODE_7E3DF4
	cmp.b #$FD
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
	lda.b #$80
	sta $7E45F4
	sta $7E45F6
	sta $7E45F8
	stz $18B2
	stz $18B3
	bra CODE_7E3E34
CODE_7E3DEC:
	lda $15BB
	and.b #$01
	beq CODE_7E3DBD
	rts
CODE_7E3DFE:
	cmp.b #$02
	beq CODE_7E3E25
	lda $18B3
CODE_7E3E05:
	cmp.b #$0F
	beq CODE_7E3E1B
	inc
	sta $7E45F4
	sta $7E45F6
	sta $7E45F8
	sta $18B3
	bra CODE_7E3E34
CODE_7E3E1B:
	stz $18B2
	lda.b #$0F
	sta $18B3
	bra CODE_7E3E34
CODE_7E3E25:
	lda $18B3
	cmp.b #$0F
	beq CODE_7E3E1B
	inc
	cmp.b #$0F
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
	and.b #$03
	asl
	xba
	lda.b #$00
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
	lda JOY1H
	and.b #$3F
	ora DATA_7E3EEF,x
	sta Pad1Cur+1
	rts
DATA_7E3E89:
	lda JOY1L
	sta $1204
	lda JOY1H
	and.b #$0C
	lsr
	lsr
	xba
	lda.b #$00
	xba
	tax
	lda DATA_7E3EF3,x
	sta $16C7
	lda JOY1H
	and.b #$F3
	ora $16C7
	sta Pad1Cur+1
	rts
DATA_7E3EAE:
	lda JOY1L
	sta $1204
	lda JOY1H
	and.b #$0C
	lsr
	lsr
	xba
	lda.b #$00
	xba
	tax
	lda DATA_7E3EF3,x
	sta $16C7
	lda JOY1H
	and.b #$33
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
	lda.b #$00
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
	rep.b #$30
	lda $1F2F
	ldx $1F3B
	ldy.w #$0002
	jsr CODE_7E4009
	sta $1F2F
	lda $1F2D
	ldx $1F39
	ldy.w #$0001
	jsr CODE_7E4009
	sta $1F2D
	lda $1F2B
	ldx $1F37
	ldy.w #$0002
	jsr CODE_7E4009
	sta $1F2B
	lda $1F29
	ldx $1F35
	ldy.w #$0001
	jsr CODE_7E4009
	sta $1F29
	lda $1F27
	ldx $1F33
	ldy.w #$0004
	jsr CODE_7E4009
	sta $1F27
	lda $1F25
	ldx $1F31
	ldy.w #$0002
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
	bit.b #$10
	bne CODE_7E3FB1
	plp
	rts
CODE_7E3FB1:
	ldx $1F1D
	ldy $1F1F
	sty VMADDL
	lda $7E9F55,x
	inx
	cmp.b #$00
	beq CODE_7E3FFF
	cmp.b #$01
	bne CODE_7E3FDB
	rep #$20
	lda $9F55,x
	inx
	inx
	clc
	adc.w #$7000
	sta VMADDL
	tay
	sep #$20
	bra CODE_7E3FBA
CODE_7E3FDB:
	rep #$20
	and.w #$00FF
	phx
	tax
	lda $7E8A6D,x
	and.w #$00FF
	plx
	ora.w #$2000
	clc
	adc.w #$0100
	sta VMDATAL
	sep #$20
	iny
	sty $1F1F
	stx $1F1D
	plp
	rts
CODE_7E3FFF:
	lda $1F13
	and.b #$EF
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
	and.b #$0F
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
	cpx.w #$1481
	beq CODE_7E4123
	lda D,$06,x
	sta CGADSUB
	lda D,$00,x
	beq CODE_7E40B7
	sta COLDATA
	bra CODE_7E40D2
CODE_7E40B7:
	lda D,$01,x
	and.b #$1F
	ora.b #$20
	sta COLDATA
	lda D,$02,x
	and.b #$1F
	ora.b #$40
	sta COLDATA
	lda D,$03,x
	and.b #$1F
	ora.b #$80
	sta COLDATA
CODE_7E40D2:
	lda D,$04,x
	sta TS
	lda D,$05,x
	bit.b #$30
	bne CODE_7E40F3
	ora.b #$10
	sta CGWSEL
	lda.b #$80
	sta WOBJSEL
	lda.b #$10
	sta WH2
	lda.b #$F0
	sta WH3
	bra CODE_7E4111
CODE_7E40F3:
	sta CGWSEL
	lda.b #$20
	sta WOBJSEL
	bra CODE_7E4111
CODE_7E40FD:
	lda.b #$02
	sta CGWSEL
	lda.b #$50
	sta CGADSUB
	lda.b #$E0
	sta COLDATA
	lda.b #$07
	sta TS
CODE_7E4111:
	stz W12SEL
	stz W34SEL
	stz WBGLOG
	lda.b #$0C
	sta WOBJLOG
	stz TMW
	rts
CODE_7E4123:
	lda.b #$BB
	sta W12SEL
	lda.b #$BB
	sta W34SEL
	lda.b #$0B
	sta WOBJSEL
	lda D,$06,x
	sta WBGLOG
	and.b #$03
	sta WOBJLOG
	lda.b #$1F
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
	eor.b #$01
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
	lda.b #$00
	pha
	plb
	lda SuperFXScreenMode
	ora.b #$18
	sta SCMR
	stx R15
RunSuperFXRoutine_L1:
	lda SFR
	and.b #$20
	bne RunSuperFXRoutine_L1
	lda SuperFXScreenMode
	sta SCMR
	plb
	rtl
CODE_7E4F0C:
	jml DoSoftReset
RenderSuperFXObjects:
	rep #$30
	lda $14C3
	sta $702B22
	lda $1F09
	sta $701A2A
	sep #$20
	lda.b #$01
	ldx.w #$AC1D
	sta PBR
	lda SuperFXScreenMode
	ora #$18
	sta SCMR
	stx R15
	jsr CODE_7E4F4C
	sep #$20
RenderSuperFXObjects_L1:
	lda SFR
	and.b #$20
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
	and.b #$80
	beq CODE_7E4F68
	jml CODE_7E4F6E
CODE_7E4F68:
	lda.b #$01
	sta D,$2D,x
	bra CODE_7E4F74
CODE_7E4F6E:
	lda D,$1E,x
	ora.b #$02
	sta D,$1E,x
	lda D,$1D,x
	and.b #$7F
	sta D,$1D,x
	rep #$20
	lda.b #$00
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
	ldx.w #$0000
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
	
	
	
	
	
DATA_7E5C72:
	DB $03,$06,$09,$0C,$0F,$12,$15,$18,$1B,$1E,$21,$24,$27,$2A,$2D,$30
	DB $33,$36,$39,$3B,$3E,$41,$43,$46,$49,$4B,$4E,$50,$52,$55,$57,$59
	DB $5B,$5E,$60,$62,$64,$66,$67,$69,$6B,$6C,$6E,$70,$71,$72,$74,$75
	DB $76,$77,$78,$79,$7A,$7B,$7B,$7C,$7D,$7D,$7E,$7E,$7E,$7E,$7E,$7F
DATA_7E5CB2:
	
	
	
	END BASE
	
	
	
	
	ARCH 65816
