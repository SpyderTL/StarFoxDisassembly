	;Unknown/empty data
	DB $00,$00,$00,$00,$00,$00
	;Unused code
SetUnusedBGColorWhite:
	rep #$30
	lda.w #$7FFF					;\Set unused background to white
	sta.w UnusedBGColor				;/
	ldx.w #$00AA
	bra UnusedCodeMain
SetUnusedBGColorMagenta:
	rep #$30
	lda.w #$7C1F					;\Set unused background to magenta
	sta.w UnusedBGColor				;/
	ldx.w #$00BA
	bra UnusedCodeMain
SetUnusedBGColorYellow:
	rep #$30
	lda.w #$03FF					;\Set unused background to yellow
	sta.w UnusedBGColor				;/
	ldx.w #$00BA
	bra UnusedCodeMain
SetUnusedBGColorCyan:
	rep #$30
	lda.w #$7FE0					;\Set unused background to cyan
	sta.w UnusedBGColor				;/
	lda.w #$00C9
	bra UnusedCodeMain
SetUnusedBGColorGreen:
	rep #$30
	lda.w #$03E0					;\Set unused background to green
	sta.w UnusedBGColor				;/
	ldx.w #$00E2
	bra UnusedCodeMain
ContinueUnusedBGColor:
	rep #$10
	ldx.w #$00D9
	bra UnusedCodeMain
UnusedCodeMain:
	stx.w Unused_177E
	sep #$20
	stz.w NMITIMEN					;\Disable NMIs...
	stz.w HDMAEN					;|...HDMAs...
	sei						;/...and IRQs
	stz.w TM					;\Disable backgrounds and sprites for main/sub screen
	stz.w TS					;/
	lda.b #$00					;\Set data bank to $00
	pha						;|
	plb						;/
	sep #$20
	rep #$10
	lda.b #$80					;\Disable background rendering
	sta.w INIDISP					;/
	lda.b #$22					;\DMA to CGRAM
	sta.w BBAD0					;|
	lda.b #$00					;|
	sta.w CGADD					;|
	ldx.w #UnusedDMADataPtr				;|
	stx.w A1T0L					;|
	lda.b #BANKOF(UnusedDMADataPtr)			;|
	sta.w A1B0					;|
	ldx.w #$0200					;|
	stx.w DAS0L					;|
	lda.b #$00					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	lda.b #$80					;\DMA to VRAM
	sta.w VMAIN					;|
	lda.b #$18					;|
	sta.w BBAD0					;|
	ldx.w #$4000					;|
	stx.w VMADDL					;|
	ldx.w #UnusedDMADataPtr				;|
	stx.w A1T0L					;|
	lda.b #BANKOF(UnusedDMADataPtr)			;|
	sta.w A1B0					;|
	ldx.w #$4000					;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	lda.b #$80					;\DMA to VRAM (again?)
	sta.w VMAIN					;|
	lda.b #$18					;|
	sta.w BBAD0					;|
	ldx.w #$4000					;|
	stx.w VMADDL					;|
	ldx.w #UnusedDMADataPtr				;|
	stx.w A1T0L					;|
	lda.b #BANKOF(UnusedDMADataPtr)			;|
	sta.w A1B0					;|
	ldx.w #$0800					;|
	stx.w DAS0L					;|
	lda.b #$01					;|
	sta.w DMAP0					;|
	lda.b #$01					;|
	sta.w MDMAEN					;/
	stz.w CGADD					;\Set unused background color
	lda.w UnusedBGColor				;|
	sta.w CGDATA					;|
	lda.w UnusedBGColor+1				;|
	sta.w CGDATA					;/
	lda.b #$40
	sta.w BG1SC
	lda.b #$00
	sta.w BG12NBA
	stz.w W12SEL
	stz.w W34SEL
	stz.w WOBJSEL
	stz.w WBGLOG
	stz.w WOBJLOG
	stz.w TMW
	stz.w TSW
	stz.w WH0
	stz.w WH1
	lda.b #$01					;\Use BG mode 1
	sta.w BGMODE					;/
	lda.b #$01					;\Enable Layer 1 for main screen
	sta.w TM					;|
	stz.w TS					;/
	stz.w CGADSUB					;\Set background color to black
	stz.w COLDATA					;/
	stz.w DMAP1					;\Init HDMA to INIDISP register
	lda.b #$00					;|
	sta.w BBAD1					;|
	lda.b #BANKOF(UnusedHDMADataPtrINIDISP)		;|
	sta.w A1B1					;|
	ldx.w #UnusedHDMADataPtrINIDISP			;|
	stx.w A1T1L					;|
	stz.w DAS10					;/
	stz.w BG1VOFS					;\Set Layer 1 scroll position
	stz.w BG1VOFS					;|
	lda.b #$F9					;|
	sta.w BG1HOFS					;|
	lda.b #$FF					;|
	sta.w BG1HOFS					;/
	lda.b #$0F					;\Set default INIDISP register value
	sta.w INIDISP					;/
	lda.b #$02					;\Enable HDMA to INIDISP register
	sta.w HDMAEN					;/
	rep #$10
UnusedCodeMain_Loop:
	ldy.w #$4E20
UnusedCodeMain_Loop2:
	dey
	bne UnusedCodeMain_Loop2
	rep #$20
	lda.w Unused_177E
	cmp.w Unused_1780
	beq UnusedCodeMain_InfinLoop
	sec
	sbc.w Unused_1780
	lsr a
	lsr a
	lsr a
	bne UnusedCodeMain_Continue
	lda.w #$0001
UnusedCodeMain_Continue:
	clc
	adc.w Unused_1780
	sta.w Unused_1780
	sep #$20
	lda.w Unused_1780
	sta.w BG1VOFS
	lda.w Unused_1780+1
	sta.w BG1VOFS
	lda.b #$03
	sta.w APUIO0
	bra UnusedCodeMain_Loop
UnusedCodeMain_InfinLoop:
	bra UnusedCodeMain_InfinLoop
UnusedHDMADataPtrINIDISP:
	DB $54,$00
	DB $01,$01,$01,$02,$01,$03,$01,$04
	DB $01,$05,$01,$06,$01,$07,$01,$08
	DB $01,$09,$01,$0A,$01,$0B,$01,$0C
	DB $01,$0D,$01,$0E,$01,$0F,$01,$0E
	DB $01,$0D,$01,$0C,$01,$0B,$01,$0A
	DB $01,$09,$01,$08,$01,$07,$01,$06
	DB $01,$05,$01,$04,$01,$03,$01,$02
DATA_0081D5:
	DB $00,$05,$0B,$11,$17,$1D,$23,$29,$30,$37,$3D,$44,$4B,$53,$5A,$62
	DB $6A,$71,$7A,$82,$8A,$93,$9C,$A5,$AE,$B7,$C1,$CB,$D5,$DF,$EA,$F5
	DB $00,$0B,$16,$22,$2E,$3A,$47,$53,$60,$6E,$7B,$89,$97,$A6,$B5,$C4
	DB $D4,$E3,$F4,$04,$15,$26,$38,$4A,$5D,$6F,$83,$96,$AB,$BF,$D4,$EA
	DB $00,$16,$2D,$44,$5C,$75,$8E,$A7,$C1,$DC,$F7,$13,$2F,$4D,$6A,$89
	DB $A8,$C7,$E8,$09,$2B,$4D,$71,$95,$BA,$DF,$06,$2D,$56,$7F,$A9,$D4
	DB $00,$2C,$5A,$89,$B9,$EA,$1C,$4F,$83,$B8,$EF,$27,$5F,$9A,$D5,$12
	DB $50,$8F,$D0,$12,$56,$9B,$E2,$2A,$74,$BF,$0C,$5B,$AC,$FE,$52,$A8
	DB $00,$59,$B5,$13,$72,$D4,$38,$9E,$06,$71,$DE,$4E,$BF,$34,$AB,$24
	DB $A0,$1F,$A1,$25,$AC,$37,$C4,$55,$E8,$7F,$19,$B7,$58,$FC,$A4,$50
	DB $00,$B3,$6A,$26,$E5,$A9,$70,$3D,$0D,$E3,$BD,$9C,$7F,$68,$56,$48
	DB $41,$3E,$42,$4B,$59,$6E,$89,$AA,$D1,$FE,$33,$6E,$B0,$F9,$49,$A0
	DB $00,$66,$D5,$4C,$CA,$52,$E1,$7A,$1B,$C6,$7A,$38,$FF,$D0,$AC,$91
	DB $82,$7D,$84,$96,$B3,$DC,$12,$54,$A2,$FD,$66,$DC,$60,$F2,$92,$41
	DB $00,$CD,$AA,$98,$95,$A4,$C3,$F4,$37,$8D,$F5,$70,$FE,$A1,$58,$23
	DB $04,$FB,$08,$2C,$67,$B9,$24,$A8,$44,$FB,$CC,$B9,$C0,$E4,$25,$83
DATA_0082D5:
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
	DB $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$05,$05,$05,$05,$05
	DB $05,$05,$05,$06,$06,$06,$06,$06,$06,$06,$07,$07,$07,$07,$07,$07
	DB $08,$08,$08,$08,$08,$08,$09,$09,$09,$09,$09,$0A,$0A,$0A,$0A,$0B
	DB $0B,$0B,$0B,$0C,$0C,$0C,$0C,$0D,$0D,$0D,$0E,$0E,$0E,$0E,$0F,$0F
	DB $10,$10,$10,$11,$11,$11,$12,$12,$13,$13,$13,$14,$14,$15,$15,$16
	DB $16,$17,$17,$18,$18,$19,$19,$1A,$1A,$1B,$1C,$1C,$1D,$1D,$1E,$1F
	DB $20,$20,$21,$22,$22,$23,$24,$25,$26,$26,$27,$28,$29,$2A,$2B,$2C
	DB $2D,$2E,$2F,$30,$31,$32,$33,$34,$35,$36,$38,$39,$3A,$3B,$3D,$3E
	DB $40,$41,$42,$44,$45,$47,$48,$4A,$4C,$4D,$4F,$51,$52,$54,$56,$58
	DB $5A,$5C,$5E,$60,$62,$64,$67,$69,$6B,$6D,$70,$72,$75,$77,$7A,$7D
	DB $80,$82,$85,$88,$8B,$8E,$91,$94,$98,$9B,$9E,$A2,$A5,$A9,$AD,$B1
	DB $B5,$B8,$BD,$C1,$C5,$C9,$CE,$D2,$D7,$DB,$E0,$E5,$EA,$EF,$F5,$FA
DATA_0083D5:
	DB $00,$00,$20,$32,$40,$4A,$52,$59,$60,$65,$6A,$6E,$72,$76,$79,$7D
	DB $80,$82,$85,$87,$8A,$8C,$8E,$90,$92,$94,$96,$98,$99,$9B,$9D,$9E
	DB $A0,$A1,$A2,$A4,$A5,$A6,$A7,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0,$B1
	DB $B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$B9,$BA,$BB,$BC,$BD,$BD,$BE,$BF
	DB $C0,$C0,$C1,$C2,$C2,$C3,$C4,$C4,$C5,$C6,$C6,$C7,$C7,$C8,$C9,$C9
	DB $CA,$CA,$CB,$CC,$CC,$CD,$CD,$CE,$CE,$CF,$CF,$D0,$D0,$D1,$D1,$D2
	DB $D2,$D3,$D3,$D4,$D4,$D5,$D5,$D5,$D6,$D6,$D7,$D7,$D8,$D8,$D9,$D9
	DB $D9,$DA,$DA,$DB,$DB,$DB,$DC,$DC,$DD,$DD,$DD,$DE,$DE,$DE,$DF,$DF
	DB $E0,$E0,$E0,$E1,$E1,$E1,$E2,$E2,$E2,$E3,$E3,$E3,$E4,$E4,$E4,$E5
	DB $E5,$E5,$E6,$E6,$E6,$E7,$E7,$E7,$E7,$E8,$E8,$E8,$E9,$E9,$E9,$EA
	DB $EA,$EA,$EA,$EB,$EB,$EB,$EC,$EC,$EC,$EC,$ED,$ED,$ED,$ED,$EE,$EE
	DB $EE,$EE,$EF,$EF,$EF,$EF,$F0,$F0,$F0,$F1,$F1,$F1,$F1,$F1,$F2,$F2
	DB $F2,$F2,$F3,$F3,$F3,$F3,$F4,$F4,$F4,$F4,$F5,$F5,$F5,$F5,$F5,$F6
	DB $F6,$F6,$F6,$F7,$F7,$F7,$F7,$F7,$F8,$F8,$F8,$F8,$F9,$F9,$F9,$F9
	DB $F9,$FA,$FA,$FA,$FA,$FA,$FB,$FB,$FB,$FB,$FB,$FC,$FC,$FC,$FC,$FC
	DB $FD,$FD,$FD,$FD,$FD,$FD,$FE,$FE,$FE,$FE,$FE,$FF,$FF,$FF,$FF,$FF
DATA_0084D5:
	DB $00,$00,$12,$1D,$24,$2A,$2F,$33,$36,$3A,$3C,$3F,$41,$43,$45,$47
	DB $49,$4A,$4C,$4D,$4E,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A
	DB $5B,$5C,$5C,$5D,$5E,$5F,$5F,$60,$61,$61,$62,$62,$63,$64,$64,$65
	DB $65,$66,$66,$67,$67,$68,$68,$69,$69,$6A,$6A,$6B,$6B,$6C,$6C,$6C
	DB $6D,$6D,$6E,$6E,$6E,$6F,$6F,$70,$70,$70,$71,$71,$71,$72,$72,$72
	DB $73,$73,$73,$74,$74,$74,$75,$75,$75,$75,$76,$76,$76,$77,$77,$77
	DB $77,$78,$78,$78,$79,$79,$79,$79,$7A,$7A,$7A,$7A,$7B,$7B,$7B,$7B
	DB $7C,$7C,$7C,$7C,$7C,$7D,$7D,$7D,$7D,$7E,$7E,$7E,$7E,$7E,$7F,$7F
	DB $7F,$7F,$7F,$7E,$7E,$7E,$7E,$7E,$7D,$7D,$7D,$7D,$7C,$7C,$7C,$7C
	DB $7C,$7B,$7B,$7B,$7B,$7A,$7A,$7A,$7A,$79,$79,$79,$79,$78,$78,$78
	DB $77,$77,$77,$77,$76,$76,$76,$75,$75,$75,$75,$74,$74,$74,$73,$73
	DB $73,$72,$72,$72,$71,$71,$71,$70,$70,$70,$6F,$6F,$6E,$6E,$6E,$6D
	DB $6D,$6C,$6C,$6C,$6B,$6B,$6A,$6A,$69,$69,$68,$68,$67,$67,$66,$66
	DB $65,$65,$64,$64,$63,$62,$62,$61,$61,$60,$5F,$5F,$5E,$5D,$5C,$5C
	DB $5B,$5A,$59,$58,$57,$56,$55,$54,$53,$52,$51,$50,$4E,$4D,$4C,$4A
	DB $49,$47,$45,$43,$41,$3F,$3C,$3A,$36,$33,$2F,$2A,$24,$1D,$12,$00
DATA_0085D5:
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$03,$03,$03,$03
	DB $03,$03,$03,$03,$04,$04,$04,$04,$04,$04,$05,$05,$05,$05,$05,$06
	DB $06,$06,$06,$07,$07,$07,$08,$08,$08,$09,$09,$09,$0A,$0A,$0B,$0B
	DB $0B,$0C,$0C,$0D,$0D,$0E,$0E,$0F,$10,$10,$11,$12,$12,$13,$14,$15
	DB $15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$20,$21,$22,$24,$25,$26
	DB $28,$29,$2B,$2D,$2F,$30,$32,$34,$36,$38,$3B,$3D,$3F,$42,$44,$47
	DB $4A,$4D,$50,$53,$56,$5A,$5D,$61,$65,$68,$6D,$71,$75,$7A,$7F,$83
DATA_0086D5:
	DB $00,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$06,$06,$06
	DB $06,$06,$06,$06,$06,$08,$08,$08,$08,$08,$08,$0A,$0A,$0A,$0A,$0C
	DB $0C,$0C,$0C,$0E,$0E,$0E,$0E,$10,$10,$10,$12,$12,$12,$14,$14,$16
	DB $16,$16,$18,$18,$1A,$1A,$1C,$1E,$1E,$20,$20,$22,$24,$24,$26,$28
	DB $2A,$2C,$2C,$2E,$30,$32,$34,$36,$38,$3A,$3E,$40,$42,$44,$48,$4A
	DB $4E,$50,$54,$56,$5A,$5E,$62,$66,$68,$6E,$72,$76,$7A,$80,$84,$8A
	DB $8E,$94,$9A,$A0,$A6,$AE,$B4,$BA,$C2,$CA,$D2,$DA,$E2,$EC,$F4,$FE
	DB $08,$12,$1C,$28,$34,$40,$4C,$5A,$66,$74,$84,$92,$A2,$B2,$C4,$D4
	DB $E6,$FA,$0E,$22,$38,$4E,$64,$7C,$96,$B0,$CA,$E6,$02,$20,$40,$60
	DB $82,$A4,$CA,$EE,$16,$3E,$6A,$96,$C2,$F2,$24,$56,$8C,$C4,$FC,$38
	DB $76,$B6,$FA,$40,$88,$D2,$20,$72,$C6,$1E,$78,$D6,$38,$9E,$08,$76
	DB $E8,$5E,$DA,$5A,$E0,$6A,$F8,$8E,$2A,$CA,$72,$20,$D4,$90,$52,$1C
	DB $F0,$CA,$AC,$98,$8E,$8C,$94,$A8,$C4,$EE,$22,$62,$AE,$08,$6E,$E4
	DB $68,$FA,$9C,$4E,$12,$E6,$CE,$C8,$D6,$F8,$30,$7C,$E2,$5E,$F2,$A2
	DB $6C,$50,$54,$74,$B2,$12,$94,$38,$00,$EE,$04,$42,$AA,$3E,$00,$F2
DATA_0087D5:
	DB $00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
	DB $FE,$FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC
	DB $FC,$FC,$FC,$FC,$FB,$FB,$FB,$FB,$FB,$FB,$FA,$FA,$FA,$FA,$FA,$F9
	DB $F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F7,$F6,$F6,$F6,$F5,$F5,$F4,$F4
	DB $F4,$F3,$F3,$F2,$F2,$F1,$F1,$F0,$EF,$EF,$EE,$ED,$ED,$EC,$EB,$EA
	DB $EA,$E9,$E8,$E7,$E6,$E5,$E4,$E3,$E2,$E1,$DF,$DE,$DD,$DB,$DA,$D9
	DB $D7,$D6,$D4,$D2,$D0,$CF,$CD,$CB,$C9,$C7,$C4,$C2,$C0,$BD,$BB,$B8
	DB $B5,$B2,$AF,$AC,$A9,$A5,$A2,$9E,$9B,$97,$92,$8E,$8A,$85,$81,$7C
DATA_0088D5:
	DB $00,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE
	DB $FE,$FE,$FE,$FC,$FC,$FC,$FC,$FC,$FC,$FC,$FC,$FC,$FC,$FA,$FA,$FA
	DB $FA,$FA,$FA,$FA,$FA,$F8,$F8,$F8,$F8,$F8,$F8,$F6,$F6,$F6,$F6,$F4
	DB $F4,$F4,$F4,$F2,$F2,$F2,$F2,$F0,$F0,$F0,$EE,$EE,$EE,$EC,$EC,$EA
	DB $EA,$EA,$E8,$E8,$E6,$E6,$E4,$E2,$E2,$E0,$E0,$DE,$DC,$DC,$DA,$D8
	DB $D6,$D4,$D4,$D2,$D0,$CE,$CC,$CA,$C8,$C6,$C2,$C0,$BE,$BC,$B8,$B6
	DB $B2,$B0,$AC,$AA,$A6,$A2,$9E,$9A,$98,$92,$8E,$8A,$86,$80,$7C,$76
	DB $72,$6C,$66,$60,$5A,$52,$4C,$46,$3E,$36,$2E,$26,$1E,$14,$0C,$02
	DB $F8,$EE,$E4,$D8,$CC,$C0,$B4,$A6,$9A,$8C,$7C,$6E,$5E,$4E,$3C,$2C
	DB $1A,$06,$F2,$DE,$C8,$B2,$9C,$84,$6A,$50,$36,$1A,$FE,$E0,$C0,$A0
	DB $7E,$5C,$36,$12,$EA,$C2,$96,$6A,$3E,$0E,$DC,$AA,$74,$3C,$04,$C8
	DB $8A,$4A,$06,$C0,$78,$2E,$E0,$8E,$3A,$E2,$88,$2A,$C8,$62,$F8,$8A
	DB $18,$A2,$26,$A6,$20,$96,$08,$72,$D6,$36,$8E,$E0,$2C,$70,$AE,$E4
	DB $10,$36,$54,$68,$72,$74,$6C,$58,$3C,$12,$DE,$9E,$52,$F8,$92,$1C
	DB $98,$06,$64,$B2,$EE,$1A,$32,$38,$2A,$08,$D0,$84,$1E,$A2,$0E,$5E
	DB $94,$B0,$AC,$8C,$4E,$EE,$6C,$C8,$00,$12,$FC,$BE,$56,$C2,$00,$0E
DATA_0089D5:
	DB $00,$F0,$F8,$A5,$FC,$96,$52,$22,$FE,$E1,$CB,$B8,$A9,$9C,$91,$87
	DB $7F,$77,$70,$6A,$65,$60,$5C,$58,$54,$51,$4E,$4B,$48,$46,$43,$41
	DB $3F,$3D,$3B,$3A,$38,$36,$35,$34,$32,$31,$30,$2F,$2E,$2D,$2C,$2B
	DB $2A,$29,$28,$27,$27,$26,$25,$24,$24,$23,$23,$22,$21,$21,$20,$20
	DB $1F,$1F,$1E,$1E,$1D,$1D,$1D,$1C,$1C,$1B,$1B,$1B,$1A,$1A,$1A,$19
	DB $19,$19,$18,$18,$18,$17,$17,$17,$17,$16,$16,$16,$16,$15,$15,$15
	DB $15,$14,$14,$14,$14,$14,$13,$13,$13,$13,$13,$12,$12,$12,$12,$12
	DB $12,$11,$11,$11,$11,$11,$11,$11,$10,$10,$10,$10,$10,$10,$10,$10
	DB $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
	DB $0E,$0E,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0C,$0C,$0C
	DB $0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0C,$0B,$0B,$0B,$0B,$0B,$0B
	DB $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0A,$0A,$0A,$0A,$0A,$0A,$0A
	DB $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$09,$09,$09,$09
	DB $09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09
	DB $09,$09,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
	DB $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$07
UnknownSineTable8:
	DB $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1B,$1E,$21,$24,$27,$2A,$2D
	DB $30,$33,$36,$39,$3B,$3E,$41,$43,$46,$49,$4B,$4E,$50,$52,$55,$57
	DB $59,$5B,$5E,$60,$62,$64,$66,$67,$69,$6B,$6C,$6E,$70,$71,$72,$74
	DB $75,$76,$77,$78,$79,$7A,$7B,$7B,$7C,$7D,$7D,$7E,$7E,$7E,$7E,$7E
	DB $7F,$7E,$7E,$7E,$7E,$7E,$7D,$7D,$7C,$7B,$7B,$7A,$79,$78,$77,$76
	DB $75,$74,$72,$71,$70,$6E,$6C,$6B,$69,$67,$66,$64,$62,$60,$5E,$5B
	DB $59,$57,$55,$52,$50,$4E,$4B,$49,$46,$43,$41,$3E,$3B,$39,$36,$33
	DB $30,$2D,$2A,$27,$24,$21,$1E,$1B,$18,$15,$12,$0F,$0C,$09,$06,$03
	DB $00,$FD,$FA,$F7,$F4,$F1,$EE,$EB,$E8,$E5,$E2,$DF,$DC,$D9,$D6,$D3
	DB $D0,$CD,$CA,$C7,$C5,$C2,$BF,$BD,$BA,$B7,$B5,$B2,$B0,$AE,$AB,$A9
	DB $A7,$A5,$A2,$A0,$9E,$9C,$9A,$99,$97,$95,$94,$92,$90,$8F,$8E,$8C
	DB $8B,$8A,$89,$88,$87,$86,$85,$85,$84,$83,$83,$82,$82,$82,$82,$82
	DB $81,$82,$82,$82,$82,$82,$83,$83,$84,$85,$85,$86,$87,$88,$89,$8A
	DB $8B,$8C,$8E,$8F,$90,$92,$94,$95,$97,$99,$9A,$9C,$9E,$A0,$A2,$A5
	DB $A7,$A9,$AB,$AE,$B0,$B2,$B5,$B7,$BA,$BD,$BF,$C2,$C5,$C7,$CA,$CD
	DB $D0,$D3,$D6,$D9,$DC,$DF,$E2,$E5,$E8,$EB,$EE,$F1,$F4,$F7,$FA,$FD
	DB $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1B,$1E,$21,$24,$27,$2A,$2D
	DB $30,$33,$36,$39,$3B,$3E,$41,$43,$46,$49,$4B,$4E,$50,$52,$55,$57
	DB $59,$5B,$5E,$60,$62,$64,$66,$67,$69,$6B,$6C,$6E,$70,$71,$72,$74
	DB $75,$76,$77,$78,$79,$7A,$7B,$7B,$7C,$7D,$7D,$7E,$7E,$7E,$7E,$7E
TiltScrollTable:
	DW TiltScrollTable_00_Flat
	DW TiltScrollTable_01
	DW TiltScrollTable_02
	DW TiltScrollTable_03
	DW TiltScrollTable_04
	DW TiltScrollTable_05_Max
	DW TiltScrollTable_05_Max
	DW TiltScrollTable_05_Max
	DW TiltScrollTable_05_Max
	DW TiltScrollTable_05_Max
TiltScrollTable_00_Flat:
	DW $4010,$4010,$4010,$4010,$4010,$4010,$4010,$4010
	DW $4010,$4010,$4010,$4010,$4010,$4010,$4010,$4010
	DW $4010,$4010,$4010,$4010,$4010,$4010,$4010,$4010
	DW $4010,$4010,$4010,$4010,$4010,$4010,$4010,$4010
TiltScrollTable_01:
	DW $4014,$4013,$4013,$4013,$4012,$4012,$4012,$4012
	DW $4012,$4011,$4011,$4011,$4011,$4010,$4010,$4010
	DW $4010,$4010,$400F,$400F,$400F,$400F,$400E,$400E
	DW $400E,$400E,$400E,$400D,$400D,$400D,$400C,$400C
TiltScrollTable_02:
	DW $4017,$4016,$4015,$4015,$4014,$4014,$4014,$4013
	DW $4013,$4012,$4012,$4012,$4011,$4011,$4010,$4010
	DW $4010,$400F,$400F,$400E,$400E,$400E,$400D,$400D
	DW $400C,$400C,$400C,$400B,$400B,$400A,$4009,$4009
TiltScrollTable_03:
	DW $4019,$4018,$4018,$4017,$4017,$4016,$4015,$4015
	DW $4014,$4014,$4013,$4012,$4012,$4011,$4011,$4010
	DW $400F,$400F,$400E,$400E,$400D,$400C,$400C,$400B
	DW $400B,$400A,$4009,$4009,$4008,$4008,$4007,$4007
TiltScrollTable_04:
	DW $401C,$401B,$401A,$4019,$4018,$4018,$4017,$4016
	DW $4015,$4015,$4014,$4013,$4012,$4012,$4011,$4010
	DW $400F,$400E,$400E,$400D,$400C,$400B,$400B,$400A
	DW $4009,$4008,$4008,$4007,$4006,$4005,$4004,$4004
TiltScrollTable_05_Max:
	DW $4020,$401F,$401E,$401D,$401C,$401B,$401A,$4019
	DW $4018,$4017,$4016,$4015,$4014,$4013,$4012,$4011
	DW $4010,$400F,$400E,$400D,$400C,$400B,$400A,$4009
	DW $4008,$4007,$4006,$4005,$4004,$4003,$4002,$4001
DATA_008DA9:
	DB $FF,$FF,$7F,$7F,$3F,$3F,$1F,$1F,$0F,$0F,$07,$07,$03,$03,$01,$01
	DB $80,$80,$C0,$C0,$E0,$E0,$F0,$F0,$F8,$F8,$FC,$FC,$FE,$FE,$FF,$FF
DATA_008DC9:
	DB $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF
	DB $00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF
	DB $00,$00,$00,$00,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$FF,$FF,$FF,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $00,$00,$FF,$00,$00,$FF,$FF,$FF,$00,$00,$FF,$00,$00,$FF,$FF,$FF
	DB $00,$00,$FF,$00,$00,$FF,$FF,$FF,$00,$00,$FF,$00,$00,$FF,$FF,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00
	DB $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
DATA_008E49:
	DB $DA,$55,$0E,$D1,$22,$ED,$16,$A9,$EA,$05,$9E,$01,$32,$9D,$A6,$D9
	DB $FA,$B5,$2E,$31,$42,$4D,$36,$09,$0A,$65,$BE,$61,$52,$FD,$C6,$39
	DB $1A,$15,$4E,$91,$62,$AD,$56,$69,$2A,$C5,$DE,$C1,$72,$5D,$E6,$99
	DB $3A,$75,$6E,$F1,$82,$0D,$76,$C9,$4A,$25,$FE,$21,$92,$BD,$06,$F9
	DB $5A,$D5,$8E,$51,$A2,$6D,$96,$29,$6A,$85,$1E,$81,$B2,$1D,$26,$59
	DB $7A,$35,$AE,$B1,$C2,$CD,$B6,$89,$8A,$E5,$3E,$E1,$D2,$7D,$46,$B9
	DB $9A,$95,$CE,$11,$E2,$2D,$D6,$E9,$AA,$45,$5E,$41,$F2,$DD,$66,$19
	DB $BA,$F5,$EE,$71,$02,$8D,$F6,$49,$CA,$A5,$7E,$A1,$12,$3D,$86,$79
	DB $DA,$55,$0E,$D1,$22,$ED,$16,$A9,$EA,$05,$9E,$01,$32,$9D,$A6,$D9
	DB $FA,$B5,$2E,$31,$42,$4D,$36,$09,$0A,$65,$BE,$61,$52,$FD,$C6,$39
	DB $1A,$15,$4E,$91,$62,$AD,$56,$69,$2A,$C5,$DE,$C1,$72,$5D,$E6,$99
	DB $3A,$75,$6E,$F1,$82,$0D,$76,$C9,$4A,$25,$FE,$21,$92,$BD,$06,$F9
	DB $5A,$D5,$8E,$51,$A2,$6D,$96,$29,$6A,$85,$1E,$81,$B2,$1D,$26,$59
	DB $7A,$35,$AE,$B1,$C2,$CD,$B6,$89,$8A,$E5,$3E,$E1,$D2,$7D,$46,$B9
	DB $9A,$95,$CE,$11,$E2,$2D,$D6,$E9,$AA,$45,$5E,$41,$F2,$DD,$66,$19
	DB $BA,$F5,$EE,$71,$02,$8D,$F6,$49,$CA,$A5,$7E,$A1,$12,$3D,$86,$79
DATA_008F49:
	DB $00,$00,$DE,$7B,$5A,$73,$18,$6B,$B5,$66,$52,$5E,$10,$5A,$CE,$51
	DB $8C,$4D,$4A,$45,$08,$3D,$C6,$38,$A5,$30,$84,$2C,$63,$24,$42,$20
DATA_008F69:
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
	DB $1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00,$1B,$00
DATA_009049:
	DB $00,$00,$20,$00,$00,$00,$A0,$00,$42,$00,$20,$01,$84,$00,$A0,$01
	DB $C6,$00,$20,$02,$08,$01,$A0,$02,$4A,$01,$20,$03,$8C,$01,$E0,$03
	DB $00,$00,$00,$04,$00,$00,$00,$14,$00,$08,$00,$24,$00,$10,$00,$34
	DB $00,$18,$00,$44,$00,$20,$00,$54,$00,$28,$00,$64,$00,$30,$00,$7C
DATA_009089:
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
;An unused font, possibly for a removed debug menu
DebugFont:
	INCBIN "graphics/debugfont.2bpp.chr"
DATA_009339:
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FE,$FE
DATA_009349:
	DB $00,$FF,$80,$55,$40,$33,$2A,$24,$20,$1C,$19,$17,$15,$13,$12,$11
	DB $10,$0F,$0E,$0D,$0C,$0C,$0B,$0B,$0A,$0A,$09,$09,$09,$08,$08,$08
	DB $08,$07,$07,$07,$07,$06,$06,$06,$06,$06,$06,$05,$05,$05,$05,$05
	DB $05,$05,$05,$05,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	DB $04,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03
	DB $03,$03,$03,$03,$03,$03,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
	DB $02,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
;Goes from 1/(-255) to 1/255
;All values are multiplied by 32768 ($8000)
;1/0 is stored as 0
;1/1 is one less due to being too large
ReciprocalTable:
        DW $FF80,$FF7F,$FF7F,$FF7E,$FF7E,$FF7D,$FF7D,$FF7C
        DW $FF7C,$FF7B,$FF7B,$FF7A,$FF7A,$FF79,$FF79,$FF78
        DW $FF77,$FF77,$FF76,$FF76,$FF75,$FF74,$FF74,$FF73
        DW $FF73,$FF72,$FF71,$FF71,$FF70,$FF70,$FF6F,$FF6E
        DW $FF6E,$FF6D,$FF6C,$FF6C,$FF6B,$FF6A,$FF69,$FF69
        DW $FF68,$FF67,$FF67,$FF66,$FF65,$FF64,$FF64,$FF63
        DW $FF62,$FF61,$FF61,$FF60,$FF5F,$FF5E,$FF5D,$FF5D
        DW $FF5C,$FF5B,$FF5A,$FF59,$FF58,$FF58,$FF57,$FF56
        DW $FF55,$FF54,$FF53,$FF52,$FF51,$FF50,$FF4F,$FF4E
        DW $FF4D,$FF4C,$FF4B,$FF4A,$FF49,$FF48,$FF47,$FF46
        DW $FF45,$FF44,$FF43,$FF42,$FF41,$FF40,$FF3F,$FF3D
        DW $FF3C,$FF3B,$FF3A,$FF39,$FF37,$FF36,$FF35,$FF34
        DW $FF32,$FF31,$FF30,$FF2E,$FF2D,$FF2C,$FF2A,$FF29
        DW $FF27,$FF26,$FF25,$FF23,$FF22,$FF20,$FF1F,$FF1D
        DW $FF1B,$FF1A,$FF18,$FF16,$FF15,$FF13,$FF11,$FF10
        DW $FF0E,$FF0C,$FF0A,$FF08,$FF06,$FF04,$FF02,$FF00
        DW $FEFE,$FEFC,$FEFA,$FEF8,$FEF6,$FEF4,$FEF2,$FEEF
        DW $FEED,$FEEB,$FEE8,$FEE6,$FEE4,$FEE1,$FEDF,$FEDC
        DW $FED9,$FED7,$FED4,$FED1,$FECE,$FECB,$FEC8,$FEC5
        DW $FEC2,$FEBF,$FEBC,$FEB9,$FEB6,$FEB2,$FEAF,$FEAB
        DW $FEA8,$FEA4,$FEA0,$FE9C,$FE98,$FE94,$FE90,$FE8C
        DW $FE88,$FE83,$FE7F,$FE7A,$FE76,$FE71,$FE6C,$FE67
        DW $FE62,$FE5C,$FE57,$FE51,$FE4C,$FE46,$FE40,$FE39
        DW $FE33,$FE2C,$FE26,$FE1F,$FE17,$FE10,$FE08,$FE00
        DW $FDF8,$FDF0,$FDE7,$FDDE,$FDD5,$FDCC,$FDC2,$FDB7
        DW $FDAD,$FDA2,$FD96,$FD8A,$FD7E,$FD71,$FD64,$FD56
        DW $FD47,$FD38,$FD28,$FD18,$FD06,$FCF4,$FCE1,$FCCD
        DW $FCB8,$FCA2,$FC8B,$FC72,$FC58,$FC3D,$FC20,$FC00
        DW $FBDF,$FBBC,$FB97,$FB6E,$FB43,$FB14,$FAE2,$FAAB
        DW $FA70,$FA2F,$F9E8,$F99A,$F944,$F8E4,$F879,$F800
        DW $F778,$F6DC,$F628,$F556,$F45E,$F334,$F1C8,$F000
        DW $EDB7,$EAAB,$E667,$E000,$D556,$C000,$8001,$0000
        DW $7FFF,$4000,$2AAA,$2000,$1999,$1555,$1249,$1000
        DW $0E38,$0CCC,$0BA2,$0AAA,$09D8,$0924,$0888,$0800
        DW $0787,$071C,$06BC,$0666,$0618,$05D1,$0590,$0555
        DW $051E,$04EC,$04BD,$0492,$0469,$0444,$0421,$0400
        DW $03E0,$03C3,$03A8,$038E,$0375,$035E,$0348,$0333
        DW $031F,$030C,$02FA,$02E8,$02D8,$02C8,$02B9,$02AA
        DW $029C,$028F,$0282,$0276,$026A,$025E,$0253,$0249
        DW $023E,$0234,$022B,$0222,$0219,$0210,$0208,$0200
        DW $01F8,$01F0,$01E9,$01E1,$01DA,$01D4,$01CD,$01C7
        DW $01C0,$01BA,$01B4,$01AF,$01A9,$01A4,$019E,$0199
        DW $0194,$018F,$018A,$0186,$0181,$017D,$0178,$0174
        DW $0170,$016C,$0168,$0164,$0160,$015C,$0158,$0155
        DW $0151,$014E,$014A,$0147,$0144,$0141,$013E,$013B
        DW $0138,$0135,$0132,$012F,$012C,$0129,$0127,$0124
        DW $0121,$011F,$011C,$011A,$0118,$0115,$0113,$0111
        DW $010E,$010C,$010A,$0108,$0106,$0104,$0102,$0100
        DW $00FE,$00FC,$00FA,$00F8,$00F6,$00F4,$00F2,$00F0
        DW $00EF,$00ED,$00EB,$00EA,$00E8,$00E6,$00E5,$00E3
        DW $00E1,$00E0,$00DE,$00DD,$00DB,$00DA,$00D9,$00D7
        DW $00D6,$00D4,$00D3,$00D2,$00D0,$00CF,$00CE,$00CC
        DW $00CB,$00CA,$00C9,$00C7,$00C6,$00C5,$00C4,$00C3
        DW $00C1,$00C0,$00BF,$00BE,$00BD,$00BC,$00BB,$00BA
        DW $00B9,$00B8,$00B7,$00B6,$00B5,$00B4,$00B3,$00B2
        DW $00B1,$00B0,$00AF,$00AE,$00AD,$00AC,$00AB,$00AA
        DW $00A9,$00A8,$00A8,$00A7,$00A6,$00A5,$00A4,$00A3
        DW $00A3,$00A2,$00A1,$00A0,$009F,$009F,$009E,$009D
        DW $009C,$009C,$009B,$009A,$0099,$0099,$0098,$0097
        DW $0097,$0096,$0095,$0094,$0094,$0093,$0092,$0092
        DW $0091,$0090,$0090,$008F,$008F,$008E,$008D,$008D
        DW $008C,$008C,$008B,$008A,$008A,$0089,$0089,$0088
        DW $0087,$0087,$0086,$0086,$0085,$0085,$0084,$0084
        DW $0083,$0083,$0082,$0082,$0081,$0081,$0080
DATA_009847:
	DB $0C,$62
;Some unused strings
UnusedStringHover1:
	DB "HOVER 1",$00
UnusedStringTank:
	DB "TANK",$00
UnusedStringWalker1:
	DB "WALKER 1",$00
UnusedStringRelAxis1:
	DB "REL AXIS 1",$00
UnusedStringRelAxis2:
	DB "REL AXIS 2",$00
UnusedStringDemo:
	DB "DEMO",$00
UnusedStringGamePaused:
	DB "GAME PAUSED",$00
UnusedString_:
	DB " ",$00
UnusedStringRelAxis3:
	DB "REL AXIS 3",$00
UnusedStringTable0:
	DW UnusedStringHover1,UnusedStringTank,UnusedStringWalker1,UnusedStringRelAxis1,UnusedStringRelAxis2
DATA_00989D:
	DW $8B8A,$8C0A,$8C8A,$8D0A
;8-bit sine table for 8-bit angles
SineTable8:
	DB $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1B,$1E,$21,$24,$27,$2A,$2D
	DB $30,$33,$36,$39,$3B,$3E,$41,$43,$46,$49,$4B,$4E,$50,$52,$55,$57
	DB $59,$5B,$5E,$60,$62,$64,$66,$67,$69,$6B,$6C,$6E,$70,$71,$72,$74
	DB $75,$76,$77,$78,$79,$7A,$7B,$7B,$7C,$7D,$7D,$7E,$7E,$7E,$7E,$7E
	DB $7F,$7E,$7E,$7E,$7E,$7E,$7D,$7D,$7C,$7B,$7B,$7A,$79,$78,$77,$76
	DB $75,$74,$72,$71,$70,$6E,$6C,$6B,$69,$67,$66,$64,$62,$60,$5E,$5B
	DB $59,$57,$55,$52,$50,$4E,$4B,$49,$46,$43,$41,$3E,$3B,$39,$36,$33
	DB $30,$2D,$2A,$27,$24,$21,$1E,$1B,$18,$15,$12,$0F,$0C,$09,$06,$03
	DB $00,$FD,$FA,$F7,$F4,$F1,$EE,$EB,$E8,$E5,$E2,$DF,$DC,$D9,$D6,$D3
	DB $D0,$CD,$CA,$C7,$C5,$C2,$BF,$BD,$BA,$B7,$B5,$B2,$B0,$AE,$AB,$A9
	DB $A7,$A5,$A2,$A0,$9E,$9C,$9A,$99,$97,$95,$94,$92,$90,$8F,$8E,$8C
	DB $8B,$8A,$89,$88,$87,$86,$85,$85,$84,$83,$83,$82,$82,$82,$82,$82
	DB $81,$82,$82,$82,$82,$82,$83,$83,$84,$85,$85,$86,$87,$88,$89,$8A
	DB $8B,$8C,$8E,$8F,$90,$92,$94,$95,$97,$99,$9A,$9C,$9E,$A0,$A2,$A5
	DB $A7,$A9,$AB,$AE,$B0,$B2,$B5,$B7,$BA,$BD,$BF,$C2,$C5,$C7,$CA,$CD
	DB $D0,$D3,$D6,$D9,$DC,$DF,$E2,$E5,$E8,$EB,$EE,$F1,$F4,$F7,$FA,$FD
	DB $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1B,$1E,$21,$24,$27,$2A,$2D
	DB $30,$33,$36,$39,$3B,$3E,$41,$43,$46,$49,$4B,$4E,$50,$52,$55,$57
	DB $59,$5B,$5E,$60,$62,$64,$66,$67,$69,$6B,$6C,$6E,$70,$71,$72,$74
	DB $75,$76,$77,$78,$79,$7A,$7B,$7B,$7C,$7D,$7D,$7E,$7E,$7E,$7E,$7E
;8.8-bit sine table for 8-bit angles
SineTable8p8:
	DW $0000,$0324,$0647,$096A,$0C8B,$0FAB,$12C7,$15E1
        DW $18F8,$1C0B,$1F19,$2223,$2527,$2826,$2B1E,$2E10
        DW $30FB,$33DE,$36B9,$398C,$3C56,$3F16,$41CD,$447A
        DW $471C,$49B3,$4C3F,$4EBF,$5133,$539A,$55F4,$5842
        DW $5A81,$5CB3,$5ED6,$60EB,$62F1,$64E7,$66CE,$68A5
        DW $6A6C,$6C23,$6DC9,$6F5E,$70E1,$7254,$73B5,$7503
        DW $7640,$776B,$7883,$7989,$7A7C,$7B5C,$7C29,$7CE2
        DW $7D89,$7E1C,$7E9C,$7F08,$7F61,$7FA6,$7FD7,$7FF5
        DW $7FFF,$7FF5,$7FD7,$7FA6,$7F61,$7F08,$7E9C,$7E1C
        DW $7D89,$7CE2,$7C29,$7B5C,$7A7C,$7989,$7883,$776B
        DW $7640,$7503,$73B5,$7254,$70E1,$6F5E,$6DC9,$6C23
        DW $6A6C,$68A5,$66CE,$64E7,$62F1,$60EB,$5ED6,$5CB3
        DW $5A81,$5842,$55F4,$539A,$5133,$4EBF,$4C3F,$49B3
        DW $471C,$447A,$41CD,$3F16,$3C56,$398C,$36B9,$33DE
        DW $30FB,$2E10,$2B1E,$2826,$2527,$2223,$1F19,$1C0B
        DW $18F8,$15E1,$12C7,$0FAB,$0C8B,$096A,$0647,$0324
        DW $0000,$FCDC,$F9B9,$F696,$F375,$F055,$ED39,$EA1F
        DW $E708,$E3F5,$E0E7,$DDDD,$DAD9,$D7DA,$D4E2,$D1F0
        DW $CF05,$CC22,$C947,$C674,$C3AA,$C0EA,$BE33,$BB86
        DW $B8E4,$B64D,$B3C1,$B141,$AECD,$AC66,$AA0C,$A7BE
        DW $A57F,$A34D,$A12A,$9F15,$9D0F,$9B19,$9932,$975B
        DW $9594,$93DD,$9237,$90A2,$8F1F,$8DAC,$8C4B,$8AFD
        DW $89C0,$8895,$877D,$8677,$8584,$84A4,$83D7,$831E
        DW $8277,$81E4,$8164,$80F8,$809F,$805A,$8029,$800B
        DW $8001,$800B,$8029,$805A,$809F,$80F8,$8164,$81E4
        DW $8277,$831E,$83D7,$84A4,$8584,$8677,$877D,$8895
        DW $89C0,$8AFD,$8C4B,$8DAC,$8F1F,$90A2,$9237,$93DD
        DW $9594,$975B,$9932,$9B19,$9D0F,$9F15,$A12A,$A34D
        DW $A57F,$A7BE,$AA0C,$AC66,$AECD,$B141,$B3C1,$B64D
        DW $B8E4,$BB86,$BE33,$C0EA,$C3AA,$C674,$C947,$CC22
        DW $CF05,$D1F0,$D4E2,$D7DA,$DAD9,$DDDD,$E0E7,$E3F5
        DW $E708,$EA1F,$ED39,$F055,$F375,$F696,$F9B9,$FCDC
        DW $0000
;16-bit sine table for 11-bit angles
SineTable16:
	DW $0000,$0064,$00C9,$012D,$0192,$01F6,$025B,$02BF
        DW $0324,$0388,$03ED,$0451,$04B6,$051A,$057F,$05E3
        DW $0647,$06AC,$0710,$0775,$07D9,$083D,$08A2,$0906
        DW $096A,$09CE,$0A33,$0A97,$0AFB,$0B5F,$0BC3,$0C27
        DW $0C8B,$0CEF,$0D53,$0DB7,$0E1B,$0E7F,$0EE3,$0F47
        DW $0FAB,$100E,$1072,$10D6,$1139,$119D,$1201,$1264
        DW $12C8,$132B,$138E,$13F2,$1455,$14B8,$151B,$157F
        DW $15E2,$1645,$16A8,$170A,$176D,$17D0,$1833,$1896
        DW $18F8,$195B,$19BD,$1A20,$1A82,$1AE4,$1B47,$1BA9
        DW $1C0B,$1C6D,$1CCF,$1D31,$1D93,$1DF5,$1E56,$1EB8
        DW $1F19,$1F7B,$1FDC,$203E,$209F,$2100,$2161,$21C2
        DW $2223,$2284,$22E5,$2345,$23A6,$2407,$2467,$24C7
        DW $2528,$2588,$25E8,$2648,$26A8,$2707,$2767,$27C7
        DW $2826,$2886,$28E5,$2944,$29A3,$2A02,$2A61,$2AC0
        DW $2B1F,$2B7D,$2BDC,$2C3A,$2C98,$2CF7,$2D55,$2DB3
        DW $2E11,$2E6E,$2ECC,$2F29,$2F87,$2FE4,$3041,$309E
        DW $30FB,$3158,$31B5,$3211,$326E,$32CA,$3326,$3382
        DW $33DE,$343A,$3496,$34F2,$354D,$35A8,$3604,$365F
        DW $36BA,$3714,$376F,$37CA,$3824,$387E,$38D8,$3932
        DW $398C,$39E6,$3A40,$3A99,$3AF2,$3B4C,$3BA5,$3BFD
        DW $3C56,$3CAF,$3D07,$3D60,$3DB8,$3E10,$3E68,$3EBF
        DW $3F17,$3F6E,$3FC5,$401D,$4073,$40CA,$4121,$4177
        DW $41CE,$4224,$427A,$42D0,$4325,$437B,$43D0,$4425
        DW $447A,$44CF,$4524,$4578,$45CD,$4621,$4675,$46C9
        DW $471C,$4770,$47C3,$4816,$4869,$48BC,$490F,$4961
        DW $49B4,$4A06,$4A58,$4AA9,$4AFB,$4B4C,$4B9E,$4BEF
        DW $4C3F,$4C90,$4CE1,$4D31,$4D81,$4DD1,$4E21,$4E70
        DW $4EBF,$4F0F,$4F5E,$4FAC,$4FFB,$5049,$5097,$50E5
        DW $5133,$5181,$51CE,$521C,$5269,$52B5,$5302,$534E
        DW $539B,$53E7,$5433,$547E,$54CA,$5515,$5560,$55AB
        DW $55F5,$5640,$568A,$56D4,$571D,$5767,$57B0,$57F9
        DW $5842,$588B,$58D4,$591C,$5964,$59AC,$59F3,$5A3B
        DW $5A82,$5AC9,$5B10,$5B56,$5B9D,$5BE3,$5C29,$5C6E
        DW $5CB4,$5CF9,$5D3E,$5D83,$5DC7,$5E0B,$5E50,$5E93
        DW $5ED7,$5F1A,$5F5E,$5FA0,$5FE3,$6026,$6068,$60AA
        DW $60EC,$612D,$616F,$61B0,$61F1,$6231,$6271,$62B2
        DW $62F2,$6331,$6371,$63B0,$63EF,$642D,$646C,$64AA
        DW $64E8,$6526,$6563,$65A0,$65DD,$661A,$6657,$6693
        DW $66CF,$670B,$6746,$6782,$67BD,$67F7,$6832,$686C
        DW $68A6,$68E0,$6919,$6953,$698C,$69C4,$69FD,$6A35
        DW $6A6D,$6AA5,$6ADC,$6B13,$6B4A,$6B81,$6BB8,$6BEE
        DW $6C24,$6C59,$6C8F,$6CC4,$6CF9,$6D2D,$6D62,$6D96
        DW $6DCA,$6DFD,$6E30,$6E63,$6E96,$6EC9,$6EFB,$6F2D
        DW $6F5F,$6F90,$6FC1,$6FF2,$7023,$7053,$7083,$70B3
        DW $70E2,$7112,$7141,$716F,$719E,$71CC,$71FA,$7227
        DW $7255,$7282,$72AF,$72DB,$7307,$7333,$735F,$738A
        DW $73B5,$73E0,$740B,$7435,$745F,$7489,$74B2,$74DB
        DW $7504,$752D,$7555,$757D,$75A5,$75CC,$75F4,$761B
        DW $7641,$7668,$768E,$76B3,$76D9,$76FE,$7723,$7747
        DW $776C,$7790,$77B4,$77D7,$77FA,$781D,$7840,$7862
        DW $7884,$78A6,$78C7,$78E8,$7909,$792A,$794A,$796A
        DW $798A,$79A9,$79C8,$79E7,$7A05,$7A24,$7A42,$7A5F
        DW $7A7D,$7A9A,$7AB6,$7AD3,$7AEF,$7B0B,$7B26,$7B42
        DW $7B5D,$7B77,$7B92,$7BAC,$7BC5,$7BDF,$7BF8,$7C11
        DW $7C29,$7C42,$7C5A,$7C71,$7C89,$7CA0,$7CB7,$7CCD
        DW $7CE3,$7CF9,$7D0F,$7D24,$7D39,$7D4E,$7D62,$7D76
        DW $7D8A,$7D9D,$7DB0,$7DC3,$7DD6,$7DE8,$7DFA,$7E0C
        DW $7E1D,$7E2E,$7E3F,$7E4F,$7E5F,$7E6F,$7E7F,$7E8E
        DW $7E9D,$7EAB,$7EBA,$7EC8,$7ED5,$7EE3,$7EF0,$7EFD
        DW $7F09,$7F15,$7F21,$7F2D,$7F38,$7F43,$7F4D,$7F58
        DW $7F62,$7F6B,$7F75,$7F7E,$7F87,$7F8F,$7F97,$7F9F
        DW $7FA7,$7FAE,$7FB5,$7FBC,$7FC2,$7FC8,$7FCE,$7FD3
        DW $7FD8,$7FDD,$7FE1,$7FE5,$7FE9,$7FED,$7FF0,$7FF3
        DW $7FF6,$7FF8,$7FFA,$7FFC,$7FFD,$7FFE,$7FFF,$7FFF
DATA_009FE7:
	DB $48,$50,$20,$20,$20,$5D,$00,$41,$5C,$00
;More unused strings
UnusedStringLoading:
	DB "LOADING",$00
UnusedStringBayEmpty:
	DB "BAY EMPTY",$00
UnusedStringTable1:
	DW UnusedStringNull,UnusedStringMissile1,UnusedStringMissile2,UnusedStringTLaser
	DW UnusedStringHMissile,UnusedStringTMGun,UnusedStringMachGun,UnusedStringLaser
	DW UnusedStringTriLaser,UnusedStringShotGun
UnusedStringNull:
	DB "NULL",$00,$00,$00,$00,$00,$00
UnusedStringMissile1:
	DB "MISSILE1",$00,$00
UnusedStringMissile2:
	DB "MISSILE2",$00,$00
UnusedStringTLaser:
	DB "TLASER",$00,$00,$00,$00
UnusedStringHMissile:
	DB "HMISSILE",$00,$00
UnusedStringTMGun:
	DB "TM GUN",$00,$00,$00,$00,$00
UnusedStringMachGun:
	DB "MACH GUN",$00,$00
UnusedStringLaser:
	DB "LASER",$00,$00,$00,$00
UnusedStringTriLaser:
	DB "TRILASER",$00,$00
UnusedStringShotGun:
	DB "SHOT GUN",$00,$00
DATA_00A07B:
	DB $00,$00,$00,$00,$00,$00,$00,$00
	DB $70,$70,$70,$70,$70,$70,$00,$00
;Ship and guideline sprites for the map screen
MapShipGraphic:
	INCBIN "graphics/mapshipgraphics.4bpp.chr"
;Atan2 table for calculating 16-bit angles
Atan2Table:
	DW $0000,$0020,$0050,$0070,$00A0,$00C0,$00F0,$0110
        DW $0140,$0160,$0190,$01B0,$01E0,$0210,$0230,$0260
        DW $0280,$02B0,$02D0,$0300,$0320,$0350,$0370,$03A0
        DW $03C0,$03F0,$0410,$0440,$0470,$0490,$04C0,$04E0
        DW $0510,$0530,$0560,$0580,$05B0,$05D0,$0600,$0620
        DW $0650,$0670,$06A0,$06C0,$06E0,$0710,$0730,$0760
        DW $0780,$07B0,$07D0,$0800,$0820,$0850,$0870,$0890
        DW $08C0,$08E0,$0910,$0930,$0960,$0980,$09A0,$09D0
        DW $09F0,$0A20,$0A40,$0A60,$0A90,$0AB0,$0AD0,$0B00
        DW $0B20,$0B50,$0B70,$0B90,$0BC0,$0BE0,$0C00,$0C30
        DW $0C50,$0C70,$0CA0,$0CC0,$0CE0,$0D00,$0D30,$0D50
        DW $0D70,$0DA0,$0DC0,$0DE0,$0E00,$0E30,$0E50,$0E70
        DW $0E90,$0EC0,$0EE0,$0F00,$0F20,$0F40,$0F70,$0F90
        DW $0FB0,$0FD0,$0FF0,$1020,$1040,$1060,$1080,$10A0
        DW $10C0,$10E0,$1110,$1130,$1150,$1170,$1190,$11B0
        DW $11D0,$11F0,$1210,$1230,$1260,$1280,$12A0,$12C0
        DW $12E0,$1300,$1320,$1340,$1360,$1380,$13A0,$13C0
        DW $13E0,$1400,$1420,$1440,$1460,$1480,$14A0,$14C0
        DW $14E0,$14F0,$1510,$1530,$1550,$1570,$1590,$15B0
        DW $15D0,$15F0,$1610,$1620,$1640,$1660,$1680,$16A0
        DW $16C0,$16D0,$16F0,$1710,$1730,$1750,$1770,$1780
        DW $17A0,$17C0,$17E0,$17F0,$1810,$1830,$1850,$1860
        DW $1880,$18A0,$18C0,$18D0,$18F0,$1910,$1920,$1940
        DW $1960,$1970,$1990,$19B0,$19C0,$19E0,$1A00,$1A10
        DW $1A30,$1A50,$1A60,$1A80,$1A90,$1AB0,$1AD0,$1AE0
        DW $1B00,$1B10,$1B30,$1B50,$1B60,$1B80,$1B90,$1BB0
        DW $1BC0,$1BE0,$1BF0,$1C10,$1C20,$1C40,$1C50,$1C70
        DW $1C80,$1CA0,$1CB0,$1CD0,$1CE0,$1D00,$1D10,$1D30
        DW $1D40,$1D60,$1D70,$1D80,$1DA0,$1DB0,$1DD0,$1DE0
        DW $1DF0,$1E10,$1E20,$1E40,$1E50,$1E60,$1E80,$1E90
        DW $1EA0,$1EC0,$1ED0,$1EF0,$1F00,$1F10,$1F30,$1F40
        DW $1F50,$1F60,$1F80,$1F90,$1FA0,$1FC0,$1FD0,$1FE0
;Model ID table for level commands 00/70/74/etc.
ModelIDTable:
	DW $ACA1,$C0F8,$D320,$BDE8,$B744,$B77C,$B7F1,$B8BF
        DW $B7D5,$B70C,$AF09,$B92F,$DB38,$B601,$B61D,$B643
        DW $B465,$BDCC,$B4DA,$BE74,$C7C0,$C018,$C050,$C034
        DW $B4FB,$B517,$B42D,$B84A,$C0DC,$C0C0,$C114,$B680
        DW $C0A4,$C1BC,$D294,$B760,$B7B9,$C14C,$C168,$C1A0
        DW $C184,$B449,$D710,$C5E4,$C61C,$C5C8,$C574,$C558
        DW $C53C,$C45C,$C3EC,$C408,$C2F0,$C22C,$C1F4,$C264
        DW $C6A8,$C6C4,$C424,$B481,$C92C,$C964,$DD4C,$D400
        DW $D41C,$D438,$D454,$D470,$C948,$BEC8,$C6E0,$C6FC
        DW $C718,$C130,$C1D8,$C788,$C7A4,$B99F,$C99C,$BA84
        DW $E580,$D4FC,$D614,$D5F8,$CA7C,$C3D0,$D630,$D64C
        DW $D668,$D684,$D6A0,$D6BC,$D6D8,$D6F4,$D518,$D828
        DW $D844,$D860,$D898,$D8B4,$D8D0,$D8EC,$D908,$B1A9
        DW $C30C,$D924,$D95C,$D978,$D994,$D9B0,$DA04,$DA3C
        DW $DA74,$DB1C,$E6D0,$E794,$E724,$CBB0,$CB78,$CB24
        DW $CB94,$CAEC,$CB08,$BBD4,$DDA0,$BB2C,$DDBC,$DDD8
        DW $DA90,$DE2C,$CDC4,$DE48,$DE9C,$DEB8,$DF28,$DF44
        DW $DF7C,$DFB4,$E0CC,$E024,$E05C,$E094,$E13C,$E174
        DW $DF98,$DFD0,$E0E8,$E040,$E078,$E0B0,$E158,$E190
        DW $E1AC,$E1C8,$E2A8,$E200,$E21C,$DE10,$C494,$C4B0
        DW $C478,$E254,$E270,$E28C,$E2C4,$E740,$E75C,$E6EC
        DW $E778,$CBCC,$CC20,$CC74,$CCC8,$CD1C,$CD70,$CDFC
        DW $CBE8,$CC3C,$CC90,$CCE4,$CD38,$CD8C,$CE18,$CC04
        DW $CC58,$CCAC,$CD00,$CD54,$CDA8,$CE34,$E2FC,$E2E0
        DW $BBB8,$B005,$AF79,$E318,$E468,$E430,$E44C,$E414
        DW $CEDC,$E36C,$E350,$E3A4,$E3DC,$CDE0,$CF4C,$CF68
        DW $CEA4,$E4A0,$E4D8,$E4F4,$D010,$D02C,$D048,$D064
        DW $E484,$E388,$D33C,$DB8C,$E52C,$DB70,$E510,$D0B8
        DW $BCB4,$BCD0,$B0C9,$C84C,$C868,$C884,$DBC4,$C328
        DW $BAF4,$BAD8,$E238,$BB10,$D198,$AFCD,$B9D7,$E708
        DW $E804,$E874,$E7B0,$E83C,$C8F4,$B235,$B251,$DC6C
        DW $DCC0
;Behavior function pointer table for level commands 00/70/74/etc.
BehaviorFunctionTable:
	BEHFUNCPTR(Beh00,$00)
	BEHFUNCPTR(Beh01,$00)
	BEHFUNCPTR(Beh02,$00)
	BEHFUNCPTR(Beh03,$00)
	BEHFUNCPTR(Beh04,$01)
	BEHFUNCPTR(Beh05,$01)
	BEHFUNCPTR(Beh06,$01)
	BEHFUNCPTR(Beh07,$01)
	BEHFUNCPTR(Beh08,$00)
	BEHFUNCPTR(Beh09,$00)
	BEHFUNCPTR(Beh0A,$00)
	BEHFUNCPTR(Beh0B,$00)
	BEHFUNCPTR(Beh0C,$00)
	BEHFUNCPTR(Beh0D,$25)
	BEHFUNCPTR(Beh0E,$25)
	BEHFUNCPTR(Beh0F,$02)
	BEHFUNCPTR(Beh10,$02)
	BEHFUNCPTR(Beh11,$02)
	BEHFUNCPTR(Beh12,$02)
	BEHFUNCPTR(Beh13,$02)
	BEHFUNCPTR(Beh14,$02)
	BEHFUNCPTR(Beh15,$02)
	BEHFUNCPTR(Beh16,$02)
	BEHFUNCPTR(Beh17,$02)
	BEHFUNCPTR(Beh18,$02)
	BEHFUNCPTR(Beh19,$02)
	BEHFUNCPTR(Beh1A,$02)
	BEHFUNCPTR(Beh1B,$02)
	BEHFUNCPTR(Beh1C,$02)
	BEHFUNCPTR(Beh1D,$02)
	BEHFUNCPTR(Beh1E,$02)
	BEHFUNCPTR(Beh1F,$02)
	BEHFUNCPTR(Beh20,$02)
	BEHFUNCPTR(Beh21,$02)
	BEHFUNCPTR(Beh22,$02)
	BEHFUNCPTR(Beh23,$02)
	BEHFUNCPTR(Beh24,$02)
	BEHFUNCPTR(Beh25,$02)
	BEHFUNCPTR(Beh26,$02)
	BEHFUNCPTR(Beh27,$02)
	BEHFUNCPTR(Beh28,$02)
	BEHFUNCPTR(Beh29,$02)
	BEHFUNCPTR(Beh2A,$02)
	BEHFUNCPTR(Beh2B,$02)
	BEHFUNCPTR(Beh2C,$02)
	BEHFUNCPTR(Beh2D,$00)
	BEHFUNCPTR(Beh2E,$35)
	BEHFUNCPTR(Beh2F,$03)
	BEHFUNCPTR(Beh30_Turret,$04)
	BEHFUNCPTR(Beh31,$05)
	BEHFUNCPTR(Beh32,$06)
	BEHFUNCPTR(Beh33,$0D)
	BEHFUNCPTR(Beh34_MidLevelRing,$07)
	BEHFUNCPTR(Beh35,$08)
	BEHFUNCPTR(Beh36,$09)
	BEHFUNCPTR(Beh37,$0B)
	BEHFUNCPTR(Beh38,$0A)
	BEHFUNCPTR(Beh39,$0B)
	BEHFUNCPTR(Beh3A,$0B)
	BEHFUNCPTR(Beh3B_EnemyShip,$0C)
	BEHFUNCPTR(Beh3C,$0E)
	BEHFUNCPTR(Beh3D,$0E)
	BEHFUNCPTR(Beh3E_CloakingEnemy,$0F)
	BEHFUNCPTR(Beh3F_CloakingEnemy,$0F)
	BEHFUNCPTR(Beh40_Bee,$10)
	BEHFUNCPTR(Beh41_ButterflyIntro,$35)
	BEHFUNCPTR(Beh42_FourArmedEnemy,$11)
	BEHFUNCPTR(Beh43_Missile,$12)
	BEHFUNCPTR(Beh44_RockCrusherBoss,$13)
	BEHFUNCPTR(Beh45_ArmadaCruiser,$14)
	BEHFUNCPTR(Beh46_ArmadaBattleshipEntry,$15)
	BEHFUNCPTR(Beh47_AtomicBaseEntry,$16)
	BEHFUNCPTR(Beh48_AtomicBaseEntry,$17)
	BEHFUNCPTR(Beh49,$1B)
	BEHFUNCPTR(Beh4A,$18)
	BEHFUNCPTR(Beh4B,$19)
	BEHFUNCPTR(Beh4C,$19)
	BEHFUNCPTR(Beh4D_Cyclops,$1A)
	BEHFUNCPTR(Beh4E,$1B)
	BEHFUNCPTR(Beh4F_FlyingFish,$00)
	BEHFUNCPTR(Beh50,$1F)
	BEHFUNCPTR(Beh51_AtomicCoreBossTaser,$2B)
	BEHFUNCPTR(Beh52,$00)
	BEHFUNCPTR(Beh53_AtomicCoreBossBlaster,$2E)
	BEHFUNCPTR(Beh54_DestructorBoss,$39)
	BEHFUNCPTR(Beh55_AtomicCoreBossLaser,$2C)
	BEHFUNCPTR(Beh56_AtomicCoreBossWallPiece,$2D)
	BEHFUNCPTR(Beh57_ShieldEnemy,$2F)
	BEHFUNCPTR(Beh58,$30)
	BEHFUNCPTR(Beh59_ExtraCredit,$00)
	BEHFUNCPTR(Beh5A_TwinBlasterEnemy,$31)
	BEHFUNCPTR(Beh5B_AntennaDish,$32)
	BEHFUNCPTR(Beh5C_AntennaBase,$33)
	BEHFUNCPTR(Beh5D,$34)
	BEHFUNCPTR(Beh5E_Butterfly,$35)
	BEHFUNCPTR(Beh5F_Butterfly,$35)
	BEHFUNCPTR(Beh60,$36)
	BEHFUNCPTR(Beh61,$36)
	BEHFUNCPTR(Beh62,$37)
	BEHFUNCPTR(Beh63,$09)
	BEHFUNCPTR(Beh64_Pylon,$3A)
	BEHFUNCPTR(Beh65,$00)
	BEHFUNCPTR(Beh66,$00)
	BEHFUNCPTR(Beh67,$00)
	BEHFUNCPTR(Beh68,$00)
	BEHFUNCPTR(Beh69,$00)
	BEHFUNCPTR(Beh6A,$3B)
	BEHFUNCPTR(Beh6B,$45)
	BEHFUNCPTR(Beh6C,$02)
	BEHFUNCPTR(Beh6D,$02)
	BEHFUNCPTR(Beh6E,$47)
	BEHFUNCPTR(Beh6F,$46)
	BEHFUNCPTR(Beh70,$00)
	BEHFUNCPTR(Beh71,$02)
	BEHFUNCPTR(Beh72_PhantronBoss,$4C)
	BEHFUNCPTR(Beh73,$51)
	BEHFUNCPTR(Beh74_MonarchDodoraBoss,$4D)
	BEHFUNCPTR(Beh75_Phantron2Boss,$4C)
	BEHFUNCPTR(Beh76_Motorist,$4F)
	BEHFUNCPTR(Beh77_GalacticRiderBoss,$4E)
	BEHFUNCPTR(Beh78_WhiteArrow,$50)
	BEHFUNCPTR(Beh79,$52)
	BEHFUNCPTR(Beh7A,$54)
	BEHFUNCPTR(Beh7B,$00)
	BEHFUNCPTR(Beh7C,$55)
	BEHFUNCPTR(Beh7D,$5E)
	BEHFUNCPTR(Beh7E,$00)
	BEHFUNCPTR(Beh7F,$00)
	BEHFUNCPTR(Beh80_FlyingEnemy,$68)
	BEHFUNCPTR(Beh81_EnemyShip,$69)
	BEHFUNCPTR(Beh82_BigCargoShip,$6A)
	BEHFUNCPTR(Beh83_BigCargoShip,$6A)
	BEHFUNCPTR(Beh84_FlatFarAwayShip,$6E)
	BEHFUNCPTR(Beh85_InterlockingPicketDoors,$6F)
	BEHFUNCPTR(Beh86_InterlockingTrapezoidDoors,$70)
	BEHFUNCPTR(Beh87_Hurdle,$71)
	BEHFUNCPTR(Beh88,$00)
	BEHFUNCPTR(Beh89_BonusDoors,$73)
	BEHFUNCPTR(Beh8A_UFO,$72)
	BEHFUNCPTR(Beh8B,$75)
	BEHFUNCPTR(Beh8C,$76)
	BEHFUNCPTR(Beh8D,$75)
	BEHFUNCPTR(Beh8E,$77)
	BEHFUNCPTR(Beh8F_ProfessorHangerBoss,$78)
	BEHFUNCPTR(Beh90,$79)
	BEHFUNCPTR(Beh91,$79)
	BEHFUNCPTR(Beh92,$79)
	BEHFUNCPTR(Beh93,$79)
	BEHFUNCPTR(Beh94,$7A)
	BEHFUNCPTR(Beh95,$7A)
	BEHFUNCPTR(Beh96,$7B)
	BEHFUNCPTR(Beh97,$02)
	BEHFUNCPTR(Beh98,$7F)
	BEHFUNCPTR(Beh99,$7F)
	BEHFUNCPTR(Beh9A,$81)
	BEHFUNCPTR(Beh9B,$80)
	BEHFUNCPTR(Beh9C,$00)
	BEHFUNCPTR(Beh9D,$83)
	BEHFUNCPTR(Beh9E,$83)
	BEHFUNCPTR(Beh9F,$84)
	BEHFUNCPTR(BehA0,$85)
	BEHFUNCPTR(BehA1,$86)
	BEHFUNCPTR(BehA2,$80)
	BEHFUNCPTR(BehA3,$56)
	BEHFUNCPTR(BehA4,$87)
	BEHFUNCPTR(BehA5,$91)
	BEHFUNCPTR(BehA6,$91)
	BEHFUNCPTR(BehA7,$91)
	BEHFUNCPTR(BehA8,$91)
	BEHFUNCPTR(BehA9,$98)
	BEHFUNCPTR(BehAA,$99)
	BEHFUNCPTR(BehAB,$9A)
	BEHFUNCPTR(BehAC,$9D)
	BEHFUNCPTR(BehAD,$91)
	BEHFUNCPTR(BehAE_NovaBombItem,$9E)
	BEHFUNCPTR(BehAF_ShieldItem,$9F)
	BEHFUNCPTR(BehB0_TwinBlasterItem,$A0)
	BEHFUNCPTR(BehB1,$A2)
	BEHFUNCPTR(BehB2,$A1)
	BEHFUNCPTR(BehB3,$A4)
	BEHFUNCPTR(BehB4,$00)
	BEHFUNCPTR(BehB5,$00)
	BEHFUNCPTR(BehB6,$00)
	BEHFUNCPTR(BehB7,$A7)
	BEHFUNCPTR(BehB8,$A7)
	BEHFUNCPTR(BehB9,$A7)
	BEHFUNCPTR(BehBA,$A7)
	BEHFUNCPTR(BehBB,$A8)
	BEHFUNCPTR(BehBC,$A8)
	BEHFUNCPTR(BehBD,$1B)
	BEHFUNCPTR(BehBE,$00)
	BEHFUNCPTR(BehBF_Volcano,$BE)
	BEHFUNCPTR(BehC0,$00)
	BEHFUNCPTR(BehC1_Volcano,$BF)
	BEHFUNCPTR(BehC2,$C0)
	BEHFUNCPTR(BehC3,$C2)
	BEHFUNCPTR(BehC4,$C8)
	BEHFUNCPTR(BehC5,$00)
	BEHFUNCPTR(BehC6,$C4)
	BEHFUNCPTR(BehC7,$C4)
	BEHFUNCPTR(BehC8,$C4)
	BEHFUNCPTR(BehC9,$C4)
	BEHFUNCPTR(BehCA,$C4)
	BEHFUNCPTR(BehCB,$D0)
	BEHFUNCPTR(BehCC,$D0)
	BEHFUNCPTR(BehCD,$00)
	BEHFUNCPTR(BehCE,$D1)
	BEHFUNCPTR(BehCF_EnergyRing,$D2)
	BEHFUNCPTR(BehD0,$D3)
	BEHFUNCPTR(BehD1,$00)
	BEHFUNCPTR(BehD2,$D5)
	BEHFUNCPTR(BehD3,$D6)
	BEHFUNCPTR(BehD4,$D7)
	BEHFUNCPTR(BehD5,$D8)
	BEHFUNCPTR(BehD6,$D8)
	BEHFUNCPTR(BehD7,$DF)
	BEHFUNCPTR(BehD8,$D7)
	BEHFUNCPTR(BehD9,$D6)
	BEHFUNCPTR(BehDA,$E0)
	BEHFUNCPTR(BehDB,$00)
	BEHFUNCPTR(BehDC,$00)
	BEHFUNCPTR(BehDD,$E1)
	BEHFUNCPTR(BehDE,$00)
	BEHFUNCPTR(BehDF,$E1)
	BEHFUNCPTR(BehE0,$E2)
	BEHFUNCPTR(BehE1_BonusArchway,$00)
	BEHFUNCPTR(BehE2_UFO,$72)
	BEHFUNCPTR(BehE3_WigglingTailEnemy,$E3)
	BEHFUNCPTR(BehE4,$00)
	BEHFUNCPTR(BehE5_BigBlueArchway,$E8)
	BEHFUNCPTR(BehE6,$00)
	BEHFUNCPTR(BehE7_HorizontalSlidingDoor,$EB)
	BEHFUNCPTR(BehE8_VerticalSlidingDoor,$EC)
	BEHFUNCPTR(BehE9_BigAsteroid,$ED)
	BEHFUNCPTR(BehEA_ShootableAsteroid,$C2)
	BEHFUNCPTR(BehEB,$00)
	BEHFUNCPTR(BehEC,$17)
	BEHFUNCPTR(BehED_ShootableAsteroid,$C2)
	BEHFUNCPTR(BehEE,$02)
	BEHFUNCPTR(BehEF,$37)
	BEHFUNCPTR(BehF0,$00)
	BEHFUNCPTR(BehF1_TitleHighPolyArwing,$E1)
	BEHFUNCPTR(BehF2_UseNextCommand,$00)
	BEHFUNCPTR(BehF3,$07)
	BEHFUNCPTR(BehF4,$07)
	BEHFUNCPTR(BehF5,$07)
;Object header table
;Each entry points to the vertices/faces/material table that a model uses,
;along with other things like hitbox size
ObjectHeaderTable:	;00AC15
	;   VV  VV  KK  FF  FF                                                      MM  MM  AA  AA  BB  BB  CC  CC  DD  DD
	;V: Pointer to vertex data for object
	;K: Bank of object
	;F: Pointer to face data for object
	;M: Offset to material 0 for object
	;A, B, C, D: Unknown, seems to just be mostly copies of the main object pointer
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$05,$00,$05,$00,$05,$00,$45,$00,$D8,$81,$15,$AC,$15,$AC,$15,$AC,$15,$AC
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0A,$00,$0A,$00,$0A,$00,$45,$00,$D8,$81,$31,$AC,$31,$AC,$31,$AC,$31,$AC
	DB $6A,$F0,$11,$82,$F0,$00,$00,$01,$00,$00,$C8,$00,$C8,$00,$C8,$00,$C8,$00,$90,$85,$4D,$AC,$4D,$AC,$4D,$AC,$4D,$AC	;Andross Square
	DB $6A,$F0,$11,$A1,$F0,$00,$00,$02,$00,$00,$90,$01,$90,$01,$90,$01,$90,$01,$AF,$85,$69,$AC,$69,$AC,$69,$AC,$69,$AC	;Black Hole Billboard Sprite
	DB $25,$EE,$11,$40,$EE,$00,$00,$00,$00,$00,$C8,$00,$C8,$00,$C8,$00,$C8,$00,$90,$85,$85,$AC,$85,$AC,$85,$AC,$85,$AC	;Andross Cube
	DB $00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$88,$00,$88,$00,$90,$00,$BC,$00,$2E,$85,$A1,$AC,$A1,$AC,$A1,$AC,$A1,$AC	;Nothing (used for BehaviorFunctionTable entries which have no model)
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$E8,$03,$E8,$03,$00,$00,$BD,$AC,$BD,$AC,$BD,$AC,$BD,$AC
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C8,$00,$C8,$00,$00,$00,$D9,$AC,$D9,$AC,$D9,$AC,$D9,$AC
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$5A,$00,$5A,$00,$00,$00,$F5,$AC,$F5,$AC,$F5,$AC,$F5,$AC
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$32,$00,$32,$00,$00,$00,$11,$AD,$11,$AD,$11,$AD,$11,$AD
	DB $5B,$F0,$11,$49,$F0,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$28,$00,$58,$85,$2D,$AD,$2D,$AD,$2D,$AD,$2D,$AD	;Reverse Explosion
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$88,$00,$88,$00,$90,$00,$BC,$00,$2E,$85,$49,$AD,$49,$AD,$49,$AD,$49,$AD	;Weird Asteroid Sprite
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$28,$00,$28,$00,$78,$00,$28,$00,$5A,$85,$65,$AD,$65,$AD,$65,$AD,$65,$AD	;Flashing Red/Blue Ring
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$50,$00,$50,$00,$F0,$00,$50,$00,$5C,$85,$D0,$CA,$81,$AD,$81,$AD,$81,$AD	;Metal Ball
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$28,$00,$60,$85,$D0,$CA,$9D,$AD,$9D,$AD,$9D,$AD	;Lava Rock
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$50,$00,$50,$00,$50,$00,$50,$00,$60,$85,$D0,$CA,$B9,$AD,$B9,$AD,$B9,$AD	;Lava Rock
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$28,$00,$30,$85,$D5,$AD,$D5,$AD,$D5,$AD,$D5,$AD	;Weak Explosion
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$50,$00,$50,$00,$50,$00,$50,$00,$30,$85,$F1,$AD,$F1,$AD,$F1,$AD,$F1,$AD	;Weak Explosion
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$04,$00,$00,$A0,$00,$A0,$00,$A0,$00,$A0,$00,$30,$85,$0D,$AE,$0D,$AE,$0D,$AE,$0D,$AE	;Weak Explosion
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$05,$00,$00,$40,$01,$40,$01,$40,$01,$40,$01,$30,$85,$29,$AE,$29,$AE,$29,$AE,$29,$AE	;Weak Explosion
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$24,$00,$1E,$00,$62,$00,$62,$00,$D8,$81,$45,$AE,$45,$AE,$45,$AE,$45,$AE
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$24,$00,$1E,$00,$62,$00,$62,$00,$D8,$81,$61,$AE,$61,$AE,$61,$AE,$61,$AE
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$24,$00,$1E,$00,$62,$00,$62,$00,$D8,$81,$7D,$AE,$7D,$AE,$7D,$AE,$7D,$AE
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$D8,$81,$99,$AE,$99,$AE,$99,$AE,$99,$AE
	DB $D4,$F0,$11,$C0,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$48,$85,$B5,$AE,$B5,$AE,$B5,$AE,$B5,$AE	;Splash
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$20,$00,$20,$00,$20,$00,$20,$00,$48,$85,$D1,$AE,$D1,$AE,$D1,$AE,$D1,$AE	;Splash
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$20,$00,$20,$00,$20,$00,$20,$00,$34,$85,$ED,$AE,$ED,$AE,$ED,$AE,$ED,$AE	;Flashing Red/Blue Shot
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$04,$00,$00,$40,$00,$40,$00,$40,$00,$40,$00,$34,$85,$09,$AF,$09,$AF,$09,$AF,$09,$AF	;Flashing Red/Blue Shot
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$04,$00,$00,$70,$00,$70,$00,$70,$00,$70,$00,$56,$85,$25,$AF,$25,$AF,$25,$AF,$25,$AF	;Spike Ball
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$20,$00,$20,$00,$20,$00,$20,$00,$52,$85,$41,$AF,$41,$AF,$41,$AF,$41,$AF	;Nova Bomb
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$04,$00,$00,$40,$00,$40,$00,$40,$00,$40,$00,$42,$85,$5D,$AF,$5D,$AF,$5D,$AF,$5D,$AF	;Small Gray Asteroid
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$04,$00,$00,$40,$00,$40,$00,$40,$00,$40,$00,$44,$85,$79,$AF,$79,$AF,$79,$AF,$79,$AF	;Small Gray Asteroid With Face
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$42,$85,$95,$AF,$95,$AF,$95,$AF,$95,$AF	;Small Gray Asteroid
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$44,$85,$B1,$AF,$B1,$AF,$B1,$AF,$B1,$AF	;Small Gray Asteroid With Face
	DB $5B,$F0,$11,$49,$F0,$00,$00,$06,$00,$00,$00,$01,$00,$01,$00,$01,$00,$01,$7D,$85,$CD,$AF,$CD,$AF,$CD,$AF,$CD,$AF	;Big Asteroid
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$42,$85,$E9,$AF,$E9,$AF,$E9,$AF,$E9,$AF	;Small Gray Asteroid
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$04,$00,$00,$40,$00,$40,$00,$40,$00,$40,$00,$62,$85,$05,$B0,$05,$B0,$05,$B0,$05,$B0	;Black Hole
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$20,$00,$20,$00,$20,$00,$20,$00,$66,$85,$21,$B0,$21,$B0,$21,$B0,$21,$B0	;Flashing Red/Blue Oval Shot
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$81,$84,$3D,$B0,$3D,$B0,$3D,$B0,$3D,$B0
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$30,$00,$30,$00,$30,$00,$30,$00,$4C,$85,$59,$B0,$59,$B0,$59,$B0,$59,$B0	;Egg LOD
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$04,$00,$00,$40,$00,$40,$00,$40,$00,$40,$00,$D0,$88,$75,$B0,$75,$B0,$75,$B0,$75,$B0	;Yellow/White Flash
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$20,$00,$20,$00,$20,$00,$20,$00,$D0,$88,$91,$B0,$91,$B0,$91,$B0,$91,$B0	;Yellow/White Flash
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$D0,$88,$AD,$B0,$AD,$B0,$AD,$B0,$AD,$B0	;Yellow/White Flash
	DB $5B,$F0,$11,$49,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$52,$85,$C9,$B0,$C9,$B0,$C9,$B0,$C9,$B0	;Nova Bomb
	DB $5B,$F0,$11,$49,$F0,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$10,$00,$52,$85,$E5,$B0,$E5,$B0,$E5,$B0,$E5,$B0	;Nova Bomb
	DB $5B,$F0,$11,$49,$F0,$00,$00,$03,$00,$00,$20,$00,$20,$00,$20,$00,$20,$00,$36,$85,$01,$B1,$01,$B1,$01,$B1,$01,$B1	;Slightly Weak Explosion
	DB $5B,$F0,$11,$49,$F0,$00,$00,$04,$00,$00,$40,$00,$40,$00,$40,$00,$40,$00,$38,$85,$1D,$B1,$1D,$B1,$1D,$B1,$1D,$B1	;Medium Explosion
	DB $5B,$F0,$11,$49,$F0,$00,$00,$05,$00,$00,$80,$00,$80,$00,$80,$00,$80,$00,$3A,$85,$39,$B1,$39,$B1,$39,$B1,$39,$B1	;Full Explosion
	DB $5B,$F0,$11,$49,$F0,$00,$00,$06,$00,$00,$00,$01,$00,$01,$00,$01,$00,$01,$3A,$85,$55,$B1,$55,$B1,$55,$B1,$55,$B1	;Full Explosion
	DB $5B,$F0,$11,$49,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$3A,$85,$71,$B1,$71,$B1,$71,$B1,$71,$B1	;Full Explosion
	DB $5B,$F0,$11,$49,$F0,$70,$FE,$02,$00,$00,$28,$00,$28,$00,$28,$00,$28,$00,$5E,$85,$8D,$B1,$8D,$B1,$8D,$B1,$8D,$B1	;Amoeba
	DB $5B,$F0,$11,$49,$F0,$E0,$FC,$03,$00,$00,$50,$00,$50,$00,$50,$00,$50,$00,$5E,$85,$A9,$B1,$A9,$B1,$A9,$B1,$A9,$B1	;Amoeba
	DB $5B,$F0,$11,$49,$F0,$00,$00,$01,$00,$00,$08,$00,$08,$00,$08,$00,$08,$00,$20,$85,$C5,$B1,$C5,$B1,$C5,$B1,$C5,$B1	;Explosion?
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$03,$00,$00,$20,$00,$20,$00,$20,$00,$20,$00,$83,$85,$E1,$B1,$E1,$B1,$E1,$B1,$E1,$B1	;Flashing Metal Ball
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$02,$00,$00,$40,$00,$28,$00,$78,$00,$10,$00,$BD,$85,$FD,$B1,$FD,$B1,$FD,$B1,$FD,$B1	;White Shot
	DB $D4,$F0,$11,$CA,$F0,$00,$00,$01,$00,$00,$14,$00,$14,$00,$14,$00,$14,$00,$68,$85,$19,$B2,$19,$B2,$19,$B2,$19,$B2	;White Flash
	DB $73,$F0,$11,$82,$F0,$00,$00,$03,$00,$00,$50,$00,$50,$00,$50,$00,$50,$00,$6A,$85,$35,$B2,$35,$B2,$35,$B2,$35,$B2	;GAME
	DB $73,$F0,$11,$82,$F0,$00,$00,$03,$00,$00,$50,$00,$50,$00,$50,$00,$50,$00,$6E,$85,$51,$B2,$51,$B2,$51,$B2,$51,$B2	;OVER
	DB $5B,$F0,$11,$82,$F0,$00,$00,$03,$00,$00,$20,$00,$20,$00,$20,$00,$20,$00,$4E,$85,$6D,$B2,$6D,$B2,$6D,$B2,$6D,$B2	;Rocket Lizard
	DB $5B,$F0,$11,$49,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$32,$85,$89,$B2,$89,$B2,$89,$B2,$89,$B2	;Sparks
	DB $37,$F0,$11,$2D,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$54,$85,$A5,$B2,$A5,$B2,$A5,$B2,$A5,$B2	;Sparks
	DB $93,$EE,$11,$9F,$EE,$00,$00,$00,$00,$00,$14,$00,$14,$00,$00,$00,$16,$00,$40,$85,$C1,$B2,$C1,$B2,$C1,$B2,$C1,$B2	;Flashing Antenna
	DB $93,$EE,$11,$9F,$EE,$00,$00,$01,$00,$00,$28,$00,$28,$00,$00,$00,$2C,$00,$40,$85,$DD,$B2,$DD,$B2,$DD,$B2,$DD,$B2	;Bigger Flashing Antenna
	DB $93,$EE,$11,$9F,$EE,$00,$00,$02,$00,$00,$50,$00,$50,$00,$00,$00,$58,$00,$40,$85,$F9,$B2,$F9,$B2,$F9,$B2,$F9,$B2	;Bigger Flashing Antenna
	DB $93,$EE,$11,$9F,$EE,$00,$00,$01,$00,$00,$28,$00,$28,$00,$28,$00,$2C,$00,$40,$85,$15,$B3,$15,$B3,$15,$B3,$15,$B3	;Flashing Antenna
	DB $BA,$EE,$11,$9A,$EF,$00,$00,$02,$00,$00,$20,$00,$14,$00,$78,$00,$8C,$01,$0C,$80,$31,$B3,$31,$B3,$31,$B3,$31,$B3	;White Morphing Fire
	DB $BA,$EE,$11,$9A,$EF,$00,$00,$02,$00,$00,$08,$00,$08,$00,$78,$00,$8C,$01,$3E,$85,$4D,$B3,$4D,$B3,$4D,$B3,$4D,$B3	;Flashing Yellow Morphing Fire
	DB $BA,$EE,$11,$9A,$EF,$00,$00,$02,$00,$00,$20,$00,$14,$00,$78,$00,$8C,$01,$3C,$85,$69,$B3,$69,$B3,$69,$B3,$69,$B3	;Flashing Blue Morphing Fire
	DB $8B,$EF,$11,$ED,$EF,$00,$00,$02,$00,$00,$18,$00,$08,$00,$18,$01,$8C,$01,$3C,$85,$85,$B3,$85,$B3,$85,$B3,$85,$B3	;Flashing Flat Blue Morphing Shot
	DB $0C,$F0,$11,$1B,$F0,$00,$00,$00,$00,$00,$04,$00,$04,$00,$04,$00,$04,$00,$2E,$85,$A1,$B3,$A1,$B3,$A1,$B3,$A1,$B3	;Weird Asteroid Sprite
	DB $0C,$F0,$11,$1B,$F0,$00,$00,$01,$00,$00,$08,$00,$08,$00,$08,$00,$08,$00,$2E,$85,$BD,$B3,$BD,$B3,$BD,$B3,$BD,$B3	;Weird Asteroid Sprite
	DB $0C,$F0,$11,$1B,$F0,$00,$00,$02,$00,$00,$10,$00,$10,$00,$10,$00,$10,$00,$2E,$85,$D9,$B3,$D9,$B3,$D9,$B3,$D9,$B3	;Weird Asteroid Sprite
	DB $00,$80,$0C,$39,$80,$00,$00,$02,$30,$67,$C8,$00,$78,$01,$78,$00,$74,$01,$13,$82,$F5,$B3,$F5,$B3,$F5,$B3,$F5,$B3	;Cyclops With Leg Broken
	DB $4D,$81,$0C,$83,$81,$00,$00,$02,$30,$67,$C8,$00,$78,$01,$84,$00,$C4,$01,$13,$82,$11,$B4,$11,$B4,$11,$B4,$11,$B4	;Cyclops With Leg Missing
	DB $B3,$82,$0C,$91,$86,$00,$00,$02,$0C,$67,$80,$00,$88,$01,$88,$00,$A0,$00,$13,$82,$2D,$B4,$2D,$B4,$2D,$B4,$2D,$B4	;Cyclops Walking
	DB $8B,$87,$0C,$83,$88,$00,$00,$02,$6C,$61,$20,$00,$3C,$01,$28,$00,$4C,$01,$13,$82,$49,$B4,$49,$B4,$49,$B4,$49,$B4	;Growing Column
	DB $C9,$88,$0C,$15,$89,$00,$00,$00,$00,$00,$1E,$00,$30,$00,$3B,$00,$4C,$00,$81,$84,$65,$B4,$65,$B4,$65,$B4,$65,$B4	;Bee
	DB $0E,$8A,$0C,$31,$8A,$00,$00,$00,$00,$00,$14,$00,$4C,$00,$14,$00,$56,$00,$13,$82,$81,$B4,$81,$B4,$81,$B4,$81,$B4	;Weird Antenna
	DB $F5,$8A,$0C,$09,$8B
	DB $43,$8B,$0C,$5A,$8B,$00,$00,$00,$00,$00,$14,$00,$1E,$00,$14,$00,$1E,$00,$13,$82,$A2,$B4,$9D,$B4,$9D,$B4,$9D,$B4	;Weird Antenna Top
	DB $CF,$8B,$0C,$EF,$8B,$00,$00,$00,$00,$00,$14,$00,$1E,$00,$16,$00,$2D,$00,$13,$82,$BE,$B4,$DA,$B4,$DA,$B4,$DA,$B4	;Hexagonal Missile Head
	DB $CF,$8B,$0C,$EF,$8B,$00,$00,$01,$00,$00,$28,$00,$3C,$00,$2C,$00,$5A,$00,$13,$82,$DA,$B4,$DA,$B4,$DA,$B4,$DA,$B4	;Hexagonal Missile Head
	DB $1E,$8D,$0C,$46,$8D
	DB $64,$8D,$0C,$92,$8D,$00,$00,$03,$42,$67,$58,$00,$40,$01,$70,$03,$B8,$03,$73,$88,$FB,$B4,$FB,$B4,$FB,$B4,$F6,$B4	;Slamming Arrow Wall
	DB $64,$8D,$0C,$92,$8D,$00,$00,$03,$00,$00,$58,$00,$40,$01,$70,$03,$B8,$03,$73,$88,$17,$B5,$17,$B5,$17,$B5,$F6,$B4	;Slamming Arrow Wall	
	DB $64,$8D,$0C,$92,$8D,$00,$00,$03,$54,$67,$70,$03,$40,$01,$58,$00,$B8,$03,$73,$88,$33,$B5,$33,$B5,$33,$B5,$33,$B5	;Slamming Arrow Wall
	DB $64,$8D,$0C,$92,$8D,$00,$00,$03,$66,$67,$70,$03,$40,$01,$58,$00,$B8,$03,$73,$88,$4F,$B5,$4F,$B5,$4F,$B5,$4F,$B5	;Slamming Arrow Wall
	DB $FB,$8D,$0C,$27,$8E,$00,$00,$00,$00,$00,$3C,$00,$3C,$00,$0A,$00,$42,$00,$13,$82,$6B,$B5,$6B,$B5,$6B,$B5,$6B,$B5	;Flat Far-Away Four-Armed Enemy
	DB $96,$8E,$0C,$A5,$8E,$00,$00,$00,$00,$00,$1B,$00,$14,$00,$23,$00,$2D,$00,$13,$82,$87,$B5,$87,$B5,$87,$B5,$87,$B5	;Pyramid
	DB $DA,$8E,$0C,$EC,$8E,$00,$00,$00,$00,$00,$1E,$00,$29,$00,$00,$00,$29,$00,$13,$82,$A3,$B5,$A3,$B5,$A3,$B5,$A3,$B5	;Flat Far-Away Ship
	DB $0D,$8F,$0C,$28,$8F,$00,$00,$00,$00,$00,$2A,$00,$28,$00,$2A,$00,$47,$00,$13,$82,$BF,$B5,$DB,$B5,$DB,$B5,$DB,$B5
	DB $76,$8F,$0C,$85,$8F
	DB $A2,$8F,$0C,$BD,$8F,$00,$00,$00,$00,$00,$2A,$00,$28,$00,$2A,$00,$29,$00,$13,$82,$E0,$B5,$FC,$B5,$FC,$B5,$FC,$B5
	DB $0B,$90,$0C,$1A,$90
	DB $37,$90,$0C,$51,$90,$00,$00,$01,$00,$00,$28,$00,$28,$00,$50,$00,$62,$00,$13,$82,$01,$B6,$01,$B6,$01,$B6,$01,$B6	;Caterpillar Head
	DB $1E,$91,$0C,$32,$91,$00,$00,$01,$00,$00,$3C,$00,$28,$00,$1E,$00,$48,$00,$13,$82,$1D,$B6,$1D,$B6,$1D,$B6,$1D,$B6	;Caterpillar Part
	DB $9F,$91,$0C,$B3,$91
	DB $28,$92,$0C,$39,$92
	DB $6E,$92,$0C,$9A,$92,$00,$00,$00,$00,$00,$50,$00,$28,$00,$14,$00,$50,$00,$13,$82,$43,$B6,$43,$B6,$43,$B6,$43,$B6	;Cloaking Ship
	DB $C9,$93,$0C,$EC,$93,$00,$00,$00,$00,$00,$23,$00,$2F,$00,$1E,$00,$38,$00,$13,$82,$5F,$B6,$5F,$B6,$7B,$B6,$7B,$B6
	DB $C7,$94,$0C,$DB,$94
	DB $12,$95,$0C,$23,$95,$00,$00,$00,$00,$00,$0A,$00,$0C,$00,$05,$00,$22,$00,$13,$82,$80,$B6,$80,$B6,$80,$B6,$80,$B6	;Caterpillar 2 Part
	DB $50,$95,$0C,$67,$95,$00,$00,$00,$00,$00,$0A,$00,$14,$00,$07,$00,$31,$00,$13,$82,$9C,$B6,$9C,$B6,$9C,$B6,$9C,$B6	;Caterpillar 2 Head
	DB $CA,$95,$0C,$DE,$95,$00,$00,$00,$00,$00,$1E,$00,$14,$00,$1E,$00,$24,$00,$7C,$80,$B8,$B6,$B8,$B6,$B8,$B6,$B8,$B6	;Octagonal Shadow
	DB $F4,$95,$0C,$23,$96,$00,$00,$00,$00,$00,$0C,$00,$7E,$00,$0C,$00,$7F,$00,$13,$82,$D4,$B6,$D4,$B6,$D4,$B6,$D4,$B6
	DB $E8,$96,$0C,$11,$97,$00,$00,$00,$00,$00,$0A,$00,$32,$00,$28,$00,$40,$00,$13,$82,$F0,$B6,$F0,$B6,$F0,$B6,$F0,$B6	;Mini Ship
	DB $BE,$97,$0C,$E9,$97,$00,$00,$00,$00,$00,$0A,$00,$28,$00,$32,$00,$39,$00,$13,$82,$0C,$B7,$0C,$B7,$0C,$B7,$28,$B7	;Mini Ship 2
	DB $E2,$98,$0C,$13,$99,$00,$00,$00,$00,$00,$0A,$00,$28,$00,$32,$00,$39,$00,$13,$82,$28,$B7,$28,$B7,$28,$B7,$28,$B7	;Mini Ship 3
	DB $C8,$99,$0C,$05,$9A,$00,$00,$00,$00,$00,$14,$00,$3C,$00,$3C,$00,$51,$00,$13,$82,$44,$B7,$44,$B7,$44,$B7,$44,$B7	;Turret
	DB $20,$9B,$0C,$2F,$9B,$20,$03,$02,$00,$00,$C8,$00,$14,$00,$28,$00,$C8,$00,$73,$88,$60,$B7,$B4,$B7,$B4,$B7,$B4,$B7	;Tank Track
	DB $4E,$9B,$0C,$68,$9B,$00,$00,$02,$00,$00,$28,$00,$14,$00,$28,$00,$2C,$00,$13,$82,$7C,$B7,$7C,$B7,$7C,$B7,$7C,$B7	;Tank Track Corner
	DB $4E,$9B,$0C,$68,$9B,$00,$00,$02,$00,$00,$28,$00,$14,$00,$28,$00,$2C,$00,$13,$82,$98,$B7,$98,$B7,$98,$B7,$98,$B7	;Tank Track Corner
	DB $94,$9B,$0C,$9D,$9B
	DB $B0,$9B,$0C,$D0,$9B,$00,$00,$01,$00,$00,$28,$00,$14,$00,$28,$00,$2C,$00,$13,$82,$B9,$B7,$B9,$B7,$B9,$B7,$B9,$B7
	DB $32,$9C,$0C,$45,$9C,$00,$00,$01,$00,$00,$14,$00,$16,$00,$74,$00,$74,$00,$13,$82,$D5,$B7,$D5,$B7,$D5,$B7,$D5,$B7
	DB $A1,$9C,$0C,$C1,$9C,$00,$00,$00,$00,$00,$28,$00,$41,$00,$37,$00,$57,$00,$13,$82,$F1,$B7,$F1,$B7,$F1,$B7,$F1,$B7	;Launcher Hovercraft
	DB $A6,$9D,$0C,$B4,$9D,$00,$00,$01,$00,$00,$14,$00,$1E,$00,$12,$00,$1E,$00,$13,$82,$0D,$B8,$0D,$B8,$0D,$B8,$0D,$B8
	DB $A6,$9D,$0C,$B4,$9D,$00,$00,$01,$00,$00,$14,$00,$1E,$00,$12,$00,$1E,$00,$13,$82,$29,$B8,$29,$B8,$29,$B8,$29,$B8
	DB $F1,$9D,$0C,$03,$9E
	DB $21,$9E,$0C,$3F,$9E,$00,$00,$02,$AC,$63,$E0,$01,$E0,$01,$30,$00,$E0,$01,$13,$82,$4A,$B8,$45,$B8,$45,$B8,$45,$B8	;Orange Obelisk
	DB $21,$9E,$0C,$3F,$9E,$00,$00,$02,$AC,$63,$E0,$01,$E0,$01,$30,$00,$E0,$01,$ED,$82,$66,$B8,$45,$B8,$45,$B8,$45,$B8	;Blue Obelisk
	DB $21,$9E,$0C,$3F,$9E,$90,$01,$02,$3C,$64,$E0,$01,$30,$00,$30,$00,$E0,$01,$13,$82,$82,$B8,$82,$B8,$82,$B8,$82,$B8	;Orange Obelisk
	DB $C2,$9E,$0C,$D4,$9E
	DB $F2,$9E,$0C,$10,$9F,$00,$00,$02,$00,$00,$30,$00,$68,$01,$30,$00,$E0,$01,$13,$82,$A3,$B8,$9E,$B8,$9E,$B8,$9E,$B8
	DB $93,$9F,$0C,$C2,$9F,$00,$00,$02,$00,$00,$68,$00,$78,$00,$14,$00,$78,$00,$13,$82,$BF,$B8,$BF,$B8,$BF,$B8,$BF,$B8	;Mid-Level Ring
	DB $E7,$A0,$0C,$19,$A1,$00,$00,$02,$00,$00,$78,$00,$8C,$00,$14,$00,$A8,$00,$13,$82,$DB,$B8,$DB,$B8,$DB,$B8,$DB,$B8	;Mid-Level Door?
	DB $96,$A2,$0C,$A5,$A2,$00,$00,$01,$8A,$70,$A0,$00,$A0,$00,$A0,$00,$32,$00,$13,$82,$F7,$B8,$F7,$B8,$F7,$B8,$F7,$B8	;Plasma Hydra Boss Arms
	DB $F8,$A2,$0C,$6A,$A3,$00,$00,$01,$8A,$70,$28,$00,$28,$00,$A0,$00,$A0,$00,$13,$82,$13,$B9,$13,$B9,$13,$B9,$13,$B9	;Plasma Hydra Boss Arms Animated
	DB $59,$A4,$0C,$38,$A5,$00,$00,$02,$00,$00,$D8,$00,$68,$00,$A0,$00,$14,$01,$13,$82,$2F,$B9,$2F,$B9,$2F,$B9,$2F,$B9	;Plasma Hydra Boss Body
	DB $FB,$A6,$0C,$69,$AA,$00,$00,$01,$00,$00,$3C,$00,$46,$00,$34,$00,$46,$00,$13,$82,$4B,$B9,$4B,$B9,$4B,$B9,$4B,$B9	;Plasma Hydra Animated Claws
	DB $B9,$AB,$0C,$CA,$AB,$00,$00,$01,$8A,$70,$A0,$00,$A0,$00,$A0,$00,$32,$00,$13,$82,$67,$B9,$7F,$BA,$7F,$BA,$7F,$BA	;Monarch Dodora Boss Neck/Tail
	DB $F6,$AB,$0C,$56,$AD,$00,$00,$01,$00,$00,$58,$00,$56,$00,$60,$00,$80,$00,$13,$82,$83,$B9,$83,$B9,$83,$B9,$83,$B9	;Monarch Dodora Boss Head
	DB $F4,$AE,$0C,$7B,$B2,$00,$00,$02,$00,$00,$50,$00,$28,$01,$98,$00,$94,$00,$13,$82,$9F,$B9,$9F,$B9,$9F,$B9,$9F,$B9	;Monarch Dodora Boss Body
	DB $DE,$B3,$0C,$EF,$B3,$00,$00,$01,$00,$00,$28,$00,$28,$00,$3C,$00,$52,$00,$13,$82,$BB,$B9,$BB,$B9,$BB,$B9,$BB,$B9	;Monarch Dodora Boss Tip Of Tail
	DB $27,$B4,$0C,$9C,$B5,$00,$00,$01,$00,$00,$38,$00,$14,$00,$24,$00,$3C,$00,$13,$82,$D7,$B9,$D7,$B9,$D7,$B9,$D7,$B9	;Monarch Dodora Boss Bird
	DB $91,$B6,$0C,$AE,$B6,$00,$00,$01,$00,$00,$1E,$00,$28,$00,$1E,$00,$2A,$00,$13,$82,$F3,$B9,$F3,$B9,$F3,$B9,$F3,$B9	;Monarch Dodora Boss Egg
	DB $58,$B7,$0C,$6F,$B7,$00,$00,$01,$00,$00,$1E,$00,$28,$00,$1E,$00,$28,$00,$73,$88,$0F,$BA,$0F,$BA,$0F,$BA,$0F,$BA	;Monarch Dodora Boss Egg Top
	DB $DC,$B7,$0C,$F6,$B7,$00,$00,$01,$00,$00,$1E,$00,$28,$00,$1E,$00,$2A,$00,$73,$88,$2B,$BA,$2B,$BA,$2B,$BA,$2B,$BA	;Monarch Dodora Boss Egg Boss
	DB $DD,$B8,$0C,$65,$BA,$00,$00,$02,$00,$00,$1C,$01,$1C,$01,$C0,$00,$74,$01,$13,$82,$47,$BA,$47,$BA,$47,$BA,$47,$BA	;Monarch Dodora Boss Wing Left
	DB $EE,$BA,$0C,$76,$BC,$00,$00,$02,$00,$00,$1C,$01,$1C,$01,$C0,$00,$74,$01,$13,$82,$63,$BA,$63,$BA,$63,$BA,$63,$BA	;Monarch Dodora Boss Wing Right
	DB $FF,$BC,$0C,$08,$BD
	DB $27,$BD,$0C,$53,$BD,$00,$00,$00,$D2,$70,$0F,$00,$2A,$00,$6E,$00,$32,$00,$13,$82,$84,$BA,$84,$BA,$84,$BA,$84,$BA	;Motorist
	DB $55,$BE,$0C,$6C,$BE,$00,$00,$02,$00,$00,$30,$00,$3C,$00,$78,$00,$90,$00,$13,$82,$A0,$BA,$A0,$BA,$A0,$BA,$A0,$BA	;Dart
	DB $55,$BE,$0C,$6C,$BE,$00,$00,$01,$00,$00,$18,$00,$1E,$00,$3C,$00,$48,$00,$13,$82,$BC,$BA,$BC,$BA,$BC,$BA,$BC,$BA	;Dart
	DB $19,$BF,$0C,$5B,$BF,$00,$00,$02,$78,$82,$C8,$00,$18,$01,$2C,$01,$98,$01,$13,$82,$D8,$BA,$D8,$BA,$D8,$BA,$D8,$BA	;Big Blue Bonus Archway
	DB $FC,$C0,$0C,$B7,$C1,$00,$00,$03,$B2,$81,$40,$01,$80,$02,$68,$01,$E0,$02,$13,$82,$F4,$BA,$F4,$BA,$F4,$BA,$F4,$BA	;Big Blue Bonus Vertical Doorway
	DB $93,$C3,$0C,$B7,$C6,$00,$00,$00,$00,$00,$2D,$00,$3C,$00,$14,$00,$4E,$00,$13,$82,$10,$BB,$10,$BB,$10,$BB,$10,$BB	;Sliding Arrow Door
	DB $A6,$C7,$0C,$C7,$C7,$00,$00,$03,$00,$00,$50,$01,$A0,$00,$18,$00,$68,$01,$13,$82,$2C,$BB,$2C,$BB,$2C,$BB,$2C,$BB
	DB $E8,$C7,$0C,$09,$C8,$00,$00,$03,$00,$00,$78,$00,$78,$00,$E0,$01,$00,$02,$13,$82,$48,$BB,$48,$BB,$48,$BB,$48,$BB	;Scramble Tunnel Wireframe
	DB $D1,$C8,$0C,$10,$C9,$00,$00,$03,$00,$00,$58,$01,$F8,$01,$E0,$01,$B0,$02,$13,$82,$64,$BB,$64,$BB,$64,$BB,$64,$BB	;Scramble Arches
	DB $0F,$CB,$0C,$24,$CB,$00,$00,$03,$00,$00,$78,$00,$78,$00,$E0,$01,$00,$02,$13,$82,$80,$BB,$80,$BB,$80,$BB,$80,$BB	;Scramble Tunnel
	DB $91,$CB,$0C,$75,$D2,$00,$00,$02,$00,$00,$50,$00,$5C,$01,$50,$00,$5C,$01,$13,$82,$9C,$BB,$9C,$BB,$9C,$BB,$9C,$BB	;Big Walker
	DB $44,$D5,$0C,$EA,$D7,$00,$00,$01,$00,$00,$B6,$00,$40,$00,$BC,$00,$C0,$00,$13,$82,$B8,$BB,$B8,$BB,$B8,$BB,$B8,$BB	;Asteroid Ambush
	DB $39,$D9,$0C,$4E,$D9,$00,$00,$00,$00,$00,$0F,$00,$05,$00,$0F,$00,$15,$00,$13,$82,$D4,$BB,$D4,$BB,$D4,$BB,$D4,$BB	;Vent
	DB $90,$D9,$0C,$B0,$D9,$00,$00,$02,$00,$00,$C0,$00,$50,$00,$C0,$00,$CC,$00,$13,$82,$F0,$BB,$F0,$BB,$F0,$BB,$F0,$BB	;Dancing Insector Boss Head
	DB $61,$DA,$0C,$CE,$DB,$00,$00,$03,$00,$00,$A0,$00,$F8,$02,$00,$03,$00,$03,$13,$82,$0C,$BC,$0C,$BC,$0C,$BC,$0C,$BC	;Dancing Insector Boss Leg
	DB $61,$DA,$0C,$CE,$DB,$00,$00,$03,$00,$00,$30,$02,$80,$00,$F8,$02,$00,$03,$13,$82,$28,$BC,$28,$BC,$28,$BC,$28,$BC	;Dancing Insector Boss Leg
	DB $23,$DC,$0C,$4F,$DC,$00,$00,$02,$00,$00,$78,$00,$F0,$00,$28,$00,$00,$01,$13,$82,$44,$BC,$44,$BC,$44,$BC,$44,$BC	;Dancing Insector Boss Hat
	DB $84,$DD,$0C,$BC,$DD,$00,$00,$01,$00,$00,$24,$00,$3A,$00,$AC,$00,$B0,$00,$13,$82,$60,$BC,$60,$BC,$60,$BC,$60,$BC	;Parrot
	DB $E1,$DF,$0C,$ED,$DF,$00,$00,$00,$00,$00,$0F,$00,$0F,$00,$3E,$00,$0D,$00,$13,$82,$7C,$BC,$7C,$BC,$7C,$BC,$7C,$BC
	DB $01,$E0,$0C,$42,$E0,$00,$00,$00,$00,$00,$46,$00,$1C,$00,$64,$00,$7D,$00,$7C,$80,$98,$BC,$98,$BC,$98,$BC,$98,$BC	;High-Poly Arwing
	DB $01,$E0,$0C,$42,$E0,$00,$00,$00,$00,$00,$46,$00,$1C,$00,$64,$00,$7D,$00,$13,$82,$B4,$BC,$B4,$BC,$B4,$BC,$B4,$BC	;High-Poly Arwing
	DB $01,$E0,$0C,$42,$E0,$00,$00,$01,$00,$00,$8C,$00,$38,$00,$C8,$00,$FA,$00,$13,$82,$D0,$BC,$D0,$BC,$D0,$BC,$D0,$BC	;High-Poly Arwing
	DB $DB,$E2,$0C,$DF,$E3,$00,$00,$02,$00,$00,$20,$00,$90,$01,$00,$00,$90,$01,$72,$85,$EC,$BC,$EC,$BC,$EC,$BC,$EC,$BC	;Lava Eruption
	DB $F1,$E3,$0C,$4B,$E4,$00,$00,$02,$00,$00,$B4,$00,$90,$01,$8C,$00,$B0,$01,$13,$82,$08,$BD,$08,$BD,$08,$BD,$08,$BD	;Slot Machine
	DB $98,$E6,$0C,$FB,$E6,$00,$00,$02,$00,$00,$64,$00,$E4,$00,$20,$00,$F0,$00,$13,$82,$24,$BD,$24,$BD,$24,$BD,$24,$BD	;Slot Machine Arm
	DB $47,$E8,$0C,$7A,$E8,$00,$00,$01,$00,$00,$50,$00,$50,$00,$0A,$00,$56,$00,$13,$82,$40,$BD,$40,$BD,$40,$BD,$40,$BD	;Training Ring
	DB $1F,$EA,$0C,$36,$EA,$00,$00,$03,$00,$00,$A0,$00,$90,$01,$A0,$00,$90,$01,$85,$85,$5C,$BD,$5C,$BD,$5C,$BD,$5C,$BD	;Andross Elongated Bipyramid
	DB $CF,$EA,$0C,$01,$EB,$00,$00,$01,$00,$00,$40,$00,$32,$00,$40,$00,$48,$00,$13,$82,$78,$BD,$78,$BD,$78,$BD,$78,$BD	;Tower Top
	DB $00,$80,$0E,$14,$80,$00,$00,$00,$00,$00,$07,$00,$02,$00,$14,$00,$14,$00,$13,$82,$94,$BD,$94,$BD,$94,$BD,$94,$BD	;Yellow/Red Flashing Shot
	DB $6F,$80,$0E,$89,$80,$00,$00,$02,$00,$00,$64,$00,$50,$00,$78,$00,$80,$00,$81,$84,$B0,$BD,$B0,$BD,$B0,$BD,$B0,$BD	;Small Rock
	DB $FD,$80,$0E,$3E,$81,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$30,$01,$81,$84,$CC,$BD,$CC,$BD,$CC,$BD,$CC,$BD	;Four-Armed Enemy
	DB $18,$83,$0E,$9F,$84,$00,$00,$00,$4A,$6E,$5A,$00,$3C,$00,$32,$00,$72,$00,$13,$82,$E8,$BD,$E8,$BD,$E8,$BD,$E8,$BD	;Diaphragm Door
	DB $FC,$85,$0E,$1A,$86,$00,$00,$00,$00,$00,$13,$00,$14,$00,$1D,$00,$1E,$00,$13,$82,$04,$BE,$04,$BE,$04,$BE,$04,$BE
	DB $68,$86,$0E,$8F,$86,$00,$00,$00,$00,$00,$11,$00,$14,$00,$20,$00,$23,$00,$13,$82,$20,$BE,$20,$BE,$20,$BE,$20,$BE
	DB $F5,$86,$0E,$4C,$87,$00,$00,$02,$00,$00,$8C,$00,$A0,$00,$50,$00,$A4,$01,$13,$82,$3C,$BE,$3C,$BE,$3C,$BE,$3C,$BE	;Rock Crusher Boss Shield
	DB $7A,$88,$0E,$91,$88,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$54,$00,$13,$82,$58,$BE,$58,$BE,$58,$BE,$58,$BE	;Rock Crusher Boss Weak Point
	DB $D7,$88,$0E,$1B,$89,$00,$00,$02,$00,$00,$28,$00,$28,$00,$50,$00,$04,$01,$13,$82,$74,$BE,$74,$BE,$74,$BE,$74,$BE	;Rock Crusher Boss Body
	DB $9A,$8A,$0E,$A9,$8A,$00,$00,$03,$98,$68,$40,$01,$40,$01,$40,$01,$40,$01,$13,$82,$90,$BE,$90,$BE,$90,$BE,$90,$BE	;Spinning Core Boss Weak Point
	DB $EF,$8A,$0E,$15,$8B,$00,$00,$03,$AA,$68,$A0,$00,$30,$02,$A0,$00,$40,$01,$13,$82,$AC,$BE,$AC,$BE,$AC,$BE,$AC,$BE	;Spinning Core Boss Laser
	DB $A6,$8B,$0E,$DB,$8B,$00,$00,$03,$00,$00,$D8,$00,$F0,$00,$D8,$00,$E8,$00,$13,$82,$C8,$BE,$C8,$BE,$C8,$BE,$C8,$BE	;Spinning Core Boss Body
	DB $B9,$8C,$0E,$D8,$8C,$00,$00,$03,$00,$00,$70,$01,$F8,$00,$08,$02,$10,$02,$13,$82,$E4,$BE,$E4,$BE,$E4,$BE,$E4,$BE	;Spinning Core Flaps Open
	DB $41,$8D,$0E,$60,$8D,$00,$00,$03,$00,$00,$08,$01,$10,$02,$20,$01,$B8,$01,$13,$82,$00,$BF,$00,$BF,$00,$BF,$00,$BF	;Spinning Core Flaps Halfway
	DB $C9,$8D,$0E,$E3,$8D,$00,$00,$03,$00,$00,$D8,$00,$E0,$01,$D8,$00,$40,$01,$13,$82,$1C,$BF,$1C,$BF,$1C,$BF,$1C,$BF	;Spinning Core Flaps Closed
	DB $4C,$8E,$0E,$60,$8E,$00,$00,$03,$00,$00,$D8,$00,$E0,$01,$D8,$00,$40,$01,$13,$82,$38,$BF,$38,$BF,$38,$BF,$38,$BF	;Spinning Core Flaps Closed
	DB $C9,$8E,$0E,$F6,$8E,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$00,$00,$B0,$00,$7C,$80,$54,$BF,$54,$BF,$54,$BF,$54,$BF	;8 Lines
	DB $C9,$8E,$0E,$F6,$8E,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$00,$00,$B0,$00,$04,$80,$70,$BF,$70,$BF,$70,$BF,$70,$BF	;8 Lines
	DB $C9,$8E,$0E,$F6,$8E,$00,$00,$00,$00,$00,$14,$00,$14,$00,$00,$00,$16,$00,$04,$80,$8C,$BF,$8C,$BF,$8C,$BF,$8C,$BF	;8 Lines
	DB $36,$8F,$0E,$57,$8F,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$00,$00,$B0,$00,$04,$80,$A8,$BF,$A8,$BF,$A8,$BF,$A8,$BF	;5 Lines
	DB $87,$8F,$0E,$9C,$8F,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$00,$00,$B0,$00,$04,$80,$C4,$BF,$C4,$BF,$C4,$BF,$C4,$BF	;3 Lines
	DB $BC,$8F,$0E,$C5,$8F,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$00,$00,$B0,$00,$04,$80,$E0,$BF,$E0,$BF,$E0,$BF,$E0,$BF	;1 Line
	DB $D5,$8F,$0E,$AE,$96,$00,$00,$00,$00,$00,$78,$00,$78,$00,$FA,$00,$9F,$00,$73,$88,$FC,$BF,$FC,$BF,$FC,$BF,$FC,$BF
	DB $20,$90,$0E,$77,$90,$00,$00,$02,$00,$00,$98,$00,$F0,$00,$90,$01,$C8,$01,$13,$82,$18,$C0,$18,$C0,$18,$C0,$18,$C0	;Armada Battleship Entry
	DB $97,$92,$0E,$F4,$92,$00,$00,$02,$00,$00,$68,$01,$18,$01,$68,$01,$9C,$01,$13,$82,$34,$C0,$34,$C0,$34,$C0,$34,$C0	;Atomic Base Entry
	DB $97,$92,$0E,$F4,$92,$00,$00,$04,$00,$00,$A0,$05,$60,$04,$A0,$05,$70,$06,$13,$82,$50,$C0,$50,$C0,$50,$C0,$50,$C0	;Atomic Base Entry
	DB $F3,$95,$0E,$11,$96,$00,$00,$00,$00,$00,$32,$00,$32,$00,$0A,$00,$47,$00,$13,$82,$6C,$C0,$6C,$C0,$6C,$C0,$6C,$C0
	DB $4D,$96,$0E,$AE,$96,$00,$00,$00,$00,$00,$3C,$00,$78,$00,$47,$00,$93,$00,$13,$82,$88,$C0,$88,$C0,$88,$C0,$88,$C0
	DB $4A,$97,$0E,$83,$97,$00,$00,$00,$00,$00,$78,$00,$78,$00,$0A,$00,$AA,$00,$13,$82,$A4,$C0,$A4,$C0,$A4,$C0,$A4,$C0
	DB $47,$98,$0E,$62,$98,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9F,$00,$13,$82,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
	DB $8A,$98,$0E,$62,$98,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9F,$00,$13,$82,$DC,$C0,$DC,$C0,$DC,$C0,$DC,$C0
	DB $A5,$98,$0E,$B4,$98,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9F,$00,$46,$85,$F8,$C0,$F8,$C0,$F8,$C0,$F8,$C0
	DB $C6,$98,$0E,$E1,$98,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9F,$00,$73,$88,$14,$C1,$14,$C1,$14,$C1,$14,$C1
	DB $F3,$98,$0E,$0E,$99,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$9F,$00,$99,$88,$30,$C1,$30,$C1,$30,$C1,$30,$C1
	DB $20,$99,$0E,$2F,$99,$90,$01,$01,$00,$00,$C8,$00,$46,$00,$14,$00,$3E,$01,$73,$88,$4C,$C1,$4C,$C1,$4C,$C1,$4C,$C1
	DB $41,$99,$0E,$50,$99,$C8,$00,$00,$00,$00,$46,$00,$41,$00,$0A,$00,$9F,$00,$99,$88,$68,$C1,$68,$C1,$68,$C1,$68,$C1
	DB $62,$99,$0E,$71,$99,$90,$01,$01,$00,$00,$28,$00,$1E,$00,$14,$00,$3E,$01,$99,$88,$84,$C1,$84,$C1,$84,$C1,$84,$C1
	DB $83,$99,$0E,$92,$99,$20,$03,$02,$00,$00,$68,$01,$A0,$00,$28,$00,$7C,$02,$99,$88,$A0,$C1,$A0,$C1,$A0,$C1,$A0,$C1
	DB $A4,$99,$0E,$D7,$99,$00,$00,$00,$00,$00,$00,$00,$00,$00,$2C,$01,$9F,$00,$73,$88,$BC,$C1,$BC,$C1,$BC,$C1,$BC,$C1
	DB $07,$9A,$0E,$D7,$99,$00,$00,$00,$00,$00,$00,$00,$00,$00,$2C,$01,$9F,$00,$99,$88,$D8,$C1,$D8,$C1,$D8,$C1,$D8,$C1
	DB $3A,$9A,$0E,$56,$9A,$00,$00,$01,$00,$00,$1E,$00,$86,$00,$50,$00,$9C,$00,$13,$82,$F4,$C1,$F4,$C1,$F4,$C1,$F4,$C1	;Little Tower Top
	DB $FF,$9A,$0E,$0E,$9B,$00,$00,$00,$00,$00,$0F,$00,$28,$00,$0F,$00,$2A,$00,$13,$82,$10,$C2,$10,$C2,$10,$C2,$10,$C2
	DB $54,$9B,$0E,$AE,$9C,$00,$00,$00,$00,$00,$50,$00,$46,$00,$1E,$00,$6E,$00,$13,$82,$2C,$C2,$2C,$C2,$2C,$C2,$2C,$C2	;Butterfly
	DB $5F,$9E,$0E,$3C,$9F,$00,$00,$03,$DC,$69,$F0,$00,$A0,$00,$68,$01,$A0,$01,$ED,$82,$48,$C2,$48,$C2,$48,$C2,$48,$C2	;Attack Carrier Boss Launcher
	DB $30,$A0,$0E,$75,$A0,$00,$00,$03,$EE,$69,$A0,$00,$F0,$00,$B8,$01,$D8,$01,$ED,$82,$64,$C2,$64,$C2,$64,$C2,$64,$C2	;Attack Carrier Boss Body
	DB $08,$A3,$0E,$32,$A3,$00,$00,$03,$EE,$69,$A0,$00,$F0,$00,$B8,$01,$D8,$01,$ED,$82,$80,$C2,$80,$C2,$80,$C2,$80,$C2	;Attack Carrier Boss Body LOD
	DB $7B,$A4,$0E,$9C,$A4,$00,$00,$03,$12,$6A,$50,$00,$A0,$00,$40,$01,$68,$01,$ED,$82,$9C,$C2,$9C,$C2,$9C,$C2,$9C,$C2	;Attack Carrier Boss Shield
	DB $09,$A5,$0E,$C3,$A5,$00,$00,$03,$24,$6A,$18,$01,$18,$01,$68,$01,$A0,$01,$ED,$82,$B8,$C2,$B8,$C2,$B8,$C2,$B8,$C2	;Attack Carrier Boss Top Left
	DB $6F,$A6,$0E,$29,$A7,$00,$00,$03,$44,$6B,$18,$01,$48,$01,$68,$01,$B8,$01,$ED,$82,$D4,$C2,$D4,$C2,$D4,$C2,$D4,$C2	;Attack Carrier Boss Bottom Left
	DB $D5,$A7,$0E,$EF,$A7,$00,$00,$01,$00,$00,$42,$00,$14,$00,$4E,$00,$50,$00,$13,$82,$F0,$C2,$F0,$C2,$F0,$C2,$F0,$C2	;Attack Carrier Boss Mini Ship
	DB $A4,$A8,$0E,$C4,$A8,$00,$00,$01,$00,$00,$42,$00,$3C,$00,$3C,$00,$54,$00,$13,$82,$0C,$C3,$0C,$C3,$0C,$C3,$0C,$C3	;Flying Enemy
	DB $A4,$A8,$0E,$C4,$A8,$00,$00,$01,$00,$00,$42,$00,$3C,$00,$3C,$00,$54,$00,$ED,$82,$28,$C3,$28,$C3,$28,$C3,$28,$C3	;Flying Enemy
	DB $9A,$A9,$0E,$A9,$A9,$00,$00,$01,$00,$00,$18,$00,$12,$00,$1E,$00,$28,$00,$13,$82,$44,$C3,$44,$C3,$44,$C3,$44,$C3	;Flying Enemy Wing
	DB $DE,$A9,$0E,$FB,$A9,$F6,$FF,$00,$B2,$5D,$22,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$60,$C3,$60,$C3,$60,$C3,$60,$C3	;Shielded Arwing
	DB $AB,$AA,$0E,$CB,$AA,$F6,$FF,$00,$B2,$5D,$21,$00,$10,$00,$50,$00,$50,$00,$13,$82,$7C,$C3,$7C,$C3,$7C,$C3,$7C,$C3	;Shielded Arwing No Right Wing
	DB $76,$AB,$0E,$96,$AB,$F6,$FF,$00,$B2,$5D,$21,$00,$10,$00,$50,$00,$50,$00,$13,$82,$98,$C3,$98,$C3,$98,$C3,$98,$C3	;Shielded Arwing No Left Wing
	DB $41,$AC,$0E,$5E,$AC,$F6,$FF,$00,$B2,$5D,$19,$00,$0D,$00,$50,$00,$50,$00,$13,$82,$B4,$C3,$B4,$C3,$B4,$C3,$B4,$C3	;Shielded Arwing No Wings
	DB $09,$AD,$0E,$40,$B2,$00,$00,$01,$00,$00,$78,$00,$3C,$00,$28,$00,$8C,$00,$13,$82,$D0,$C3,$D0,$C3,$D0,$C3,$D0,$C3	;Interlocking Door
	DB $B3,$B3,$0E,$CE,$B3,$00,$00,$02,$00,$00,$50,$00,$50,$00,$4C,$00,$5C,$00,$13,$82,$EC,$C3,$EC,$C3,$EC,$C3,$EC,$C3	;Antenna Dish
	DB $6B,$B4,$0E,$89,$B4,$28,$00,$02,$00,$00,$64,$00,$7C,$00,$64,$00,$7C,$00,$13,$82,$08,$C4,$08,$C4,$08,$C4,$08,$C4	;Antenna Base
	DB $DF,$B4,$0E,$10,$B5,$00,$00,$02,$00,$00,$50,$00,$E0,$01,$A0,$00,$E0,$01,$13,$82,$24,$C4,$24,$C4,$24,$C4,$24,$C4	;Pylon
	DB $DF,$B4,$0E,$10,$B5,$00,$00,$02,$3C,$64,$50,$00,$E0,$01,$A0,$00,$E0,$01,$13,$82,$40,$C4,$40,$C4,$40,$C4,$40,$C4	;Pylon
	DB $A0,$B5,$0E,$C3,$B5,$00,$00,$00,$00,$00,$23,$00,$3C,$00,$28,$00,$40,$00,$13,$82,$5C,$C4,$5C,$C4,$5C,$C4,$5C,$C4	;Twin Blaster Enemy
	DB $AB,$B6,$0E,$D1,$B6,$00,$00,$01,$00,$00,$28,$00,$28,$00,$22,$00,$2C,$00,$13,$82,$78,$C4,$78,$C4,$78,$C4,$78,$C4	;Twin Blaster Item
	DB $8E,$B7,$0E,$83,$B8,$00,$00,$01,$00,$00,$2A,$00,$28,$00,$28,$00,$2E,$00,$13,$82,$94,$C4,$94,$C4,$94,$C4,$94,$C4	;Nova Bomb Item
	DB $D6,$B8,$0E,$FF,$B8,$00,$00,$01,$00,$00,$30,$00,$28,$00,$30,$00,$30,$00,$13,$82,$B0,$C4,$B0,$C4,$B0,$C4,$B0,$C4	;Shield Item
	DB $C7,$B9,$0E,$EA,$B9,$00,$00,$00,$00,$00,$24,$00,$0E,$00,$28,$00,$38,$00,$13,$82,$CC,$C4,$CC,$C4,$CC,$C4,$CC,$C4	;Wing Repair Item
	DB $FB,$BA,$0E,$24,$BB,$00,$00,$00,$00,$00,$18,$00,$14,$00,$18,$00,$18,$00,$13,$82,$E8,$C4,$E8,$C4,$E8,$C4,$E8,$C4	;Unused Item
	DB $D7,$BB,$0E,$FB,$BB,$00,$00,$01,$00,$00,$14,$00,$1E,$00,$12,$00,$1E,$00,$13,$82,$04,$C5,$04,$C5,$04,$C5,$04,$C5	;Extra Credit Part
	DB $96,$BC,$0E,$C1,$BC,$00,$00,$00,$00,$00,$24,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$20,$C5,$20,$C5,$20,$C5,$20,$C5	;Repairing Arwing
	DB $7E,$BD,$0E,$C6,$BD,$00,$00,$00,$00,$00,$28,$00,$28,$00,$32,$00,$47,$00,$13,$82,$3C,$C5,$3C,$C5,$3C,$C5,$3C,$C5	;Hexagonal Hover Tank
	DB $BA,$BE,$0E,$E3,$BE,$00,$00,$01,$00,$00,$28,$00,$46,$00,$28,$00,$4C,$00,$13,$82,$58,$C5,$58,$C5,$58,$C5,$58,$C5	;Enemy With Wireframe
	DB $E0,$BF,$0E,$EC,$C2,$40,$06,$03,$00,$00,$F0,$00,$50,$00,$58,$00,$F0,$00,$13,$82,$74,$C5,$74,$C5,$74,$C5,$74,$C5	;Atomic Core Boss Blaster
	DB $8C,$C3,$0E,$70,$C6,$00,$00,$03,$00,$00,$40,$01,$20,$03,$40,$01,$48,$03,$13,$82,$90,$C5,$90,$C5,$90,$C5,$90,$C5	;Atomic Core Boss Body
	DB $8C,$C3,$0E,$70,$C6,$00,$00,$03,$64,$6C,$40,$01,$20,$03,$40,$01,$48,$03,$13,$82,$AC,$C5,$AC,$C5,$AC,$C5,$AC,$C5	;Atomic Core Boss Body
	DB $77,$C8,$0E,$93,$C8,$00,$00,$03,$00,$00,$50,$00,$20,$03,$28,$00,$28,$03,$13,$82,$C8,$C5,$C8,$C5,$C8,$C5,$C8,$C5	;Atomic Core Boss Wall Piece
	DB $BF,$C8,$0E,$D6,$C8,$00,$00,$02,$00,$00,$F0,$00,$F0,$00,$78,$00,$40,$01,$13,$82,$E4,$C5,$E4,$C5,$E4,$C5,$E4,$C5	;Atomic Core Boss Taser
	DB $36,$C9,$0E,$FE,$C9,$00,$00,$03,$F0,$6D,$38,$00,$70,$00,$20,$03,$20,$03,$13,$82,$00,$C6,$00,$C6,$00,$C6,$00,$C6	;Atomic Core Boss Spark
	DB $36,$CA,$0E,$77,$CA,$00,$00,$03,$00,$00,$A0,$00,$F0,$00,$C0,$00,$78,$00,$13,$82,$1C,$C6,$1C,$C6,$1C,$C6,$1C,$C6	;Atomic Core Boss Laser
	DB $C4,$CA,$0E,$EB,$CA,$00,$00,$00,$00,$00,$3C,$00,$46,$00,$46,$00,$5F,$00,$13,$82,$38,$C6,$38,$C6,$38,$C6,$38,$C6	;Atomic Core Boss Debris
	DB $6C,$CB,$0E,$83,$CB,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$A0,$00,$E0,$00,$13,$82,$54,$C6,$54,$C6,$54,$C6,$54,$C6	;Slot Machine Button
	DB $E2,$CB,$0E,$F9,$CB,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$50,$00,$E0,$00,$13,$82,$70,$C6,$70,$C6,$70,$C6,$70,$C6	;Slot Machine Button Pushed
	DB $58,$CC,$0E,$D4,$CC,$88,$FF,$02,$00,$00,$E4,$00,$08,$01,$64,$00,$18,$01,$13,$82,$8C,$C6,$8C,$C6,$8C,$C6,$8C,$C6	;Attack Carrier 2 Boss Shield
	DB $A3,$CD,$0E,$C6,$CD,$00,$00,$02,$00,$00,$3C,$00,$50,$00,$3C,$00,$54,$00,$13,$82,$A8,$C6,$A8,$C6,$A8,$C6,$A8,$C6	;Attack Carrier 2 Boss Weak Point
	DB $81,$CE,$0E,$49,$CF,$00,$00,$03,$00,$00,$E0,$01,$A0,$00,$A0,$00,$28,$02,$13,$82,$C4,$C6,$C4,$C6,$C4,$C6,$C4,$C6	;Attack Carrier 2 Boss Body
	DB $2D,$D1,$0E,$83,$D1,$00,$00,$01,$14,$6E,$5A,$00,$78,$00,$64,$00,$B4,$00,$13,$82,$E0,$C6,$E0,$C6,$E0,$C6,$E0,$C6	;Armada Ship Core Body
	DB $6F,$D3,$0E,$83,$D3,$00,$00,$01,$38,$6E,$1A,$00,$56,$00,$1A,$00,$56,$00,$13,$82,$FC,$C6,$FC,$C6,$FC,$C6,$FC,$C6	;Armada Ship Core
	DB $E8,$D3,$0E,$38,$D4,$00,$00,$01,$00,$00,$5A,$00,$78,$00,$28,$00,$96,$00,$13,$82,$18,$C7,$18,$C7,$18,$C7,$18,$C7
	DB $A9,$D5,$0E,$CA,$D5,$00,$00,$02,$00,$00,$C8,$00,$B4,$00,$C8,$00,$50,$01,$13,$82,$34,$C7,$34,$C7,$34,$C7,$34,$C7	;Attack Carrier 2 Boss Body Middle
	DB $7A,$D6,$0E,$1B,$D7,$00,$00,$03,$00,$00,$E0,$01,$B0,$00,$C8,$00,$28,$02,$13,$82,$50,$C7,$50,$C7,$50,$C7,$50,$C7	;Attack Carrier 2 Boss Body Right
	DB $C8,$D7,$0E,$69,$D8,$00,$00,$03,$00,$00,$E0,$01,$B0,$00,$C8,$00,$28,$02,$13,$82,$6C,$C7,$6C,$C7,$6C,$C7,$6C,$C7	;Attack Carrier 2 Boss Body Left
	DB $16,$D9,$0E,$42,$DF,$00,$00,$02,$50,$71,$80,$01,$3C,$01,$10,$01,$B0,$01,$13,$82,$88,$C7,$88,$C7,$88,$C7,$88,$C7	;Phantron 2 Boss
	DB $24,$E1,$0E,$5C,$E1,$00,$00,$02,$00,$00,$B4,$00,$8C,$00,$F0,$00,$FC,$00,$13,$82,$A4,$C7,$A4,$C7,$A4,$C7,$A4,$C7	;Phantron Boss
	DB $F5,$E2,$0E,$30,$E3,$00,$00,$05,$BC,$68,$C0,$03,$A0,$05,$A0,$0F,$A0,$0F,$13,$82,$C0,$C7,$C0,$C7,$C0,$C7,$C0,$C7	;Armada Cruiser
	DB $B4,$E4,$0E,$E7,$E4,$00,$00,$01,$00,$00,$32,$00,$28,$00,$3C,$00,$4A,$00,$13,$82,$DC,$C7,$DC,$C7,$DC,$C7,$DC,$C7	;Pod Ship
	DB $CA,$E5,$0E,$F4,$E5,$00,$00,$02,$00,$00,$B4,$00,$88,$00,$90,$00,$0C,$01,$13,$82,$F8,$C7,$F8,$C7,$F8,$C7,$F8,$C7	;Fat Winged Ship
	DB $E2,$E6,$0E,$F7,$E6,$00,$00,$02,$00,$00,$58,$00,$B0,$00,$78,$00,$CC,$00,$13,$82,$14,$C8,$14,$C8,$14,$C8,$14,$C8	;Phantron 2 Boss Leg Right
	DB $6C,$E7,$0E,$81,$E7,$00,$00,$02,$00,$00,$58,$00,$B0,$00,$78,$00,$CC,$00,$13,$82,$30,$C8,$30,$C8,$30,$C8,$30,$C8	;Phantron 2 Boss Leg Left
	DB $F6,$E7,$0E,$89,$E9,$00,$00,$02,$00,$00,$3C,$00,$50,$00,$F0,$00,$FC,$00,$13,$82,$4C,$C8,$4C,$C8,$4C,$C8,$4C,$C8
	DB $1C,$EB,$0E,$43,$EB,$00,$00,$02,$7C,$81,$78,$00,$A0,$00,$28,$00,$AC,$00,$13,$82,$68,$C8,$68,$C8,$68,$C8,$68,$C8	;Small Bonus Archway
	DB $0B,$EC,$0E,$40,$EC,$00,$00,$01,$00,$00,$4A,$00,$36,$00,$DC,$00,$A0,$00,$13,$82,$84,$C8,$84,$C8,$84,$C8,$84,$C8	;Long Cannon Tank
	DB $95,$ED,$0E,$01,$EE,$40,$01,$05,$00,$00,$40,$05,$C0,$02,$80,$07,$C0,$08,$ED,$82,$A0,$C8,$A0,$C8,$A0,$C8,$A0,$C8
	DB $76,$EF,$0E,$91,$EF,$00,$00,$00,$00,$00,$32,$00,$32,$00,$64,$00,$74,$00,$13,$82,$BC,$C8,$BC,$C8,$BC,$C8,$BC,$C8	;Beveled Tunnel
	DB $FE,$EF,$0E,$0D,$F0,$00,$00,$03,$00,$00,$D0,$02,$E0,$01,$D0,$07,$80,$08,$13,$82,$D8,$C8,$D8,$C8,$D8,$C8,$D8,$C8	;Tunnel Piece
	DB $46,$F0,$0E,$91,$F0,$00,$00,$00,$00,$00,$08,$00,$0A,$00,$3C,$00,$22,$00,$13,$82,$F4,$C8,$F4,$C8,$F4,$C8,$F4,$C8	;Letter D
	DB $46,$F0,$0E,$91,$F0,$00,$00,$00,$00,$00,$08,$00,$0A,$00,$3C,$00,$22,$00,$ED,$82,$10,$C9,$10,$C9,$10,$C9,$10,$C9	;Letter D
	DB $00,$80,$0F,$15,$80,$00,$00,$03,$E2,$6C,$A0,$00,$40,$01,$A0,$00,$88,$01,$13,$82,$2C,$C9,$2C,$C9,$2C,$C9,$2C,$C9	;Short Building
	DB $00,$80,$0F,$15,$80,$00,$00,$02,$D0,$6C,$50,$00,$A0,$00,$50,$00,$C4,$00,$13,$82,$48,$C9,$48,$C9,$48,$C9,$48,$C9	;Short Building
	DB $6A,$80,$0F,$7F,$80,$00,$00,$02,$F4,$6C,$50,$00,$90,$01,$50,$00,$A0,$01,$13,$82,$64,$C9,$64,$C9,$64,$C9,$64,$C9	;Tall Building
	DB $D4,$80,$0F,$92,$81,$00,$00,$01,$C0,$79,$2A,$00,$24,$00,$5E,$00,$6C,$00,$13,$82,$80,$C9,$80,$C9,$80,$C9,$80,$C9	;Galactic Rider Boss Door
	DB $E6,$81,$0F,$72,$82,$00,$00,$01,$E4,$70,$4E,$00,$48,$00,$B2,$00,$BA,$00,$13,$82,$9C,$C9,$9C,$C9,$9C,$C9,$9C,$C9	;Galactic Rider Boss Body
	DB $38,$86,$0F,$B6,$8D,$00,$00,$00,$86,$71,$26,$00,$75,$00,$24,$00,$80,$00,$13,$82,$B8,$C9,$B8,$C9,$B8,$C9,$B8,$C9	;Base Shooting Rings
	DB $BD,$8E,$0F,$6D,$91,$00,$00,$02,$CE,$71,$C8,$00,$C8,$00,$DC,$00,$F0,$00,$13,$82,$D4,$C9,$D4,$C9,$D4,$C9,$D4,$C9	;Metal Smasher Boss Body
	DB $BD,$8E,$0F,$6D,$91,$00,$00,$02,$BC,$71,$C8,$00,$C8,$00,$DC,$00,$F0,$00,$13,$82,$F0,$C9,$F0,$C9,$F0,$C9,$F0,$C9	;Metal Smasher Boss Body
	DB $BD,$8E,$0F,$6D,$91,$00,$00,$02,$AA,$71,$C8,$00,$C8,$00,$DC,$00,$F0,$00,$13,$82,$0C,$CA,$0C,$CA,$0C,$CA,$0C,$CA	;Metal Smasher Boss Body
	DB $EC,$93,$0F,$2D,$94,$00,$00,$00,$00,$00,$28,$00,$24,$00,$58,$00,$5D,$00,$13,$82,$28,$CA,$28,$CA,$28,$CA,$28,$CA	;Truck
	DB $59,$95,$0F,$3D,$97,$00,$00,$02,$F2,$71,$58,$01,$8C,$01,$50,$01,$90,$01,$13,$82,$44,$CA,$44,$CA,$44,$CA,$44,$CA	;Blade Barrier Boss Fan
	DB $59,$95,$0F,$3D,$97,$00,$00,$02,$00,$00,$8C,$01,$8C,$01,$50,$01,$90,$01,$13,$82,$60,$CA,$60,$CA,$60,$CA,$60,$CA	;Blade Barrier Boss Fan
	DB $E8,$98,$0F,$05,$99,$00,$00,$02,$00,$00,$88,$00,$A0,$00,$44,$00,$AC,$00,$13,$82,$7C,$CA,$7C,$CA,$7C,$CA,$7C,$CA	;Blade Barrier Boss Body
	DB $67,$99,$0F,$7E,$99,$00,$00,$02,$00,$00,$78,$00,$78,$00,$78,$00,$78,$00,$13,$82,$98,$CA,$98,$CA,$98,$CA,$98,$CA	;Blade Barrier Boss Tail
	DB $E8,$99,$0F,$04,$9C,$00,$00,$01,$00,$00,$76,$00,$82,$00,$28,$00,$84,$00,$13,$82,$B4,$CA,$B4,$CA,$B4,$CA,$B4,$CA	;Blade Barrier Boss Web
	DB $15,$9D,$0F,$29,$9D,$00,$00,$01,$00,$00,$28,$00,$00,$00,$28,$00,$28,$00,$D8,$81,$D0,$CA,$D0,$CA,$D0,$CA,$D0,$CA
	DB $3F,$9D,$0F,$51,$9D,$00,$00,$00,$00,$00,$14,$00,$14,$00,$1E,$00,$24,$00,$13,$82,$EC,$CA,$EC,$CA,$EC,$CA,$EC,$CA
	DB $6F,$9D,$0F,$AE,$9D,$00,$00,$01,$00,$00,$1C,$00,$78,$00,$14,$00,$7C,$00,$13,$82,$08,$CB,$08,$CB,$08,$CB,$08,$CB
	DB $46,$9E,$0F,$96,$9E,$00,$00,$06,$00,$00,$00,$0A,$00,$0A,$40,$06,$00,$0C,$13,$82,$24,$CB,$24,$CB,$24,$CB,$24,$CB	;Titania Mountain Entry
	DB $3D,$A1,$0F,$8D,$A1,$00,$00,$06,$00,$00,$00,$0A,$00,$0A,$80,$02,$80,$0A,$13,$82,$40,$CB,$40,$CB,$40,$CB,$40,$CB	;Titania Mountain Entry LOD
	DB $DC,$A2,$0F,$F4,$A2,$40,$0C,$03,$00,$00,$18,$00,$38,$00,$80,$02,$80,$02,$13,$82,$5C,$CB,$5C,$CB,$5C,$CB,$5C,$CB
	DB $3A,$A3,$0F,$4F,$A3,$40,$0C,$03,$00,$00,$40,$00,$90,$00,$C8,$00,$00,$01,$13,$82,$78,$CB,$78,$CB,$78,$CB,$78,$CB	;Titania Mountain Tunnel Piece
	DB $CC,$A3,$0F,$00,$A5,$00,$00,$00,$00,$00,$32,$00,$3C,$00,$5A,$00,$6A,$00,$13,$82,$94,$CB,$94,$CB,$94,$CB,$94,$CB	;Professor Hanger Boss
	DB $5B,$A8,$0F,$01,$AB,$00,$00,$01,$00,$00,$40,$00,$80,$00,$0A,$00,$90,$00,$13,$82,$B0,$CB,$B0,$CB,$B0,$CB,$B0,$CB	;Titania Mountain Door
	DB $6F,$AC,$0F,$A5,$AC,$00,$00,$03,$00,$00,$60,$00,$80,$02,$B8,$01,$A0,$02,$13,$82,$CC,$CB,$CC,$CB,$CC,$CB,$CC,$CB	;Mountain Thin Left
	DB $6F,$AC,$0F,$A5,$AC,$00,$00,$03,$00,$00,$60,$00,$80,$02,$B8,$01,$A0,$02,$ED,$82,$E8,$CB,$E8,$CB,$E8,$CB,$E8,$CB	;Mountain Thin Left
	DB $6F,$AC,$0F,$A5,$AC,$00,$00,$03,$00,$00,$60,$00,$80,$02,$B8,$01,$A0,$02,$C1,$83,$04,$CC,$04,$CC,$04,$CC,$04,$CC	;Mountain Thin Left
	DB $4C,$AD,$0F,$82,$AD,$00,$00,$03,$00,$00,$60,$00,$80,$02,$B8,$01,$A0,$02,$13,$82,$20,$CC,$20,$CC,$20,$CC,$20,$CC	;Mountain Thin Right
	DB $4C,$AD,$0F,$82,$AD,$00,$00,$03,$00,$00,$60,$00,$80,$02,$B8,$01,$A0,$02,$ED,$82,$3C,$CC,$3C,$CC,$3C,$CC,$3C,$CC	;Mountain Thin Right
	DB $4C,$AD,$0F,$82,$AD,$00,$00,$03,$00,$00,$60,$00,$80,$02,$B8,$01,$A0,$02,$C1,$83,$58,$CC,$58,$CC,$58,$CC,$58,$CC	;Mountain Thin Right
	DB $29,$AE,$0F,$5B,$AE,$00,$00,$03,$00,$00,$88,$00,$80,$02,$B8,$01,$A8,$02,$13,$82,$74,$CC,$74,$CC,$74,$CC,$74,$CC	;Mountain Left
	DB $29,$AE,$0F,$5B,$AE,$00,$00,$03,$00,$00,$88,$00,$80,$02,$B8,$01,$A8,$02,$ED,$82,$90,$CC,$90,$CC,$90,$CC,$90,$CC	;Mountain Left
	DB $29,$AE,$0F,$5B,$AE,$00,$00,$03,$00,$00,$88,$00,$80,$02,$B8,$01,$A8,$02,$C1,$83,$AC,$CC,$AC,$CC,$AC,$CC,$AC,$CC	;Mountain Left
	DB $02,$AF,$0F,$34,$AF,$00,$00,$03,$00,$00,$88,$00,$80,$02,$B8,$01,$A8,$02,$13,$82,$C8,$CC,$C8,$CC,$C8,$CC,$C8,$CC	;Mountain Right
	DB $02,$AF,$0F,$34,$AF,$00,$00,$03,$00,$00,$88,$00,$80,$02,$B8,$01,$A8,$02,$ED,$82,$E4,$CC,$E4,$CC,$E4,$CC,$E4,$CC	;Mountain Right
	DB $02,$AF,$0F,$34,$AF,$00,$00,$03,$00,$00,$88,$00,$80,$02,$B8,$01,$A8,$02,$C1,$83,$00,$CD,$00,$CD,$00,$CD,$00,$CD	;Mountain Right
	DB $DB,$AF,$0F,$10,$B0,$00,$00,$03,$00,$00,$D0,$00,$80,$02,$B8,$01,$B8,$02,$13,$82,$1C,$CD,$1C,$CD,$1C,$CD,$1C,$CD	;Mountain Wide Left
	DB $DB,$AF,$0F,$10,$B0,$00,$00,$03,$00,$00,$D0,$00,$80,$02,$B8,$01,$B8,$02,$ED,$82,$38,$CD,$38,$CD,$38,$CD,$38,$CD	;Mountain Wide Left
	DB $DB,$AF,$0F,$10,$B0,$00,$00,$03,$00,$00,$D0,$00,$80,$02,$B8,$01,$B8,$02,$C1,$83,$54,$CD,$54,$CD,$54,$CD,$54,$CD	;Mountain Wide Left
	DB $B7,$B0,$0F,$EC,$B0,$00,$00,$03,$00,$00,$D0,$00,$80,$02,$B8,$01,$B8,$02,$13,$82,$70,$CD,$70,$CD,$70,$CD,$70,$CD	;Mountain Wide Right
	DB $B7,$B0,$0F,$EC,$B0,$00,$00,$03,$00,$00,$D0,$00,$80,$02,$B8,$01,$B8,$02,$ED,$82,$8C,$CD,$8C,$CD,$8C,$CD,$8C,$CD	;Mountain Wide Right
	DB $B7,$B0,$0F,$EC,$B0,$00,$00,$03,$00,$00,$D0,$00,$80,$02,$B8,$01,$B8,$02,$C1,$83,$A8,$CD,$A8,$CD,$A8,$CD,$A8,$CD	;Mountain Wide Right
	DB $93,$B1,$0F,$15,$B2,$00,$00,$00,$00,$00,$3C,$00,$19,$00,$3C,$00,$41,$00,$13,$82,$C4,$CD,$C4,$CD,$C4,$CD,$C4,$CD	;Helicopter
	DB $64,$B3,$0F,$09,$B4,$00,$00,$01,$00,$00,$22,$00,$14,$00,$14,$00,$24,$00,$13,$82,$E0,$CD,$E0,$CD,$E0,$CD,$E0,$CD	;Metal Smasher Boss Mine
	DB $AA,$B4,$0F,$D4,$B4,$00,$00,$03,$00,$00,$B8,$00,$90,$01,$A0,$00,$B0,$01,$13,$82,$FC,$CD,$FC,$CD,$FC,$CD,$FC,$CD	;Mountain
	DB $AA,$B4,$0F,$D4,$B4,$00,$00,$03,$00,$00,$B8,$00,$90,$01,$A0,$00,$B0,$01,$ED,$82,$18,$CE,$18,$CE,$18,$CE,$18,$CE	;Mountain
	DB $AA,$B4,$0F,$D4,$B4,$00,$00,$03,$00,$00,$B8,$00,$90,$01,$A0,$00,$B0,$01,$C1,$83,$34,$CE,$34,$CE,$34,$CE,$34,$CE	;Mountain
	DB $83,$B5,$0F,$9E,$B6,$00,$00,$00,$00,$00,$37,$00,$28,$00,$3C,$00,$3F,$00,$13,$82,$50,$CE,$50,$CE,$50,$CE,$50,$CE	;Fish
	DB $B7,$B7,$0F,$41,$B8,$00,$00,$00,$00,$00,$3C,$00,$3C,$00,$14,$00,$55,$00,$13,$82,$6C,$CE,$6C,$CE,$6C,$CE,$6C,$CE	;Growing Leaf
	DB $A6,$B8,$0F,$8A,$BA,$00,$00,$02,$00,$00,$48,$00,$64,$00,$48,$00,$D4,$00,$13,$82,$88,$CE,$88,$CE,$88,$CE,$88,$CE	;Growing Flower
	DB $5B,$BC,$0F,$87,$BD,$00,$00,$00,$00,$00,$14,$00,$32,$00,$14,$00,$32,$00,$13,$82,$A4,$CE,$A4,$CE,$A4,$CE,$A4,$CE
	DB $31,$BE,$0F,$CE,$C0,$38,$FF,$01,$00,$00,$4C,$00,$46,$00,$50,$00,$60,$00,$13,$82,$C0,$CE,$C0,$CE,$C0,$CE,$C0,$CE
	DB $42,$C2,$0F,$6E,$C3,$00,$00,$00,$00,$00,$0F,$00,$32,$00,$0F,$00,$32,$00,$13,$82,$DC,$CE,$DC,$CE,$DC,$CE,$DC,$CE
	DB $FE,$C3,$0F,$0D,$C4,$00,$00,$00,$00,$00,$14,$00,$28,$00,$14,$00,$2E,$00,$13,$82,$30,$CF,$F8,$CE,$F8,$CE,$F8,$CE
	DB $39,$C4,$0F,$48,$C4,$00,$00,$00,$00,$00,$0F,$00,$28,$00,$0A,$00,$2B,$00,$13,$82,$14,$CF,$14,$CF,$14,$CF,$14,$CF
	DB $74,$C4,$0F,$83,$C4,$00,$00,$00,$00,$00,$1C,$00,$28,$00,$1C,$00,$38,$00,$D8,$81,$30,$CF,$30,$CF,$30,$CF,$30,$CF
	DB $A2,$C4,$0F,$F8,$C4,$00,$00,$01,$00,$00,$34,$00,$82,$00,$2A,$00,$82,$00,$13,$82,$4C,$CF,$4C,$CF,$4C,$CF,$4C,$CF	;Small Flower
	DB $EF,$C7,$0F,$54,$C8,$00,$00,$01,$00,$00,$34,$00,$AA,$00,$2A,$00,$AA,$00,$13,$82,$68,$CF,$68,$CF,$68,$CF,$68,$CF	;Big Flower
	DB $8A,$CB,$0F,$57,$CC,$00,$00,$00,$00,$00,$0F,$00,$78,$00,$17,$00,$78,$00,$13,$82,$84,$CF,$84,$CF,$84,$CF,$84,$CF
	DB $09,$CD,$0F,$23,$CD,$00,$00,$00,$00,$00,$0F,$00,$32,$00,$0F,$00,$32,$00,$13,$82,$A0,$CF,$A0,$CF,$A0,$CF,$A0,$CF
	DB $A5,$CD,$0F,$D2,$CD,$00,$00,$02,$0A,$7E,$78,$00,$50,$00,$C8,$00,$CC,$00,$13,$82,$BC,$CF,$BC,$CF,$BC,$CF,$BC,$CF	;Crab Head
	DB $86,$CF,$0F,$2B,$D2,$00,$00,$02,$1C,$7E,$1C,$01,$C4,$00,$64,$00,$A0,$00,$13,$82,$D8,$CF,$D8,$CF,$D8,$CF,$D8,$CF	;Crab Leg Left
	DB $A0,$D2,$0F,$45,$D5,$00,$00,$02,$2E,$7E,$1C,$01,$C4,$00,$64,$00,$A0,$00,$13,$82,$F4,$CF,$F4,$CF,$F4,$CF,$F4,$CF	;Crab Leg Right
	DB $BA,$D5,$0F,$2F,$D6,$00,$00,$05,$00,$00,$E0,$04,$80,$07,$E0,$05,$60,$08,$13,$82,$10,$D0,$10,$D0,$10,$D0,$10,$D0	;Venom Entry
	DB $E5,$D9,$0F,$09,$DA,$40,$06,$04,$00,$00,$70,$00,$40,$06,$40,$06,$40,$06,$13,$82,$2C,$D0,$2C,$D0,$2C,$D0,$2C,$D0
	DB $20,$DB,$0F,$3E,$DC,$00,$00,$02,$00,$00,$60,$00,$00,$00,$60,$00,$6C,$00,$13,$82,$48,$D0,$48,$D0,$48,$D0,$48,$D0	;Venom Entry Door
	DB $8B,$DC,$0F,$F1,$DE,$00,$00,$01,$00,$00,$70,$00,$7E,$00,$14,$00,$A8,$00,$13,$82,$64,$D0,$64,$D0,$64,$D0,$64,$D0	;Venom Entry Door 2
	DB $3C,$E0,$0F,$54,$E0,$00,$00,$02,$00,$00,$40,$00,$14,$00,$94,$00,$A0,$00,$13,$82,$80,$D0,$80,$D0,$80,$D0,$80,$D0
	DB $B0,$E0,$0F,$CA,$E0,$00,$00,$02,$00,$00,$1C,$00,$64,$00,$70,$00,$94,$00,$13,$82,$9C,$D0,$9C,$D0,$9C,$D0,$9C,$D0
	DB $78,$E1,$0F,$87,$E1,$00,$00,$04,$00,$00,$E0,$01,$20,$03,$50,$00,$B0,$03,$94,$85,$B8,$D0,$B8,$D0,$B8,$D0,$B8,$D0	;Andross Boss Square
	DB $DA,$E1,$0F,$E9,$E1,$00,$00,$02,$00,$00,$78,$00,$C8,$00,$14,$00,$EC,$00,$94,$85,$D4,$D0,$D4,$D0,$D4,$D0,$D4,$D0	;Andross Boss Square 2
	DB $DA,$E1,$0F,$E9,$E1,$00,$00,$02,$00,$00,$78,$00,$C8,$00,$14,$00,$EC,$00,$13,$82,$F0,$D0,$F0,$D0,$F0,$D0,$F0,$D0	;Andross Boss Square 2
	DB $3C,$E2,$0F,$4B,$E2,$00,$00,$00,$00,$00,$1E,$00,$32,$00,$05,$00,$3B,$00,$13,$82,$0C,$D1,$0C,$D1,$0C,$D1,$0C,$D1	;Andross Boss Square 3
	DB $3C,$E2,$0F,$4B,$E2,$00,$00,$01,$00,$00,$3C,$00,$64,$00,$0A,$00,$76,$00,$13,$82,$28,$D1,$28,$D1,$28,$D1,$28,$D1	;Andross Boss Square 3
	DB $9E,$E2,$0F,$86,$E8,$00,$00,$04,$10,$81,$E0,$01,$C0,$03,$90,$01,$60,$04,$94,$85,$44,$D1,$44,$D1,$44,$D1,$44,$D1	;Andross Boss Face
	DB $81,$EB,$0F,$5B,$F0,$00,$00,$04,$10,$81,$C0,$01,$C0,$03,$D0,$03,$A0,$04,$94,$85,$60,$D1,$60,$D1,$60,$D1,$60,$D1	;Andross Boss Face 2
	DB $2A,$F3,$0F,$6E,$F3,$00,$00,$00,$00,$00,$32,$00,$3C,$00,$3C,$00,$55,$00,$13,$82,$7C,$D1,$7C,$D1,$7C,$D1,$7C,$D1
	DB $5F,$F4,$0F,$DC,$F7,$00,$00,$01,$AE,$82,$5A,$00,$3C,$00,$14,$00,$6E,$00,$13,$82,$98,$D1,$98,$D1,$98,$D1,$98,$D1	;Vertical Tunnel Door
	DB $B8,$F8,$0F,$D9,$F8,$00,$00,$04,$00,$00,$D0,$00,$60,$00,$A0,$01,$D0,$01,$13,$82,$B4,$D1,$B4,$D1,$B4,$D1,$B4,$D1	;Armada Tunnel Upward Piece
	DB $37,$F9,$0F,$49,$F9,$00,$00,$04,$00,$00,$D0,$00,$60,$00,$A0,$01,$D0,$01,$13,$82,$D0,$D1,$D0,$D1,$D0,$D1,$D0,$D1	;Armada Tunnel Upward Piece 2
	DB $A7,$F9,$0F,$B9,$F9,$00,$00,$04,$00,$00,$D0,$00,$60,$00,$A0,$01,$D0,$01,$13,$82,$EC,$D1,$EC,$D1,$EC,$D1,$EC,$D1	;Armada Tunnel Upward Piece
	DB $17,$FA,$0F,$29,$FA,$00,$00,$04,$00,$00,$D0,$00,$60,$00,$A0,$01,$D0,$01,$13,$82,$08,$D2,$08,$D2,$08,$D2,$08,$D2	;Armada Tunnel Downward Piece
	DB $87,$FA,$0F,$96,$FA,$00,$00,$04,$00,$00,$D0,$00,$60,$00,$40,$01,$90,$01,$13,$82,$24,$D2,$24,$D2,$24,$D2,$24,$D2	;Armada Tunnel Piece
	DB $CF,$FA,$0F,$DE,$FA,$00,$00,$04,$00,$00,$D0,$00,$60,$00,$40,$01,$90,$01,$13,$82,$40,$D2,$40,$D2,$40,$D2,$40,$D2	;Armada Tunnel Piece 2
	DB $17,$FB,$0F,$34,$FB,$00,$00,$04,$00,$00,$E0,$00,$A0,$00,$20,$03,$40,$03,$13,$82,$5C,$D2,$5C,$D2,$5C,$D2,$5C,$D2	;Armada Tunnel Twist Piece
	DB $E6,$F0,$11,$F5,$F0,$00,$00,$00,$00,$00,$28,$00,$28,$00,$28,$00,$45,$00,$13,$82,$78,$D2,$78,$D2,$78,$D2,$78,$D2
	DB $55,$F1,$11,$F5,$F0,$00,$00,$00,$00,$00,$05,$00,$3C,$00,$05,$00,$45,$00,$13,$82,$94,$D2,$94,$D2,$94,$D2,$94,$D2
	DB $64,$F1,$11,$F5,$F0,$00,$00,$00,$00,$00,$05,$00,$3C,$00,$05,$00,$45,$00,$13,$82,$B0,$D2,$B0,$D2,$B0,$D2,$B0,$D2
	DB $00,$00,$00,$00,$00,$00,$00,$00,$B2,$5D,$24,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$CC,$D2,$CC,$D2,$CC,$D2,$CC,$D2
	DB $73,$F1,$11,$96,$F1,$00,$00,$00,$B2,$5D,$24,$00,$0E,$00,$50,$00,$50,$00,$7C,$80,$E8,$D2,$E8,$D2,$E8,$D2,$E8,$D2
	DB $73,$F1,$11,$96,$F1,$F4,$01,$00,$B2,$5D,$24,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$04,$D3,$04,$D3,$04,$D3,$04,$D3
	DB $73,$F1,$11,$96,$F1,$00,$00,$00,$B2,$5D,$24,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$20,$D3,$20,$D3,$20,$D3,$20,$D3
	DB $73,$F1,$11,$96,$F1,$00,$00,$00,$00,$00,$24,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$3C,$D3,$3C,$D3,$3C,$D3,$3C,$D3
	DB $B3,$F2,$11,$D9,$F2,$00,$00,$00,$B2,$5D,$24,$00,$0E,$00,$50,$00,$50,$00,$7C,$80,$58,$D3,$58,$D3,$58,$D3,$58,$D3
	DB $B3,$F2,$11,$D9,$F2,$00,$00,$00,$B2,$5D,$24,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$74,$D3,$74,$D3,$74,$D3,$74,$D3
	DB $F6,$F3,$11,$1C,$F4,$00,$00,$00,$B2,$5D,$24,$00,$0E,$00,$50,$00,$50,$00,$7C,$80,$90,$D3,$90,$D3,$90,$D3,$90,$D3
	DB $F6,$F3,$11,$1C,$F4,$00,$00,$00,$B2,$5D,$24,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$AC,$D3,$AC,$D3,$AC,$D3,$AC,$D3
	DB $39,$F5,$11,$5C,$F5,$00,$00,$00,$B2,$5D,$14,$00,$0E,$00,$50,$00,$50,$00,$7C,$80,$C8,$D3,$C8,$D3,$C8,$D3,$C8,$D3
	DB $39,$F5,$11,$5C,$F5,$00,$00,$00,$B2,$5D,$14,$00,$0E,$00,$50,$00,$50,$00,$13,$82,$E4,$D3,$E4,$D3,$E4,$D3,$E4,$D3
	DB $00,$80,$10,$0F,$80,$00,$00,$02,$18,$6D,$50,$00,$40,$01,$40,$01,$CC,$01,$13,$82,$00,$D4,$00,$D4,$00,$D4,$00,$D4	;Thin Building
	DB $48,$80,$10,$92,$80,$00,$00,$02,$2A,$6D,$C8,$00,$90,$01,$C8,$00,$E8,$01,$13,$82,$1C,$D4,$1C,$D4,$1C,$D4,$1C,$D4	;4 Buildings With Tall Blue
	DB $C6,$81,$10,$07,$82,$00,$00,$02,$72,$6D,$C8,$00,$90,$01,$C8,$00,$E8,$01,$13,$82,$38,$D4,$38,$D4,$38,$D4,$38,$D4	;3 Buildings With Tall Orange
	DB $DF,$82,$10,$1D,$83,$00,$00,$02,$A8,$6D,$C8,$00,$90,$01,$C8,$00,$E8,$01,$13,$82,$54,$D4,$54,$D4,$54,$D4,$54,$D4	;4 Tall Buildings
	DB $1D,$84,$10,$3B,$84,$00,$00,$02,$00,$00,$50,$00,$54,$01,$A0,$00,$80,$01,$13,$82,$70,$D4,$70,$D4,$70,$D4,$70,$D4	;Thin Building With Logo
	DB $AB,$84,$10,$A3,$8C,$00,$00,$03,$00,$00,$E8,$01,$E0,$01,$48,$03,$48,$03,$ED,$82,$8C,$D4,$8C,$D4,$8C,$D4,$8C,$D4	;Great Commander Boss Assembly
	DB $3D,$90,$10,$B9,$90,$00,$00,$03,$00,$00,$F0,$00,$D8,$00,$C8,$00,$30,$01,$ED,$82,$A8,$D4,$A8,$D4,$A8,$D4,$A8,$D4	;Great Commander Boss Head
	DB $3D,$90,$10,$B9,$90,$00,$00,$00,$00,$00,$1E,$00,$1B,$00,$19,$00,$26,$00,$ED,$82,$C4,$D4,$C4,$D4,$C4,$D4,$C4,$D4	;Great Commander Boss Head
	DB $A1,$91,$10,$39,$95,$00,$00,$03,$00,$00,$E8,$01,$58,$02,$80,$02,$B0,$02,$ED,$82,$E0,$D4,$E0,$D4,$E0,$D4,$E0,$D4	;Great Commander Boss Middle Part
	DB $5B,$97,$10,$27,$98,$00,$00,$03,$E0,$7A,$90,$01,$78,$00,$E8,$01,$F0,$01,$ED,$82,$FC,$D4,$FC,$D4,$FC,$D4,$FC,$D4	;Great Commander Boss Bottom Part
	DB $2B,$9A,$10,$D7,$9A,$00,$00,$03,$88,$6C,$E8,$01,$58,$00,$E0,$01,$10,$02,$ED,$82,$18,$D5,$18,$D5,$18,$D5,$18,$D5	;Great Commander Boss Whole
	DB $16,$9E,$10,$3A,$9E,$00,$00,$03,$00,$00,$E8,$00,$C8,$00,$A0,$00,$08,$01,$ED,$82,$34,$D5,$34,$D5,$34,$D5,$34,$D5	;Great Commander Boss Middle Part Center
	DB $38,$9F,$10,$53,$9F,$00,$00,$03,$00,$00,$30,$00,$A8,$00,$30,$02,$38,$02,$ED,$82,$50,$D5,$50,$D5,$50,$D5,$50,$D5	;Great Commander Boss Middle Part Left
	DB $D2,$9F,$10,$ED,$9F,$00,$00,$03,$00,$00,$30,$00,$A8,$00,$30,$02,$38,$02,$ED,$82,$6C,$D5,$6C,$D5,$6C,$D5,$6C,$D5	;Great Commander Boss Middle Part Right
	DB $6C,$A0,$10,$F8,$A0,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$24,$00,$ED,$82,$88,$D5,$88,$D5,$88,$D5,$88,$D5	;Great Commander Boss Weak Point Left
	DB $2F,$A1,$10,$BB,$A1,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$24,$00,$ED,$82,$A4,$D5,$A4,$D5,$A4,$D5,$A4,$D5	;Great Commander Boss Weak Point Right
	DB $F2,$A1,$10,$04,$A2,$00,$00,$02,$00,$00,$10,$00,$08,$00,$14,$00,$1C,$00,$2E,$85,$C0,$D5,$C0,$D5,$C0,$D5,$C0,$D5
	DB $1F,$A2,$10,$34,$A2,$00,$00,$02,$00,$00,$10,$00,$08,$00,$14,$00,$1C,$00,$2E,$85,$DC,$D5,$DC,$D5,$DC,$D5,$DC,$D5
	DB $4F,$A2,$10,$C6,$A4,$00,$00,$00,$00,$00,$19,$00,$21,$00,$34,$00,$39,$00,$13,$82,$F8,$D5,$F8,$D5,$F8,$D5,$F8,$D5
	DB $2D,$A7,$10,$68,$A7,$00,$00,$01,$00,$00,$32,$00,$78,$00,$0A,$00,$82,$00,$13,$82,$14,$D6,$14,$D6,$14,$D6,$14,$D6
	DB $27,$A8,$10,$3C,$A8,$00,$00,$01,$00,$00,$5A,$00,$14,$00,$28,$00,$64,$00,$13,$82,$30,$D6,$30,$D6,$30,$D6,$30,$D6	;Beveled Beam 1
	DB $82,$A8,$10,$97,$A8,$00,$00,$01,$00,$00,$5A,$00,$28,$00,$14,$00,$7A,$00,$13,$82,$4C,$D6,$4C,$D6,$4C,$D6,$4C,$D6	;Beveled Beam 2
	DB $DD,$A8,$10,$F2,$A8,$00,$00,$01,$00,$00,$1E,$00,$3C,$00,$14,$00,$7C,$00,$13,$82,$68,$D6,$68,$D6,$68,$D6,$68,$D6	;Beveled Beam 3
	DB $6C,$A9,$10,$81,$A9,$00,$00,$01,$00,$00,$32,$00,$3C,$00,$14,$00,$82,$00,$13,$82,$84,$D6,$84,$D6,$84,$D6,$84,$D6	;Beveled Beam 4
	DB $FB,$A9,$10,$10,$AA,$00,$00,$01,$00,$00,$0A,$00,$3C,$00,$14,$00,$7A,$00,$13,$82,$A0,$D6,$A0,$D6,$A0,$D6,$A0,$D6	;Beveled Beam 5
	DB $8A,$AA,$10,$9F,$AA,$00,$00,$01,$00,$00,$5A,$00,$0A,$00,$14,$00,$5E,$00,$13,$82,$BC,$D6,$BC,$D6,$BC,$D6,$BC,$D6	;Beveled Beam 6
	DB $19,$AB,$10,$2E,$AB,$00,$00,$01,$00,$00,$1E,$00,$1E,$00,$14,$00,$44,$00,$13,$82,$D8,$D6,$D8,$D6,$D8,$D6,$D8,$D6	;Beveled Beam 7
	DB $A8,$AB,$10,$BD,$AB,$00,$00,$01,$00,$00,$0A,$00,$28,$00,$14,$00,$52,$00,$13,$82,$F4,$D6,$F4,$D6,$F4,$D6,$F4,$D6	;Beveled Beam 8
	DB $37,$AC,$10,$2F,$AD,$00,$00,$00,$80,$77,$08,$00,$4F,$00,$0A,$00,$53,$00,$13,$82,$10,$D7,$10,$D7,$10,$D7,$10,$D7	;Growing Column 2
	DB $75,$AD,$10,$33,$AE,$00,$00,$00,$D0,$75,$64,$00,$C8,$00,$0A,$00,$65,$00,$81,$84,$2C,$D7,$2C,$D7,$2C,$D7,$2C,$D7	;Rising Archway
	DB $F9,$AE,$10,$AF,$AF,$00,$00,$00,$00,$00,$2B,$00,$39,$00,$3C,$00,$53,$00,$13,$82,$48,$D7,$48,$D7,$48,$D7,$48,$D7	;Cockpit
	DB $73,$F1,$11,$96,$F1,$80,$0C,$05,$00,$00,$00,$00,$00,$00,$80,$0C,$00,$00,$13,$82,$64,$D7,$64,$D7,$64,$D7,$64,$D7	;Low-Poly Arwing
	DB $C4,$B3,$10,$E7,$B3,$00,$FB,$04,$00,$00,$40,$01,$E0,$00,$00,$05,$00,$05,$13,$82,$80,$D7,$80,$D7,$80,$D7,$80,$D7	;Low-Poly Arwing No Wings
	DB $0C,$B5,$10,$32,$B5,$00,$FB,$04,$00,$00,$40,$02,$E0,$00,$00,$05,$00,$05,$13,$82,$9C,$D7,$9C,$D7,$9C,$D7,$9C,$D7	;Low-Poly Arwing No Right Wing
	DB $57,$B6,$10,$7D,$B6,$00,$FB,$04,$00,$00,$40,$02,$E0,$00,$00,$05,$00,$05,$13,$82,$B8,$D7,$B8,$D7,$B8,$D7,$B8,$D7	;Low-Poly Arwing No Left Wing
	DB $A2,$B7,$10,$E6,$BD,$00,$00,$02,$50,$71,$80,$01,$3C,$01,$10,$01,$B0,$01,$13,$82,$D4,$D7,$D4,$D7,$D4,$D7,$D4,$D7	;Artsy Thing
	DB $B8,$BF,$10,$CD,$BF,$00,$00,$02,$00,$00,$50,$00,$28,$00,$50,$00,$08,$02,$13,$82,$F0,$D7,$F0,$D7,$F0,$D7,$F0,$D7
	DB $32,$C0,$10,$5B,$C0,$00,$00,$01,$00,$00,$3C,$00,$28,$00,$50,$00,$52,$00,$13,$82,$0C,$D8,$0C,$D8,$0C,$D8,$0C,$D8
	DB $57,$C1,$10,$B1,$C3,$00,$00,$01,$00,$00,$7E,$00,$78,$00,$B4,$00,$D6,$00,$13,$82,$28,$D8,$28,$D8,$28,$D8,$28,$D8
	DB $A3,$C4,$10,$B8,$C4,$00,$00,$00,$00,$00,$37,$00,$32,$00,$37,$00,$51,$00,$13,$82,$44,$D8,$44,$D8,$44,$D8,$44,$D8
	DB $25,$C5,$10,$70,$C5,$00,$00,$00,$00,$00,$73,$00,$0A,$00,$69,$00,$9C,$00,$13,$82,$60,$D8,$60,$D8,$60,$D8,$60,$D8
	DB $25,$C5,$10,$70,$C5,$00,$00,$00,$00,$00,$73,$00,$6E,$00,$69,$00,$9C,$00,$13,$82,$7C,$D8,$7C,$D8,$7C,$D8,$7C,$D8
	DB $DD,$C5,$10,$F2,$C5,$00,$00,$00,$00,$00,$1E,$00,$3C,$00,$1E,$00,$44,$00,$13,$82,$98,$D8,$98,$D8,$98,$D8,$98,$D8
	DB $5F,$C6,$10,$74,$C6,$00,$00,$00,$00,$00,$50,$00,$19,$00,$50,$00,$71,$00,$13,$82,$B4,$D8,$B4,$D8,$B4,$D8,$B4,$D8
	DB $E1,$C6,$10,$F6,$C6,$00,$00,$01,$00,$00,$28,$00,$50,$00,$D2,$00,$E2,$00,$13,$82,$D0,$D8,$D0,$D8,$D0,$D8,$D0,$D8
	DB $5A,$C7,$10,$75,$C7,$00,$00,$01,$00,$00,$1E,$00,$1E,$00,$96,$00,$9A,$00,$13,$82,$EC,$D8,$EC,$D8,$EC,$D8,$EC,$D8
	DB $04,$C8,$10,$37,$C8,$00,$00,$00,$00,$00,$19,$00,$7D,$00,$19,$00,$80,$00,$13,$82,$08,$D9,$08,$D9,$08,$D9,$08,$D9
	DB $C6,$C8,$10,$DB,$C8,$00,$00,$01,$00,$00,$8C,$00,$28,$00,$78,$00,$9E,$00,$13,$82,$24,$D9,$24,$D9,$24,$D9,$24,$D9
	DB $AB,$C9,$10,$C0,$C9,$00,$00,$01,$00,$00,$64,$00,$28,$00,$6E,$00,$70,$00,$13,$82,$40,$D9,$40,$D9,$40,$D9,$40,$D9
	DB $15,$CA,$10,$50,$CA,$00,$05,$04,$00,$00,$40,$01,$40,$01,$40,$01,$B0,$04,$13,$82,$5C,$D9,$5C,$D9,$5C,$D9,$5C,$D9
	DB $15,$CA,$10,$50,$CA,$80,$02,$03,$00,$00,$A0,$00,$A0,$00,$A0,$00,$58,$02,$13,$82,$78,$D9,$78,$D9,$78,$D9,$78,$D9
	DB $15,$CA,$10,$50,$CA,$40,$01,$02,$00,$00,$50,$00,$50,$00,$50,$00,$2C,$01,$13,$82,$94,$D9,$94,$D9,$94,$D9,$94,$D9
	DB $7D,$CB,$10,$A6,$CB,$50,$00,$00,$00,$00,$1E,$00,$32,$00,$78,$00,$7A,$00,$13,$82,$B0,$D9,$B0,$D9,$B0,$D9,$B0,$D9
	DB $7D,$CB,$10,$A6,$CB,$50,$00,$00,$00,$00,$1E,$00,$32,$00,$78,$00,$7A,$00,$13,$82,$CC,$D9,$CC,$D9,$CC,$D9,$CC,$D9
	DB $30,$CC,$10,$45,$CC,$00,$00,$02,$00,$00,$50,$00,$50,$00,$14,$00,$74,$00,$13,$82,$E8,$D9,$E8,$D9,$E8,$D9,$E8,$D9
	DB $7D,$CC,$10,$52,$CD,$00,$00,$03,$00,$00,$58,$01,$78,$01,$80,$00,$A8,$01,$13,$82,$04,$DA,$04,$DA,$04,$DA,$04,$DA
	DB $E2,$CD,$10,$D4,$CF,$00,$00,$00,$00,$00,$40,$00,$50,$00,$15,$00,$68,$00,$13,$82,$20,$DA,$20,$DA,$20,$DA,$20,$DA
	DB $C7,$D0,$10,$5D,$D4,$00,$00,$01,$00,$00,$5C,$00,$3C,$00,$0A,$00,$6E,$00,$13,$82,$3C,$DA,$3C,$DA,$3C,$DA,$3C,$DA
	DB $4E,$D5,$10,$94,$D9,$00,$00,$02,$00,$00,$B8,$00,$78,$00,$14,$00,$DC,$00,$13,$82,$58,$DA,$58,$DA,$58,$DA,$58,$DA
	DB $4E,$D5,$10,$94,$D9,$00,$00,$01,$00,$00,$5C,$00,$3C,$00,$0A,$00,$6E,$00,$13,$82,$74,$DA,$74,$DA,$74,$DA,$74,$DA
	DB $83,$DA,$10,$86,$DB,$00,$00,$00,$00,$00,$3A,$00,$25,$00,$1C,$00,$3B,$00,$13,$82,$90,$DA,$90,$DA,$90,$DA,$90,$DA
	DB $9F,$DC,$10,$B1,$DC,$00,$00,$00,$00,$00,$19,$00,$0B,$00,$0F,$00,$1D,$00,$13,$82,$AC,$DA,$AC,$DA,$AC,$DA,$AC,$DA
	DB $E8,$DC,$10,$F4,$DC,$00,$00,$00,$00,$00,$12,$00,$15,$00,$0D,$00,$1A,$00,$13,$82,$C8,$DA,$C8,$DA,$C8,$DA,$C8,$DA
	DB $E8,$DC,$10,$F4,$DC,$00,$00,$01,$00,$00,$24,$00,$2A,$00,$1A,$00,$34,$00,$13,$82,$E4,$DA,$E4,$DA,$E4,$DA,$E4,$DA
	DB $E8,$DC,$10,$F4,$DC,$00,$00,$02,$00,$00,$48,$00,$54,$00,$34,$00,$68,$00,$13,$82,$00,$DB,$00,$DB,$00,$DB,$00,$DB
	DB $11,$DD,$10,$54,$DF,$00,$00,$01,$04,$7B,$5A,$00,$6E,$00,$3C,$00,$96,$00,$13,$82,$1C,$DB,$1C,$DB,$1C,$DB,$1C,$DB
	DB $2D,$E0,$10,$59,$E0,$00,$00,$01,$00,$00,$78,$00,$50,$00,$B4,$00,$C4,$00,$13,$82,$38,$DB,$38,$DB,$38,$DB,$38,$DB
	DB $B7,$E1,$10,$A7,$E3,$00,$00,$01,$00,$00,$1A,$00,$1E,$00,$3C,$00,$44,$00,$13,$82,$54,$DB,$54,$DB,$54,$DB,$54,$DB
	DB $4C,$E4,$10,$72,$E4,$00,$00,$00,$00,$00,$3C,$00,$3C,$00,$32,$00,$4F,$00,$13,$82,$70,$DB,$70,$DB,$70,$DB,$70,$DB
	DB $CC,$E5,$10,$C4,$E7,$00,$00,$01,$00,$00,$32,$00,$68,$00,$30,$00,$74,$00,$13,$82,$8C,$DB,$8C,$DB,$8C,$DB,$8C,$DB
	DB $6D,$E8,$10,$9C,$E8,$00,$00,$00,$00,$00,$14,$00,$19,$00,$14,$00,$19,$00,$13,$82,$A8,$DB,$A8,$DB,$A8,$DB,$A8,$DB
	DB $D3,$E9,$10,$D9,$EA,$00,$00,$00,$00,$00,$2D,$00,$28,$00,$28,$00,$2D,$00,$13,$82,$C4,$DB,$C4,$DB,$C4,$DB,$C4,$DB
	DB $F0,$EB,$10,$FE,$EC,$00,$00,$00,$62,$83,$3C,$00,$14,$00,$14,$00,$42,$00,$13,$82,$E0,$DB,$E0,$DB,$E0,$DB,$E0,$DB
	DB $53,$ED,$10,$0F,$EF,$00,$00,$01,$16,$84,$3C,$00,$3C,$00,$14,$00,$58,$00,$13,$82,$FC,$DB,$FC,$DB,$FC,$DB,$FC,$DB
	DB $7C,$EF,$10,$97,$EF,$00,$00,$01,$00,$00,$14,$00,$14,$00,$00,$00,$16,$00,$13,$82,$18,$DC,$18,$DC,$18,$DC,$18,$DC
	DB $26,$F0,$10,$72,$F0,$00,$00,$02,$00,$00,$28,$00,$28,$00,$28,$00,$38,$00,$13,$82,$34,$DC,$34,$DC,$34,$DC,$34,$DC
	DB $D1,$F0,$10,$DA,$F0,$00,$00,$02,$00,$00,$28,$00,$28,$00,$00,$00,$38,$00,$A4,$85,$50,$DC,$50,$DC,$50,$DC,$50,$DC
	DB $EC,$F0,$10,$01,$F1,$00,$00,$01,$00,$00,$1C,$00,$A0,$00,$1C,$00,$A4,$00,$13,$82,$6C,$DC,$6C,$DC,$6C,$DC,$6C,$DC
	DB $63,$F1,$10,$8C,$F2,$00,$00,$02,$00,$00,$A0,$00,$E0,$00,$A0,$00,$E4,$00,$94,$85,$88,$DC,$88,$DC,$88,$DC,$88,$DC
	DB $85,$F3,$10,$99,$F6,$00,$00,$01,$00,$00,$50,$00,$4E,$00,$50,$00,$72,$00,$94,$85,$A4,$DC,$A4,$DC,$A4,$DC,$A4,$DC
	DB $6A,$F7,$10,$79,$F7,$00,$00,$00,$00,$00,$5A,$00,$14,$00,$14,$00,$5E,$00,$13,$82,$C0,$DC,$C0,$DC,$C0,$DC,$C0,$DC
	DB $A5,$F7,$10,$B4,$F7,$00,$00,$00,$00,$00,$14,$00,$3C,$00,$14,$00,$42,$00,$13,$82,$DC,$DC,$DC,$DC,$DC,$DC,$DC,$DC
	DB $A5,$F7,$10,$E0,$F7,$00,$00,$00,$00,$00,$14,$00,$3C,$00,$14,$00,$42,$00,$13,$82,$F8,$DC,$F8,$DC,$F8,$DC,$F8,$DC
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$64,$00,$64,$00,$64,$00,$64,$00,$13,$82,$14,$DD,$14,$DD,$14,$DD,$14,$DD
	DB $0C,$F8,$10,$1D,$F8,$00,$00,$01,$00,$00,$28,$00,$3C,$00,$28,$00,$3C,$00,$13,$82,$30,$DD,$30,$DD,$30,$DD,$30,$DD
	DB $00,$80,$11,$21,$80,$00,$00,$03,$06,$6D,$50,$00,$30,$02,$A0,$00,$48,$02,$13,$82,$4C,$DD,$4C,$DD,$4C,$DD,$4C,$DD
	DB $69,$80,$11,$8C,$80,$00,$FB,$04,$00,$00,$40,$02,$E0,$00,$00,$05,$00,$05,$13,$82,$68,$DD,$68,$DD,$68,$DD,$68,$DD
	DB $B1,$81,$11,$49,$82,$00,$00,$04,$00,$00,$20,$03,$A0,$02,$F0,$02,$B0,$04,$13,$82,$84,$DD,$84,$DD,$84,$DD,$84,$DD
	DB $D2,$84,$11,$E1,$84,$00,$00,$03,$00,$00,$58,$01,$60,$01,$B8,$01,$98,$02,$13,$82,$A0,$DD,$A0,$DD,$A0,$DD,$A0,$DD
	DB $F3,$84,$11,$14,$85,$00,$00,$03,$00,$00,$68,$01,$90,$00,$28,$00,$68,$01,$13,$82,$BC,$DD,$BC,$DD,$BC,$DD,$BC,$DD
	DB $35,$85,$11,$AB,$85,$00,$00,$01,$00,$00,$50,$00,$50,$00,$78,$00,$80,$00,$13,$82,$D8,$DD,$D8,$DD,$F4,$DD,$F4,$DD
	DB $C5,$87,$11,$DF,$87,$00,$00,$00,$00,$00,$28,$00,$19,$00,$6E,$00,$6E,$00,$13,$82,$F4,$DD,$F4,$DD,$F4,$DD,$F4,$DD
	DB $64,$88,$11,$FC,$89,$00,$00,$01,$00,$00,$40,$00,$54,$00,$32,$00,$58,$00,$13,$82,$10,$DE,$10,$DE,$10,$DE,$10,$DE
	DB $64,$88,$11,$FC,$89,$00,$00,$00,$00,$00,$20,$00,$2A,$00,$19,$00,$2C,$00,$13,$82,$2C,$DE,$2C,$DE,$2C,$DE,$2C,$DE
	DB $69,$8A,$11,$3A,$8B,$00,$00,$02,$00,$00,$A0,$00,$64,$00,$7C,$00,$CC,$00,$13,$82,$48,$DE,$48,$DE,$48,$DE,$48,$DE
	DB $88,$8C,$11,$9F,$8C,$00,$00,$02,$00,$00,$28,$00,$64,$00,$7C,$00,$8C,$00,$13,$82,$64,$DE,$64,$DE,$64,$DE,$64,$DE
	DB $0A,$8D,$11,$1B,$8D,$00,$00,$02,$00,$00,$68,$00,$3C,$00,$28,$00,$70,$00,$13,$82,$80,$DE,$80,$DE,$80,$DE,$80,$DE
	DB $75,$8D,$11,$A4,$8D,$00,$00,$01,$00,$00,$34,$00,$40,$00,$5A,$00,$5C,$00,$13,$82,$9C,$DE,$9C,$DE,$9C,$DE,$9C,$DE
	DB $E4,$8E,$11,$14,$8F,$00,$00,$01,$00,$00,$3C,$00,$22,$00,$5A,$00,$6C,$00,$13,$82,$B8,$DE,$B8,$DE,$B8,$DE,$B8,$DE
	DB $01,$90,$11,$24,$90,$00,$00,$01,$00,$00,$3C,$00,$22,$00,$5A,$00,$6C,$00,$13,$82,$D4,$DE,$D4,$DE,$D4,$DE,$D4,$DE
	DB $F4,$90,$11,$25,$91,$00,$00,$01,$00,$00,$3C,$00,$22,$00,$5A,$00,$6C,$00,$13,$82,$F0,$DE,$F0,$DE,$F0,$DE,$F0,$DE
	DB $C5,$91,$11,$E2,$91,$00,$00,$01,$00,$00,$3C,$00,$22,$00,$5A,$00,$6C,$00,$13,$82,$0C,$DF,$0C,$DF,$0C,$DF,$0C,$DF
	DB $32,$92,$11,$6E,$92,$00,$00,$01,$00,$00,$82,$00,$64,$00,$96,$00,$B4,$00,$13,$82,$28,$DF,$28,$DF,$28,$DF,$28,$DF
	DB $D1,$93,$11,$F8,$94,$00,$00,$02,$00,$00,$10,$01,$64,$00,$D8,$00,$54,$01,$13,$82,$44,$DF,$44,$DF,$44,$DF,$44,$DF
	DB $DD,$96,$11,$07,$98,$00,$00,$00,$00,$00,$24,$00,$17,$00,$23,$00,$2E,$00,$13,$82,$60,$DF,$60,$DF,$60,$DF,$60,$DF
	DB $DC,$98,$11,$37,$9A,$00,$00,$00,$00,$00,$FA,$00,$19,$00,$19,$00,$FA,$00,$13,$82,$7C,$DF,$7C,$DF,$7C,$DF,$7C,$DF
	DB $DC,$98,$11,$E4,$99,$00,$00,$00,$00,$00,$FA,$00,$19,$00,$19,$00,$FA,$00,$13,$82,$98,$DF,$98,$DF,$98,$DF,$98,$DF
	DB $DC,$98,$11,$37,$9A,$00,$00,$00,$40,$7E,$FA,$00,$FA,$00,$FA,$00,$FA,$00,$13,$82,$B4,$DF,$B4,$DF,$B4,$DF,$B4,$DF
	DB $DC,$98,$11,$E4,$99,$00,$00,$00,$40,$7E,$FA,$00,$FA,$00,$FA,$00,$FA,$00,$13,$82,$D0,$DF,$D0,$DF,$D0,$DF,$D0,$DF
	DB $F7,$98,$11,$37,$9A,$00,$00,$00,$A8,$7F,$FA,$00,$FA,$00,$FA,$00,$FA,$00,$13,$82,$EC,$DF,$EC,$DF,$EC,$DF,$EC,$DF
	DB $F7,$98,$11,$E4,$99,$00,$00,$00,$A8,$7F,$FA,$00,$FA,$00,$FA,$00,$FA,$00,$13,$82,$08,$E0,$08,$E0,$08,$E0,$08,$E0
	DB $2A,$99,$11,$37,$9A,$00,$00,$00,$00,$00,$19,$00,$FA,$00,$19,$00,$FA,$00,$13,$82,$24,$E0,$24,$E0,$24,$E0,$24,$E0
	DB $2A,$99,$11,$E4,$99,$00,$00,$00,$00,$00,$19,$00,$FA,$00,$19,$00,$FA,$00,$13,$82,$40,$E0,$40,$E0,$40,$E0,$40,$E0
	DB $45,$99,$11,$37,$9A,$00,$00,$00,$00,$00,$19,$00,$19,$00,$FA,$00,$FA,$00,$13,$82,$5C,$E0,$5C,$E0,$5C,$E0,$5C,$E0
	DB $45,$99,$11,$E4,$99,$00,$00,$00,$00,$00,$19,$00,$19,$00,$FA,$00,$FA,$00,$13,$82,$78,$E0,$78,$E0,$78,$E0,$78,$E0
	DB $60,$99,$11,$37,$9A,$00,$00,$00,$00,$00,$7D,$00,$19,$00,$19,$00,$7D,$00,$13,$82,$94,$E0,$94,$E0,$94,$E0,$94,$E0
	DB $60,$99,$11,$E4,$99,$00,$00,$00,$00,$00,$7D,$00,$19,$00,$19,$00,$7D,$00,$13,$82,$B0,$E0,$B0,$E0,$B0,$E0,$B0,$E0
	DB $60,$99,$11,$37,$9A,$00,$00,$00,$F4,$7E,$7D,$00,$7D,$00,$7D,$00,$7D,$00,$13,$82,$CC,$E0,$CC,$E0,$CC,$E0,$CC,$E0
	DB $60,$99,$11,$E4,$99,$00,$00,$00,$F4,$7E,$7D,$00,$7D,$00,$7D,$00,$7D,$00,$13,$82,$E8,$E0,$E8,$E0,$E8,$E0,$E8,$E0
	DB $7B,$99,$11,$37,$9A,$00,$00,$00,$5C,$80,$7D,$00,$7D,$00,$7D,$00,$7D,$00,$13,$82,$04,$E1,$04,$E1,$04,$E1,$04,$E1
	DB $7B,$99,$11,$E4,$99,$00,$00,$00,$5C,$80,$7D,$00,$7D,$00,$7D,$00,$7D,$00,$13,$82,$20,$E1,$20,$E1,$20,$E1,$20,$E1
	DB $AE,$99,$11,$37,$9A,$00,$00,$00,$00,$00,$19,$00,$7D,$00,$19,$00,$7D,$00,$13,$82,$3C,$E1,$3C,$E1,$3C,$E1,$3C,$E1
	DB $AE,$99,$11,$E4,$99,$00,$00,$00,$00,$00,$19,$00,$7D,$00,$19,$00,$7D,$00,$13,$82,$58,$E1,$58,$E1,$58,$E1,$58,$E1
	DB $C9,$99,$11,$37,$9A,$00,$00,$00,$00,$00,$19,$00,$19,$00,$7D,$00,$7D,$00,$13,$82,$74,$E1,$74,$E1,$74,$E1,$74,$E1
	DB $C9,$99,$11,$E4,$99,$00,$00,$00,$00,$00,$19,$00,$19,$00,$7D,$00,$7D,$00,$13,$82,$90,$E1,$90,$E1,$90,$E1,$90,$E1
	DB $9F,$9A,$11,$4C,$9B,$00,$00,$03,$00,$00,$90,$01,$E8,$01,$18,$01,$38,$02,$13,$82,$AC,$E1,$AC,$E1,$AC,$E1,$AC,$E1
	DB $87,$9D,$11,$DE,$9D,$00,$00,$03,$00,$00,$B8,$01,$88,$00,$18,$01,$10,$02,$13,$82,$C8,$E1,$C8,$E1,$C8,$E1,$C8,$E1
	DB $6F,$9E,$11,$BD,$9E,$00,$00,$02,$00,$00,$14,$00,$64,$00,$28,$00,$F8,$00,$13,$82,$E4,$E1,$E4,$E1,$E4,$E1,$E4,$E1
	DB $91,$9F,$11,$DF,$9F,$00,$00,$04,$00,$00,$50,$00,$90,$01,$A0,$00,$E0,$03,$13,$82,$00,$E2,$00,$E2,$00,$E2,$00,$E2
	DB $CB,$A0,$11,$19,$A1,$00,$00,$04,$00,$00,$A0,$02,$A0,$02,$20,$03,$E0,$03,$13,$82,$1C,$E2,$1C,$E2,$1C,$E2,$1C,$E2
	DB $00,$A2,$11,$23,$A2,$00,$00,$01,$00,$00,$30,$00,$3A,$00,$32,$00,$40,$00,$C1,$83,$38,$E2,$38,$E2,$38,$E2,$38,$E2
	DB $00,$A2,$11,$23,$A2,$00,$00,$01,$00,$00,$30,$00,$3A,$00,$32,$00,$40,$00,$C1,$83,$54,$E2,$54,$E2,$54,$E2,$54,$E2
	DB $00,$A2,$11,$23,$A2,$00,$00,$01,$00,$00,$30,$00,$3A,$00,$32,$00,$40,$00,$13,$82,$70,$E2,$70,$E2,$70,$E2,$70,$E2
	DB $00,$A2,$11,$23,$A2,$00,$00,$01,$00,$00,$30,$00,$3A,$00,$32,$00,$40,$00,$21,$84,$8C,$E2,$8C,$E2,$8C,$E2,$8C,$E2
	DB $F4,$A2,$11,$F2,$A4,$00,$00,$01,$00,$00,$5C,$00,$3C,$00,$28,$00,$6E,$00,$13,$82,$A8,$E2,$A8,$E2,$A8,$E2,$A8,$E2
	DB $53,$A6,$11,$47,$A9,$00,$00,$00,$00,$00,$1E,$00,$57,$00,$2F,$00,$58,$00,$13,$82,$C4,$E2,$C4,$E2,$C4,$E2,$C4,$E2
	DB $95,$AA,$11,$AA,$AA,$EC,$FF,$01,$00,$00,$3C,$00,$64,$00,$64,$00,$70,$00,$13,$82,$E0,$E2,$E0,$E2,$E0,$E2,$E0,$E2
	DB $95,$AA,$11,$AA,$AA,$D8,$FF,$02,$00,$00,$78,$00,$C8,$00,$C8,$00,$E0,$00,$13,$82,$FC,$E2,$FC,$E2,$FC,$E2,$FC,$E2
	DB $FD,$AA,$11,$11,$AB,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$00,$00,$A0,$00,$13,$82,$18,$E3,$18,$E3,$18,$E3,$18,$E3
	DB $27,$AB,$11,$53,$AB,$00,$00,$01,$00,$00,$56,$00,$64,$00,$6E,$00,$78,$00,$13,$82,$34,$E3,$34,$E3,$34,$E3,$34,$E3
	DB $0C,$AD,$11,$27,$AD,$00,$00,$00,$00,$00,$0F,$00,$28,$00,$0F,$00,$50,$00,$13,$82,$50,$E3,$50,$E3,$50,$E3,$50,$E3
	DB $0E,$AE,$11,$31,$AE,$00,$00,$00,$00,$00,$46,$00,$35,$00,$31,$00,$56,$00,$13,$82,$6C,$E3,$6C,$E3,$6C,$E3,$6C,$E3
	DB $96,$AF,$11,$BF,$AF,$00,$00,$01,$00,$00,$48,$00,$4A,$00,$3C,$00,$74,$00,$13,$82,$88,$E3,$88,$E3,$88,$E3,$88,$E3
	DB $4D,$B1,$11,$EC,$B2,$00,$00,$00,$00,$00,$32,$00,$19,$00,$78,$00,$78,$00,$13,$82,$A4,$E3,$A4,$E3,$A4,$E3,$A4,$E3
	DB $4D,$B1,$11,$EC,$B2,$00,$00,$00,$00,$00,$32,$00,$19,$00,$78,$00,$78,$00,$ED,$82,$C0,$E3,$C0,$E3,$C0,$E3,$C0,$E3
	DB $A9,$B4,$11,$DE,$B6,$00,$00,$00,$00,$00,$6E,$00,$17,$00,$66,$00,$6F,$00,$13,$82,$DC,$E3,$DC,$E3,$DC,$E3,$DC,$E3
	DB $A9,$B4,$11,$DE,$B6,$00,$00,$00,$00,$00,$6E,$00,$17,$00,$66,$00,$6F,$00,$ED,$82,$F8,$E3,$F8,$E3,$F8,$E3,$F8,$E3
	DB $A3,$B9,$11,$C1,$B9,$00,$00,$02,$00,$00,$BC,$00,$CC,$00,$3C,$00,$1C,$01,$13,$82,$14,$E4,$14,$E4,$14,$E4,$14,$E4
	DB $11,$BA,$11,$2B,$BA,$00,$00,$00,$00,$00,$1E,$00,$4B,$00,$1E,$00,$4E,$00,$13,$82,$30,$E4,$30,$E4,$30,$E4,$30,$E4
	DB $C6,$BA,$11,$E1,$BA,$00,$00,$00,$00,$00,$19,$00,$28,$00,$14,$00,$28,$00,$13,$82,$4C,$E4,$4C,$E4,$4C,$E4,$4C,$E4
	DB $76,$BB,$11,$AE,$BB,$00,$00,$01,$00,$00,$3C,$00,$18,$00,$64,$00,$74,$00,$13,$82,$68,$E4,$68,$E4,$68,$E4,$68,$E4
	DB $83,$BD,$11,$B9,$BD,$00,$00,$01,$00,$00,$3C,$00,$32,$00,$64,$00,$72,$00,$13,$82,$84,$E4,$84,$E4,$84,$E4,$84,$E4
	DB $53,$BF,$11,$79,$BF,$00,$00,$01,$00,$00,$3C,$00,$50,$00,$3C,$00,$50,$00,$13,$82,$A0,$E4,$A0,$E4,$A0,$E4,$A0,$E4
	DB $5A,$C0,$11,$74,$C0,$00,$00,$02,$00,$00,$28,$00,$78,$00,$DC,$00,$EC,$00,$13,$82,$BC,$E4,$BC,$E4,$BC,$E4,$BC,$E4
	DB $E4,$C0,$11,$13,$C1,$00,$00,$01,$00,$00,$34,$00,$3C,$00,$0E,$00,$3C,$00,$13,$82,$D8,$E4,$D8,$E4,$D8,$E4,$D8,$E4
	DB $F0,$C1,$11,$7A,$C2,$00,$00,$00,$00,$00,$0A,$00,$0F,$00,$29,$00,$2D,$00,$13,$82,$F4,$E4,$F4,$E4,$F4,$E4,$F4,$E4
	DB $C7,$C2,$11,$A4,$C3,$00,$00,$02,$00,$00,$98,$00,$64,$00,$A4,$00,$C0,$00,$13,$82,$10,$E5,$10,$E5,$10,$E5,$10,$E5
	DB $88,$C5,$11,$E0,$C8,$00,$00,$00,$00,$00,$2E,$00,$3D,$00,$64,$00,$64,$00,$13,$82,$2C,$E5,$2C,$E5,$2C,$E5,$2C,$E5
	DB $D6,$CA,$11,$DF,$CA,$00,$00,$01,$00,$00,$14,$00,$00,$00,$64,$00,$66,$00,$13,$82,$48,$E5,$48,$E5,$48,$E5,$48,$E5
	DB $F1,$CA,$11,$FF,$CA,$00,$00,$00,$00,$00,$0A,$00,$00,$00,$14,$00,$14,$00,$13,$82,$64,$E5,$64,$E5,$64,$E5,$64,$E5
	DB $28,$CB,$11,$40,$CB,$00,$00,$00,$00,$00,$36,$00,$00,$00,$59,$00,$64,$00,$13,$82,$80,$E5,$80,$E5,$80,$E5,$80,$E5
	DB $5E,$CB,$11,$E4,$CC,$00,$00,$03,$00,$00,$80,$00,$78,$00,$60,$02,$80,$02,$13,$82,$9C,$E5,$9C,$E5,$9C,$E5,$9C,$E5
	DB $1B,$CE,$11,$2A,$CE,$00,$00,$03,$00,$00,$10,$04,$E0,$01,$D0,$07,$00,$09,$13,$82,$B8,$E5,$B8,$E5,$B8,$E5,$B8,$E5
	DB $63,$CE,$11,$E9,$CF,$00,$00,$03,$00,$00,$80,$00,$78,$00,$60,$02,$80,$02,$13,$82,$D4,$E5,$D4,$E5,$D4,$E5,$D4,$E5
	DB $20,$D1,$11,$5E,$D1,$00,$00,$02,$00,$00,$8C,$00,$44,$00,$84,$00,$BC,$00,$13,$82,$F0,$E5,$F0,$E5,$F0,$E5,$F0,$E5
	DB $D7,$D3,$11,$15,$D4,$00,$00,$02,$00,$00,$8C,$00,$44,$00,$84,$00,$BC,$00,$13,$82,$0C,$E6,$0C,$E6,$0C,$E6,$0C,$E6
	DB $22,$D5,$11,$79,$D5,$40,$01,$05,$00,$00,$A0,$04,$60,$01,$60,$07,$60,$08,$ED,$82,$28,$E6,$28,$E6,$28,$E6,$28,$E6
	DB $5B,$D6,$11,$BE,$D6,$00,$00,$04,$00,$00,$90,$01,$80,$02,$80,$07,$80,$07,$ED,$82,$44,$E6,$44,$E6,$44,$E6,$44,$E6
	DB $95,$D9,$11,$DC,$DB,$00,$00,$01,$00,$00,$AA,$00,$86,$00,$80,$00,$AC,$00,$13,$82,$60,$E6,$60,$E6,$60,$E6,$60,$E6
	DB $63,$DD,$11,$84,$DF,$00,$00,$03,$00,$00,$A0,$00,$A0,$00,$90,$01,$08,$03,$13,$82,$7C,$E6,$7C,$E6,$7C,$E6,$7C,$E6
	DB $19,$E1,$11,$3C,$E1,$00,$00,$02,$CA,$84,$DC,$00,$DC,$00,$DC,$00,$DC,$00,$13,$82,$98,$E6,$98,$E6,$98,$E6,$98,$E6
	DB $FE,$E1,$11,$22,$EA,$00,$00,$04,$46,$81,$E0,$01,$C0,$03,$90,$01,$60,$04,$94,$85,$B4,$E6,$B4,$E6,$B4,$E6,$B4,$E6
	DB $42,$EC,$0C,$7D,$EC,$00,$00,$02,$00,$00,$48,$01,$A0,$00,$24,$01,$58,$01,$13,$82,$D0,$E6,$D0,$E6,$D0,$E6,$D0,$E6	;U.F.O.
	DB $D2,$ED,$0C,$06,$EE,$00,$00,$01,$00,$00,$3C,$00,$78,$00,$64,$00,$9C,$00,$13,$82,$EC,$E6,$EC,$E6,$EC,$E6,$EC,$E6	;Small Yellow Tank
	DB $D2,$ED,$0C,$06,$EE,$00,$00,$01,$00,$00,$3C,$00,$78,$00,$64,$00,$9C,$00,$ED,$82,$08,$E7,$08,$E7,$08,$E7,$08,$E7	;Small Blue Tank
	DB $0C,$F0,$11,$1B,$F0,$00,$00,$00,$00,$00,$04,$00,$04,$00,$04,$00,$04,$00,$2C,$85,$24,$E7,$24,$E7,$24,$E7,$24,$E7
	DB $DC,$EE,$0C,$C5,$EF,$00,$00,$03,$00,$00,$E0,$01,$80,$02,$C0,$03,$A8,$04,$13,$82,$40,$E7,$40,$E7,$40,$E7,$40,$E7
	DB $75,$F0,$0C,$5E,$F1,$00,$00,$03,$00,$00,$E0,$01,$80,$02,$C0,$03,$A8,$04,$13,$82,$5C,$E7,$5C,$E7,$5C,$E7,$5C,$E7	;Tunnel With Door Left
	DB $0E,$F2,$0C,$26,$F3,$00,$00,$02,$00,$00,$48,$00,$EC,$00,$50,$00,$F0,$00,$13,$82,$78,$E7,$78,$E7,$78,$E7,$78,$E7	;Tunnel With Door Right
	DB $D6,$F3,$0C,$B0,$F4,$00,$00,$03,$5A,$7C,$F0,$00,$40,$01,$90,$01,$28,$01,$13,$82,$94,$E7,$94,$E7,$94,$E7,$94,$E7	;Bonus Doors
	DB $D7,$F5,$0C,$22,$F6,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$13,$82,$B0,$E7,$B0,$E7,$B0,$E7,$B0,$E7	;Letter E
	DB $D7,$F5,$0C,$22,$F6,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$ED,$82,$CC,$E7,$CC,$E7,$CC,$E7,$CC,$E7	;Letter E
	DB $D7,$F5,$0C,$22,$F6,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$C1,$83,$E8,$E7,$E8,$E7,$E8,$E7,$E8,$E7	;Letter E
	DB $2B,$F7,$0C,$46,$F7,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$13,$82,$04,$E8,$04,$E8,$04,$E8,$04,$E8	;Letter T
	DB $2B,$F7,$0C,$46,$F7,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$ED,$82,$20,$E8,$20,$E8,$20,$E8,$20,$E8	;Letter T
	DB $E7,$F7,$0C,$28,$F8,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$13,$82,$3C,$E8,$3C,$E8,$3C,$E8,$3C,$E8	;Letter N
	DB $E7,$F7,$0C,$28,$F8,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$ED,$82,$58,$E8,$58,$E8,$58,$E8,$58,$E8	;Letter N
	DB $FD,$F8,$0C,$44,$F9,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$13,$82,$74,$E8,$74,$E8,$74,$E8,$74,$E8	;Letter H
	DB $FD,$F8,$0C,$44,$F9,$00,$00,$00,$00,$00,$08,$00,$1E,$00,$3C,$00,$22,$00,$C1,$83,$90,$E8,$90,$E8,$90,$E8,$90,$E8	;Letter H
UnusedBank00SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/
CODE_00E8B0:
	sta.b $02
	ldy.w $1238
	rep #$20
	lda.w $0010,y
	sec
	sbc.b $10,x
	bpl CODE_00E8C3
	eor.w #$FFFF
	inc a
CODE_00E8C3:
	cmp.b $02
	sep #$20
	bpl CODE_00E8CD
	jml CODE_00E8D1
	sep #$20
	clc
	rts
CODE_00E8D1:
	sep #$21
	rts
CODE_00E8D4:
	rep #$20
	lda.w #CODE_00E943
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(CODE_00E943)
	sta.b $18,x
	lda.b #$06
	sta.w Object2ListRel+$0B,x
	lda.b #$00
	sta.w Object2ListRel+$08,x
	rep #$20
	lda.w #$89A3
	sta.w Object2ListRel+$09,x
	lda.w #$EE08
	sta.w Object2ListRel+$06,x
	sep #$20
	lda.b #$40
	sta.b $2A,x
	lda.b #$04
	sta.b $2B,x
	lda.b $1D,x
	ora.b #$08
	sta.b $1D,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b #$01
	sta.w Object2ListRel+$15,x
	lda.b #$01
	sta.b $24,x
	lda.b $1F,x
	ora.b #$20
	sta.b $1F,x
	lda.b #$23
	sta.w Unknown_7EF0C9
	lda.w Unknown_7EF0C9
	sta.l $70019A
	lda.b #$00
	sta.l $70019C
	lda.l $70019A
	clc
	adc.b #$40
	sta.l $70019A
	jsr CODE_00EEB5
	lda.b #$00
	sta.w Object2ListRel+$12,x
CODE_00E943:
	rep #$20
	lda.w #$E954
	sta.b $53
	sep #$20
	lda.b #$00
	sta.b $55
	jml CODE_09BADE
DATA_00E954:
	JUMPTABLE(CODE_00E9B9)
	JUMPTABLE(CODE_00ED67)
	JUMPTABLE(CODE_00ECB8)
	JUMPTABLE(CODE_00EC7D)
	JUMPTABLE(CODE_00EB99)
	JUMPTABLE(CODE_00EB8F)
	JUMPTABLE(CODE_00EB78)
	JUMPTABLE(CODE_00EB38)
	JUMPTABLE(CODE_00EB1B)
	JUMPTABLE(CODE_00F065)
	JUMPTABLE(CODE_00ECB8)
	JUMPTABLE(CODE_00EABE)
	JUMPTABLE(CODE_00EC7D)
	JUMPTABLE(CODE_00EB99)
	JUMPTABLE(CODE_00EAA1)
	JUMPTABLE(CODE_00EA19)
	JUMPTABLE(CODE_00EA4E)
	JUMPTABLE(CODE_00EA97)
	JUMPTABLE(CODE_00EA33)
	JUMPTABLE(CODE_00E9FF)
	JUMPTABLE(CODE_00ED51)
	JUMPTABLE(CODE_00ED47)
CODE_00E9AC:
	lda.b #$00
	sta.b $23,x
CODE_00E9B0:
	lda.b #$01
	jsl CODE_09BACE
	jmp CODE_00E943
CODE_00E9B9:
	stz.w $1757
	rep #$20
	lda.w #$09C4
	jsr CODE_00E8B0
	bcc CODE_00E9D5
	rep #$20
	lda.b $10,x
	clc
	adc.w #$0014
	sta.b $10,x
	sep #$10
	inc.w $1757
CODE_00E9D5:
	rep #$20
	lda.b $0C,x
	cmp.w #$0000
	sep #$20
	bpl CODE_00E9E4
	jml CODE_00E9F3
CODE_00E9E4:
	rep #$20
	lda.b $0C,x
	clc
	adc.w #$FFE7
	sta.b $0C,x
	sep #$20
	inc.w $1757
CODE_00E9F3:
	lda.w $1757
	bne CODE_00E9FC
	jml CODE_00E9B0
CODE_00E9FC:
	jmp CODE_00F0CB
CODE_00E9FF:
	lda.w Object2ListRel+$32,x
	cmp.b #$1E
	bne CODE_00EA13
	lda.b #$00
	sta.w Object2ListRel+$32,x
	lda.b #$0D
	sta.w Object2ListRel+$12,x
	jmp CODE_00E943
CODE_00EA13:
	inc.w Object2ListRel+$32,x
	jmp CODE_00F0A3
CODE_00EA19:
	rep #$20
	lda.b $0E,x
	sta.b $3A
	lda.w #$FE70
	jsl CODE_1FD6F0
	sta.b $0E,x
	sep #$20
	bcc CODE_00EA30
	jml CODE_00E9B0
	jmp CODE_00F0CB
CODE_00EA33:
	jsr CODE_00EE33
	lda.b #$07
	jsl CODE_1FDC40
	cpy.w #$0000
	beq CODE_00EA45
	jml CODE_00F0CB
CODE_00EA45:
	lda.b $1E,x
	and.b #$7F
	sta.b $1E,x
	jmp CODE_00E9B0
CODE_00EA4E:
	rep #$20
	lda.w #$BCEC
	sta.w $14C5
	sep #$20
	jsl CODE_1FD54B
	bcs CODE_00EA62
	jml CODE_00EA81
CODE_00EA62:
	lda.b #$07
	jsl CODE_1FD56F
	phx
	tyx
	ply
	rep #$20
	lda.w #$F69E
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	phx
	tyx
	ply
CODE_00EA81:
	lda.b #$98
	jsl CODE_03B7F9
	lda.b #$07
	jsl CODE_1FDC40
	phx
	tyx
	jsl CODE_09BBAE
	plx
	jmp CODE_00E9B0
CODE_00EA97:
	jsr CODE_00EE33
	rep #$20
	lda.w #$05DC
	bra CODE_00EAA6
CODE_00EAA1:
	rep #$20
	lda.w #$09C4
CODE_00EAA6:
	jsr CODE_00E8B0
	bcc CODE_00EAAF
	jml CODE_00E9B0
CODE_00EAAF:
	rep #$20
	lda.b $10,x
	clc
	adc.w #$FFCE
	sta.b $10,x
	sep #$20
	jmp CODE_00F0A3
CODE_00EABE:
	lda.b #$01
	jsl CODE_1FDC40
	rep #$20
	lda.w #$82ED
	sta.w $1CEA,y
CODE_00EACC:
	sep #$20
	lda.b #$03
	jsl CODE_1FDC40
	rep #$20
	lda.w #$82ED
	sta.w $1CEA,y
	sep #$20
	lda.b #$05
	jsl CODE_1FDC40
	rep #$20
	lda.w #$82ED
	sta.w $1CEA,y
	sep #$20
	lda.b #$02
	jsl CODE_1FDC40
	rep #$20
	lda.w #$82ED
	sta.w $1CEA,y
	sep #$20
	lda.b #$04
	jsl CODE_1FDC40
	rep #$20
	lda.w #$82ED
	sta.w $1CEA,y
	sep #$20
	jmp CODE_00E9B0
	lda.b #$09
	sta.b $02
	jsr CODE_00EE57
	jmp CODE_00E9B0
CODE_00EB1B:
	rep #$20
	lda.w #$07D0
	jsr CODE_00E8B0
	bcs CODE_00EB29
	jml CODE_00E8B0
CODE_00EB29:
	rep #$20
	lda.b $10,x
	clc
	adc.b #$50
	sta.b $10,x
	sep #$20
	jmp CODE_00F065
CODE_00EB38:
	rep #$20
	lda.w #$05DC
	jsr CODE_00E8B0
	bcc CODE_00EB46
	jml CODE_00E9B0
CODE_00EB46:
	lda.b $24,x
	sta.b $3A
	lda.b #$02
	jsl CODE_1FD8BD
	sta.b $24,x
	rep #$20
	lda.b $10,x
	sec
	sbc.b #$32
	sta.b $10,x
	sep #$20
	jmp CODE_00F065
	lda.b #$0A
	jsr CODE_00EE34
	cmp.b #$05
	beq CODE_00EB6E
	jml CODE_00F065
CODE_00EB6E:
	lda.b #$0B
	sta.b $02
	jsr CODE_00EE57
	jmp CODE_00E9B0
CODE_00EB78:
	lda.b #$0D
	jsr CODE_00EE34
	cmp.b #$05
	beq CODE_00EB85
	jml CODE_00F065
CODE_00EB85:
	lda.b #$0E
	sta.b $02
	jsr CODE_00EE57
	jmp CODE_00E9B0
CODE_00EB8F:
	lda.b #$0C
	sta.b $02
	jsr CODE_00EE57
	jmp CODE_00E9B0
CODE_00EB99:
	lda.b $1E,x
	and.b #$20
	beq CODE_00EBA3
	jml CODE_00EC23
CODE_00EBA3:
	rep #$20
	lda.b $10,x
	clc
	adc.w #$FFD8
	sta.b $10,x
	sep #$20
	lda.b $1E,x
	and.b #$40
CODE_00EBB3:
	beq CODE_00EBB9
	jml CODE_00EBE9
CODE_00EBB9:
	rep #$20
	lda.w #$07D0
	jsr CODE_00E8B0
	bcc CODE_00EBF9
	lda.b $1E,x
	ora.b #$40
	sta.b $1E,x
	jsl CODE_02FC58
	cmp.b #$7F
	bcs CODE_00EBD5
	jml CODE_00EBE0
CODE_00EBD5:
	rep #$20
	lda.w #$FED4
	sta.b $28,x
	sep #$20
	bra CODE_00EBE9
CODE_00EBE0:
	rep #$20
	lda.w #$FFBA
	sta.b $28,x
	sep #$20
CODE_00EBE9:
	rep #$20
	lda.b $0E,x
	sta.b $3A
	lda.b $28,x
	jsl CODE_1FD6AB
	sta.b $0E,x
	sep #$20
CODE_00EBF9:
	rep #$20
	lda.w #$01F4
	jsr CODE_00E8B0
	bcc CODE_00EC52
CODE_00EC03:
	lda.b $23,x
	cmp.b #$01
	bne CODE_00EC13
	lda.b $1E,x
	and.b #$DF
	sta.b $1E,x
	jml CODE_00E9AC
CODE_00EC13:
	inc.b $23,x
	lda.b $1E,x
	eor.b #$20
	sta.b $1E,x
	lda.b $1E,x
	and.b #$BF
	sta.b $1E,x
	bra CODE_00EC52
CODE_00EC23:
	rep #$20
	lda.b $0E,x
	cmp.w #$FE70
	beq CODE_00EC38
	bmi CODE_00EC34
	sec
	sbc.w #$0005
	bra CODE_00EC38
CODE_00EC34:
	clc
	adc.w #$0005
CODE_00EC38:
	sta.b $0E,x
	sep #$20
	rep #$20
	lda.b $10,x
	clc
	adc.w #$0028
	sta.b $10,x
	sep #$20
	rep #$20
	lda.w #$09C4
	jsr CODE_00E8B0
	bcc CODE_00EC03
CODE_00EC52:
	phx
	rep #$20
	lda.b $25,x
	and.w #$00FF
	tax
	lda.w SineTable8,x
	bit.w #$0080
	beq CODE_00EC69
	ora.w #$FF00
	bra CODE_00EC6C
CODE_00EC69:
	and.w #$00FF
CODE_00EC6C:
	plx
	asl
	asl
	sta.b $0C,x
	sep #$20
	lda.b $25,x
	clc
	adc.b #$04
	sta.b $25,x
	jmp CODE_00F0CB
CODE_00EC7D:
	lda.w $15BB
	and.b #$03
	beq CODE_00EC88
	jml CODE_00EC9A
CODE_00EC88:
	lda.b $24,x
	cmp.b #$14
	beq CODE_00EC98
	bmi CODE_00EC95
	sec
	sbc.b #$01
	bra CODE_00EC98
CODE_00EC95:
	clc
	adc.b #$01
CODE_00EC98:
	sta.b $24,x
CODE_00EC9A:
	rep #$20
	lda.b $0E,x
	clc
	adc.w #$FFFC
	sta.b $0E,x
	sep #$20
	rep #$20
	lda.b $0E,x
	cmp.w #$FE70
	sep #$20
	bpl CODE_00ECB5
	jml CODE_00E9B0
CODE_00ECB5:
	jmp CODE_00F0CB
CODE_00ECB8:
	lda.b #$07
	sta.b $02
	jsr CODE_00EE57
	jsl ApplyObjectVelocity
	rep #$20
	lda.b $31,x
	clc
	adc.w #$0008
	sta.b $31,x
	sep #$20
	rep #$20
	lda.b $0E,x
	cmp.w #$FFB0
	sep #$20
	bpl CODE_00ECDE
	jml CODE_00ED29
CODE_00ECDE:
	rep #$20
	lda.w #$FFB0
	sta.b $0E,x
	sep #$20
	rep #$20
	lda.b $31,x
	eor.w #$FFFF
	inc
	cmp.w #$8000
	ror
	bpl CODE_00ECF8
	adc.w #$0000
CODE_00ECF8:
	cmp.w #$8000
	ror
	bpl CODE_00ED01
	adc.w #$0000
CODE_00ED01:
	cmp.w #$8000
	ror
	bpl CODE_00ED0A
	adc.w #$0000
CODE_00ED0A:
	cmp.w #$8000
	ror
	bpl CODE_00ED13
	adc.w #$0000
CODE_00ED13:
	cmp.w #$FFFB
	bcc CODE_00ED1B
	lda.w #$000
CODE_00ED1B:
	sta.b $31,x
	sep #$20
	cmp.b #$00
	sep #$20
	bne CODE_00ED29
	jmp CODE_00ED2C
CODE_00ED29:
	jmp CODE_00F0CB
CODE_00ED2C:
	lda.b #$8E
	jsl CODE_03B7F9
	lda.w $F0C9
	sec
	sbc.b #$05
	sta.w $F0C9
	jsr CODE_00ED6A
	jsr CODE_00ED6A
	jsr CODE_00ED6A
	jmp CODE_00E9B0
CODE_00ED47:
	lda.b #$04
	sta.b $02
	jsr CODE_00EE57
	jmp CODE_00F0CB
CODE_00ED51:
	inc.b $23,x
	lda.b $23,x
	cmp.b #$0F
	bne CODE_00ED5D
	jml CODE_00E9B0
CODE_00ED5D:
	lda.b #$03
	sta.b $02
	jsr CODE_00EE57
	jmp CODE_00F0CB
CODE_00ED67:
	jmp CODE_00F065
CODE_00ED6A:
	rep #$20
	lda.w #$ADF1
	sta.w $14C5
	sep #$20
	jsl CODE_1FD54B
	bcs CODE_00ED7E
	jml CODE_00EDDD
CODE_00ED7E:
	rep #$20
	lda.w #CODE_00EDE0
	sta.w $0016,y
	sep #$20
	lda.b #BANKOF(CODE_00EDE0)
	sta.w $0018,y
	lda.b #$00
	ora.b #$80
	sta.w $1CE6,y
	lda.w $001E,y
	ora.b #$01
	sta.w $001E,y
	jsl CopyPositionIndXToIndY
	lda.w $001D,y
	ora.b #$20
	sta.w $001D,y
	lda.b #$00
	sta.w $1CF4,y
	jsl CODE_02FC58
	and.b #$1F
	sec
	sbc.b #$0F
	clc
	adc.w $1CF4,y
	sta.w $1CF4,y
	jsl CODE_02FC58
	rep #$20
	bit.w #$0080
	beq CODE_00EDD2
	ora.w #$FF00
	bra CODE_00EDD5
CODE_00EDD2:
	and.w #$00FF
CODE_00EDD5:
	asl
	clc
	adc.w $000C,y
	sta.w $000C,y
	sep #$20
	rts
CODE_00EDE0:
	lda.w $1CE6,x
	and.b #$7F
	cmp.b #$07
	beq CODE_00EE03
	lda.w $1CE6,x
	clc
	adc.b #$01
	bmi CODE_00EDF4
	clc
	adc.b #$08
CODE_00EDF4:
	and.b #$7F
	cmp.b #$08
	bcc CODE_00EDFD
	sec
	sbc.b #$08
CODE_00EDFD:
	ora.b #$80
	sta.w $1CE6,x
	rtl
CODE_00EE03:
	jsl CODE_1FD501
	rtl
CODE_00EE08:
	lda.b #$06
	jsl CODE_1FDC40
	cpy.w #$0000
	beq CODE_00EE20
	lda.w $001E,y
	ora.b #$01
	sta.w $001E,y
	lda.b #$00
	sta.w $002A,y
CODE_00EE20:
	lda.b #$07
	jsl CODE_1FDC40
	cpy.w #$0000
	beq CODE_00EE2F
	jslCODE_1FD540
CODE_00EE2F:
	jml CODE_06EAAE
CODE_00EE33:
	rts
CODE_00EE34:
	sta.b $02
	stz.b $08
	lda.b #$01
	sta.b $90
CODE_00EE3C:
	lda.b $90
	jsl CODE_1FDC40
	lda.w $1CDC,y
	cmp.b $02
	bne CODE_00EE4B
	inc.b $08
CODE_00EE4B:
	lda.b $90
	inc
	sta.b $90
	cmp #$06
	bne CODE_00EE3C
	lda.b $08
	rts
CODE_00EE57:
	lda.b #$01
	jsl CODE_1FDC40
	phx
	tyx
	ply
	lda.b $02
	sta.w $1CDC,x
	phx
	tyx
	ply
	lda.b #$03
	jsl CODE_1FDC40
	phx
	tyx
	ply
	lda.b $02
	sta.w $1CDC,x
	phx
	tyx
	ply
	lda.b #$05
	jsl CODE_1FDC40
	phx
	tyx
	ply
	lda.b $02
	sta.w $1CDC,x
	phx
	tyx
	ply
	lda.b #$02
	jsl CODE_1FDC40
	phx
	tyx
	ply
	lda.b $02
	sta.w $1CDC,x
	phx
	tyx
	ply
	lda.b #$04
	jsl CODE_1FDC40
	phx
	tyx
	ply
	lda.b $02
	sta.w $1CDC,x
	phx
	tyx
	ply
	rts
DATA_00EEAD:
	DW $FFF1,$FFFB,$0005,$000F
CODE_00EEB5:
	lda.b #$00
	sta.b $22,x
	rep #$20
	lda.w #$0000
	sta.b $06,x
	sep #$20
	rep #$20
	lda.w #$0000
	sta.b $26,x
	sep #$20
	rep #$20
	lda.w #$BC0C
	sta.w $14C5
	sep #$20
	jsl CODE_1FD54B
	bcs CODE_00EEDF
	jml CODE_00EF0D
CODE_00EEDF:
	lda.b #$01
	jsl CODE_1FD56F
	phx
	tyx
	ply
	rep #$20
	lda.w #$F15A
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b #$05
	sta.w $1CED,x
	lda.b #$0F
	sta.w $1CEE,x
	lda.b #$80
	sta.w $1CF0,x
	phx
	tyx
	ply
CODE_00EF0D:
	rep #$20
	lda.w #$BC0C
	sta.w $14C5
	sep #$20
	jsl CODE_1FD54B
	bcs CODE_00EF21
	jml CODE_00EF54
CODE_00EF21:
	lda.b #$03
	jsl CODE_1FD56F
	phx
	tyx
	ply
	rep #$20
	lda.w #$F15A
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b #$0E
	sta.w $1CEC,x
	lda.b #$05
	sta.w $1CED,x
	lda.b #$04
	sta.w $1CEE,x
	lda.b #$4D
	sta.w $1CF0,x
	phx
	tyx
	ply
CODE_00EF54:
	rep #$20
	lda.w #$BC0C
	sta.w $14C5
	sep #$20
	jsl CODE_1FD54B
	bcs CODE_00EF68
	jml CODE_00EF9B
CODE_00EF68:
	lda.b #$05
	jsl CODE_1FD56F
	phx
	tyx
	ply
	rep #$20
	lda.w #$F15A
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b #$09
	sta.w $1CEC,x
	lda.b #$05
	sta.w $1CED,x
	lda.b #$F4
	sta.w $1CEE,x
	lda.b #$1A
	sta.w $1CF0,x
	phx
	tyx
	ply
CODE_00EF9B:
	rep #$20
	lda.w #$BC0C
	sta.w $14C5
	sep #$20
	jsl CODE_1FD54B
	bcs CODE_00EFAF
	jml CODE_00EFE2
CODE_00EFAF:
	lda.b #$02
	jsl CODE_1FD56F
	phx
	tyx
	ply
	rep #$20
	lda.w #$F15A
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b #$F7
	sta.w $1CEC,x
	lda.b #$05
	sta.w $1CED,x
	lda.b #$F4
	sta.w $1CEE,x
	lda.b #$E7
	sta.w $1CF0,x
	phx
	tyx
	ply
CODE_00EFE2:
	rep #$20
	lda.w #$BC0C
	sta.w $14C5
	sep #$20
	jsl CODE_1FD54B
	bcs CODE_00EFF6
	jml CODE_00F029
CODE_00EFF6
	lda.b #$04
	jsl CODE_1FD56F
	phx
	tyx
	ply
	rep #$20
	lda.w #$F15A
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b #$F2
	sta.w $1CEC,x
	lda.b #$05
	sta.w $1CED,x
	lda.b #$04
	sta.w $1CEE,x
	lda.b #$B4
	sta.w $1CF0,x
	phx
	tyx
	ply
CODE_00F029:
	rep #$20
	lda.w #$BC0C
	sta.w $14C5
	sep #$20
	jsl CODE_1FD54B
	bcs CODE_00F03D
	jml CODE_00F05C
CODE_00F03D:
	lda.b #$06
	jsl CODE_1FD56F
	phx
	tyx
	ply
	rep #$20
	lda.w #$F614
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	phx
	tyx
	ply
CODE_00F05C:
	jsr CODE_00F060
	rts
CODE_00F060:
	jsl CODE_09DBCF
	rts
CODE_00F065:
	lda.b #$06
	jsr CODE_00EE34
	cmp.b #$03
	bmi CODE_00F072
	jml CODE_00E9B0
CODE_00F072:
	cmp.b #$02
	beq CODE_00F07A
	jml CODE_00F080
CODE_00F07A:
	lda.b #$06
	sta.b $24,x
	bra CODE_00F08C
CODE_00F080:
	cmp.b #$01
	beq CODE_00F088
	jml CODE_00F08C
CODE_00F088:
	lda.b #$04
	sta.b $24,x
CODE_00F08C:
	txy
	rep #$20
	lda.w $15BB
	and.w #$0003
	asl
	tax
	lda DATA_00EEAD,x
	tyx
	clc
	adc.b $0E,x
	sta.b $0E,x
	sep #$20
CODE_00F0A3:
	phx
	rep #$20
	lda.b $25,x
	and.w #$00FF
	tax
	lda.w SineTable8,x
	bit.w #$0080
	beq CODE_00F0BA
	ora.w #$FF00
	bra CODE_00F0BD
CODE_00F0BA:
	and.w #$00FF
CODE_00F0BD:
	plx
	asl
	asl
	sta.b $0C,x
	sep #$20
	lda.b $25,x
	clc
	adc.b #$02
	sta.b $25,x
CODE_00F0CB:
	lda.b $13,x
	and.b #$80
	pha
	lda.b $13,x
	clc
	adc.w $0024,x
	sta.b $13,x
	lda.b $13,x
	and.b #$80
	sta.b $02
	pla
	eor.b $02
	beq CODE_00F0F3
	lda.b $24,x
	cmp.b #$08
	bpl CODE_00F0ED
	jml CODE_00F0F3
CODE_00F0ED:
	lda.b #$4F
	jsl CODE_03B7F9
CODE_00F0F3:
	jsl CODE_1FDC69
	phy
	lda.b #$01
	dec
CODE_00F0FB:
	inc
	sta.w $14C5
	pha
	lda.w $14C5
	jsl CODE_1FDC40
	pla
	cpy.w #$0000
	bne CODE_00F116
	cmp.b #$05
	bne CODE_00F0FB
	ply
	jml CODE_00F11D
CODE_00F116:
	ply
	lda.b #$40
	sta.b $2A,x
	bra CODE_00F136
CODE_00F11D:
	rep #$20
	lda.w #$82ED
	sta.w $1CEA,x
	sep #$20
	lda.b $1F,x
	and.b #$DF
	sta.b $1F,x
	lda.w $1CF4,x
	clc
	adc.b #$0A
	sta.w $1CF4,x
CODE_00F136:
	lda.w $1CF4,x
	clc
	adc.b #$05
	sta.w $1CF4,x
	jsr CODE_00F060
	lda.l $70019C
	clc
	adc.b $2A,x
	sta.l $70019C
	lda.l $70019C
	clc
	adc.w $F0C9
	sta.l $70019C
	rtl
CODE_00F15A:
	rep #$20
	lda.l #$F1A1
	sta.b $16,x
	sep #$20
	lda.b #$00
	sta.b $18,x
	lda.b #$00
	sta.w $1CD5,x
	lda.b #$00
	sta.w $1CD2,x
	rep #$20
	lda.w #$F53D
	sta.w $1CD3,x
	lda.w #$F547
	sta.w $1CD0,x
	sep #$20
	lda.b #$4A
	sta.b $2A,x
	lda.b #$04
	sta.b $2B,x
	lda.b #$01
	sta.w $1CDF,x
	lda.b $22,x
	clc
	adc.b #$FE
	sta.b $02
	lda.b $02
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	lda.b #$00
	sta.w $1CDC,x
CODE_00F1A1:
	rep #$20
	lda.w #$F1B2
	sta.b $53
	sep #$20
	lda.b #$00
	sta.b $55
	jml DoJumpTable
DATA_00F1B2:
	JUMPTABLE(CODE_00F4DD)
	JUMPTABLE(CODE_00F407)
	JUMPTABLE(CODE_00F410)
	JUMPTABLE(CODE_00F37B)
	JUMPTABLE(CODE_00F357)
	JUMPTABLE(CODE_00F471)
	JUMPTABLE(CODE_00F499)
	JUMPTABLE(CODE_00F2FB)
	JUMPTABLE(CODE_00F3C2)
	JUMPTABLE(CODE_00F25E)
	JUMPTABLE(CODE_00F2F8)
	JUMPTABLE(CODE_00F226)
	JUMPTABLE(CODE_00F2AB)
	JUMPTABLE(CODE_00F2F8)
	JUMPTABLE(CODE_00F1EE)
CODE_00F1EE:
	lda.b $1E,x
	and.b #$10
	beq CODE_00F1F8
	jml CODE_00F209
CODE_00F1F8:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$06
	beq CODE_00F21D
	lda.b #$01
	jsr CODE_00F4BA
	jmp CODE_00F510
CODE_00F209:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$04
	beq CODE_00F21A
	lda.b #$FF
	jsr CODE_00F4BA
	jmp CODE_00F510
CODE_00F21A:
	jsr CODE_00F4D6
CODE_00F21D:
	lda.b $1E,x
	eor.b #$10
	sta.b $1E,x
	jmp CODE_00F510
CODE_00F226:
	lda.b $1E,x
	and.b #$10
	beq CODE_00F230
	jml CODE_00F241
CODE_00F230:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$0B
	beq CODE_00F225
	lda.b #$01
	jsr CODE_00F4BA
	jmp CODE_00F510
CODE_00F241:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$09
	beq CODE_00F252
	lda.b #$FF
	jsr CODE_00F4BA
	jmp CODE_00F510
CODE_00F252:
	jsr CODE_00F4D6
CODE_00F255:
	lda.b $1E,x
	eor.b #$10
	sta.b $1E,x
	jmp CODE_00F510
CODE_00F25E:
	rep #$20
	lda.w #$F53D
	sta.w $1CD3,x
	sep #$20
	lda.b #$00
	sta.w $1CD5,x
	lda.b #$4A
	sta.b $2A,x
	lda.b $1E,x
	ora.b #$10
	sta.b $1E,x
	lda.b $22,x
	and.b #$03
	clc
	adc.b #$09
	sta.b $02
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b $02
	bne CODE_00F28F
	jml CODE_00F3FE
CODE_00F28F:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$FF
	bmi CODE_00F29A
	clc
	adc.b #$10
CODE_00F29A:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F2A3
	sec
	sbc.b #$10
CODE_00F2A3:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
	rep #$20
	lda.w #$F53D
	sta.w $1CD3,x
	sep #$20
	lda.b #$00
	sta.w $1CD5,x
	lda.b #$4A
	sta.b $2A,x
	lda.b $1E,x
	ora.b #$10
	sta.b $1E,x
	lda.b $22,x
	and.b #$03
	clc
	adc.b #$04
	sta.b $02
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b $02
	bne CODE_00F2DC
	jml CODE_00F3FE
CODE_00F2DC:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$FF
	bmi CODE_00F2E7
	clc
	adc.b #$10
CODE_00F2E7:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F2F0
	sec
	sbc.b #$10
CODE_00F2F0:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F2F8:
	jmp CODE_00F51B
CODE_00F2FB:
	rep #$20
	lda.w $1CEA,x
	cmp.w #$82ED
	sep #$20
	bne CODE_00F30B
	jml CODE_00F322
CODE_00F30B:
	lda.b #$4A
	sta.b $2A,x
	rep #$20
	lda.w #$889E
	sta.w $1CD3,x
	sep #$20
	lda.b #$06
	sta.w $1CD5,x
	bra CODE_00F333
CODE_00F322:
	rep #$20
	lda.w #$F53D
	sta.w $1CD3,x
	sep #$20
	lda.b #$00
	sta.w $1CD5,x
CODE_00F333:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi CODE_00F33E
	clc
	adc.b #$0F
CODE_00F33E:
	and.b #$7F
	cmp.b #$0F
	bcc CODE_00F34F
	lda.b #$0F
	dec
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F34F:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F357:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi CODE_00F362
	clc
	adc.b #$08
CODE_00F362:
	and.b #$7F
	cmp.b #$0B
	bcc CODE_00F373
	lda.b #$0B
	dec
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F373:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F37B:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$00
	bne CODE_00F388
	jml CODE_00F51B
CODE_00F388:
	bpl CODE_00F3A6
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi CODE_00F395
	clc
	adc.b #$10
CODE_00F395:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F39E
	sec
	sbc.b #$10
CODE_00F39E:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F3A6:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$FF
	bmi CODE_00F3B1
	clc
	adc.b #$10
CODE_00F3B1:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F3BA
	sec
	sbc.b #$10
CODE_00F3BA:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F3C2:
	lda.w $15BB
	and.b #$0F
	beq CODE_00F3CD
	jml CODE_00F51B
CODE_00F3CD:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$0B
	bne CODE_00F3DA
	jml CODE_00F51B
CODE_00F3DA:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$FF
	bmi CODE_00F3E5
	clc
	adc.b #$10
CODE_00F3E5:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F3EE
	sec
	sbc.b #$10
CODE_00F3EE:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F3F6:
	lda.b #$00
	sta.w $1CDC,x
	jmp CODE_00F1A1
CODE_00F3FE:
	lda.b #$01
	jsl CODE_09BACE
	jmp CODE_00F1A1
CODE_00F407:
	lda.b $1E,x
	and.b #$EF
	sta.b $1E,x
	jmp CODE_00F3FE
CODE_00F410:
	lda.b $1E,x
	and.b #$10
	beq CODE_00F41A
	jml CODE_00F43F
CODE_00F41A:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$05
	beq CODE_00F468
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi CODE_00F42E
	clc
	adc.b #$10
CODE_00F42E:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F437
	sec
	sbc.b #$10
CODE_00F437:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F43F:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$00
	bne CODE_00F44C
	jml CODE_00F3F6
CODE_00F44C:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$FF
	bmi CODE_00F457
	clc
	adc.b #$10
CODE_00F457:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F460
	sec
	sbc.b #$10
CODE_00F460:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F468:
	lda.b $1E,x
	eor.b #$10
	sta.b $1E,x
	jmp CODE_00F51B
CODE_00F471:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi CODE_00F47C
	clc
	adc.b #$0B
CODE_00F47C:
	and.b #$7F
	cmp.b #$0B
	bcc CODE_00F48D
	lda.b #$0B
	dec
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F3FE
CODE_00F48D:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	lda.b #$4A
	sta.b $2A,x
	jmp CODE_00F51B
CODE_00F499:
	lda.b #$4A
	sta.b $2A,x
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$0A
	beq CODE_00F4B0
	lda.b #$0A
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F4B0:
	lda.b #$09
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F51B
CODE_00F4BA:
	sta.b $02
	lda.w Object2ListRel+$1D,x
	clc
	adc.b $02
	bmi CODE_00F4C7
	clc
	adc.b #$10
CODE_00F4C7:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F4D0
	sec
	sbc.b #$10
CODE_00F4D0:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	rts
CODE_00F4D6:
	lda.b #$97
	jsl CODE_03B7F9
	rts
CODE_00F4DD:
	lda.b $1E,x
	and.b #$10
	beq CODE_00F4E7
	jml CODE_00F4F7
CODE_00F4E7:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$03
	beq CODE_00F50A
CODE_00F4F0:
	lda.b #$01
	jsr CODE_00F4BA
	bra CODE_00F510
CODE_00F4F7:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$00
	beq CODE_00F507
	lda.b #$FF
	jsr CODE_00F4BA
	bra CODE_00F510
CODE_00F507:
	jsr CODE_00F4D6
CODE_00F50A:
	lda.b $1E,x
	eor.b #$10
	sta.b $1E,x
CODE_00F510:
	lda.b $2A,x
	cmp.b #$40
	bpl CODE_00F51B
	lda.b #$05
	sta.w $1CDC,x
CODE_00F51B:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$0D
	bcs CODE_00F528
	jml CODE_00F533
CODE_00F528:
	rep #$20
	lda.w #$BC28
	sta.b $04,x
	sep #$20
	bra CODE_00F53C
CODE_00F533:
	rep #$20
	lda.w #$BC0C
	sta.b $04,x
	sep #$20
CODE_00F53C:
	rts
CODE_00F53C:
	lda.b #$24
	jsl CODE_03B7F9
	jml CODE_0689A3
CODE_00F547:
	lda.w $F0C9
	sec
	sbc.b #$05
	sta.w $F0C9
	rep #$20
	lda.w #CODE_00F5A2
	sta.l Object2ListRel+$06,x
	sep #$20
	lda.b #BANKOF(CODE_00F5A2)
	sta.l Object2ListRel+$08,x
	ldy.b $06,x
	lda.b $20,x
	and.b #$EF
	sta.b $20,x
	rep #$20
	stx.b $3C
	phy
CODE_00F56E:
	lda.w $0026,y
	beq CODE_00F57F
	cmp.b $3C
	beq CODE_00F57A
	tay
	bra CODE_00F56E
CODE_00F57A:
	lda.b $26,x
	sta.w $0026,y
CODE_00F57F:
	ply
	sep #$20
	lda.b #$78
	sta.b $15,x
	lda.b $15,x
	sta.b TempRotZ
	lda.b $13,x
	jsl GetLocalZX8RotateNegRotY
	rep #$20
	lda.b TempVecX
	sta.b $2F,x
	lda.b TempVecZ
	sta.b $33,x
	sep #$20
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
CODE_00F5A2:
	jsl ApplyObjectVelocity
	lda.b $13,x
	clc
	adc.b #$10
	sta.b $13,x
	rep #$20
	lda.b $31,x
	clc
	adc.b #$04
	sta.b $31,x
	sep #$20
	rep #$20
	lda.b $0E,x
	cmp.w #$FFEC
	sep #$20
	bpl CODE_00F5C8
	jml CODE_00F613
CODE_00F5C8:
	rep #$20
	lda.w #$FFEC
	sta.b $0E,x
	sep #$20
	rep #$20
	lda.b $31,x
	eor.w #$FFFF
	inc
	cmp.w #$8000
	ror
	bpl CODE_00F5E2
	adc.w #$0000
CODE_00F5E2:
	cmp.w #$8000
	ror
	bpl CODE_00F5EB
	adc.w #$0000
CODE_00F5EB:
	cmp.w #$8000
	ror
	bpl CODE_00F5F4
	adc.w #$0000
CODE_00F5F4:
	cmp.w #$8000
	ror
	bpl CODE_00F5FD
	adc.w #$0000
CODE_00F5FD:
	cmp.w #$FFFB
	bcc CODE_00F605
	lda.w #$0000
CODE_00F605:
	sta.b $31,x
	sep #$20
	cmp.b #$00
	sep #$20
	bne CODE_00F613
	jml DestroyCommonEnemy
CODE_00F613:
	rtl
CODE_00F614:
	lda.b $1D,x
	ora.b #$08
	sta.b $1D,x
	rep #$20
	lda.w #CODE_00F639
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(CODE_00F639)
	sta.b $18,x
	jsl SetDefaultDestroyColiFuncPtrs
	lda.b #$FF
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
	lda.b $1F,x
	ora.b #$20
	sta.b $2F,x
CODE_00F639:
	lda.w Object2ListRel+$26,x
	clc
	adc.b #$05
	sta.w Object2ListRel+$26,x
	lda.b $13,x
	cmp.b #$F0
	bcs CODE_00F64E
	lda.b $13,x
	cmp.b #$10
	bcs CODE_00F69D
CODE_00F64E:
	lda.w $15BB
	and.b #$0F
	beq CODE_00F659
	jml CODE_00F69D
CODE_00F659:
	lda.b #$00
	sta.w $1545
	lda.b #$CE
	sta.w $1547
	lda.b #$00
	sta.w $1549
	lda.b #$00
	sta.w $154C
	lda.b #$80
	sta.w $154B
	stz.w $154D
	stz.w $154E
	lda.b #$26
	jsl ShootProjectile
	cpy.w #$0000
	bne CODE_00F686
	ldy.w $156B
CODE_00F686:
	rep #$20
	lda.w PlayerObject
	sta.w $0006,y
	sep #$20
	lda.b #$FF
	sta.w $000A,y
	lda.w $002E,y
	ora.b #$10
	sta.w $002E,y
CODE_00F69D:
	rts
CODE_00F69E:
	lda.b #$00
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	lda.b #$FF
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
	rep #$20
	lda.w #CODE_00F6C4
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(CODE_00F6C4)
	sta.b $18,x
	lda.b #$32
	sta.b $23,x
CODE_00F6C4:
	lda.b $1E,x
	and.b #$10
	bne CODE_00F6CE
	jml CODE_00F6F7
CODE_00F6CE:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$00
	bne CODE_00F6DB
	jml CODE_00F76E
CODE_00F6DB:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$FF
	bmi CODE_00F6E6
	clc
	adc.b #$10
CODE_00F6E6:
	and.b #$7F
	cmp.b #$10
	bcc CODE_00F6EF
	sec
	sbc.b #$10
CODE_00F6EF:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F73A
CODE_00F6F7:
	lda.b $23,x
	cmp.b #$14
	beq CODE_00F703
	lda.b $23,x
	cmp.b #$01
	bne CODE_00F706
CODE_00F703:
	jsr CODE_00F773
CODE_00F706:
	lda.b $23,x
	bne CODE_00F70E
	jml CODE_00F74B
CODE_00F70E:
	dec.b $23,x
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi CODE_00F71B
	clc
	adc.b #$0A
CODE_00F71B:
	and.b #$7F
	cmp.b #$0A
	bcc CODE_00F72C
	lda.b #$0A
	dec
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F731
CODE_00F72C:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
CODE_00F731:
	lda.w Object2ListRel+$2B,x
	clc
	adc.b #$FB
	sta.w Object2ListRel+$2B,x
CODE_00F73A:
	jsl OffsetObjectZPosition
	lda.b #$00					;\Clear object rotation
	sta.b $12,x					;|
	lda.b #$00					;|
	sta.b $13,x					;|
	lda.b #$00					;|
	sta.b $14,x					;/
	rtl
CODE_00F74B:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi CODE_00F756
	clc
	adc.b #$14
CODE_00F756:
	and.b #$7F
	cmp.b #$14
	bcc CODE_00F767
	lda.b #$14
	dec
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp CODE_00F76E
CODE_00F767:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	bra CODE_00F731
CODE_00F76E:
	jsl CODE_1FD501
	rtl
CODE_00F773:
	rep #$20
	lda.w #$AD9D
	sta.w $14C5
	sep #$20
	jsl CreateChildObject
	bcs CODE_00F787
	jml CODE_00F7D8
CODE_00F787:
	jsl CopyPositionTo
	rep #$20
	lda.w #$0000
	sta.w $000E,y
	sep #$20
	rep #$20
	lda.w #$F7D9
	sta.w $0016,y
	sep #$20
	lda.b #$00
	sta.w $0018,y
	lda.w $002E,y
	ora.b #$10
	sta.w $002E,y
	lda.b #$99
	jsl PushSoundEffectToQueue
	phx
	tyx
	ldy.w PlayerObject
	stz.w $1532
	jsl CODE_1FD03E
	sep #$20
	xba
	cmp.b $12,x
	beq CODE_00F7C5
CODE_00F7C5:
	sta.b $12,x
	jsl CODE_1FD021
	sep #$20
	xba
	eor.b #$FF
	inc
	cmp.b $13,x
	beq CODE_00F7D5
CODE_00F7D5:
	sta.b $13,x
	plx
CODE_00F7D8:
	rts
CODE_00F7D9:
	rep #$20
	lda.w #CODE_00F828
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(CODE_00F828)
	sta.b $18,x
	jsl SetDefaultDestroyColiFuncPtrs
	lda.b $1F,x
	ora.b #$20
	sta.b $1F,x
	lda.b #$FF
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
	rep #$20
	lda.w #$8574
	sta.w Object2ListRel+$20,x
	sep #$20
	lda.b $1D,x
	ora.b #$20
	sta.b $1D,x
	lda.b #$00
	sta.w Object2ListRel+$15,x
	lda.b #$00
	sta.w Object2ListRel+$2A,x
	lda.b #$78
	sta.b $15,x
	lda.b $15,x
	sta.b TempRotZ
	lda.b $13,x
	sta.w TempRotY
	lda.b $12,x
	sta.w TempRotX
	jsl SetTempVelocity
CODE_00F828:
	rep #$20
	lda.w #$AD9D
	sta.w $14C5
	sep #$20
	jsl CreateChildObject
	bcs
	jml CODE_00F857
CODE_00F83C:
	jsl CopyPositionTo
	rep #$20
	lda.w #$F860
	sta.w $0016,y
	sep #$20
	lda.b #$00
	sta.w $0018,y
	lda.w $001E,y
	ora.b #$01
	sta.w $001E,y
CODE_00F857:
	jsl ApplyObjectVelocity
	jsl OffsetObjectZPosition
	rtl
CODE_00F860:
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	rep #$20
	lda.w #$8574
	sta.w Object2ListRel+$20,x
	sep #$20
	lda.b $1D,x
	ora.b #$20
	sta.b $1D,x
	lda.b #$01
	sta.w Object2ListRel+$15,x
	lda.b #$00
	sta.w Object2ListRel+$2A,x
	lda.b $22,x
	cmp.b #$0A
	beq CODE_00F88D
	inc.b $22,x
	jsl OffsetObjectZPosition
	rtl
CODE_00F88D:
	jsl CODE_1FD501
	rtl
CODE_00F892:
	rep #$20
	lda.w #$AD81
	sta.w $14C5
	sep #$20
	jsl CreateChildObject
CODE_00F8A6:
	bcc CODE_00F8AC
	jml CODE_00F932
CODE_00F8AC:
	jsl CopyRotationTo
	jsl CopyRotationTo
	rep #$20
	lda.w #CODE_09EFC6
	sta.w $0016,y
	sep #$20
	lda.b #BANKOF(CODE_09EFC6)
	sta.w $0018,y
	lda.w $002E,y
	ora.b #$10
	sta.w $002E,y
	phx
	tyx
	ldy.w PlayerObject
	stz.w $1532
	jsl CODE_1FD03E
	sep #$20
	xba
	cmp.b $12,x
	beq CODE_00F8DE
CODE_00F8DE:
	sta.b $12,x
	jsl CODE_1FD021
	sep #$20
	xba
	eor.b #$FF
	inc
	cmp.b $13,x
	beq CODE_00F8EE
CODE_00F8EE:
	sta.b $13,x
	txy
	plx
	jsl CODE_02FC58
	and.b #$0F
	sta.b TempVecX
	jsl CODE_02FC58
	and.b #$3F
	sta.b TempVecY
	lda.b TempVecY
	sec
	sbc.b #$20
	sta.b TempVecY
	lda.w $0012,y
	clc
	adc.b TempVecX
	sta.w $0012,y
	lda.w $0012,y
	clc
	adc.b #$F8
	sta.w $0012,y
	lda.w $0013,y
	clc
	adc.b TempVecY
	sta.w $0013,y
	lda.w $001E,y
	ora.b #$10
	sta.w $001E,y
	lda.b #$49
	jsl PushSoundEffectToQueue
CODE_00F932:
	rts
CODE_00F933:
	lda.b $1D,x
	ora.b #$20
	sta.b $1D,x
	lda.b #$08
	sta.w Object2ListRel+$15,x
	lda.b #$00
	sta.w Object2ListRel+$2A,x
	rep #$20
	lda.w #CODE_00F95C
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(CODE_00F95C)
	sta.b $18,x
	jsl CODE_1FD41A
	lda.b #$06
	sta.b $2A,x
	lda.b #$10
	sta.b $2B,x
CODE_00F95C:
	rep #$20
	lda.w #$03E8
	jsl CODE_0398A7
	bcc CODE_00F96B
	jml CODE_00F96C
CODE_00F96B:
	rtl
CODE_00F96C:
	rep #$20
	lda.w #CODE_00F979
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(CODE_00F979)
	sta.b $18,x
CODE_00F979:
	jsr CODE_00F892
	jsr CODE_00F892
	jsr CODE_00F892
	jsr CODE_00F892
	jsr CODE_00F892
	jsr CODE_00F892
	jsr CODE_00F892
	jsr CODE_00F892
	jsr CODE_00F892
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
	lda.b #$00
	sta.b $2A,x
	rtl

;BEHAVIOR FUNCTION ID $E5
BehE5_BigBlueArchway:
	rep #$20
	lda.w #BehE5_BigBlueArchwayLoop
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(BehE5_BigBlueArchwayLoop)
	sta.b $18,x
	jsl SetDefaultDestroyColiFuncPtrs
	lda.b #$FF
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
	lda.b $1F,x
	ora.b #$20
	sta.b $1F,x
	lda.b #$00
	ora.b #$80
	sta.w Object2ListRel+$1D,x
BehE5_BigBlueArchwayLoop:
	lda.b $1E,x
	and.b #$10
	beq BehE5_L1
	jml BehE5_L8
BehE5_L1:
	lda.b $1E,x
	and.b #$EF
	sta.b $1E,x
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$00
	beq BehE5_L2
	jml BehE5_L3
BehE5_L2:
	jsl CODE_03B731
BehE5_L3:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$01
	bmi BehE5_L4
	clc
	adc.b #$08
BehE5_L4:
	and.b #$7F
	cmp.b #$08
	bcc BehE5_L5
	lda.b #$08
	dec
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	jmp BehE5_L6
BehE5_L5:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	rtl
BehE5_L6:
	inc.b $22,x
	lda.b $22,x
	cmp.b #$0A
	bne BehE5_L7
	lda.b #$00
	sta.b $22,x
	lda.b $1E,x
	ora.b #$10
	sta.b $1E,x
BehE5_L7:
	rtl
BehE5_L8:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$00
	bne BehE5_L9
	jml BehE5_L14
BehE5_L9:
	lda.w Object2ListRel+$1D,x
	and.b #$7F
	cmp.b #$07
	beq BehE5_L10
	jml BehE5_L11
BehE5_L10:
	jsl CODE_03B719
BehE5_L11:
	lda.w Object2ListRel+$1D,x
	clc
	adc.b #$FF
	bmi BehE5_L12
	clc
	adc.b #$08
BehE5_L12:
	and.b #$7F
	cmp.b #$08
	bcc BehE5_L13
	sec
	sbc.b #$08
BehE5_L13:
	ora.b #$80
	sta.w Object2ListRel+$1D,x
	rtl
BehE5_L14:
	inc.b $22,x
	lda.b $22,x
	cmp.b #$0A
	bne BehE5_L7
	lda.b #$00
	sta.b $22,x
	brl BehE5_L1
;BEHAVIOR FUNCTION ID $E9
BehE9_BigAsteroid:
	rep #$20					;\Set object behavior routine pointer to BehE9_BigAsteroid_Loop
	lda.w #BehE9_BigAsteroid_Loop			;|
	sta.b $16,x					;|
	sep #$20					;|
	lda.b #BANKOF(BehE9_BigAsteroid_Loop)		;|
	sta.b $18,x					;/
	jsl SetDefaultDestroyColiFuncPtrs
	lda.b $1F,x
	ora.b #$20
	sta.b $1F,x
	lda.b #$FF					;\Set HP (indestructible)
	sta.b $2A,x					;/
	lda.b #$0C					;\Set power (damage to player upon impact)
	sta.b $2B,x					;/
	lda.w $18C8					;\Calculate Y rotation
	eor.b #$FF					;|
	inc						;|
	clc						;|
	adc.b #$80					;|
	clc						;|
	adc.w $152B					;|
	sta.b $13,x					;/
	lda.w $18C6					;\Set X rotation
	sta.b $12,x					;/
	jsl CODE_02FC58
	and.b #$0F
	sta.b $22,x
	lda.b $22,x
	sec
	sbc.b #$08
	sta.b $22,x
BehE9_BigAsteroid_Loop:
	rtl
;BEHAVIOR FUNCTION ID $EA
BehEA_ShootableAsteroid:
	rep #$20
	lda.w #$459F
	sta.b $28,x
	sep #$20
	lda.b #$02					;\Set HP
	sta.b $2A,x					;/
	lda.b #$0C					;\Set power (damage to player upon impact)
	sta.b $2B,x					;/
	jml Beh9C
;BEHAVIOR FUNCTION ID $ED
BehED_ShootableAsteroid:
	rep #$20
	lda.w #$459B
	sta.b $28,x
	sep.b #$20
	lda.b #$02					;\Set HP
	sta.b $2A,x					;/
	lda.b #$0C					;\Set power (damage to player upon impact)
	sta.b $2B,x					;/
	jml Beh9C

CODE_00FACF:
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
	rtl
CODE_00FAD6:
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	rep #$20					;\Set object behavior routine pointer to $00FB03
	lda.w #CODE_00FB03				;|
	sta.b $16,x					;|
	sep #$20					;|
	lda.b #BANKOF(CODE_00FB03)			;|
	sta.b $18,x					;/
	jsl SetDefaultDestroyColiFuncPtrs
	lda.b $13,x
	clc
	adc.b #$80
	sta.b $13,x
	lda.b #$04
	sta.b $2A,x
	lda.b #$08
	sta.b $2B,x
	lda.b #$00
	ora.b #$80
	sta.w Object2ListRel+$1D,x
CODE_00FB03:
	lda.b $1E,x
	and #$20
	beq CODE_00FB0D
	jml CODE_00FC69
CODE_00FB0D:
	lda.w $15BB
	and.b #$01
	beq CODE_00FB18
	jml CODE_00FB2F
CODE_00FB18:
	jsl CODE_068C1A
	cpy.w #$0000
	bne CODE_00FB25
	jml CODE_00FB2F
CODE_00FB25:
	rep #$20
	lda.w #$0000
	sta.w $000E,y
	sep #$20
CODE_00FB2F:
	rep #$20
	lda.b $0E,x
	cmp.w #$0000
	sep #$20
	bmi CODE_00FB3E
	jml CODE_00FB65
CODE_00FB3E:
	rep #$20
	lda.b $31,x					;\Increase object Y velocity by 2
	clc						;|
	adc.w #$0002					;|
	sta.b $31,x					;/
	sep #$20
	rep #$20
	lda.b $0E,x					;\Apply object Y velocity to object Y position
	clc						;|
	adc.b $31,x					;|
	sta.b $0E,x					;/
	sep #$20
	bpl CODE_00FB5C
	jml CODE_00FB65
CODE_00FB5C:
	rep #$20
	lda.w #$0000					;\Set object Y position to 0
	sta.b $0E,x					;/
	sep #$20
CODE_00FB65:
	jsl OffsetObjectZPosition
	lda.b $1E,x
	and.b #$40
	beq CODE_00FB73
	jml CODE_00FB9D
CODE_00FB73:
	rep #$20
	lda.b $0C,x
	sta.b $3A
	lda.w #$FF38
	jsl CODE_1FD6AB
	sta.b $0C,x
	sep #$20
	bcc CODE_00FB8A
	jml CODE_00FBC6
CODE_00FB8A:
	rep #$20
	lda.b $0C,x
	cmp.w #$FF6A
	sep #$20
	bpl CODE_00FB99
	jml CODE_00FBC6
CODE_00FB99:
	jml CODE_00FB69
CODE_00FB9D:
	rep #$20
	lda.b $0C,x
	sta.b $3A
	lda.w #$00C8
	jsl CODE_1FD6AB
	sta.b $0C,x
	sep #$20
	bcc CODE_00FBB4
	jml CODE_00FBC6
CODE_00FBB4:
	rep #$20
	lda.b $0C,x
	cmp.w #$0096
	sep #$20
	bmi CODE_00FBC3
	jml CODE_00FBC6
CODE_00FBC3:
	jmp CODE_00FC69
CODE_00FBC6:
	ldy.w $1238
	jsl CODE_1FD021
	sep #$20
	xba
	eor.b #$FF
	inc
	cmp.b $13,x
	beq CODE_00FBD7
CODE_00FBD7:
	sta.b $13,x
	lda #$00
	sta Object2ListRel+$1D,x
	rep #$20						;\Set object behavior routine pointer to $00FC29
	lda.w #CODE_00FC29					;|
	sta.b $16,x						;|
	sep #$20						;|
	lda.b #BANKOF(CODE_00FC29)				;|
	sta.b $18,x						;/
	lda.b #$46
	sta.b $15,x
	lda.b $15,x
	sta.b TempRotZ
	lda.b $13,x
	jsl GetLocalZX8RotateNegRotY
	rep #$20
	lda.b TempVecX
	sta.b $2F,x
	lda.b TempVecZ
	sta.b $33,x
	sep #$20
	rep #$20
	lda.w #$FFF1
	sta.b $31,x
	sep #$20
	jsl CODE_068C31
	cpy.w #$0000
	bne CODE_00FC1B
	jml CODE_00FC25
CODE_00FC1B:
	rep #$20
	lda.w #$0000
	sta.w $000E,y
	sep #$20
CODE_00FC25:
	jsl CODE_03B749
CODE_00FC29:
	rep #$20
	lda.b $31,x
	clc
	adc.w #$0002
	sta.b $31,x
	sep #$20
	jsl ApplyObjectVelocity
	jsl OffsetObjectZPosition
	rep #$20
	lda.b $0E,x
	cmp.w #$0000
	sep #$20
	bpl CODE_00FC4C
	jml CODE_00FC69
CODE_00FC4C:
	jsl CODE_068C31
	cpy.w #$0000
	bne CODE_00FC59
	jml CODE_00FC63
CODE_00FC59:
	rep #$20
	lda.w #$0000
	sta.w $000E,y
	sep #$20
CODE_00FC63:
	lda.b $1E,x
	ora.b #$20
	sta.b $1E,x
CODE_00FC69:
	rtl

UnusedBank00SetBRegBank00:
	lda.b #$00					;\Set data bank to $00
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/

;Compressed tilemap
	INCBIN "graphics/compressed/gameover.mapz"

;Reset and interrupt routines
Reset_L1:
	clc						;\Disable emulation mode
	xce						;/
	jml DoReset					; Jump to do more reset initialization stuff
Reset:
	bra Reset_L1					; Branch to do reset stuff
GeneralInterrupt:					;\If interrupt occurs, exit immediately
	rti						;/

;;;;;;;;;;;;;;;;;;;;;;
;INTERNAL SNES HEADER;
;;;;;;;;;;;;;;;;;;;;;;
	ORG $FFC0
	DB "STAR FOX             "			;Title
	DB $20						;SlowROM, LoROM
	DB $13						;ROM + SuperFX
	DB $0A						;ROM is 1MiB (32 banks)
	DB $00						;No RAM (not true however, there's actually 64KiB)
	DB $01						;North America region
	DB $01						;???
	DB $02						;Version 1.2
	DW $06CF					;Complement Checksum	
	DB $F930					;Checksum
	
	;Native mode vectors
	DW $FFFF					;UNUSED
	DW $FFFF					;UNUSED
	DW GeneralInterrupt				;COP
	DW GeneralInterrupt				;BRK
	DW GeneralInterrupt				;ABORT
	DW $0108					;NMI
	DW $0000					;RESET (unused, CPU resets in emulation mode)
	DW $010C					;IRQ
	
	;Emulation mode vectors
	DW $FFFF					;UNUSED
	DW $FFFF					;UNUSED
	DW GeneralInterrupt				;COP
	DW $0000					;BRK (unused, uses the same vector as IRQ in emulation mode)
	DW GeneralInterrupt				;ABORT
	DW GeneralInterrupt				;NMI
	DW Reset					;RESET
	DW GeneralInterrupt				;IRQ
