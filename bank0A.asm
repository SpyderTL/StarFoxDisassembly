UnusedBank0ASetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/










Beh80_FlyingEnemy:
	lda.b #$02					;\Set enemy HP to 2
	sta.b $2A,x					;/
	lda.b #$08					;\Set enemy power to 8
	sta.b $2B,x					;/
	rep #$20					;\Set object behavior routine pointer to Beh80_FlyingEnemy_Loop
	lda.w #Beh80_FlyingEnemy_Loop			;|
	sta.b $16,x					;|
	sep #$20					;|
	lda.b #BANKOF(Beh80_FlyingEnemy_Loop)		;|
	sta.b $18,x					;/
	jsl SetDefaultDestroyColiFuncPtrs
	lda.b #$28
	sta.b $15,x
	rep #$20
	lda.w Object2ListRel+$02,x
	clc
	adc.w #$0096
	sta.w Object2ListRel+$02,x
	sep #$20
	rep #$20
	lda.w Object2ListRel+$02,x
	clc
	adc.w $150F
	sta.w Object2ListRel+$02,x
	sep #$20
	rep #$20
	lda.w #$C344
	sta.w Object2ListRel+$1A,x
	sep #$20
	lda.b #$03
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	lda.b $20,x
	ora.b #$04
	sta.b $20,x
	lda.b $2E,x
	ora.b #$40
	sta.b $2E,x
	lda.b #$03
	sta.w Object2ListRel+$1F,x
Beh80_FlyingEnemy_Loop:
	lda.w Object2ListRel+$12,x
	cmp.b #$00
	beq CODE_0AA1FE
	jml CODE_0AA2CF
CODE_0AA1FE:
	rep #$20
	lda.b $10,x
	sta.w Object2ListRel+$04,x
	sep #$20
	rep #$20
	lda.w Object2ListRel+$04,x
	sec
	sbc.w #$000A
	sta.w Object2ListRel+$04,x
	sep #$20
	stz.w $1532
	rep #$20
	lda.w Object2ListRel+$00,x
	sta.b TempVecXL
	lda.w Object2ListRel+$04,x
	sta.w TempVecZL
	sep #$20
	jsl CODE_1FCF43
	eor.b #$FF
	inc
	cmp.b $13,x
	beq CODE_0AA261
	sec
	sbc.b $13,x
	cmp.b #$00
	bmi CODE_0AA243
	cmp.b #$08
	bpl CODE_0AA249
	lda.b #$08
	bra CODE_0AA249
CODE_0AA243:
	cmp.b #$F8
	bmi CODE_0AA249
	lda.b #$F8
CODE_0AA249:
	cmp.b #$80
	ror
	bpl CODE_0AA250
	adc.b #$00
CODE_0AA250:
	cmp.b #$80
	ror
	bpl CODE_0AA257
	adc.b #$00
CODE_0AA257:
	cmp.b #$80
	ror
	bpl CODE_0AA25E
	adc.b #$00
CODE_0AA25E:
	clc
	adc.b $13,x
CODE_0AA261:
	sta.b $13,x
	rep #$20
	lda.w Object2ListRel+$00,x
	sta.b TempVecXL
	lda.w Object2ListRel+$02,x
	sta.b TempVecYL
	lda.w Object2ListRel+$04,x
	sta TempVecZL
	sep #$20
	jsl CODE_1FD05C
	cmp.b $12,x
	beq CODE_0AA2AF
	sec
	sbc.b $12,x
	cmp.b #$00
	bmi CODE_0AA291
	cmp.b #$08
	bpl CODE_0AA297
	lda.b #$08
	bra CODE_0AA297
CODE_0AA291:
	cmp.b #$F8
	bmi CODE_0AA297
	lda.b #$F8
CODE_0AA297:
	cmp.b #$80
	ror
	bpl CODE_0AA29E
	adc.b #$00
CODE_0AA29E:
	cmp.b #$80
	ror
	bpl CODE_0AA2A5
	adc.b #$00
CODE_0AA2A5:
	cmp.b #$80
	ror
	bpl CODE_0AA2AC
	adc.b #$00
CODE_0AA2AC:
	clc
	adc.b $12,x
CODE_0AA2AF:
	sta.b $12,x
	rep #$20
	lda.b $0E,x
	cmp.w Object2ListRel+$02,x
	sep #$20
	bmi CODE_0AA2C0
	jml CODE_0AA2CF
CODE_0AA2C0:
	lda.w Object2ListRel+$12,x
	inc
	cmp.b #$03
	beq CODE_0AA2CC
	bmi CODE_0AA2CC
	lda.b #$01
CODE_0AA2CC:
	sta.w Object2ListRel+$12,x
CODE_0AA2CF:
	lda.w Object2ListRel+$12,x
	cmp.b #$01
	beq CODE_0AA2DA
	jml CODE_0AA36B:
CODE_0AA2DA:
	stz $1538
	lda.b #$00
	cmp.b $12,x
	bne CODE_0AA2E7
	jml CODE_0AA313
CODE_0AA2E7:
	sec
	sbc.b $12,x
	cmp.b #$00
	bmi CODE_0AA2F6
	cmp.b #$04
	bpl CODE_0AA2FC
	lda.b #$04
	bra CODE_0AA2FC
CODE_0AA2F6:
	cmp.b #$FC
	bmi CODE_0AA2FC
	lda.b #$FC
CODE_0AA2FC:
	cmp.b #$80
	ror
	bpl CODE_0AA303
	adc.b #$00
CODE_0AA303:
	cmp.b #$80
	ror
	bpl CODE_0AA30A
	adc.b #$00
CODE_0AA30A:
	clc
	adc.b $12,x
	sta.b $12,x
	jml CODE_0AA316
CODE_0AA313:
	inc $1538
CODE_0AA316:
	lda.b #$80
	cmp.b $13,x
	bne CODE_0AA320
	jml CODE_0AA34C
CODE_0AA320:
	sec
	sbc.b $13,x
	cmp.b #$00
	bmi CODE_0AA32F
	cmp.b #$04
	bpl CODE_0AA335
	lda.b #$04
	bra CODE_0AA335
CODE_0AA32F:
	cmp.b #$FC
	bmi CODE_0AA335
	lda.b #$FC
CODE_0AA335:
	cmp.b #$80
	ror
	bpl CODE_0AA33C
	adc.b #$00
CODE_0AA33C:
	cmp.b #$80
	ror
	bpl CODE_0AA343
	adc.b #$00
CODE_0AA343:
	clc
	adc.b $13,x
	sta.b $13,x
	jml CODE_0AA34F
CODE_0AA34C:
	inc.w $1538
CODE_0AA34F:
	lda.w $1538
	cmp.b #$02
	bne CODE_0AA35A
	jml CODE_0AA35C
CODE_0AA35A:
	bra CODE_0AA36B
CODE_0AA35C:
	lda.w Object2ListRel+$12,x
	inc
	cmp.b #$03
	beq CODE_0AA368
	bmi CODE_0AA368
	lda.b #$01
CODE_0AA368:
	sta.w Object2ListRel+$12,x
CODE_0AA36B:
	lda.w Object2ListRel+$12,x
	cmp.b #$02
	beq CODE_0AA376
	jml CODE_0AA3BE
CODE_0AA376:
	ldy PlayerObject
	rep #$20
	lda.w $0010,y
	sec
	sbc.b $10,x
	bpl CODE_0AA387
	eor.w #$FFFF
	inc
CODE_0AA387:
	cmp.w #$03E8
	sep #$20
	bmi CODE_0AA392
	jml CODE_0AA3BE
CODE_0AA392:
	jsl CODE_1FDA57
	rep #$20
	lda.w $0010,y
	sec
	sbc.b $10,x
	bpl CODE_0AA3A4
	eor.w #$FFFF
	inc
CODE_0AA3A4:
	cmp.w #$0258
	sep #$20
	bmi CODE_0AA3AF
	jml CODE_0AA3BE
CODE_0AA3AF:
	lda.w Object2ListRel+$12,x
	inc
	cmp.b #$03
	beq CODE_0AA3BB
	bmi CODE_0AA3BB
	lda.b #$01
CODE_0AA3BB:
	sta.w Object2ListRel+$12,x
CODE_0AA3BE:
	lda.w Object2ListRel+$12,x
	cmp.b #$03
	beq CODE_0AA3C9
	jml CODE_0AA3D5
CODE_0AA3C9:
	lda.b $13,x
	sta.b $3A
	lda.b #$80
	jsl CODE_1FD88A
CODE_0AA3D5:
	ldy.w PlayerObject
	rep #$20
	lda.w $0010,y
	sec
	sbc.b $10,x
	bpl CODE_0AA3E6
	eor.w #$FFFF
	inc
CODE_0AA3E6:
	cmp.w #$0190
	bmi CODE_0AA3F0
	cmp.w #$05DC
	bmi CODE_0AA3F6
CODE_0AA3F0:
	sep #$20
	jml CODE_0AA434
CODE_0AA3F6:
	sep #$20
	lda.w $15BB
	clc
	adc.w CurProcObject
	and.b #$07
	beq CODE_0AA407
	jml CODE_0AA434
CODE_0AA407:
	lda.b #$00
	sta.w $154C
	lda.b #$00
	sta.w $154B
	stz.w $154D
	stz.w $154E
	lda.b #$00
	sta.w $1545
	lda.b #$00
	sta.w $1547
	lda.b #$00
	sta.w $1548
	lda.b #$0C
	jsl ShootProjectile
	cpy.w #$0000
	bne CODE_0AA434
	ldy.w $156B
CODE_0AA434:
	lda.b $15,x
	sta.b TempRotZ
	lda.b $13,x
	sta.w TempRotY
	lda.b $12,x
	sta.w TempRotX
	jsl SetTempVelocity
	jsl ApplyObjectVelocity
	jsl OffsetObjectZPosition
	rtl








































































Beh84_FlatFarAwayShip:
	rep #$20					;\Set object behavior routine pointer to Beh84_FlatFarAwayShipLoop
	lda.w #Beh84_FlatFarAwayShipLoop		;|
	sta.b $16,x					;|
	sep #$20					;|
	lda.b #BANKOF(Beh84_FlatFarAwayShipLoop)	;|
	sta.b $18,x					;/
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
	lda.b #$46
	sta.b $0A,x
Beh84_FlatFarAwayShipLoop:
	dec.b $0A,x
	beq CODE_0AB341
	jml CODE_0AB345
CODE_0AB341:
	jsl CODE_1FD501
CODE_0AB345:
	rep #$20					;\Add WParam26 to X position
	lda.b $0C,x					;|
	clc						;|
	adc.b $0026,x					;|
	sta.b $0C,x					;|
	sep #$20					;/
	rep #$20					;\Add WParam28 to Y position
	lda.b $0E,x					;|
	clc						;|
	adc.b $0028,x					;|
	sta.b $0E,x					;|
	sep #$20					;/
	rep #$20					;\Add 60 to Z position
	lda.b $10,x					;|
	clc						;|
	adc.w #$003C					;|
	sta.b $10,x					;|
	sep #$20					;/
	rtl
Beh9B:
	rep #$20
	lda.w #Beh9B_Loop
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(Beh9B_Loop)
	sta.b $18,x
	jsl SetDefaultDestroyColiFuncPtrs
	lda.b #$02
	sta.b $2A,x
	lda.b #$08
	sta.b $08,x
	rep #$20
	lda.w #$DAAC
	sta.w Object2ListRel+$1A,x
	sep #$20
	lda.b #$80
	sta.b $13,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b #$00
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	lda.b $20,x
	ora.b #$04
	sta.b $20,x
	lda.b #$1E
	sta.b $15,x
	jsl CODE_06916D
Beh9B_Loop:
	ldy PlayerObject
	lda.w Object2ListRel+$12,x
	cmp.b #$00
	beq CODE_0AB3BA
	jml CODE_0AB46E
CODE_0AB3BA:
	stz.w $1532
	jsl CODE_1FD03E
	sep #$20
	xba
	cmp.b $12,x
	beq CODE_0AB3EE
	sec
	sbc.b $12,x
	cmp.b #$00
	bmi CODE_0AB3D7
	cmp.b #$04
	bpl CODE_0AB3DD
	lda.b #$04
	bra CODE_0AB3DD
CODE_0AB3D7:
	cmp.b #$FC
	bmi CODE_0AB3DD
	lda.b #$FC
CODE_0AB3DD:
	cmp.b #$80
	ror
	bpl CODE_0AB3E4
	





