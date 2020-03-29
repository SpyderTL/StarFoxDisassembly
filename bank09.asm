UnusedBank09SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/
CallCopyPositionTo:
	jsl CopyPositionTo
	rts
UnkFunc_098009:
	stz.w Unknown_1532
	jsl UnkAngleGetterFunc_1FD03E
	sep #$20
	xba
	cmp.b $12,x
	beq UnkFunc_098009_L1
UnkFunc_098009_L1:
	sta.b $12,x
	jsl FaceTargetObjectY
	sep #$20
	xba
	eor.b #$FF
	inc
	cmp.b $13,x
	beq UnkFunc_098009_L2
UnkFunc_098009_L2:
	sta.b $13,x
	rts
UnkFunc_09802A:
	lda.w Unknown_18C8
	eor.b #$FF
	inc
	clc
	adc.b #$80
	clc
	adc.w Unknown_152B
	sta.b $13,x
	lda.w Unknown_18C6
	sta.b $12,x
	rts
CallApplyObjectVelocity:
	jsl ApplyObjectVelocity
	rts
Calls_UnkFunc_09A98B:
	jsr UnkFunc_09A98B
	rtl
UnkFunc_098048:
	sta.b TempVecXG
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi UnkFunc_098048_L1
	clc
	adc.b TempVecXG
UnkFunc_098048_L1:
	and.b #$7F
	cmp.b TempVecXG
	bcc UnkFunc_098048_L2
	sec
	sbc.b TempVecXG
UnkFunc_098048_L2:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	rts


























BehSubAdd:
	sta.b TempVecXG
	lda.w Object2ListRel+$12,x
	clc
	adc.b TempVecXG
	sta.w Object2ListRel+$12,x
	rtl
BehSubSet:
	sta.w Object2ListRel+$12,x
	rtl
DoJumpTable:
	sty.w JumpTableTempRegY
	lda.w Object2ListRel+$12,x
	rep #$20
	and.w #$00FF
	asl
	asl
	tay
	sep #$20
	lda [TempJptPtr],y
	pha
	iny
	rep #$20
	lda [TempJptPtr],y
	pha
	sep #$20
	ldy JumpTableTempRegY
	rtl
	
