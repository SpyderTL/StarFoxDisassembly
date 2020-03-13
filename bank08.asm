UnusedBank08SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/
CODE_088004:
	lda.w $152F
	jsl CODE_1FDC40
	cpy.w #$0000
	bne CODE_088014
	jml CODE_08809A
CODE_088014:
	lda.w $152C
	sta.b $02
	sta.b $04
	bit.b #$80
	beq CODE_088025
	lda.b #$FF
	sta.b $05
	bra CODE_088027
CODE_088025:
	stz.b $05
CODE_088027:
	lda.w $152D
	sta.b $08
	sta.b $0A
	bit.b #$80
	beq CODE_088038
	lda.b #$FF
	sta.b $0B
	bra CODE_08803A
CODE_088038:
	stz.b $0B
CODE_08803A:
	lda.w $152C
	sta.b $90
	sta.w $15C2
	bit.b #$80
	beq CODE_08804D
	lda.b #$FF
	sta.w $15C3
	bra CODE_088050
CODE_08804D:
	stz.w $15C3
CODE_088050:
	lda.b $14,x
	jsl CODE_1FCC78
	lda.b $04
	sta.b $02
	lda.b $0A
	sta.b $08
	lda.w $15C2
	sta.b $90
	lda.b $13,x
	jsl CODE_1FC97B
	rep #$20
	lda.b $04
	asl
	sta.b $04
	lda.b $0A
	asl
	sta.b $0A
	lda.w $15C2
	asl
	sta.w $15C2
	lda.b $0C,x
	clc
	adc.b $04
	sta.w $000C,y
	lda.b $10
	clc
	adc.w $15C2
	sta.w $0010,y
	lda.b $0E,x
	clc
	adc.b $0A
	sta.w $000E,y
	sep #$20
	inc $1530
CODE_08809A:
	rts
CODE_08809B:
	lda.w $152F
	jsl CODE_1FDC40
	cpy.w #$0000
	bne CODE_0880AB
	jml CODE_088134
CODE_0880AB:
	lda.w $152C
	sta.b $02
	sta.b $04
	bit.b #$80
	beq CODE_0880BC
	lda.b #$FF
	sta.b $05
	bra CODE_0880BE
CODE_0880BC:
	stz.b $05
CODE_0880BE:
	lda.w $152D
	sta.b $08
	sta.b $0A
	bit.b #$80
	beq CODE_0880CF
	lda.b #$FF
	sta.b $0B
	bra CODE_0880D1
CODE_0880CF:
	stz.b $0B
CODE_0880D1:
	lda.w $152E
	sta.b $90
	sta.w $15C2
	bit.b #$80
	beq CODE_0880E4
	lda.b #$FF
	sta.w $15C3
	bra CODE_0880E7
CODE_0880E4:
	stz $15C3
CODE_0880E7:
	lda.b $14,x
	jsl CODE_1FCC78
	lda.b $04
	sta.b $02
	lda.b $0A
	sta.b $08
	lda.w $15C2
	sta.b $90
	lda.b $13,x
	jsl CODE_1FC97B
	rep #$20
	lda.b $04
	asl
	asl
	sta.b $04
	lda.b $0A
	asl
	asl
	sta.b $0A
	lda.w $15C2
	asl
	asl
	sta.w $15C2
	lda.b $0C,x
	clc
	adc.b $04
	sta.w $000C,y
	lda.b $10,x
	clc
	adc.w $15C2
	sta.w $0010,y
	lda.b $0E,x
	clc
	adc.b $0A
	sta.w $000E,y
	sep #$20
	inc $1530
CODE_088134:
	rts
CODE_088135:
	lda.b $13,x
	bmi CODE_08813B
	eor.b #$FF
CODE_08813B:
	rep #$20
	bit.b #$80
	beq CODE_088147
	ora.w #$FF00
	bra CODE_08814A
CODE_088147:
	and.b #$FF
CODE_08814A:
	clc
	adc.w #$0040
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	clc
	adc.b $10,x
	sta.b $10,x
	sep #$20
	rts
Beh44_RotateZ:
	lda.b $14,x
	clc
	adc.b #$02
	sta.b $14,x
	rtl
Beh44_RockCrusherBoss:
	rep #$20
	lda.w #Beh44_RotateZ
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(Beh44_RotateZ)
	sta.b $18,x
	rep #$20
	lda.b $16,x
	sta.w Object2ListRel+$0F,x
	sep #$20
	lda.b $18,x
	sta.w Object2ListRel+$11,x
	rep #$20
	lda.w #Beh44_RockCrusherBossLoop
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(Beh44_RockCrusherBossLoop)
	sta.b $18,x
	lda.b #$06
	sta.w Object2ListRel+$0B,x
	lda.b #$06
	sta.w Object2ListRel+$08,x
	rep #$20
	lda.w #$89A3
	sta.w Object2ListRel+$09,x
	lda.w #$EAAE
	sta.w Object2ListRel+$06,x
	sep #$20
	lda.b #$23					;\Set enemy HP to 35
	sta.b $2A,x					;/
	lda.b #$0A					;\Set enemy power to 10
	sta.b $2B,x					;/
	lda.b #$23					;\Set boss HP bar display max to 35
	sta.l EnemyHPBarMax				;/
	lda.b #$00
	sta.l EnemyHPBarCur
	lda.w $1FFD					;\Check level...
	cmp.b #$00					;|
	bne Beh44_NotLevel1				;|...if not level 1, branch to increase HP
	jml Beh44_SkipIncHP				;/...otherwise, branch to skip this
Beh44_NotLevel1:
	lda.b #$46					;\Set enemy HP to 70
	sta.b $2A,x					;/
	lda.b #$0A					;\Set enemy power to 10
	sta.b $2B,x					;/
	lda.b #$46					;\Set boss HP bar display max to 70
	sta.l EnemyHPBarMax				;/
	lda.b #$00
	sta.l EnemyHPBarCur
Beh44_SkipIncHP:
	lda.b #$80					;\Set Z rotation to 180 degrees
	sta.b $13,x					;/
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b $09,x
	ora.b #$01
	sta.b $09,x
	lda.b #$04
	ora.b #$80
	sta.w Object2ListRel+$1C,x
	lda.b $20,x
	ora.b #$40
	sta.b $20,x
	lda.b #$82					;\Play sound effect
	jsl PushSoundEffect				;/
	rep #$20
	lda.w #$BE3C
	sta.w $14C5
	sep #$20
	jsl SpawnChildObject
	bcs CODE_08821C
CODE_08821C:
	lda.b #$01
	jsl LinkChildObject
	rep #$20
	lda.w #CODE_088AC7
	sta.w $0016,y
	sep #$20
	lda.b #BANKOF(CODE_088AC7)
	sta.w $0018,y
	lda.w $002E,y
	ora.b #$10
	sta.w $002E,y
	brl CODE_088240
CODE_08823C:
	jml CODE_1FBDEE
CODE_088240:
	rep #$20
	lda.w #$BE58
	sta.w $14C5
	sep #$20
	jsl SpawnChildObject
	bcs CODE_088254
	jml CODE_088274
CODE_088254:
	lda.b #$02
	jsl LinkChildObject
	rep #$20
	lda.w #CODE_08891A
	sta.w $0016,y
	sep #$20
	lda.b #BANKOF(CODE_08891A)
	sta.w $0018,y
	lda.w $002E,y
	ora.b #$10
	sta.w $002E,y
	brl CODE_088278
CODE_088274:
	jml CODE_1FBDEE
CODE_088278:
	

























Beh5A_TwinBlasterEnemy:
	rep #$20
	lda.w #Beh5A_TwinBlasterEnemyLoop
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(Beh5A_TwinBlasterEnemyLoop)
	sta.b $18,x
	lda.b #$06
	sta.w Object2ListRel+$0B,x
	lda.b #$08
	sta.w Object2ListRel+$08,x
	rep #$20
	lda.w #$89A3
	sta.w Object2ListRel+$09,x
	lda.w #$DDA8
	sta.w Object2ListRel+$06,x
	sep #$20
	lda.b #$08
	sta.b $2A,x
	lda.b #$10
	sta.b $2B,x
	lda.b #$28
	sta.b $15,x
	lda.b $1D,x
	ora.b #$08
	sta.b $1D,x
	lda.b #$02
	sta.b $23,x
Beh5A_TwinBlasterEnemyLoop:
	ldy PlayerObject
	stz $1532
	jsl CODE_1FD03E
	sep #$20
	xba
	cmp.b $12,x
	beq 













































































