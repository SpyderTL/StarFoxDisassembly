	;Continuation of data to transfer
	;Waves
	INCBIN "audio/waves/narr_incomingenemyfighters.brr":$06E1-$2BF1
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF
	;Transfer $003C bytes to SPC address $3D00
	DW $003C,$3D00
	;Data to transfer
	DB $00,$FF,$E0,$B8,$07,$A0,$01,$FD,$E0,$B8,$07,$A0,$02,$FF,$E0,$B8
	DB $07,$A0,$03,$FD,$E0,$B8,$00,$F0,$04,$F6,$E0,$B8,$00,$F0,$05,$FF
	DB $E0,$B8,$00,$F0,$06,$F6,$E0,$B8,$02,$00,$07,$FF,$E0,$B8,$02,$00
	DB $08,$FF,$E0,$B8,$03,$C0,$09,$FF,$E0,$B8,$07,$A0
	;Transfer $0004 bytes to SPC address $FDDE
	DW $0004,$FDDE
	;Data to transfer
	;Music pointers
	DW $F7C2,$FCCE
	;Transfer $013C bytes to SPC address $F7C2
	DW $013C,$F7C2
	;Data to transfer
	;Music data
	INCBIN "audio/songs/scramble.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0010 bytes to SPC address $3CA0
	DW $0010,$3CA0
	;Data to transfer
	DB $A0,$DB,$91,$EA,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $0F00 bytes to SPC address $DBA0
	DW $0F00,$DBA0
	;Data to transfer
	;Waves
	INCBIN "audio/waves/narr_goodluck.brr"
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0040 bytes to SPC address $3C00
	DW $0040,$3C00
	;Data to transfer
	DB $00,$40,$D1,$44,$00,$40,$D1,$44,$00,$40,$D1,$44,$00,$40,$D1,$44
	DB $00,$40,$D1,$44,$00,$40,$D1,$44,$00,$40,$D1,$44,$F5,$4D,$ED,$58
	DB $F5,$4D,$ED,$58,$F5,$4D,$ED,$58,$F5,$4D,$ED,$58,$F5,$4D,$ED,$58
	DB $F5,$4D,$ED,$58,$ED,$58,$73,$96,$ED,$58,$73,$96,$ED,$58,$73,$96
	;Transfer $5680 bytes to SPC address $4000
	DW $5680,$4000
	;Data to transfer
	;Waves
	INCBIN "audio/waves/spooky.brr"
	INCBIN "audio/waves/orchhit2.brr"
	INCBIN "audio/waves/orchhit3.brr":$0000-$310C
