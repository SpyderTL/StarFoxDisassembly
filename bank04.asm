UnusedBank04SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/

;BEHAVIOR FUNCTION ID $F2
BehF2:
	lda.b #$0A
	sta.b $2A,x
	lda.b #$0A
	sta.b $2B,x
	bra Beh9C
;BEHAVIOR FUNCTION ID $E4
BehE4:
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
	lda.b $1D,x
	ora.b #$40
	sta.b $1D,x
	lda.b #$0A
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
;BEHAVIOR FUNCTION ID $9C
Beh9C:
	rep #$20
	lda.w #Beh9C_E4_F2_Loop
	sta.b $16,x
	sep #$20
	lda.b #(Beh9C_E4_F2_Loop>>16)
	sta.b $18,x
	lda.b #$04
	sta.w Object2ListRel+$0B,x
	lda.b #$06
	sta.w Object2ListRel+$08,x
	rep #$20
	lda.w #$A2DE
	sta.w Object2ListRel+$09,x
	lda.w #$F45F
	sta.w Object2ListRel+$06,x
	sep #$20
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b $1D,x					;\Enable shadow for this object
	ora.b #FLAGS1D_HASSHADOW			;|
	sta.b $1D,x					;/
	lda.b #$00
	sta.b $25,x
	stz.w $F0B0
	stz.w $F0B1
Beh9C_E4_F2_Loop:
	ldy.b $28,x
	phx
	tyx
	lda.l DATA_04A413,x
	plx
	sta.w Object2ListRel+$12,x
	rep #$20
	lda.w #Beh9C_E4_F2_LoopJumpTable
	sta.b $53
	sep #$20
	lda.b #(Beh9C_E4_F2_LoopJumpTable>>16)
	sta.b $55
	jml DoJumpTable
Beh9C_E4_F2_LoopJumpTable:
	JUMPTABLE(CODE_048471)
	JUMPTABLE(CODE_04847A)
	JUMPTABLE(CODE_048483)
	JUMPTABLE(CODE_04849C)
	DB $04,$A4,$84,$00
	DB $04,$AD,$84,$00
	DB $04,$F6,$84,$00
	DB $04,$10,$85,$00
	DB $04,$BC,$85,$00
	DB $04,$CB,$86,$00
	DB $04,$2A,$86,$00
	DB $04,$45,$88,$00
	DB $04,$9D,$88,$00
	DB $04,$10,$89,$00
	DB $04,$7B,$89,$00
	DB $04,$1F,$93,$00
	DB $04,$2E,$8B,$00
	DB $04,$42,$8B,$00
	DB $04,$81,$8B,$00
	DB $04,$BB,$8B,$00
	DB $04,$FA,$8B,$00
	DB $04,$C3,$8C,$00
	DB $04,$31,$8D,$00
	DB $04,$A5,$8E,$00
	DB $04,$EA,$8C,$00
	DB $04,$1E,$90,$00
	DB $04,$67,$84,$00
	DB $04,$5E,$84,$00
	DB $04,$4C,$84,$00
	DB $04,$55,$84,$00
	DB $04,$30,$90,$00
	DB $04,$7D,$90,$00
	DB $04,$91,$90,$00
	DB $04,$F8,$83,$00
	DB $04,$9D,$90,$00
	DB $04,$AA,$90,$00
	DB $04,$D1,$90,$00
	DB $04,$04,$91,$00
	DB $04,$15,$91,$00
	DB $04,$41,$91,$00
	DB $04,$58,$91,$00
	DB $04,$E2,$91,$00
	DB $04,$FA,$91,$00
	DB $04,$05,$92,$00
	DB $04,$2D,$92,$00
	DB $04,$3E,$92,$00
	DB $04,$5E,$92,$00
	DB $04,$6F,$92,$00
	DB $04,$83,$92,$00
	DB $04,$BB,$92,$00
	DB $04,$F1,$92,$00
	DB $04,$D8,$92,$00
	DB $04,$0D,$93,$00
	DB $04,$16,$93,$00
	DB $04,$28,$93,$00
	DB $04,$8F,$93,$00
	DB $04,$BB,$93,$00
	DB $04,$EB,$93,$00
	DB $04,$32,$94,$00
	DB $04,$7D,$94,$00
	DB $04,$86,$94,$00
	DB $04,$8F,$94,$00
	DB $04,$E8,$95,$00
	DB $04,$63,$95,$00
	DB $04,$A8,$94,$00
	DB $04,$24,$97,$00
	DB $04,$2D,$97,$00
	DB $04,$20,$97,$00
	DB $04,$BE,$87,$00
	DB $04,$CC,$87,$00
	DB $04,$D2,$87,$00
	DB $04,$E0,$87,$00
	DB $04,$F1,$87,$00
	DB $04,$FF,$87,$00
	DB $04,$B6,$87,$00
	DB $04,$36,$97,$00
	DB $04,$6B,$97,$00
	DB $04,$75,$98,$00
	DB $04,$AB,$97,$00
	DB $04,$5F,$98,$00
	DB $04,$8B,$98,$00
	DB $04,$9E,$98,$00
	DB $04,$D9,$98,$00
	DB $04,$15,$99,$00
	DB $04,$2B,$99,$00
	DB $04,$04,$9A,$00
	DB $04,$3A,$9A,$00
	DB $04,$AB,$9A,$00
	DB $04,$05,$9B,$00
	DB $04,$30,$9B,$00
	DB $04,$5B,$9B,$00
	DB $04,$6A,$9B,$00
	DB $04,$79,$9B,$00
	DB $04,$3A,$9C,$00
	DB $04,$B4,$9C,$00
	DB $04,$C8,$9C,$00
	DB $04,$E9,$9C,$00
	DB $04,$64,$8A,$00
	DB $04,$82,$8A,$00
	DB $04,$72,$8A,$00
	DB $04,$94,$8A,$00
	DB $04,$07,$8A,$00
	DB $04,$2D,$8A,$00
	DB $04,$19,$8A,$00
	DB $04,$43,$8A,$00
	DB $04,$08,$9D,$00
	DB $04,$23,$9D,$00
	DB $04,$3D,$9D,$00
	DB $04,$5F,$9D,$00
	DB $04,$88,$9D,$00
	DB $04,$A5,$9D,$00
	DB $04,$AE,$9D,$00
	DB $04,$B7,$9D,$00
	DB $04,$DF,$9D,$00
	DB $04,$E7,$9D,$00
	DB $04,$11,$9E,$00
	DB $04,$1A,$9E,$00
	DB $04,$23,$9E,$00
	DB $04,$2D,$9E,$00
	DB $04,$76,$95,$00
	DB $04,$0E,$98,$00
	DB $04,$4F,$92,$00
	DB $04,$CC,$8A,$00
	DB $04,$D8,$8A,$00
	DB $04,$E6,$8A,$00
	DB $04,$F4,$8A,$00
	DB $04,$3D,$9E,$00
	DB $04,$5B,$9E,$00
	DB $04,$78,$9E,$00
	DB $04,$8D,$9E,$00
	DB $04,$CA,$9E,$00
	DB $04,$EC,$9E,$00
	DB $04,$0E,$9F,$00
	DB $04,$30,$9F,$00
	DB $04,$52,$9F,$00
	DB $04,$87,$9F,$00
	DB $04,$C7,$92,$00
	DB $04,$CD,$99,$00
	DB $04,$50,$99,$00
	DB $04,$90,$99,$00
	DB $04,$E2,$98,$00
	DB $04,$E0,$97,$00
	DB $04,$0E,$A0,$00
	DB $04,$ED,$9F,$00
	DB $04,$CC,$9F,$00
	DB $04,$47,$A0,$00
	DB $04,$64,$A0,$00
	DB $04,$A0,$8C,$00
	DB $04,$37,$93,$00
	DB $04,$4C,$93,$00
	DB $04,$63,$93,$00
	DB $04,$78,$93,$00
	DB $04,$58,$8B,$00
	DB $04,$6B,$8B,$00
	DB $04,$D6,$85,$00
	DB $04,$E9,$85,$00
	DB $04,$00,$86,$00
	DB $04,$13,$86,$00
	DB $04,$26,$85,$00
	DB $04,$31,$85,$00
	DB $04,$3C,$85,$00
	DB $04,$47,$85,$00
	DB $04,$61,$85,$00
	DB $04,$7B,$85,$00
	DB $04,$95,$85,$00
	DB $04,$92,$84,$00
	DB $04,$86,$A0,$00

CODE_048318:
	lda.b #$00
	sta.b $24,x
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$000E
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
CODE_04832D:
	lda.b #$00
	sta.b $24,x
CODE_048331:
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$000D
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
CODE_048342:
	lda.b #$00
	sta.b $24,x
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$0009
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
CODE_048357:
	lda.b #$00
	sta.b $24,x
CODE_04835B:
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$0008
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
	
