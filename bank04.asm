CODE_048000:
	lda #$7E
	pha
	plb

;BEHAVIOR FUNCTION ID $F2
BehF2:
	lda #$0A
	sta D,$2A,x
	lda #$0A
	sta D,$2B,x
	bra Beh9C
;BEHAVIOR FUNCTION ID $E4
BehE4:
	lda D,$1E,x
	ora #$01
	sta D,$1E,x
	lda D,$1D,x
	ora #$40
	sta D,$1D,x
	lda #$0A
	sta D,$2A,x
	lda #$08
	sta D,$2B,x
;BEHAVIOR FUNCTION ID $9C
Beh9C:
	rep #$20
	lda.w #Beh9C_E4_F2_Loop
	sta D,$16,x
	sep #$20
	lda.b #(Beh9C_E4_F2_Loop>>16)
	sta D,$18,x
	lda #$04
	sta $1CD5,x
	lda #$06
	sta $1CD2,x
	rep #420
	lda #$A2DE,x
	sta $1CD3,x
	lda #$F45F,x
	sta $1CD0,x
	sep #$20
	lda D,$2E,x
	ora #$10
	sta D,$2E,x
	lda D,$1D,x
	ora #$08
	sta D,$1D,x
	lda #$00
	sta D,$25,x
	stz $F0B0
	stz $F0B1
Beh9C_E4_F2_Loop:
	ldy D,$28,x
	phx
	tyx
	lda.l DATA_04A413,x
	plx
	sta $1CDC,x
	rep #$20
	lda.w #Beh9C_E4_F2_LoopJumpTable
	sta D,$53
	sep #$20
	lda.b #(Beh9C_E4_F2_LoopJumpTable>>16)
	sta D,$55
	jml CODE_09BADE
Beh9C_E4_F2_LoopJumpTable:
	DB $04,$70,$84,$00
	DB $04,$79,$84,$00
	DB $04,$82,$84,$00
	DB $04,$9B,$84,$00
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
	lda #$00
	sta D,$24,x
	sep #$20
	rep #$20
	lda D,$28,x
	clc
	adc #$000E
	sta D,$28,x
	sep #$20
	jmp CODE_04805F
CODE_04832D:
	lda #$00
	sta D,$24,x
CODE_048331:
	sep #$20
	rep #$20
	lda D,$28,x
	clc
	adc #$000D
	sta D,$28,x
	sep #$20
	jmp CODE_04805F
CODE_048342:
	lda #$00
	sta D,$24,x
	sep #$20
	rep #$20
	lda D,$28,x
	clc
	adc #$0009
	sta D,$28,x
	sep #$20
	jmp CODE_04805F
CODE_048357:
	lda #$00
	sta D,$24,x
CODE_04835B:
	sep #$20
	rep #$20
	lda D,$28,x
	clc
	adc #$0008
	sta D,$28,x
	sep #$20
	jmp CODE_04805F

CODE_04836C:
	lda #$00
	ldx D, $24, X
	sep #$20
	rep #$20
	lda D, $28, X
	clc
	adc #$0007
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_048381:
	lda #$00
	ldx D, $24, X
	sep #$20
	rep #$20
	lda D, $28, X
	clc
	adc #$0006
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_0483AB:
	lda #$00
	ldx D, $24, X
	sep #$20
	rep #$20
	lda D, $28, X
	clc
	adc #$0004
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_0483C0:
	lda #$00
	ldx D, $24, X
	sep #$20
	rep #$20
	lda D, $28, X
	clc
	adc #$0003
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_0483D5:
	lda #$00
	ldx D, $24, X
CODE_0483D9:
	sep #$20
	rep #$20
	lda D, $28, X
	clc
	adc #$0002
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_0483EA:
	lda #$00
	ldx D, $24, X
CODE_0483EE:
	sep #$20
	rep #$20
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_0483F9:
	rep #$20
	jsr CODE_04A35F
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_048405:
	rep #$20
	jsr CODE_04A36B
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_048411:
	rep #$20
	jsr CODE_04A377
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_04841D:
	rep #$20
	jsr CODE_04A383
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_048429:
	rep #$20
	jsr CODE_04A38F
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_048435:
	rep #$20
	jsr CODE_04A39B
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_048441:
	rep #$20
	jsr CODE_04A3A7
	sta D, $28, X
	sep #$20
	jmp CODE_04805F

CODE_04844D:
	lda D, $1E, X
	ora #$40
	sta D, $1E, X
	jmp 0483EE

CODE_04844D:
	lda D, $1E, X
	and #$BF
	sta D, $1E, X
	jmp 0483EE

CODE_04844D:
	lda D, $1E, X
	and #$7F
	sta D, $1E, X
	jmp 0483EE

CODE_04844D:
	lda D, $1E, X
	ora #$80
	sta D, $1E, X
	jmp 0483EE

CODE_04844D:
	lda D, $1E, X
	ora #$10
	sta D, $1E, X
	jmp 0483EE

CODE_04844D:
	lda D, $1E, X
	and #$EF
	sta D, $1E, X
	jmp 0483EE

CODE_048483:
	jsr CODE_04A35F
	cmp D, $24, X
	bnz CODE_04848E
	jmp CODE_0483D5
	inc D, $24, X
	jmp CODE_04A1AF

CODE_048493:
	rep @#20
	inc D, $28, X
	jmp CODE_04A1AF
	
