UnusedBank06SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/
UnkFunc_068004:
	rep #$20
	stz.w Unknown_18C5
	stz.w Unknown_18C7
	stz.w Unknown_18C9
	stz.w Unused_1956
	lda.w #$0000
	sta.l EnemyHPBarMax
	sep #$20
	stz.w Unknown_14D0
	lda.b #$08
	sta.w Unknown_14D1
	stz.w Unknown_14D3
	stz.w Unknown_14D2
	lda.b #$01
	sta.w Unknown_15AC
	lda.b #$28
	sta.l $7001BC
	sep #$20
	rep #$10
	stz.w Unused_1956
	phb
	lda.b #$7E
	pha
	plb
	ldx.w FirstObject
UnkFunc_068004_L1:
	stz.w Unknown_1248
	jsl ProcObject
	lda.w Unknown_1248
	bne UnkFunc_068004_L3
	ldy.b $00,x
UnkFunc_068004_L2:
	tyx
	bne UnkFunc_068004_L1
	bra UnkFunc_068004_L4
UnkFunc_068004_L3:
	ldy.b $00,x
	jsl Calls_UnkFunc_1FBFE0
	bra UnkFunc_068004_L2
UnkFunc_068004_L4:
	jsl UnkFunc_681D5
	rep #$20
	lda.w #$ACA1
	sta.w TempMiscW
	sep #$20
	jsl CreateChildObject
	bcs UnkFunc_068004_L5
	jml UnkFunc_068004_L6
UnkFunc_068004_L5:
	sty.w Unknown_156B
	lda.w $0009,y
	and.b #~FLAGS09_UNK08
	sta.w $0009,y
	lda.w $001F,y
	and.b #~FLAGS1F_UNK08
	sta.w $001F,y
	lda.w $0020,y
	ora.b #FLAGS20_UNK01
	sta.w $0020,y
	bra UnkFunc_068004_L7
UnkFunc_068004_L6:
	jml UnkFunc_1FBDEE
UnkFunc_068004_L7:
	ldx PlayerObject
	lda.b $1F,x
	and.b #~FLAGS1F_UNK08
	sta.b $1F,x
	lda.b $20,x
	ora.b #FLAGS20_UNK01
	sta.b $20,x
	ldx.w Unknown_1567
	lda.b $1F,x
	and.b #~FLAGS1F_UNK08
	sta.b $1F,x
	lda.b $20,x
	ora.b #FLAGS20_UNK01
	sta.b $20,x
	ldx.w Unknown_1563
	lda.b $1F,x
	and.b #~FLAGS1F_UNK08
	sta.b $1F,x
	lda.b $20,x
	ora.b #FLAGS20_UNK01
	sta.b $20,x
	ldx.w Unknown_1565
	lda.b $1F,x
	and.b #~FLAGS1F_UNK08
	sta.b $1F,x
	lda.b $20,x
	ora.b #FLAGS20_UNK01
	sta.b $20,x
	plb
	rtl
ArwingModelIDTable:
	DW $D320,$D3AC,$D374,$D3E4
	DW $C360,$C398,$C37C,$C3B4
	DW $ACA1,$ACA1,$ACA1,$ACA1
	DW $D764,$D764,$D764,$D764
	DW $ACA1,$ACA1,$ACA1,$ACA1
	DW $D2E8,$D390,$D358,$D3C8
	DW $DD68,$D7B8,$D79C,$D780
SetArwingModel:
	asl
	asl
	asl
	sta.w Unknown_1532
	lda.w Unknown_14D6
	and.b #$18
	beq SetArwingModel_AllWings
	bit.b #$08
	beq SetArwingModel_NoRightWing
	bit.b #$10
	bne SetArwingModel_NoWings
	phx
	tyx
	ply
	phx
	rep #$20
	lda.w Unknown_1532
	and.w #$00FF
	tax
	lda.l ArwingModelIDTable+2,x
	plx
	sta.b $04,x
	sep #$20
	phx
	tyx
	ply
	bra SetArwingModel_Exit
SetArwingModel_NoRightWing:
	phx
	tyx
	ply
	phx
	rep #$20
	lda.w Unknown_1532
	and.w #$00FF
	tax
	lda.l ArwingModelIDTable+4,x
	plx
	sta.b $04,x
	sep #$20
	phx
	tyx
	ply
	bra SetArwingModel_Exit
SetArwingModel_NoWings:
	phx
	tyx
	ply
	phx
	rep #$20
	lda.w Unknown_1532
	and.w #$00FF
	tax
	lda.l ArwingModelIDTable+6,x
	plx
	sta.b $04,x
	sep #$20
	phx
	tyx
	ply
	bra SetArwingModel_Exit
SetArwingModel_AllWings:
	phx
	tyx
	ply
	phx
	rep #$20
	lda.w Unknown_1532
	and.w #$00FF
	tax
	lda.l ArwingModelIDTable+6,x
	plx
	sta.b $04,x
	sep #$20
	phx
	tyx
	ply
SetArwingModel_Exit:
	rtl
InitArwingModelBuffer:
	jsr DoInitArwingModelBuffer
	rtl
DoInitArwingModelBuffer:
	phx
	phy
	rep #$20
	and.w #$00FF
	asl
	asl
	asl
	tax
	lda.l ArwingModelIDTable,x
	sta.l ArwingModelIDBuffer
	lda.l ArwingModelIDTable+2,x
	sta.l ArwingModelIDBuffer+2
	lda.l ArwingModelIDTable+4,x
	sta.l ArwingModelIDBuffer+4
	lda.l ArwingModelIDTable+6,x
	sta.l ArwingModelIDBuffer+6
	sep #$20
	ply
	plx
	rts
UnkFunc_0681C1:
	inc.w Unknown_15A0
	lda.w Unknown_15A0
	cmp.b #$07
	bmi UnkFunc_0681C1_L1
	stz.w Unknown_15A0
UnkFunc_0681C1_L1:
	lda.w Unknown_15A0
	jsr DoInitArwingModelBuffer
	rts
UnkFunc_681D5:
	sep #$20
	rep #$10
	lda.w Unknown_14DD
	and.b #$08
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
Beh67:
	lda.b $2E,x
	ora.b #FLAGS2E_UNK10
	sta.b $2E,x
BehE1_BonusArchway:
	lda.b #$FF
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
	rep #$20
	lda.w #$0000
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	rtl
Beh69:
	lda.b $09,x
	and.b #~FLAGS09_UNK08
	sta.b $09,x
	jml Beh68
Beh68:
	lda.b $2E,x
	ora.b #FLAGS2E_UNK10
	sta.b $2E,x
	lda.b #$80
	sta.b $13,x
	lda.b #$FF
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
	rep #$20
	lda.w #$0000
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	rtl
BehC0:
	lda.b $2E,x
	ora.b #FLAGS2E_UNK10
	sta.b $2E,x
	lda.b #$80
	sta.b $13,x
	lda.b #$FF
	sta.b $2A,x
	lda.b #$14
	sta.b $2B,x
	rep #$20
	lda.w #$0000
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	rtl
BehD1:
	lda.b $2E,x
	ora.b #FLAGS2E_UNK10
	sta.b $2E,x
	lda.b #$FF
	sta.b $2A,x
	lda.b #$14
	sta.b $2B,x
	rep #$20
	lda.w #BehD1_Loop
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(BehD1_Loop)
	sta.b $18,x
BehD1_Loop:
	lda.b $12,x
	clc
	adc.b $22,x
	sta.b $12,x
	lda.b $13,x
	clc
	adc.b $23,x
	sta.b $13,x
	lda.b $14,x
	clc
	adc.b $24,x
	sta.b $14,x
	rtl
Beh88:
	lda.b #$FF
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
	rep #$20
	lda.w #Beh88_Loop
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(Beh88_Loop)
	sta.b $18,x
Beh88_Loop:
	jsl OffsetObjectZPosition
	rtl
Beh08:
	OffsetObjectZPosition
	lda.b $1E,x
	ora.b #FLAGS1E_UNK01
	sta.b $1E,x
	rtl
Beh09:
	rep #$20
	lda.b $26,x
	sta.b $10,x
	sep #$20
	rep #$20
	lda.b $10,x
	clc
	adc.w Unknown_14FA
	sta.b $10,x
	lda.b $1E,x
	ora.b #FLAGS1E_UNK01
	sta.b $1E,x
	rtl
UnkFunc_68671:
	lda.b #$0A
	sta.b $0A,x
	lda.b $1E,x
	ora.b #FLAGS1E_UNK01
	sta.b $1E,x
	rep #$20
	lda.w #UnkFunc_68671_L1
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(UnkFunc_68671_L1)
	sta.b $18,x
	lda.b $22,x
	sta.w Unknown_152C
	lda.b $1D,x
	ora.b #FLAGS1D_UNK20
	sta.b $1D,x
	lda.b #$00
	sta.w Object2ListRel+$15,x
	lda.w Unknown_152C
	sta.w Object2ListRel+$2A,x
	lda.b $20,x
	and.b #~FLAGS20_UNK08
	sta.b $20,x
	lda.b $09,x
	and.b #~FLAGS09_UNK08
	sta.b $09,x
UnkFunc_68671_L1:
	dec.w Object2ListRel+$2A,x
	ldy.w Unknown_158B
	cpy.w #$0000
	bne UnkFunc_68671_L2
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
BehDC:
	lda.b #$00
	ora.b #$80
	sta.w Object2ListRel+$1D,x
Beh0A:
	lda.b $1E,x
	ora.b #FLAGS1E_UNK01
	sta.b $1E,x
	rep #$20
	lda.w #$0000
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	rtl
	
	
	
	
	
	
	
	
	
	
	
	ARCH SUPERFX
;;;;;;;;;;;;;;;;;;;;;;;
;SHEAR SCROLL ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;
CalcShearScroll_Normal2:
	alt1
	lms r7,($00C6)
	with r7
	asr
	from r7
	asr
	asr
	iwt r7,#$0080
	add r7
	alt1
	lms r6,($01B0)
	add r6
	ibt r6,#$01
	iwt r10,#$0222
	iwt r12,#$00E0
	cache
	move r13,r15
	from r6
	alt1
	stb r10
	inc r10
	alt1
	stb r10
	inc r10
	swap
	alt1
	stb r10
	inc r10
	loop
	swap
	stop
	nop
CalcShearScroll_Normal:
	ibt r1,#$00
	ibt r2,#$00
	alt1
	lms r3,($00C6)
	move r0,r3
	not
	asr
	asr
	asr
	asr
	asr
	asr
	to r3
	hib
	with r3
	sex
	to r4
	lob
	with r4
	swap
	ibt r5,#$00
	alt1
	lms r7,($002C)
	with r7
	asr
	with r7
	asr
	with r7
	asr
	alt1
	lms r6,($01B0)
	with r7
	add r6
	ibt r6,#$01
	iwt r9,#$0372
	iwt r10,#$0371
	iwt r12,#$0070
	cache
	move r13,r15
	with r2
	add r4
	with r1
	alt1
	adc r3
	from r1
	add r5
	not
	add r7
	from r6
	alt1
	stb r9
	inc r9
	alt1
	stb r9
	inc r9
	swap
	alt1
	stb r9
	inc r9
	swap
	sub r7
	not
	add r7
	swap
	alt1
	stb r10
	dec r10
	swap
	alt1
	stb r10
	dec r10
	from r6
	alt1
	stb r10
	dec r10
	loop
	nop
	stop
	nop
CalcShearScroll_Tunnel2:
	ibt r1,#$00
	ibt r2,#$00
	alt1
	lms r3
	lms r3,($00C6)
	with r3
	to r0
	add r3
	add r3
	add r3
	with r3
	asr
	with r3
	asr
	add r3
	to r3
	hib
	with r3
	sex
	to r4
	lob
	with r4
	swap
	iwt r5,#$0080
	ibt r6,#$01
	iwt r9,#$0372
	iwt r10,#$0372
	iwt r12,#$0070
	cache
	move r13,r15
	with r2
	add r4
	with r1
	alt1
	adc r3
	from r1
	add r5
	from r6
	alt1
	stb r9
	inc r9
	alt1
	stb r9
	swap
	inc r9
	alt1
	stb r9
	inc r9
	dec r10
	alt1
	stb r10
	swap
	dec r10
	alt1
	stb r10
	dec r10
	from r6
	alt1
	stb r10
	loop
	nop
	stop
	nop
CalcShearScroll_Tunnel:
	ibt r1,#$00
	ibt r2,#$00
	alt1
	lms r3,($00C6)
	move r0,r3
	add r3
	add r3
	add r3
	with r3
	asr
	with r3
	asr
	add r3
	to r3
	hib
	with r3
	sex
	to r4
	lob
	with r4
	swap
	iwt r5,#$0080
	ibt r6,#$01
	iwt r9,#$0372
	iwt r10,#$0372
	ibt r7,#$06
	from r7
	alt3
	romb
	alt1
	lms r7,($01AE)
	dec r7
	bpl CalcShearScroll_Tunnel_L1
	nop
	iwt r13,#$0020
	with r7
	add r13
CalcShearScroll_Tunnel_L1:
	alt2
	sms ($01AE),r7
	iwt r14,#ShearScrollTable_TunnelA
	with r14
	add r7
	to r8
	getb
	with r8
	sex
	ibt r13,#$00
	iwt r12,#$0070
	cache
CalcShearScroll_Tunnel_L2:
	with r2
	add r4
	with r1
	alt1
	adc r3
	from r1
	add r5
	swap
	dec r10
	alt1
	stb r10
	swap
	dec r10
	alt1
	stb r10
	dec r10
	from r6
	alt1
	stb r10
	dec r13
	bpl CalcShearScroll_Tunnel_L3
	nop
	inc r14
	to r8
	getb
	with r8
	sex
	ibt r13,#$70
	with r13
	sub r12
	with r13
	lsr
	with r13
	lsr
	with r13
	lsr
CalcShearScroll_Tunnel_L3:
	move r11,r14
	iwt r14,#ShearScrollTable_TunnelB
	with r14
	add r12
	to r6
	getb
	with r11
	to r14
	with r6
	sex
	with r8
	to r11
	moves r6,r6
	beq CalcShearScroll_Tunnel_L5
	nop
CalcShearScroll_Tunnel_L4:
	with r11
	alt1
	div2
	dec r6
	bne CalcShearScroll_Tunnel_L4
	nop
CalcShearScroll_Tunnel_L5:
	add r11
	ibt r6,#$01
	from r6
	alt1
	stb r9
	inc r9
	alt1
	stb r9
	swap
	inc r9
	alt1
	stb r9
	inc r9
	dec r12
	bne CalcShearScroll_Tunnel_L2
	nop
	stop
	nop
CalcShearScroll_Warped:
	alt1
	lms r0,($01AA)
	dec r0
	bne CalcShearScroll_Warped_L1
	sbk
	alt1
	lms r0,($01AC)
	not
	inc r0
	sbk
	iwt r0,#$0140
	alt2
	sms ($01AA),r0
CalcShearScroll_Warped_L1:
	alt1
	lms r1,($01AC)
	alt1
	lms r0,($01A8)
	add r1
	sbk
	move r3,r0
	add r3
	add r3
	add r3
	with r3
	asr
	with r3
	asr
	add r3
	ibt r1,#$00
	ibt r2,#$00
	to r3
	hib
	with r3
	sex
	to r4
	lob
	with r4
	swap
	ibt r0,#$06
	alt3
	romb
	alt1
	lmd r0,($01A6)
	alt2
	add #$03
	ibt r6,#$46
	alt3
	cmp r6
	blt CalcShearScroll_Warped_L2
	nop
	sub r6
CalcShearScroll_Warped_L2:
	sbk
	iwt r14,#ShearScrollTable_Warped
	with r14
	add r0
	iwt r5,#$0200
	iwt r7,#$0372
	iwt r8,#$0372
	ibt r9,#$01
	alt1
	lms r11,($01B0)
	iwt r12,#$0070
	cache
	move r13,r15
	with r2
	add r4
	with r1
	alt1
	adc r3
	from r1
	to r6
	add r5
	getb
	inc r14
	sex
	add r6
	add r11
	from r9
	alt1
	stb r8
	inc r8
	alt1
	stb r8
	swap
	inc r8
	alt1
	stb r8
	inc r8
	dec r7
	alt1
	stb r7
	dec r7
	swap
	alt1
	stb r7
	dec r7
	from r9
	alt1
	stb r7
	loop
	nop
	stop
	nop
ShearScrollTable_TunnelA:
	DB $EC,$ED,$EE,$EF,$F2,$F6,$FA,$FE,$02,$06,$0A,$0E,$11,$12,$13,$14
	DB $14,$13,$12,$11,$0E,$0A,$06,$02,$FE,$FA,$F6,$F2,$EF,$EE,$ED,$EC
	DB $EC,$ED,$EE,$EF,$F2,$F6,$FA,$FE,$02,$06,$0A,$0E,$11,$12,$13,$14
	DB $14,$13,$12,$11,$0E,$0A,$06,$02,$FE,$FA,$F6,$F2,$EF,$EE,$ED,$EC
	DB $EC,$ED,$EE,$EF,$F2,$F6,$FA,$FE,$02,$06,$0A,$0E,$11,$12,$13,$14
	DB $14,$13,$12,$11,$0E,$0A,$06,$02,$FE,$FA,$F6,$F2,$EF,$EE,$ED,$EC
	DB $EC,$ED,$EE,$EF,$F2,$F6,$FA,$FE,$02,$06,$0A,$0E,$11,$12,$13,$14
	DB $14,$13,$12,$11,$0E,$0A,$06,$02,$FE,$FA,$F6,$F2,$EF,$EE,$ED,$EC
	DB $EC,$ED,$EE,$EF,$F2,$F6,$FA,$FE,$02,$06,$0A,$0E,$11,$12,$13,$14
	DB $14,$13,$12,$11,$0E,$0A,$06,$02,$FE,$FA,$F6,$F2,$EF,$EE,$ED,$EC
	DB $EC,$ED,$EE,$EF,$F2,$F6,$FA,$FE,$02,$06,$0A,$0E,$11,$12,$13,$14
	DB $14,$13,$12,$11,$0E,$0A,$06,$02,$FE,$FA,$F6,$F2,$EF,$EE,$ED,$EC
	DB $EC,$ED,$EE,$EF,$F2,$F6,$FA,$FE,$02,$06,$0A,$0E,$11,$12,$13,$14
	DB $14,$13,$12,$11,$0E,$0A,$06,$02,$FE,$FA,$F6,$F2,$EF,$EE,$ED,$EC
ShearScrollTable_Warped:
	DB $EC,$EC,$EC,$EC,$ED,$ED,$ED,$EE,$EE,$EF,$F0,$F1,$F2,$F3,$F5,$F7
	DB $F9,$FB,$FD,$FF,$02,$04,$06,$08,$0B,$0D,$0E,$0F,$10,$11,$12,$12
	DB $13,$13,$13,$14,$14,$14,$14,$13,$13,$13,$12,$12,$11,$10,$0F,$0E
	DB $0C,$0B,$08,$06,$04,$02,$FF,$FD,$FB,$F9,$F7,$F5,$F3,$F2,$F1,$F0
	DB $EF,$EE,$EE,$ED,$ED,$ED
	DB $EC,$EC,$EC,$EC,$ED,$ED,$ED,$EE,$EE,$EF,$F0,$F1,$F2,$F3,$F5,$F7
	DB $F9,$FB,$FD,$FF,$02,$04,$06,$08,$0B,$0D,$0E,$0F,$10,$11,$12,$12
	DB $13,$13,$13,$14,$14,$14,$14,$13,$13,$13,$12,$12,$11,$10,$0F,$0E
	DB $0C,$0B,$08,$06,$04,$02,$FF,$FD,$FB,$F9,$F7,$F5,$F3,$F2,$F1,$F0
	DB $EF,$EE,$EE,$ED,$ED,$ED
	DB $EC,$EC,$EC,$EC,$ED,$ED,$ED,$EE,$EE,$EF,$F0,$F1,$F2,$F3,$F5,$F7
	DB $F9,$FB,$FD,$FF,$02,$04,$06,$08,$0B,$0D,$0E,$0F,$10,$11,$12,$12
	DB $13,$13,$13,$14,$14,$14,$14,$13,$13,$13,$12,$12,$11,$10,$0F,$0E
	DB $0C,$0B,$08,$06,$04,$02,$FF,$FD,$FB,$F9,$F7,$F5,$F3,$F2,$F1,$F0
	DB $EF,$EE,$EE,$ED,$ED,$ED
	DB $EC,$EC,$EC,$EC,$ED,$ED,$ED,$EE,$EE,$EF,$F0,$F1,$F2,$F3,$F5,$F7
	DB $F9,$FB,$FD,$FF,$02,$04,$06,$08,$0B,$0D,$0E,$0F,$10,$11,$12,$12
	DB $13,$13,$13,$14,$14,$14,$14,$13,$13,$13,$12,$12,$11,$10,$0F,$0E
	DB $0C,$0B,$08,$06,$04,$02,$FF,$FD,$FB,$F9,$F7,$F5,$F3,$F2,$F1,$F0
	DB $EF,$EE,$EE,$ED,$ED,$ED
ShearScrollTable_TunnelB:
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03,$03
	DB $03,$03,$03,$03,$03,$04,$04,$04,$04,$04,$04,$04,$05,$05,$06,$06
	DB $06,$06,$06,$06,$06,$06,$06,$06
	ARCH 65816
