UnusedBank07SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/

Beh79:
	rep #$20
	lda.w #Beh79_Loop1
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(Beh79_Loop1)
	sta.b $18,x
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
Beh79_Loop1:
	lda.b $22,x
	bne Beh79_L1
	jml Beh79_L2
Beh79_L1:
	dec.b $22,x
	rtl
Beh79_L2:
	rep #$20
	lda.w #Beh79_Loop2
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(Beh79_Loop2)
	sta.b $18,x
	jsl CODE_06EEEE
	rep #$20
	lda.w $000E,y
	clc
	adc.w #$FFC4
	sta.w $000E,y
	sep #$20
Beh79_Loop2:
	lda.b $23,x
	cmp.b #$06
	bne Beh79_L3
	jml Beh79_L5
Beh79_L3:
	lda.w $15BB
	and.b #$01
	beq Beh79_L4
	jml Beh79_L5
Beh79_L4:
	lda.b $14,x
	cmp.b #$40
	beq Beh79_L5
	bmi Beh79_L5
	jml Beh79_L6
Beh79_L5:
	lda.b $14,x
	clc
	adc.w $0023,x
	sta.b $14,x
Beh79_L6:
	rtl
CODE_07806D:
	lda.b $09,x
	and.b #$F7
	sta.b $09,x
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
	rep #$20
	lda.w #CODE_078092
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(CODE_078092)
	sta.b $18,x
	lda.b #$46
	sta.b $0A,x
	lda.b #$1E
	sta.b $15,x
	lda.b #$C0
	sta.b $14,x
CODE_078092:
	ldy.w PlayerObject
	rep #$20
	lda.w $0010,y
	cmp.w $0010,x
	sep #$20
	bmi CODE_0780A5
	jml CODE_07810C
CODE_0780A5:
	lda.b $1E,x
	and.b #$10
	beq CODE_0780AF
	jml CODE_0780E9
CODE_0780AF:
	lda.b $1E,x
	ora.b #$10
	sta.b $1E,x
	stx.w $158B
	rep #$20
	lda.w #$B219
	sta.w $14C5
	sep #$20
	jsl CreateChildObject
	bcs CODE_0780CC
	jml CODE_0780E3
CODE_0780CC:
	rep #$20
	lda.w #CODE_068671
	sta.w $0016,y
	sep #$20
	lda.b #BANKOF(CODE_068671)
	sta.w $0018,y
	lda.w $0020,y
	ora.b #$08
	sta.w $0020,y
CODE_0780E3:
	lda.b #$32
	jsl PushSoundEffectToQueue
CODE_0780E9:
	lda.b $14,x
	sta.b $3A
	lda.b #$00
	jsl CODE_1FD8F7
	sta.b $14,x
	lda.w $15BB
	and.b #$03
	beq CODE_078100
	jml CODE_07810C
CODE_078100:
	lda.b $12,x
	sta.b $3A
	lda.b #$C0
	jsl CODE_1FD8F7
	sta.b $12,x
CODE_07810C:
	lda.b $15,x
	sta.b $7E
	lda.b $13,x
	sta.w $15A7
	lda.b $12,x
	sta.w $15A6
	jsl SetTempVelocity
	jsl ApplyObjectVelocity
	jsl OffsetObjectZPosition
	dec.b $0A,x
	beq CODE_07812E
	jml CODE_078132
CODE_07812E:
	jsl CODE_1FD501
CODE_078132:
	rtl
JumpDestroyCommonEnemy:
	jml DestroyCommonEnemy
Beh97:
	
	
	
	
	
	
	
	
	
