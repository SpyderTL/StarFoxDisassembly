	;Continuation of data to transfer
	;Waves
	INCBIN "audio/waves/orchhit3.brr":$310D-$3D85
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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
	;Transfer $021B bytes to SPC address $F000
	DW $021B,$F000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/title.mus"
	;Transfer $0004 bytes to SPC address $FDE2
	DW $0004,$FDE2
	;Data to transfer
	;Music pointers
	DW $F000,$F000
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0030 bytes to SPC address $3C00
	DW $0030,$3C00
	;Data to transfer
	DB $00,$40,$0F,$4C,$0F,$4C,$99,$5B,$99,$5B,$97,$69,$97,$69,$AD,$8C
	DB $AD,$8C,$58,$9F,$AD,$8C,$58,$9F,$AD,$8C,$58,$9F,$58,$9F,$D2,$A9
	DB $D2,$A9,$86,$AA,$A1,$AA,$1F,$AB,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $6B40 bytes to SPC address $4000
	DW $6B40,$4000
	;Data to transfer
	;Waves
	INCBIN "audio/waves/unk1C0FDD.brr"
	INCBIN "audio/waves/narr_thisiscorneria.brr"
	INCBIN "audio/waves/narr_pepperspeaking.brr"
	INCBIN "audio/waves/narr_congratulations.brr"
	INCBIN "audio/waves/narr_headingback.brr"
	INCBIN "audio/waves/crash4.brr"
	INCBIN "audio/waves/synthlead3.brr"
	INCBIN "audio/waves/beep6.brr"
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $0010 bytes to SPC address $3C70
	DW $0010,$3C70
	;Data to transfer
	DB $20,$C7,$42,$CC,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $0530 bytes to SPC address $C720
	DW $0530,$C720
	;Data to transfer
	;Waves
	INCBIN "audio/waves/narr_roger.brr":$0000-$04DA
