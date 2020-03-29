UnusedBank0BSetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/
PlayerBeh_Scramble:
	lda.w Unknown_14D6
	ora.b #$60
	sta.w Unknown_14D6
	rep #$20
	lda.w #$FFC4
	sta.w Unknown_1589
	sep #$20
	rep #$20
	lda.w #$FF88
	sta.w Unknown_156F
	sep #$20
	rep #$20
	lda.w #$0078
	sta.w Unknown_1571
	sep #$20
	rep #$20
	lda.w #$FF88
	sta.w Unknown_1573
	sep #$20
	rep #$20
	lda.w #$0078
	sta.w Unknown_1575
	sep #$20
	rep #$20
	lda.w #$0000
	sta.w Unknown_157F
	sep #$20
	rep #$20
	lda.w #$FF88
	sta.w Unknown_157B
	sep #$20
	rep #$20
	lda.w #$0005
	sta.w Unknown_157D
	sep #$20
	rep #$20
	lda.w #$FF88
	sta.w Unknown_1577
	sep #$20
	rep #$20
	lda.w #$FFEC
	sta.w Unknown_1579
	sep #$20
	lda.b #$09
	sta.w Unknown_14DA
	lda.b #$FF
	sta.w Unknown_14DF
	lda.b #$0B
	sta.w Unknown_14D5
	lda.w Unknown_14D0
	ora.b #$00
	sta.w Unknown_14D0
	lda.w Unknown_14D0
	and.b #$DF
	sta.w Unknown_14D0
	lda.w Unknown_14DD
	and.b #$FB
	sta.w Unknown_14DD
	lda.w Unknown_14D8
	ora.b #$02
	sta.w Unknown_14D8
	lda.w Unknown_14D7
	and.b #$FB
	sta.w Unknown_14D7
	lda.w Unknown_14DD
	and.b #$D7
	sta.w Unknown_14DD
	lda.b $1D,x
	ora.b #FLAGS1D_DISPSHADOW
	sta.b $1D,x
	rep #$20
	lda.w #PlayerBeh_Scramble_L3
	sta.w $16,x
	sep #$20
	lda.b #BANKOF(PlayerBeh_Scramble_L3)
	sta.b $18,x
	jsl SetNullDestroyColiFuncPtrs
	sta.w Unknown_15BB
	lda.b #$02
	sta.w FadeMode
	rep #$20
	lda.w #$F800
	sta.w Unknown_18C5
	sep #$20
	lda.w Unknown_14D0
	ora.b #$01
	sta.w Unknown_14D0
	lda.b #$03
	sta.w Unknown_15CA
	lda.w #$ACA1
	sta.w TempMiscW
	sep #$20
	jsl CreateChildObject
	bcs PlayerBeh_Scramble_L1
	jml PlayerBeh_Scramble_L2
PlayerBeh_Scramble_L1:
	rep #$20
	lda.w #UnkFunc_07873F
	sta.w $0016,y
	sep #$20
	lda.b #BANKOF(UnkFunc_07873F)
	sta.w $0018,y
	jsl CopyPositionTo
PlayerBeh_Scramble_L2:
	lda.w Unknown_14D0
	and.b #$EF
	sta.w Unknown_14D0
	lda.b #$46
	sta.w Unknown_1553
	rep #$20
	lda.w #$D304
	sta.b $04,x
	sep #$20
	lda.b #$00
	sta.w Unknown_1551
	lda.b #$00
	sta.w Unknown_1552
PlayerBeh_Scramble_L3:
	inc.w Unknown_1551
	lda.w Unknown_1551
	cmp.b #$1C
	beq PlayerBeh_Scramble_L4
	jml PlayerBeh_Scramble_L5
PlayerBeh_Scramble_L4:
	lda.b #$00
	sta.w Unknown_1551
PlayerBeh_Scramble_L5:
	phx
	rep #$20
	lda.w Unknown_1551
	and.w #$00FF
	tax
	sep #$20
	lda.l ArwingIdleRotZTable,x
	plx
	sta.b $14,x
	lda.w Unknown_1552
	clc
	adc.b #$02
	sta.w Unknown_1552
	lda.w Unknown_1552
	cmp.b #$48
	beq PlayerBeh_Scramble_L6
	jml PlayerBeh_Scramble_L7
PlayerBeh_Scramble_L6:
	lda.b #$00
	sta.w Unknown_1552
PlayerBeh_Scramble_L7:
	phx
	rep #$20
	lda.w Unknown_1552
	and.w #$00FF
	tax
	lda.l ArwingIdleHoverTable,x
	bit.b #$0080
	beq PlayerBeh_Scramble_L8
	ora.w #$FF00
	bra PlayerBeh_Scramble_L9
PlayerBeh_Scramble_L8:
	and.w #$00FF
PlayerBeh_Scramble_L9:
	plx
	asl
	sta.b $0E,x
	sep #$20
	rep #$20
	lda.b $0E,x
	clc
	adc.w #$FFE2
	sta.b $0E,x
	sep #$20
	lda.w Unknown_14D0
	and.b #$10
	bne PlayerBeh_Scramble_L10
	jml PlayerBeh_Scramble_L12
PlayerBeh_Scramble_L10:
	lda.w Unknown_1553
	bne PlayerBeh_Scramble_L11
	jml PlayerBeh_Scramble_L13
PlayerBeh_Scramble_L11:
	dec.w Unknown_1553
PlayerBeh_Scramble_L12:
	rep #$20
	lda.b $10,x
	clc
	adc.w #$0041
	sta.b $10,x
	sep #$20
	jsl ClearPalette
	rtl
PlayerBeh_Scramble_L13:
	rep #$20
	lda.w #PlayerBeh_Scramble_L16
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(PlayerBeh_Scramble_L16)
	sta.b $18,x
	stx.w Unknown_158B
	rep #$20
	lda.w #$B219
	sta.w TempMiscW
	sep #$20
	jsl CreateChildObject
	bcs PlayerBeh_Scramble_L14
	jml PlayerBeh_Scramble_L15
PlayerBeh_Scramble_L14:
	rep #$20
	lda.w #UnkFunc_68671
	sta.w $0016,y
	sep #$20
	lda.b #BANKOF(UnkFunc_68671)
	sta.w $0018,y
	lda.w $0020,y
	ora.b #FLAGS20_UNK08
	sta.w $0020,y
PlayerBeh_Scramble_L15:
	lda.b #$32
	jsl PushSoundEffectToQueue
	lda.w Unknown_14D8
	and.b #$FD
	sta.w Unknown_14D8
PlayerBeh_Scramble_L16:
	lda.b $14,x
	sta.b TempMiscX
	lda.b #$00
	jsl Clamp8Shift8
	sta.b $14,x
	rep #$20
	lda.b $10,x
	clc
	adc.w #$0073
	sta.b $10,x
	rtl
PlayerBeh_Sea:
	lda.w Unknown_14D6
	ora.b #$60
	sta.w Unknown_14D6
	rep #$20
	
	
	
	
	
	
	
	
	
	
	
	
