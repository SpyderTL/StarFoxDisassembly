	;Continuation of data to transfer
	;Waves
	INCBIN "audio/waves/narr_twinblaster.brr":$00F3-$086F
	INCBIN "audio/waves/narr_shield.brr"
	INCBIN "audio/waves/andross.brr"
	INCBIN "audio/waves/narr_shield.brr"
	INCBIN "audio/waves/narr_repaired.brr"
	INCBIN "audio/waves/mechanical4.brr"
	INCBIN "audio/waves/calliope.brr"
	INCBIN "audio/waves/noise.brr"
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0040 bytes to SPC address $3C60
	DW $0040,$3C60
	;Data to transfer
	DB $60,$B3,$7B,$B3,$96,$B3,$B1,$B3,$CC,$B3,$6F,$BF,$6F,$BF,$19,$C7
	DB $19,$C7,$BE,$CD,$19,$C7,$BE,$CD,$19,$C7,$BE,$CD,$19,$C7,$BE,$CD
	DB $D9,$CD,$ED,$D1,$D9,$CD,$ED,$D1,$D9,$CD,$ED,$D1,$D9,$CD,$ED,$D1
	DB $D9,$CD,$ED,$D1,$D9,$CD,$ED,$D1,$8F,$DB,$43,$DC,$5E,$DC,$DC,$DC
	;Transfer $2990 bytes to SPC address $B360
	DW $2990,$B360
	;Data to transfer
	;Waves
	INCBIN "audio/waves/unk199CD6.brr"
	INCBIN "audio/waves/unk199D0C.brr"
	INCBIN "audio/waves/timpani.brr"
	INCBIN "audio/waves/unk19A8E5.brr"
	INCBIN "audio/waves/horns.brr"
	INCBIN "audio/waves/strings.brr"
	INCBIN "audio/waves/beep2.brr"
	INCBIN "audio/waves/beep.brr"
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $00F0 bytes to SPC address $3D00
	DW $00F0,$3D00
	;Data to transfer
	DB $00,$FF,$E0,$B8,$03,$40,$01,$FF,$E0,$B8,$03,$10,$02,$FF,$E0,$B8
	DB $02,$B0,$03,$FF,$E0,$B8,$02,$F0,$04,$FF,$E0,$B8,$06,$40,$05,$FF
	DB $E0,$B8,$06,$B0,$06,$FF,$E0,$B8,$03,$B0,$07,$FF,$E0,$B8,$02,$00
	DB $08,$FF,$E0,$B8,$02,$00,$09,$FF,$E0,$B8,$04,$70,$0A,$FF,$E0,$B8
	DB $00,$80,$0B,$FF,$E0,$B8,$03,$C0,$0C,$FF,$E0,$B8,$07,$A0,$0D,$FF
	DB $E0,$B8,$03,$D0,$0E,$FF,$E0,$B8,$05,$B0,$0F,$FF,$E0,$B8,$07,$A0
	DB $10,$FF,$E0,$B8,$07,$A0,$11,$FF,$EC,$B8,$02,$A0,$12,$FF,$E0,$B8
	DB $07,$A0,$13,$FF,$E0,$B8,$03,$C0,$14,$DF,$34,$B8,$02,$00,$15,$F6
	DB $F1,$B8,$02,$00,$16,$FF,$EE,$B8,$02,$00,$17,$FF,$E0,$B8,$05,$B0
	DB $18,$FF,$E0,$B8,$03,$00,$19,$FF,$E0,$B8,$03,$00,$1A,$FF,$E0,$B8
	DB $04,$90,$1B,$FF,$E0,$B8,$07,$A0,$1C,$FF,$ED,$B8,$03,$00,$1D,$FF
	DB $F0,$B8,$03,$00,$1E,$FF,$F6,$B8,$03,$00,$1F,$FF,$E0,$B8,$03,$00
	DB $20,$FE,$E0,$B8,$03,$A0,$21,$FF,$ED,$B8,$03,$C0,$22,$FF,$F3,$B8
	DB $03,$C0,$23,$FF,$F6,$B8,$03,$C0,$24,$FF,$E0,$B8,$03,$C0,$25,$FF
	DB $E0,$B8,$03,$C0,$26,$FF,$E0,$B8,$03,$00,$27,$FF,$E0,$B8,$01,$00
	;Transfer $0AA0 bytes to SPC address $F342
	DW $0AA0,$F342
	;Data to transfer
	;Music data
	INCBIN "audio/songs/unk19C75E.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0060 bytes to SPC address $3C60
	DW $0060,$3C60
	;Data to transfer
	DB $60,$B3,$7B,$B3,$96,$B3,$B1,$B3,$CC,$B3,$A0,$B5,$A0,$B5,$2A,$BC
	DB $2A,$BC,$45,$BC,$2A,$BC,$45,$BC,$2A,$BC,$45,$BC,$0B,$BD,$BF,$BD
	DB $0B,$BD,$BF,$BD,$0B,$BD,$BF,$BD,$FE,$BD,$0E,$C3,$FE,$BD,$0E,$C3
	DB $29,$C3,$5F,$C3,$68,$C3,$4F,$C7,$5D,$C8,$AB,$CB,$EA,$CB,$32,$CC
	DB $3B,$CC,$D4,$CC,$DD,$CC,$59,$D2,$59,$D2,$A1,$D2,$BC,$D2,$D7,$D2
	DB $F2,$D2,$57,$D7,$57,$D7,$61,$D9,$7C,$D9,$A5,$DA,$FF,$FF,$FF,$FF
	;Transfer $2760 bytes to SPC address $B360
	DW $2760,$B360
	;Data to transfer
	;Waves
	INCBIN "audio/waves/click2.brr"
	INCBIN "audio/waves/click.brr"
	INCBIN "audio/waves/unk19D2D6.brr"
	INCBIN "audio/waves/snare.brr"
	INCBIN "audio/waves/beep3.brr"
	INCBIN "audio/waves/bass.brr"
	INCBIN "audio/waves/synthlead.brr"
	INCBIN "audio/waves/click3.brr"
	INCBIN "audio/waves/noise4.brr"
	INCBIN "audio/waves/tom.brr"
	INCBIN "audio/waves/beep4.brr"
	INCBIN "audio/waves/unk19EB45.brr"
	INCBIN "audio/waves/orchhit.brr"
	INCBIN "audio/waves/beep5.brr"
	INCBIN "audio/waves/click4.brr"
	INCBIN "audio/waves/unk19F1FC.brr"
	INCBIN "audio/waves/flute.brr"
	INCBIN "audio/waves/horns2.brr"
	;Transfer $011A bytes to SPC address $3D00
	DW $011A,$3D00
	;Data to transfer
	DB $00,$FF,$E0,$B8,$03,$40,$01,$FF,$E0,$B8,$03,$10,$02,$FF,$E0,$B8
	DB $02,$B0,$03,$FF,$E0,$B8,$02,$F0,$04,$FF,$E0,$B8,$06,$40,$05,$FF
	DB $E0,$B8,$06,$B0,$06,$FF,$E0,$B8,$03,$B0,$07,$FF,$E0,$B8,$02,$00
	DB $08,$FF,$E0,$B8,$02,$00,$09,$FF,$E0,$B8,$04,$70,$0A,$FF,$E0,$B8
	DB $00,$80,$0B,$FF,$E0,$B8,$03,$C0,$0C,$FF,$E0,$B8,$07,$A0,$0D,$FF
	DB $E0,$B8,$03,$D0,$0E,$FF,$E0,$B8,$05,$B0,$0F,$FF,$E0,$B8,$07,$A0
	DB $10,$FF,$E0,$B8,$07,$A0,$11,$FF,$EC,$B8,$02,$A0,$12,$FF,$E0,$B8
	DB $07,$A0,$13,$FF,$E0,$B8,$03,$C0,$14,$DF,$34,$B8,$02,$00,$15,$F6
	DB $F1,$B8,$02,$00,$16,$FF,$EE,$B8,$02,$00,$17,$FF,$E0,$B8,$05,$B0
	DB $18,$FF,$E0,$B8,$03,$00,$19,$FF,$E0,$B8,$03,$00,$1A,$FF,$E0,$B8
	DB $01,$B0,$1B,$FF,$E0,$B8,$03,$90,$1C,$FF,$F9,$B8,$03,$A0,$1D,$F4
	DB $F1,$B8,$03,$A0,$1E,$FF,$E0,$B8,$03,$A0,$1F,$FF,$F3,$B8,$03,$80
	DB $20,$FE,$E0,$B8,$03,$A0,$21,$FF,$F0,$B8,$03,$80,$22,$F6,$E0,$B8
	DB $03,$00,$23,$FF,$E0,$B8,$03,$00,$24,$FF,$F8,$B8,$01,$50,$25,$FF
	DB $E0,$B8,$1D,$F0,$26,$FF,$F2,$B8,$06,$F0,$27,$FF,$EF,$B8,$01,$00
	DB $28,$FF,$E0,$B8,$01,$00,$29,$FF,$E0,$B8,$07,$A0,$2A,$FF,$E0,$B8
	DB $03,$00,$2B,$FF,$E0,$B8,$03,$00,$2C,$FF,$E0,$B8,$03,$D0,$2D,$FF
	DB $E0,$B8,$03,$00,$2E,$FF,$E0,$B8,$03,$00
	;Transfer $04C2 bytes to SPC address $F8FE
	DW $04C2,$F8FE
	;Data to transfer
	;Music data
	INCBIN "audio/songs/unk19FAEC.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0010 bytes to SPC address $3CB0
	DW $0010,$3CB0
	;Data to transfer
	DB $00,$D3,$16,$E4,$16,$E4,$31,$E4,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $12B0 bytes to SPC address $D300
	DW $12B0,$D300
	INCBIN "audio/waves/crash2.brr":$0000-$0035
