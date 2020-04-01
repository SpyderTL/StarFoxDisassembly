	;Continuation of data to transfer
	;Music data
	INCBIN "audio/songs/credits.mus":$087F-$1D34
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $0000,$E600,$E600,$E600
	;Transfer $0B93 bytes to SPC address $E600
	DW $0B93,$E600
	;Data to transfer
	;Music data
	INCBIN "audio/songs/unk1E94CA.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $0000,$EBE5,$EBE5,$EBE5
	;Transfer $0CAA bytes to SPC address $EBE5
	DW $0CAA,$EBE5
	;Data to transfer
	;Music data
	INCBIN "audio/songs/meteor.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $0000,$ECBA,$ECBA,$ECBA
	;Transfer $0C12 bytes to SPC address $ECBA
	DW $0C12,$ECBA
	;Data to transfer
	;Music data
	INCBIN "audio/songs/titania.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0022 bytes to SPC address $FDCC
	DW $0022,$FDC0
	;Data to transfer
	;Music pointers
	DW $0000,$E600,$E600,$E600,$0000,$0000,$F8FE,$0000
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $FCCE
	;Transfer $07C5 bytes to SPC address $E600
	DW $07C5,$E600
	;Data to transfer
	;Music data
	INCBIN "audio/songs/training.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $0000,$E600,$E600,$E600
	;Transfer $0C75 bytes to SPC address $E600
	DW $0C75,$E600
	;Data to transfer
	;Music data
	INCBIN "audio/songs/macbeth.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $F4B5,$EB3A,$E000,$E000
	;Transfer $0016 bytes to SPC address $FDCC
	DW $0016,$FDCC
	;Data to transfer
	;Music pointers
	DW $F8D3,$EAC3,$0000,$0000,$F77F,$0000,$F829,$EA06
	DW $0000,$0000,$FCF0
	;Transfer $0C14 bytes to SPC address $E000
	DW $0C14,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/asteroid_venomatmosphere.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $F4B5,$E000,$E000,$E000
	;Transfer $0016 bytes to SPC address $FDCC
	DW $0016,$FDCC
	;Data to transfer
	;Music pointers
	DW $F8D3,$0000,$E603,$0000,$F77F,$0000,$F829,$0000
	DW $0000,$0000,$FCF0
	;Transfer $0685 bytes to SPC address $E000
	DW $0685,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/spacearmada.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $F4B5,$E000,$E000,$E000
	;Transfer $0016 bytes to SPC address $FDCC
	DW $0016,$FDCC
	;Data to transfer
	;Music pointers
	DW $F8D3,$0000,$0000,$0000,$F77F,$0000,$F829,$0000
	DW $0000,$0000,$FCF0
	;Transfer $0AC8 bytes to SPC address $E000
	DW $0AC8,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/highway.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $F4B5,$E000,$E000,$E000
	;Transfer $0016 bytes to SPC address $FDCC
	DW $0016,$FDCC
	;Data to transfer
	;Music pointers
	DW $F8D3,$0000,$0000,$0000,$F77F,$0000,$F829,$0000
	DW $0000,$0000,$FCF0
	;Transfer $056A bytes to SPC address $E000
	DW $056A,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/sectorxz.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0008 bytes to SPC address $FDC0
	DW $0008,$FDC0
	;Data to transfer
	;Music pointers
	DW $F4B5,$E000,$E000,$E000
	;Transfer $0016 bytes to SPC address $FDCC
	DW $0016,$FDCC
	;Data to transfer
	;Music pointers
	DW $F8D3,$0000,$0000,$0000,$F77F,$0000,$F829,$0000
	DW $0000,$0000,$FCF0
	;Transfer $06D4 bytes to SPC address $E000
	DW $06D4,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/venom13.mus"
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0022 bytes to SPC address $FDC0
	DW $0022,$FDC0
	;Data to transfer
	;Music pointers
	DW $0000,$EC7E,$EC7E,$EC7E,$E000,$E022,$F8FE,$0000
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $FCCE
	;Transfer $1603 bytes to SPC address $E000
	DW $1603,$E000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/outofthisdimension.mus":$0000-$078F
