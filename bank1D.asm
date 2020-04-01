	;Continuation of data to transfer
	;Waves
	INCBIN "audio/waves/narr_roger.brr":$04DB-$0521
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $00F0 bytes to SPC address $3D00
	DW $00F0,$3D00
	;Data to transfer
	DB $00,$FF,$E0,$B8,$07,$A0,$01,$FF,$E0,$B8,$06,$30,$02,$FF,$E0,$B8
	DB $06,$B0,$03,$FF,$E0,$B8,$06,$C0,$04,$FD,$E0,$B8,$07,$A0,$05,$FD
	DB $E0,$B8,$07,$A0,$06,$FF,$E0,$B8,$07,$A0,$07,$FF,$E0,$B8,$01,$90
	DB $08,$FF,$E0,$B8,$03,$00,$09,$FF,$E0,$B8,$01,$00,$0A,$FD,$E0,$B8
	DB $02,$00,$0B,$FD,$E0,$B8,$02,$00,$0C,$FD,$E0,$B8,$02,$00,$0D,$FD
	DB $E0,$B8,$02,$00,$0E,$FD,$E0,$B8,$02,$00,$0F,$FD,$E0,$B8,$02,$00
	DB $10,$FD,$E0,$B8,$02,$00,$11,$FD,$E0,$B8,$02,$00,$12,$FD,$E0,$B8
	DB $02,$00,$13,$FD,$E0,$B8,$02,$00,$14,$DF,$34,$B8,$02,$00,$15,$F6
	DB $F1,$B8,$02,$00,$16,$FF,$EE,$B8,$02,$00,$17,$FF,$E0,$B8,$05,$B0
	DB $18,$FF,$E0,$B8,$03,$00,$19,$FF,$E0,$B8,$03,$00,$1A,$FF,$E0,$B8
	DB $04,$90,$1B,$FF,$E0,$B8,$07,$A0,$1C,$FF,$E0,$B8,$07,$A0,$1D,$FF
	DB $F0,$B8,$03,$C0,$1E,$FF,$F6,$B8,$03,$C0,$1F,$FD,$E0,$B8,$03,$C0
	DB $20,$FE,$E0,$B8,$03,$C0,$21,$FF,$ED,$B8,$03,$C0,$22,$FF,$F3,$B8
	DB $03,$C0,$23,$FF,$F6,$B8,$03,$C0,$24,$FF,$E0,$B8,$03,$C0,$25,$FF
	DB $E0,$B8,$03,$C0,$26,$FF,$E0,$B8,$03,$00,$27,$FF,$E0,$B8,$01,$00
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $F4B5,$0000,$E000,$0000
	;Transfer $001A bytes to SPC address $FDCC
	DW $001A,$FDCC
	;Data to transfer
	;Music pointers
	DW $F8D3,$0000,$0000,$0000,$F77F,$0000,$F829,$0000
	DW $0000,$0000,$FCF0,$E772,$E772
	;Transfer $13FA bytes to SPC address $E000
	DW $13FA,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/ending.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0010 bytes to SPC address $3C70
	DW $0010,$3C70
	;Data to transfer
	DB $20,$C7,$47,$D6,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	;Transfer $0F30 bytes to SPC address $C720
	DW $0F30,$C720
	;Data to transfer
	;Waves
	INCBIN "audio/waves/narr_letsgo.brr"
	;Unknown data
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
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
	;Transfer $00EA bytes to SPC address $E000
	DW $00EA,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/continue.mus"
	;Transfer $0022 bytes to SPC address $FDC0
	DW $0022,$FDC0
	;Data to transfer
	;Music pointers
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $0000,$E000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $0000
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0040 bytes to SPC address $3C00
	DW $0040,$3C00
	;Data to transfer
	DB $00,$40,$8C,$5C,$8C,$5C,$B5,$5D,$8C,$5C,$B5,$5D,$D0,$5D,$6C,$64
	DB $D0,$5D,$6C,$64,$98,$6B,$E0,$6B,$E9,$6B,$EA,$6D,$E9,$6B,$EA,$6D
	DB $05,$6E,$AA,$74,$05,$6E,$AA,$74,$47,$86,$51,$88,$47,$86,$51,$88
	DB $6C,$88,$11,$8F,$6C,$88,$11,$8F,$6C,$88,$11,$8F,$6C,$88,$11,$8F
	;Transfer $4F30 bytes to SPC address $4000
	DW $4F30,$4000
	;Data to transfer
	;Waves
	INCBIN "audio/waves/noise5.brr"
	INCBIN "audio/waves/horns3.brr"
	INCBIN "audio/waves/frenchhorns.brr"
	INCBIN "audio/waves/beep7.brr"
	INCBIN "audio/waves/stringhit.brr"
	INCBIN "audio/waves/horns4.brr"
	INCBIN "audio/waves/flute2.brr"
	INCBIN "audio/waves/horns5.brr"
	;Unknown data
	DB $FF,$FF,$FF,$FF
	;Transfer $00E4 bytes to SPC address $3D00
	DB $00,$FF,$E0,$B8,$07,$A0,$01,$FD,$E0,$B8,$03,$00,$02,$FF,$E0,$B8
	DB $03,$00,$03,$FD,$E0,$B8,$03,$C0,$04,$FF,$E0,$B8,$03,$C0,$05,$FF
	DB $EF,$B8,$01,$00,$06,$FF,$F6,$B8,$03,$10,$07,$FF,$F2,$B8,$03,$10
	DB $08,$FD,$E0,$B8,$03,$D0,$09,$FF,$E0,$B8,$03,$D0,$0A,$FD,$E0,$B8
	DB $03,$00,$0B,$FF,$E0,$B8,$03,$00,$0C,$FD,$E0,$B8,$03,$00,$0D,$FD
	DB $E0,$B8,$03,$00,$0E,$FF,$F0,$B8,$03,$00,$0F,$FF,$E0,$B8,$03,$00
	DB $10,$FD,$E0,$B8,$02,$00,$11,$FD,$E0,$B8,$02,$00,$12,$FD,$E0,$B8
	DB $02,$00,$13,$FD,$E0,$B8,$02,$00,$14,$DF,$34,$B8,$02,$00,$15,$F6
	DB $F1,$B8,$02,$00,$16,$FF,$EE,$B8,$02,$00,$17,$FD,$E0,$B8,$03,$00
	DB $18,$FF,$E0,$B8,$03,$00,$19,$FF,$E0,$B8,$03,$00,$1A,$FF,$E0,$B8
	DB $04,$90,$1B,$FF,$E0,$B8,$07,$A0,$1C,$FF,$ED,$B8,$03,$00,$1D,$FF
	DB $F0,$B8,$03,$00,$1E,$FF,$F6,$B8,$03,$00,$1F,$FF,$E0,$B8,$03,$00
	DB $20,$FE,$E0,$B8,$03,$C0,$21,$FF,$ED,$B8,$03,$C0,$22,$FF,$F3,$B8
	DB $03,$C0,$23,$FF,$F6,$B8,$03,$C0,$24,$FF,$E0,$B8,$03,$C0,$25,$FF
	DB $E0,$B8,$03,$C0
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $F4B5,$0000,$0000,$0000
	DW $001A,$FDCC
	;Data to transfer
	;Music pointers
	DW $F8D3,$0000,$0000,$0000,$F77F,$0000,$F829,$0000
	DW $0000,$0000,$FCF0,$E000,$E000
	;Transfer $1D35 bytes to SPC address $E000
	DW $1D35,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/credits.mus":$0000-$087E
