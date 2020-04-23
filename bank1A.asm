	;Continuation of data to transfer
	;Waves
	INCBIN "audio/waves/crash2.brr":$0036-$1115
	INCBIN "audio/waves/treads.brr"
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0030 bytes to SPC address $3C00
	DW $0030,$3C00
	;Data to transfer
	DB $00,$40,$27,$58,$27,$58,$66,$7C,$27,$58,$66,$7C,$66,$7C,$81,$7C
	DB $66,$7C,$81,$7C,$66,$7C,$81,$7C,$DF,$96,$71,$A4,$DF,$96,$71,$A4
	DB $71,$A4,$8C,$A4,$69,$A6,$5B,$D2,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $9260 bytes to SPC address $4000
	DW $9260,$4000
	;Data to transfer
	;Waves
	INCBIN "audio/waves/narr_emergency.brr"
	INCBIN "audio/waves/narr_prepareforlaunch.brr"
	INCBIN "audio/waves/bgchatter.brr"
	INCBIN "audio/waves/crash3.brr"
	INCBIN "audio/waves/synthlead2.brr"
	INCBIN "audio/waves/narr_incomingenemyfighters.brr":$0000-$06E0
