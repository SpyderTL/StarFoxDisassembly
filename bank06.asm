UnusedBank06SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/

CODE_068004:
	rep #$20
	stz $18C5
	stz $18C7
	stz $18C9
	stz $1956
	lda #$0000
	sta $70019A
	sep #$20
	stz $14D0
	lda #$08
	sta $14D1
	stz $14D3
	stz $14D2






















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
