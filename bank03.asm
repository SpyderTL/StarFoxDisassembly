	;Unknown bytes
	DB $E4,$00,$64,$00
;;;;;;;;;;;;;;;
;MATERIAL DATA;
;;;;;;;;;;;;;;;
;The following data are material tables used by the models in the game.
;Each model has an offset associated with it, which is the offset to material 0.
;;;;;;;;
;FORMAT;
;;;;;;;;
;Materials with the first and second byte matching, and from $00-$09, are lit/shaded colors.
;The exact shade used depends on the depth (and orientation?) of the object.
;
;Materials with a high byte of $3E denote flat-shaded colors.
;The high and low nybbles are palette indices to use for the checkerboard pattern.
;
;Materials with a high byte of $40-$4A are for textured quads. Only quads are supported by this mode.
;The low byte then determines the texture offset. The high bit of this determines which nybble
;of the texture map should be used.
;
;Materials with a high byte of $80-$FF are animated materials. The whole word is treated as a pointer in
;bank 3 to an animated material table. The first byte determines the number of frames of animation,
;followed by that many words in the format above.
	;Unknown material table
	DW $3FEE,$3F44,$3F77,$3F88
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$84FC
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$3F44,$3F44
	DW $3F44,$3F44,$0404,$0101
	DW $0202,$0303,$0404,$0505
	DW $0606,$0707,$0808,$0909
	DW $0A0A,$0B0B,$0000,$0101
	DW $0202,$0303,$0404,$0505
	DW $0606,$0707,$820A,$0909
	DW $0A0A,$0B0B,$820A
	;Unknown animated material
	DB $04		;Number of frames
	DW $3F11,$3F22,$3F33,$3F44	;Frame data
	;THIS IS THE MAIN MATERIAL TABLE
	;Most objects use this material/palette table.
	;Lit colors
	DW $0000,$0101,$0202,$0303
	DW $0404,$0505,$0606,$0707
	DW $0808,$0909
	;Flat colors
	DW $3E00,$3E01,$3E02,$3E03
	DW $3E04,$3E05,$3E06,$3E07
	DW $3E08,$3E09,$3E0A,$3E0B
	DW $3E0C,$3E0D,$3E0E,$3E0F
	DW $3E10,$3E11,$3E12,$3E13
	DW $3E14,$3E15,$3E16,$3E17
	DW $3E18,$3E19,$3E1A,$3E1B
	DW $3E1C,$3E1D,$3E1E,$3E1F
	;Animated colors
	DW $84E1,$84EA,$84FC,$8505
	DW $850E,$8517
	;Textures
	DW $401B,$40A8,$40A8,$40A8
	;More animated materials and textures
	DW $878C,$87AD,$87B8,$87D4
	DW $87C3,$40AC,$876D,$40DB
	DW $48DB,$8722,$872B,$8734
	DW $873D,$8746,$84F3,$4005
	DW $4001,$4002,$40D6,$3F99
	DW $3FA9,$3FAA,$3FBA,$3FBB
	DW $3FCB,$3FCC,$3FDC,$3FDD
	DW $3FED,$3FEE,$3F11,$3F21
	DW $3F22,$3F32,$3F33,$3F43
	DW $3F44,$3F55,$3F65,$3F66
	DW $3F76,$3F77,$3F87,$3F88
	DW $47D1,$88D7,$88E8,$88F9
	DW $4006,$890A,$4006,$40AC
	DW $85B3,$463C,$400C,$400D
	DW $4004
	;ANOTHER COMMONLY USED TABLE
	;Lit colors
	DW $0000,$0101,$0303,$0202
	DW $0505,$0404,$0707,$0606
	DW $0909,$0808
	;Flat colors
	DW $3E00,$3E01,$3E02,$3E03
	DW $3E04,$3E05,$3E06,$3E07
	DW $3E08,$3E09,$3E0A,$3E12
	DW $3E13,$3E14,$3E15,$3E16
	DW $3E17,$3E18,$3E0B,$3E0C
	DW $3E0D,$3E0E,$3E0F,$3E10
	DW $3E11,$3E19,$3E1A,$3E1B
	DW $3E1C,$3E1D,$3E1E,$3E1F
	;Animated colors
	DW $84E1,$84EA,$84FC,$8505
	DW $850E,$8517
	;Textures
	DW $401B,$40A8,$40A8,$40A8
	;More animated materials and textures
	DW $878C,$87AD,$87B8,$87D4
	DW $87C3,$40AC,$876D,$40DB
	DW $48DB,$8722,$872B,$8734
	DW $873D,$8746,$84F3,$4005
	DW $4001,$4002,$40D7,$3F99
	DW $3FA9,$3FAA,$3FBA,$3FBB
	DW $3FCB,$3FCC,$3FDC,$3FDD
	DW $3FED,$3FEE,$3F11,$3F21
	DW $3F22,$3F32,$3F33,$3F43
	DW $3F44,$3F55,$3F65,$3F66
	DW $3F76,$3F77,$3F87,$3F88
	DW $47D1,$88D7,$88E8,$88F9
	DW $4006,$890A,$4006,$40AC
	DW $85B3,$463C
	;A SMALL TABLE
	;Lit colors
	DW $0202,$0606,$0000,$0303
	DW $0404,$0505,$0101,$0707
	DW $0808,$0909
	;Flat colors
	DW $3E00,$3E01,$3E0B,$3E0C
	DW $3E0D,$3E0E,$3E0F,$3E10
	DW $3E11,$3E09,$3E0A,$3E02
	DW $3E03,$3E04,$3E05,$3E06
	DW $3E07,$3E08,$3E12,$3E13
	DW $3E14,$3E15,$3E16,$3E17
	DW $3E18,$3E19,$3E1A,$3E1B
	DW $3E1C,$3E1D,$3E1E,$3E1F
	;Animated colors
	DW $84E1,$84EA,$84FC,$8505
	DW $850E,$8517
	;ANOTHER SMALL TABLE
	;Lit colors
	DW $0303,$0707,$0202,$0000
	DW $0404,$0505,$0606,$0101
	DW $0808,$0909
	;Flat colors
	DW $3E00,$3E01,$3E12,$3E13
	DW $3E14,$3E15,$3E16,$3E17
	DW $3E18,$3E09,$3E0A,$3E0B
	DW $3E0C.$3E0D,$3E0E,$3E0F
	DW $3E10,$3E11,$3E02,$3E03
	DW $3E04,$3E05,$3E06,$3E07
	DW $3E08,$3E19,$3E1A,$3E1B
	DW $3E1C,$3E1D,$3E1E,$3E1F
	;Animated colors
	DW $84E1,$84EA,$84FC,$8505
	DW $850E,$8517
	;A THIRD SMALL TABLE
	;Lit colors
	DW $0000,$0101,$0202,$0000
	DW $0404,$0505,$0606,$0101
	DW $0808,$0909
	;Flat colors
	DW $3E00,$3E01,$3E02,$3E03
	DW $3E04,$3E05,$3E06,$3E07
	DW $3E08,$3E09,$3E0A,$3E0B
	DW $3E0C,$3E0D,$3E0E,$3E0F
	DW $3E10,$3E11,$3E00,$3E01
	DW $3E02,$3E03,$3E04,$3E05
	DW $3E06,$3E19,$3E1A,$3E1B
	DW $3E1C,$3E1D,$3E1E,$3E1F
	;Animated colors
	DW $84E1,$84EA,$84FC,$8505
	DW $850E,$8517
	;THE FOLLOWING ARE REFERENCED BY THE MATERIAL LISTS ABOVE
	DB $04		;Number of frames
	DW $3FEE,$3F77,$3F22,$3FFF	;Frame data
	DB $04		;Number of frames
	DW $3F44,$3F33,$3F22,$3F11	;Frame data
	DB $04		;Number of frames
	DW $3E11,$3E1B,$3E11,$3E1B	;Frame data
	DB $04		;Number of frames
	DW $3F88,$3F77,$3F66,$3F55	;Frame data
	DB $04		;Number of frames
	DW $3FEE,$3FDD,$3FCC,$3FBB	;Frame data
	DB $04		;Number of frames
	DW $3FE4,$3F86,$3F82,$3F31	;Frame data
	DB $04		;Number of frames
	DW $3FE0,$3F70,$3F20,$3FF0	;Frame data
	
	DW $4639,$8524,$4639,$463A
	DW $4639,$463A,$4018,$4018
	DW $8814,$8825,$880F,$8837
	DW $8840,$8851,$87F5,$8806
	DW $87E4,$401B,$401F,$87DF
	
	
	;USED FOR FLASHING RING AND EXPLOSIONS
	DW $875C,$874B
	
	;USED FOR THE ANDROSS SQUARE/CUBE/ELONGATED BIPYRAMID MODEL
	DW $46A6,$46A6
	;Unknown animated material
	DB $04
	DW $400C,$400D,$400E,$400E
	;USED FOR THE BLACK HOLE BILLBOARD SPRITE
	DW $46D0,$41D0
	
	
	;The following table is used to translate the low byte of a textured material into a pointer
	;for the upper left corner of the texture to be used (the high byte is used for the size/mirroring).
TexCoordOffsTable:	;038918
	DL $128000,$128020,$128040,$128060
	DL $128080,$1280A0,$1280C0,$1280E0
	DL $12A000,$12A020,$12A040,$12A060
	DL $12A080,$12A0A0,$12A0C0,$12A0E0
	
	DL $12C000,$12C020,$12C040,$12C060
	DL $12C080,$12C0A0,$12C0C0,$12C0E0
	DL $12E000,$12E020,$12E040,$12E060
	DL $12E080,$12E0A0,$12E0C0,$12E0E0
	
	DL $128000,$128020,$128040,$128060
	DL $128080,$1280A0,$1280C0,$12A000
	DL $12A020,$12A040,$12A060,$12A080
	DL $12A0A0,$12A0C0,$12C000,$12C020
	
	DL $12C040,$12C060,$12C080,$12C0A0
	DL $12C0C0,$12E000,$12E040,$12E080
	DL $12E0C0,$138000,$138040,$138080
	DL $1380C0,$13C000,$13C040,$13C080
	
	DL $13C0C0,$138000,$138020,$138040
	DL $138060,$138080,$1380A0,$1380C0
	DL $1380E0,$13A000,$13A020,$13A0E0
	DL $13C080,$13C0A0,$13C0C0,$13C0E0
	
	DL $13A040,$13E080,$13F080,$13C000
	DL $13E040,$13F040,$13A080,$13A0A0
	DL $13A0C0,$13A020,$13A030,$13A080
	DL $13A0A0,$13E8A0,$13E8C0,$13A0C0
DATA_038A38:
	DL $14CE26,$14CE26
DATA_038A3E:
	DB $50,$8A,$5A,$8A,$64,$8A,$6E,$8A
	DB $78,$8A,$82,$8A,$8C,$8A,$96,$8A
	DB $A0,$8A,$1F,$1F,$00,$00,$1F,$00
	DB $1F,$1F,$00,$1F,$3F,$3F,$3F,$00
	DB $00,$00,$00,$3F,$3F,$3F,$7F,$0F
	DB $00,$00,$00,$0F,$0F,$0F,$0F,$00
	DB $1F,$1F,$00,$00,$7F,$00,$7F,$1F
	DB $00,$1F,$3F,$0F,$00,$00,$3F,$00
	DB $3F,$0F,$00,$0F,$3F,$0F,$3F,$00
	DB $00,$00,$00,$0F,$3F,$0F,$3F,$3F
	DB $00,$00,$3F,$00,$3F,$3F,$00,$3F
	DB $7F,$07,$1F,$00,$00,$00,$00,$07
	DB $1F,$07,$1F,$1F,$1F,$00,$00,$00
	DB $00,$1F,$1F,$1F,$00,$00,$21,$00
	DB $00,$00,$A5,$00,$42,$00,$29,$01
	DB $84,$00,$AD,$01,$C6,$00,$31,$02
	DB $08,$01,$B5,$02,$4A,$01,$39,$03
	DB $8C,$01,$FF,$03
	;Base color palette, three varieties.
	;The first one is more blue-tinted, the second one is more red-tinted,
	;and the third one is more green-tinted.
BaseColorTable:	;038ACA
	DW $0000,$0451,$153A,$22BD
	DW $377F,$5445,$6D2B,$7E8F
	DW $7FB6,$0CA3,$2588,$424E
	DW $56F5,$6B9A,$7FFE,$0003
	
	DW $0000,$00B5,$119E,$1ADF
	DW $2F7F,$5CA5,$6D4C,$76F1
	DW $7FB7,$0847,$1CED,$39D0
	DW $4E74,$6B38,$7FFE,$0220
	
	DW $0000,$2035,$357E,$36BF
	DW $4B5F,$6D40,$7E2C,$7F6D
	DW $7FF5,$24C3,$3989,$4E05
	DW $62D3,$7778,$7FFD,$0220
	;This table to rows of lit colors in b03p6GSUCol_LitColorTable
LitColorPointerTable:	;038B2A
	DW $8E0A,$8E14,$8E1E,$8E28
	DW $8E32,$8E3C,$8E46,$8E50
	DW $8E5A,$8E64,$8E64,$8E64
	
	DW $8E6E,$8E78,$8E82,$8E8C
	DW $8E96,$8EA0,$8EAA,$8EB4
	DW $8EBE,$8EC8,$8EC8,$8EC8
	
	DW $8ED2,$8EDC,$8EE6,$8EF0
	DW $8EFA,$8F04,$8F0E,$8F18
	DW $8F22,$8F2C,$8F2C,$8F2C
	
	DW $8F3C,$8F40,$8F4A,$8F54
	DW $8F5E,$8F68,$8F72,$8F7C
	DW $8F86,$8F90,$8F90,$8F90
	;Dithered 4bpp format (same as the $3E material type).
	;The exact set of colors used is determined programmatically.
FlatColorTable:	;038B8A
	DB $99,$9A,$AA,$AB,$BB,$BC,$CC,$CD
	DB $DD,$DE,$EE,$11,$12,$22,$23,$33
	DB $34,$44,$55,$56,$66,$67,$77,$78
	DB $88,$16,$26,$36,$46,$AF,$FF,$DF
	DB $99,$99,$9A,$9A,$AA,$AB,$BB,$BC
	DB $CC,$CD,$DD,$99,$19,$11,$12,$22
	DB $23,$33,$99,$59,$55,$56,$66,$67
	DB $77,$99,$15,$16,$26,$9F,$AF,$FF
	DB $99,$99,$99,$99,$9A,$9A,$AA,$AB
	DB $BB,$BC,$CC,$99,$99,$19,$19,$11
	DB $12,$22,$99,$99,$59,$59,$55,$56
	DB $66,$99,$99,$15,$16,$99,$15,$9F
	DB $99,$99,$99,$99,$99,$99,$9A,$9A
	DB $AA,$AB,$BB,$99,$99,$99,$19,$19
	DB $19,$11,$99,$99,$99,$59,$59,$59
	DB $55,$99,$99,$15,$15,$99,$15,$15
	
	DB $99,$9A,$AA,$AB,$BB,$BC,$CC,$CD
	DB $DD,$DE,$EE,$11,$12,$22,$23,$33
	DB $34,$44,$55,$56,$66,$67,$77,$78
	DB $88,$16,$26,$36,$46,$AF,$FF,$DF
	DB $9A,$9A,$AA,$AB,$BB,$BC,$CC,$CD
	DB $DD,$DE,$EE,$12,$22,$23,$33,$34
	DB $44,$4E,$56,$66,$67,$77,$78,$88
	DB $8E,$17,$27,$37,$47,$6F,$7F,$8F
	DB $6B,$6B,$6B,$6C,$6C,$7C,$7C,$7D
	DB $7D,$8D,$8E,$36,$36,$37,$37,$47
	DB $47,$48,$67,$67,$77,$78,$78,$88
	DB $8E,$6C,$7C,$7D,$7E,$6D,$7D,$8D
	DB $6C,$6C,$6C,$7C,$7C,$7D,$7D,$8D
	DB $8D,$8E,$8E,$7C,$7C,$7D,$7D,$8D
	DB $8D,$8E,$7C,$7C,$7D,$7D,$8D,$8D
	DB $8E,$88,$8E,$8E,$8E,$88,$8E,$EE
	
	DB $99,$9A,$AA,$AB,$BB,$BC,$CC,$CD
	DB $DD,$DE,$EE,$11,$12,$22,$23,$33
	DB $34,$44,$55,$56,$66,$67,$77,$78
	DB $88,$16,$26,$36,$46,$AF,$FF,$DF
	DB $19,$19,$29,$39,$49,$4A,$4B,$4C
	DB $4D,$4D,$4E,$2A,$2B,$3B,$3C,$4C
	DB $4D,$4D,$6A,$6B,$6C,$7C,$7D,$8D
	DB $8D,$35,$36,$37,$38,$2F,$3F,$4F
	DB $19,$29,$39,$49,$4A,$4B,$4C,$4D
	DB $4D,$4D,$4D,$49,$4A,$4A,$4B,$4C
	DB $4D,$4D,$26,$36,$36,$37,$47,$48
	DB $48,$36,$37,$47,$48,$3F,$4F,$4C
	DB $29,$39,$49,$4A,$4B,$4C,$4D,$4D
	DB $4D,$4D,$4D,$4A,$4A,$4C,$4C,$4D
	DB $4D,$4D,$36,$36,$37,$47,$48,$48
	DB $48,$37,$47,$48,$48,$4F,$4C,$4C
	
	DB $99,$9A,$AA,$AB,$BB,$BC,$CC,$CD
	DB $DD,$DE,$EE,$11,$12,$22,$23,$33
	DB $34,$44,$55,$56,$66,$67,$77,$78
	DB $88,$16,$26,$36,$46,$AF,$FF,$DF
	DB $59,$59,$55,$56,$66,$67,$77,$78
	DB $88,$8D,$8E,$15,$16,$26,$36,$37
	DB $47,$48,$55,$56,$66,$66,$67,$77
	DB $78,$16,$16,$26,$36,$5F,$6F,$7F
	DB $55,$55,$56,$56,$66,$66,$67,$67
	DB $77,$77,$78,$55,$56,$66,$67,$77
	DB $78,$88,$56,$56,$56,$66,$66,$67
	DB $67,$56,$56,$66,$6C,$5C,$5C,$6C
	DB $55,$55,$56,$56,$56,$66,$66,$66
	DB $67,$67,$67,$56,$56,$66,$66,$67
	DB $67,$77,$56,$56,$56,$56,$66,$66
	DB $66,$56,$56,$66,$66,$56,$56,$66
	
	DB $99,$9A,$AA,$AB,$BB,$BC,$CC,$CD
	DB $DD,$DE,$EE,$11,$12,$22,$23,$33
	DB $34,$44,$55,$56,$66,$67,$77,$78
	DB $88,$16,$26,$36,$46,$AF,$FF,$DF
	DB $19,$19,$1A,$1A,$1B,$2A,$2B,$2C
	DB $3C,$3C,$4D,$19,$19,$11,$12,$22
	DB $23,$33,$15,$15,$25,$25,$26,$36
	DB $37,$1A,$1B,$2A,$2B,$1F,$2F,$3F
	DB $19,$19,$19,$19,$19,$1A,$1A,$1B
	DB $2A,$2B,$2C,$19,$19,$19,$1A,$1B
	DB $2A,$2B,$19,$19,$1A,$1A,$1B,$2A
	DB $2B,$19,$1A,$1A,$1B,$1A,$1A,$1B
	DB $19,$19,$19,$19,$19,$19,$19,$19
	DB $1A,$1A,$1B,$19,$19,$19,$19,$19
	DB $19,$1A,$19,$19,$19,$19,$19,$19
	DB $1A,$19,$19,$19,$1A,$19,$19,$1A
	;Dithered 4bpp format (same as the $3E material type).
	;These are used by the lit/shaded materials.
	;The exact set of colors used is determined programmatically.
LitColorTable:	;038E0A
	DB $AB,$AB,$BB,$BB,$BC,$CC,$CD,$DD,$DE,$EE
	DB $9A,$9A,$AA,$AA,$AB,$BB,$BC,$CC,$CD,$DD
	DB $19,$1A,$11,$12,$22,$23,$33,$34,$44,$EE
	DB $59,$5A,$55,$56,$66,$67,$77,$78,$88,$EE
	DB $29,$29,$39,$39,$49,$4A,$4B,$4C,$4D,$4E
	DB $69,$69,$79,$79,$89,$8A,$8B,$8C,$8D,$8E
	DB $19,$19,$1A,$11,$12,$22,$23,$33,$34,$44
	DB $59,$59,$5A,$55,$56,$66,$67,$77,$78,$88
	DB $15,$25,$25,$26,$26,$36,$36,$37,$47,$48
	DB $9F,$9F,$9F,$AF,$AF,$BF,$BF,$CF,$DF,$EF
	
	DB $9A,$9A,$AB,$AB,$BB,$BB,$BC,$CC,$CD,$DD
	DB $9A,$9A,$9A,$9A,$AA,$AA,$AB,$BB,$BC,$CC
	DB $19,$19,$1A,$1A,$11,$12,$22,$23,$33,$34
	DB $59,$59,$5A,$5A,$55,$56,$66,$67,$77,$78
	DB $19,$19,$29,$29,$39,$39,$3A,$4A,$4B,$4C
	DB $59,$59,$69,$69,$79,$79,$7A,$8A,$8B,$8C
	DB $19,$19,$19,$1A,$1A,$11,$12,$22,$23,$33
	DB $59,$59,$59,$5A,$5A,$55,$56,$66,$67,$77
	DB $15,$15,$15,$25,$25,$26,$26,$36,$36,$37
	DB $9B,$9B,$9B,$9F,$9F,$AF,$AF,$BF,$BF,$CF
	
	DB $9A,$9A,$9A,$9A,$AB,$AB,$BB,$BB,$BC,$CC
	DB $9A,$9A,$9A,$9A,$9A,$9A,$AA,$AA,$AB,$BB
	DB $19,$19,$19,$19,$1A,$1A,$11,$12,$22,$23
	DB $59,$59,$59,$59,$5A,$5A,$55,$56,$66,$67
	DB $19,$19,$19,$19,$29,$29,$39,$39,$3A,$4A
	DB $59,$59,$59,$59,$59,$59,$69,$69,$79,$79
	DB $19,$19,$19,$19,$19,$1A,$1A,$11,$12,$22
	DB $59,$59,$59,$59,$59,$5A,$5A,$55,$56,$66
	DB $15,$15,$15,$25,$25,$26,$26,$36,$36,$37
	DB $9A,$9A,$9A,$9B,$9B,$9F,$9F,$AF,$AF,$BF
	
	DB $9A,$9A,$9A,$9A,$9A,$9A,$AB,$AB,$BB,$BB
	DB $9A,$9A,$9A,$9A,$9A,$9A,$9A,$9A,$AA,$AA
	DB $19,$19,$19,$19,$19,$19,$1A,$1A,$11,$12
	DB $59,$59,$59,$59,$59,$59,$59,$59,$5A,$5A
	DB $19,$19,$19,$19,$19,$19,$29,$29,$39,$39
	DB $59,$59,$59,$59,$59,$59,$69,$69,$79,$79
	DB $19,$19,$19,$19,$19,$19,$19,$1A,$1A,$11
	DB $59,$59,$59,$59,$59,$59,$59,$5A,$5A,$55
	DB $15,$15,$15,$15,$15,$25,$25,$26,$26,$36
	DB $9A,$9A,$9A,$9A,$9A,$9B,$9B,$9F,$9F,$AF
DATA_038F9A:
	DB $C0,$B0,$B0,$00,$00,$C0,$B0,$00
	DB $00,$00,$C0,$00,$00,$00,$00,$00
	DB $F6,$F3,$F1,$00,$FE,$FD,$FC,$00
	DB $FE,$FD,$FC,$00,$F6,$F3,$C1,$00
	
	
	
	
	
	
DoDecompressTileset:
	php
	rep #$20
	lda #$2800
	sta $70002C
	sep #$20
	lda #$01
	ldx #$B301
	jsl RunSuperFXRoutine
	plp
	rtl
DoDecompressTilemap:
	php
	rep #$20
	lda #$00C0
	sta $700090
	lda #$4000
	sta $70002C
	sep #$20
	lda #$01
	ldx #$B301
	jsl RunSuperFXRoutine
	plp
	rtl
CODE_03AB60:
	php
	rep #$20
	lda #$0000
	sta $700090
	lda #$4000
	sta $70002C
	sep #$20
	lda #$01
	ldx #$B301
	jsl RunSuperFXRoutine
	plp
	rtl
CODE_03AB7E:
	php
	rep #$20
	lda #$2800
	sta $70002C
	sep #$20
	lda #$01
	ldx #$B301
	jsl RunSuperFXRoutine
	plp
	rtl
DecompressTileset:
	rep #$20
	pla
	tax
	clc
	adc #$0007
	pha
	lda #$0000
	sta $700090
	lda $030003,x
	and #$00FF
	sta $700064
	lda $030001,x
	sta $700062
	lda $030004,x
	sta $188A
	lda $030006,x
	sta $188C
	sep #$20
	jsl DoDecompressTileset
	rts
DoDecompressTilemap:
	rep #$20
	pla
	tax
	clc
	adc #$0007
	pha
	lda $030001,x
	sta $700062
	lda $030003,x
	and #$00FF
	sta $700064
	lda $030004,x
	sta $188E
	lda $030006,x
	sta $1890
	sep #$20
	jsl DoDecompressTilemap
	rts
CODE_03ABFE:
	rep #$20
	pla
	tax
	clc
	adc #$0005
	pha
	lda $030001,x
	sta $1892
	sep #$20
	lda $030003,x
	sta $1894
	rep #$20
	lda $030004
	sta $1895
	lda $1892
	clc
	adc #$00DF
	tay
	phy
	sep #$20
	phb
	lda
	pha
	plb
	ldx #$00DF
CODE_03AC34:
	lda $0000,y
	sta $1789,x
	dey
	dex
	bpl CODE_03AC34
	plb
	ply
	rts
DATA_03AC42:
	DB $00,$00,$00,$03,$5F,$90
	DB $00,$00,$00,$03,$03,$91
	DB $00,$00,$00,$03,$07,$91
	DB $00,$00,$00,$03,$A0,$91
	DB $00,$00,$00,$03,$0B,$91
	DB $00,$00,$00,$03,$DF,$92
	DB $00,$00,$00,$03,$10,$94
	DB $00,$00,$00,$03,$9C,$94
	DB $00,$00,$00,$03,$2F,$95
	DB $00,$00,$00,$03,$C7,$95
	DB $00,$00,$00,$03,$5A,$96
	DB $00,$00,$00,$03,$DC,$96
	DB $00,$00,$00,$03,$5E,$97
	DB $00,$00,$00,$03,$D6,$97
	DB $00,$00,$00,$03,$A4,$98
	DB $00,$00,$00,$03,$30,$99
	DB $00,$00,$00,$03,$D0,$99
	DB $00,$00,$00,$03,$73,$9A
	DB $00,$00,$00,$03,$1F,$9B
	DB $00,$00,$00,$03,$C2,$9B
	DB $00,$00,$00,$03,$5B,$9C
	DB $00,$00,$00,$03,$D3,$A7
	DB $00,$00,$00,$03,$F1,$9C
	DB $00,$00,$00,$03,$7D,$9D
	DB $00,$00,$00,$03,$4B,$9E
	DB $00,$00,$00,$03,$4F,$9F
	DB $00,$00,$00,$03,$DC,$9F
	DB $00,$00,$00,$03,$F4,$A0
	DB $00,$00,$00,$03,$F2,$A1
	DB $00,$00,$00,$03,$88,$A2
	DB $00,$00,$00,$03,$45,$A3
	DB $00,$00,$00,$03,$D1,$A3
	DB $00,$00,$00,$03,$6E,$A4
	DB $00,$00,$00,$03,$72,$A4
	DB $00,$00,$00,$03,$FE,$A4
	DB $00,$00,$00,$03,$8B,$A5
	DB $00,$00,$00,$03,$03,$A6
	DB $00,$00,$00,$03,$A7,$A6
	DB $00,$00,$00,$03,$33,$A7
	DB $00,$00,$00,$03,$BA,$8F
	DB $00,$00,$00,$03,$DB,$A8
	DB $00,$00,$00,$03,$F5,$A9
	DB $00,$00,$00,$03,$5B,$A8
	DB $00,$00,$00,$03,$63,$A9
	DB $00,$00,$00,$03,$6B,$93
	DB $00,$00,$00,$03,$35,$92
	DB $00,$00,$00,$00,$00,$00
	DB $00
	
	
	
	
	
	
CODE_03AD5D:
	php
	rep #$10
	ldx #$0000
	jsr HandleAudio
	plp
	rtl
CODE_03AD68:
	php
	rep #$10
	ldx #$001C
	jsr HandleAudio
	plp
	rtl
CODE_03AD73:
	php
	rep #$10
	ldx #$0025
	jsr HandleAudio
	plp
	rtl
CODE_03AD7E:
	php
	rep #$10
	ldx #$0033
	jsr HandleAudio
	plp
	rtl
CODE_03AD89:
	php
	rep #$10
	ldx #$0041
	jsr HandleAudio
	plp
	rtl
	
	
	
	
	
	


CODE_03BD7A:
	php
	sep #$20
	lda #$DE
	sta ScanlineToWaitFor
	jsl WaitScanline
	lda #$00
CODE_03BD88:
	dec a
	bne CODE_03BD88
	plp
	rts
WaitScanline:		;03BD8D
	php
	rep #$30
	phx
	pha
	sep #$20
	stz $16DC
WaitScanline_L1:
	sep #$20
	lda SLHV	;(2137)
	lda OPVCT	;(213D)
	xba
	lda OPVCT	;(213D)
	xba
	cmp ScanlineToWaitFor
	bne WaitScanline_L1
	rep #$30
	pla
	plx
	plp
	rtl
CODE_03BDAF:		;03BDAF
	php
	sep #$20
	lda #$03
	sta $16EC
	stz $1898
	rep #$20
	lda #$00FC
	sta $16CE
	lda #$0092
	sta $16D0
	lda #$0018
	sta $16D2
	lda #$019A
	sta $16D4
	stz $16D6
	stz $16DD
	stz $16DF
	plp
	rtl
Main:			;03BDDF
	sep #$20
	rep #$10
	jsr $D11C
	stz $1F51
	ldx #$0000
	stx $1F4F
	stx $1F4D
	stz $1FCF
	sei
	rep #$20
	lda #$0000
	sta $7001D6
	sta $16E4
	lda #$0000
	sta $7001D8
	sta $16E6
	lda #$0096
	sta $16E8
	sta $7001DA
	ldx #$1281
	stx D,$30
	stz D,$34
	lda #$0001
	sta D,$36
	jsl $03CD09
	jsr $C511
	sep #$20
	lda D,$45
	lsr
	lsr
	sta SCBR
	lda #$FF
	sta $16D9
	lda #$06
	sta $70009A
	jsr $CA7B
	jsr $C71C
	jsr $C891
	jsr $C71C
	jsr $C891
	jsl $03CB35
	rep #$30
	lda #$2020
	sta VMADDL
	ldx #$0000
Main_L1:
	lda $A08B,x
	sta VMDATAL
	inx
	inx
	cpx #$03C0
	bne Main_L1
	lda #$5020
	sta VMADDL
	ldx #$0000
Main_L2:
	lda $A08B,x
	sta VMDATAL
	inx
	inx
	cpx #$03C0
	bne Main_L2
	rep #$20
	stz D,$04
	lda #$0010
	sta $15C2
	dec $16D6
	bmi Main_L3
	inc $16D6
	jsl $03CC3E
	lda $16D9
	pha
	dec $16D6
	jsl $03CC3E
	pla
Main_L3:
	pha
	inc $16D6
	sep #$20
	rep #$10
	lda $16D9
	bpl Main_L4
	lda #$00
Main_L4:
	rep #$20
	asl a
	tax
	lda $03D408,x
	sta D,$32
	sta D,$38
	jsr $C67F
	sep #$30
	lda #$08
	sta HDMAEN
	lda #$BE
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$30
	lda #$64
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$30
	rep #$20
	pla
	sep #$20
	pha
	lda $004211
	cli
	jsl $03AD89
	pla
	cmp #$0E
	beq Main_L5
	cmp #$0A
	bne Main_L6
Main_L5:
	lda #$0F
	sta $1F47
	stz $1F46
Main_L6:
	lda #$FF
Main_L7:
	pha
	lda #$C8
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$30
	jsr $BD7A
	pla
	inc a
	inc a
	sta $7E4608
	sta $7E460A
	sta $7E460C
	cmp #$0F
	bne Main_L7
	sep #$20
	rep #$10
	lda $16D6
	beq Main_L8
	brl Main_L20
Main_L8:
	lda #$0A
	sta $16D6
	rep #$20
	lda #$0010
	sta $70009A
Main_L9:
	inc $15BB
	jsr CODE_03C511
	jsr CODE_03C58F
	lda $70009A
	pha
	lda #$0006
	sta $70009A
	lda #$FFFE
	sta $16D9
	jsr CODE_03CA7B
	pla
	sta $70009A
	jsr CODE_03C78D
	lda $70009A
	beq Main_L10
	sec
	sbc #$0004
	sta $70009A
Main_L10:
	jsr CODE_03C891
	lda $15BB
	bit #$0002
	beq Main_L11
	jsl CODE_03CC3E
	bra Main_L12
Main_L11:
	jsl CODE_03CC22
Main_L12:
	jsl CODE_03CBFB
	lda $1209
	bit #$2F00
	beq Main_L17
	lda #$0010
	sta $70009A
	jsr CODE_03BD7A
	jsl CODE_03CC22
	lda $1209
	bit #$2A00
	sep #$20
	bne Main_L14
	lda $16D8
	inc
	cmp #$03
	bne Main_L13
	lda #$00
Main_L13:
	sta $16D8
	bra Main_L16
Main_L14:
	lda $16D8
	dec
	cmp #$FF
	bne Main_L15
	lda #$02
Main_L15:
	sta $16D8
Main_L16:
	lda #$11
	jsl CODE_03B7F9
	jsl CODE_03C67F
	rep #$20
Main_L17:
	lda $1209
	bit #$9080
	bne Main_L18
	brl Main_L9
Main_L18:
	stz $16D6
	stz $16D9
Main_L19:
	jsl CODE_03CC3E
	sep #$20
	lda #$F1
	sta $1F47
	stz $1F46
	rep #$20
	jmp Main_L23
Main_L20:
	sep #$20
	jsr CODE_03C67F
Main_L21:
	ldx D,$02
	phx
	lda #$FF
	sta $16D9
	jsr CODE_03C511
	jsr CODE_03C58F
	jsr CODE_03CA7B
	jsr CODE_03C78D
	jsr CODE_03C891
	plx
	stx D,$02
	jsr CODE_03C484
	bcc Main_L21
	jsr CODE_03BD7A
	jsl CODE_03CC3E
	lda #$08
	sta D,CurNMITask
	lda $16D9
	pha
	lda #$FE
	sta $16D9
Main_L22:
	jsr CODE_03C511
	jsr CODE_03C58F
	jsr CODE_03CA7B
	jsr CODE_03C78D
	jsr CODE_03C891
	jsl CODE_03CBFB
	rep #$20
	lda $1209
	bit #$D0C0
	sep #$20
	beq Main_L22
	pla
	sta $16D9
Main_L23:
	sep #$20
	rep #$10
	lda #$F1
	sta $1F47
	stz $1F46
	lda #$10
	jsl CODE_03B7F9
	lda #$01
	sta D,$34
	lda #$53
Main_L24:			;03C04C
	pha
	jsr CODE_03BD7A
	pla
	dec
	bne Main_L24
	sei
	lda #$E0
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	jsr CODE_03C611
	jsr CODE_03BD7A
	jsr CODE_03BD7A
	sep #$20
	rep #$10
	ldx #$0000
Main_L25:
	phx
	lda #$01
Main_L26:
	pha
	txa
	jsr CODE_03CB4F
	pla
	dec
	bne Main_L26
	plx
	txa
	ora #$E0
	sta COLDATA
	inx
	cpx #$0020
	bne Main_L25
	jsr CODE_03C74D
	sep #$20
	jsr CODE_03BD7A
Main_L27:
	sep #$20
	lda SLHV
	lda OPHCT
	xba
	lda OPHCT
	xba
	rep #$20
	and #$01FF
	cmp #$0000
	bcc Main_L27
	cmp #$000F
	bcs Main_L27
	sep #$20
	lda #$01
	sta TM
	rep #$20
	jsr CODE_03C5BF
	jsr CODE_03C956
	lda TIMEUP
	rep #$20
	cli
	jsr CODE_03C78D
	sei
	jsr CODE_03C896
	jsr CODE_03C5C0
	stz D,$10
	stz D,$11
	stz D,$14
	stz D,$16
	stz D,$1E
	stz D,$20
	ldx #$20
Main_L28:
	phx
	stx D,$1C
	jsr CODE_03C8CB
	rep #$20
	lda D,$18
	clc
	adc D,$10
	sta D,$10
	lda D,$1A
	clc
	adc D,$12
	sta D,$12
	jsr CODE_03BD7A
	sep #$20
	lda D,$10
	sta BG1HOFS
	lda D,$11
	sta BG1HOFS
	lda D,$12
	sta BG1VOFS
	lda D,$13
	sta BG1VOFS
	plx
	dex
	bne Main_L28
	sep #$20
	rep #$10
	lda #$02
	sta HDMAEN
	lda #$64
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda #$62
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	rep #$20
	lda #$0000
	sta $700090
	lda #$0011
	sta $700064
	lda #$FB89
	sta $700062
	lda #$6820
	sta $188A
	lda #$1000
	sta $188C
	sep #$20
	jsl CODE_03AB2B
	lda #$B8
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	jsl CODE_7E33BA
	rep #$20
	lda #$0017
	sta $700064
	lda #$8718
	sta $700062
	lda #$7C00
	sta $188A
	lda #$0800
	sta $188C
	lda #$0002
	sta $700090
	sep #$20
	jsl CODE_03AB7E
	lda #$B8
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	jsl CODE_7E33BA
	jsr CODE_03C5D4
	lda #$B8
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda #$03
	sta TM
	lda #$82
	sta CGADSUB
	stz CGWSEL
	lda #$FF
	sta COLDATA
	sta $7EF0C6
	ldx #$00BA
	stx VTIMEL
	lda #$22
	sta D,CurNMITask
	lda TIMEUP
	cli
	jsr CODE_03C777
	jsr CODE_03C763
	jsr CODE_03C74D
	rep #$20
	lda #$000F
	sta $7001F2
	lda #$7800
	sta $700030
	jsr CODE_03CA1C
	jsr CODE_03C87B
	sep #$20
	lda #$D8
	sta BG1VOFS
	stz BG1VOFS
	stz BG1HOFS
	stz BG1HOFS
	lda #$2C
	sta BG1SC
	rep #$20
	lda $16D9
	asl
	tax
	sep #$20
	lda DATA_03D391,x
	bit #$80
	bne Main_L29
	lda #$0D
	sta $1F47
	stz $1F46
	bra Main_L30
Main_L29:
	lda #$0B
	sta $1F47
	stz $1F46
Main_L30:
	ldx #$0028
Main_L31:
	phx
	jsr CODE_03C58F
	jsr CODE_03CA1C
	jsr CODE_03C87B
	rep #$20
	lda $16D9
	asl
	tax
	lda DATA_03D391,x
	bit #$80
	bne Main_L33
	lda $7001F2
	inc
	cmp #$007E
	beq Main_L34
	sta $7001F2
	plx
	cpx #$0014
	bne Main_L32
	sep #$20
	lda #$FE
	sta $7EF0C6
Main_L32:
	rep #$20
	inx
	phx
	bra Main_L34
Main_L33:
	rep #$20
	phx
	lda $7001F2
	inc
	cmp #$003A
	beq Main_L34
	sta $7001F2
Main_L34:
	lda $700022
	clc
	adc #$0400
	sta $700022
	lda $7001D6
	sec
	sbc #$000A
	sta $7001D6
	lda $7001DA
	clc
	adc #$000A
	sta $7001DA
	phx
	cpx #$0012
	bcs Main_L35
	txy
	sep #$20
	dex
	lda DATA_03D68C,x
	tyx
	rep #$20
Main_L35:
	dex
	beq Main_L36
	brl Main_L31
Main_L36:
	sep #$20
	rep #$10
	ldx #$00DE
	stx VTIMEL
	lda #$01
	sta SuperFXScreenMode
	lda #$00
	sta $7EF0C7
	lda #$22
	sta $7E4600
	lda #$DC
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	stz BG2VOFS
	stz BG2VOFS
	stz BG2HOFS
	stz BG2HOFS
Main_L37:
	jsr CODE_03C777
	jsr CODE_03D1BB
	jsr CODE_03C763
	rep #$20
	lda $7000BC
	sep #$20
	bne Main_L39
	lda $7000BE
	cmp #$27
	beq Main_L38
	lda #$89
	jsl CODE_03B7F9
Main_L38:
	lda $7EF0C7
	inc
	sta $7EF0C7
	bra Main_L37
Main_L39:
	lda #$00
	sta $7EF0C7
Main_L40:
	jsr CODE_03C777
	lda $7EF0C7
	pha
	lda #$FF
	sta $7EF0C7
	jsr CODE_03D1BB
	pla
	sta $7EF0C7
	jsr CODE_03D133
	jsr CODE_03C763
	rep #$20
	lda $7000BC
	sep #$20
	bne Main_L41
	lda $7000BE
	cmp #$27
	beq Main_L41
	lda #$89
	jsl CODE_03B7F9
Main_L41:
	lda #$32
Main_L42:
	pha
	jsl CODE_03CBE8
	lda #$78
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda $120A
	bit #$10
	bne Main_L43
	lda $120A
	bit #$80
	bne Main_L43
	lda $1209
	bit #$80
	bne Main_L43
	pla
	dec
	beq Main_L42
	lda $7EF0C7
	cmp #$FF
	beq Main_L44
	inc
	sta $7EF0C7
	bra Main_L40
Main_L43:
	pla
Main_L44:
	lda #$13
	jsl CODE_03B7F9
	lda #$E0
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda #$DE
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda #$E0
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda #$DE
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	sei
	sep #$20
	lda #$83
	sta CGADSUB
	stz CGWSEL
	lda #$E0
	sta COLDATA
	lda #$00
Main_L45:
	pha
	lda #$DD
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda #$DC
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	pla
	ora #$E0
	sta COLDATA
	and #$1F
	inc
	cmp #$20
	bne Main_L45
	jsr CODE_03D11C
	jsr CODE_03BD7A
	rep #$30
	lda $1FF7
	sta LevelScriptPointer
	sep #$20
	lda $1FF9
	sta LevelScriptBank
	rep #$20
	jml CODE_02E3C5
	
	

CODE_03C453:
	php
	sep #$20
	rep #$10
	jsl CODE_03CC3E
	lda $16D9
	rep #$20
	and #$FF
	asl
	asl
	tax
	lda $D36C,x
	sta $38
	sta $32
	sep #$20
	lda $16D6
	pha
	lda #$14
	sta $16D6
	jsl CODE_03CC3E
	pla
	sta $16D6
	plp
	rts


b03p3Col_PreShadedPalette:	;03D46C
	;Shaded versions of base colors
	DW $2906,$51DB,$56BF,$579F,$6FFF,$7E8D,$7F52,$7FFC
	DW $7FFF,$35CD,$5B16,$77FD,$7FFF,$7FFF,$7BF5,$5FEE
	DW $2906,$4578,$4A5F,$4B3F,$5BFF,$762A,$7EEF,$7FF8
	DW $7FFF,$294A,$4EB3,$6B9A,$7FFF,$7FFF,$6FF2,$53EB
	DW $2906,$3D36,$421D,$42FF,$4FFF,$6DE8,$7EAD,$7FF5
	DW $7FFD,$2108,$4671,$6358,$7FFF,$7FFF,$67F0,$4BA9
	DW $2906,$34F4,$39DB,$3ABF,$47FF,$65A6,$7E6B,$7FB3
	DW $7FFB,$18C6,$3E2F,$165B,$77FD,$7FFF,$5FEE,$4367
	DW $2906,$2CB2,$3199,$327F,$3FFF,$5D64,$7E29,$7F71
	DW $7FF9,$1084,$35ED,$52D4,$6FBB,$7FFF,$57EC,$3B25
	DW $2906,$2470,$2957,$2A3F,$37BF,$5522,$75E7,$7F2F
	DW $7FF7,$0842,$2DAB,$924A,$6779 $7FFF,$4FCA,$32E3
	DW $2906,$1C2E,$2115,$21FF,$2F7F,$4CE0,$6DA5,$7EED
	DW $7FF5,$0000,$2569,$4250,$5F37,$77FD,$4788,$2AA1
	DW $2906,$140C,$14B2,$0D5A,$1ADA,$3C60,$5900,$6A48
	DW $6F71,$0000,$1D27,$35ED,$4EB3,$6358,$32E3,$1A20
	DW $2906,$100B,$0C70,$00D6,$0A56,$3000,$4880,$59C4
	DW $5ACC,$0000,$10C4,$2DAB,$4250,$52D4,$2680,$0DC0
	DW $2906,$0809,$000D,$0052,$01D2,$2800,$3800,$4940
	DW $4A48,$0000,$0CA3,$2569,$35ED,$4250,$1A20,$0580
	DW $2906,$0007,$000A,$000E,$014E,$2000,$2C00,$38C0
	DW $39C4,$0000,$0882,$1D27,$298A,$31CC,$0DC0,$0140
	DW $2906,$0004,$0006,$0009,$00A9,$1400,$1C00,$2420
	DW $2520,$0000,$0040,$10C4,$1906,$1D27,$0140,$00E0
	DW $2906,$0003,$0004,$0006,$0046,$0C00,$1400,$2000
	DW $18C0,$0000,$0040,$0CA3,$10C4,$14E5,$0100,$00C0
	DW $2906,$0001,$0003,$0005,$0007,$0C00,$1000,$1800
	DW $1880,$0040,$0040,$0882,$0CA3,$10C4,$00A0,$00A0
	DW $2906,$0003,$0005,$0007,$000A,$0C20,$1040,$1860
	DW $2480,$0482,$0461,$0CC4,$10E5,$1506,$0521,$00E0
	;...plus 16 colors for sprites
	DW $2DAF,$03E5,$673A,$5295,$3DF0,$35AE,$252A,$6DA5
	DW $7EED,$7FFF,$7A1F,$707F,$301A,$0000,$0000,$0000
DATA_03D66C:
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$FF,$FE,$FD,$FC,$FA,$F8,$F6
	DB $F4,$F2,$F0,$EE,$EC,$EA,$E7,$E4
	DB $E1,$06,$00,$80
b03ps9LevHeader_LevelTable:	;03D6A0
	;Level 2
	DB $00,$E6,$00,$03,$04,$14,$00,$8C,$5C,$0D,$58,$01,$04,$4E,$00,$F8,$FF,$FF
	DB $02,$04,$00,$03,$04,$0E,$03,$72,$5E,$0D,$59,$01,$04,$4E,$00,$F8,$04,$4E,$00,$F8,$02,$0E,$08,$F8,$FF,$FF
	DB $01,$32,$00,$03,$09,$08,$05,$CD,$5E,$0D,$6A,$01,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF
	DB $01,$54,$00,$03,$12,$05,$09,$50,$5F,$0D,$6B,$01,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF
	DB $01,$72,$00,$03,$00,$00,$0F,$AB,$5F,$0D,$72,$01,$FF,$FF
	;Level 1
	DB $01,$56,$02,$03,$06,$15,$00,$8E,$4F,$0D,$58,$00,$02,$0E,$08,$F8,$FF,$FF
	DB $02,$02,$00,$03,$0B,$11,$02,$8E,$51,$0D,$59,$00,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF
	DB $01,$B4,$00,$03,$14,$0E,$06,$E9,$51,$0D,$5A,$00,$03,$0E,$08,$00,$FF,$FF
	DB $01,$C6,$00,$03,$18,$0B,$08,$AC,$54,$0D,$5B,$00,$04,$4E,$00,$F8,$FF,$FF
	DB $01,$D8,$00,$03,$00,$00,$0F,$28,$55,$0D,$5C,$00,$FF,$FF
	;Level 3
	DB $01,$62,$02,$03,$06,$17,$00,$F5,$62,$0D,$6C,$02,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF
	DB $02,$00,$00,$03,$0C,$15,$01,$1C,$65,$0D,$6D,$02,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$FF,$FF
	DB $01,$12,$01,$03,$12,$13,$04,$77,$65,$0D,$6E,$02,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF
	DB $01,$34,$01,$03,$1B,$13,$07,$FE,$65,$0D,$6F,$02,$02,$0E,$08,$F8,$04,$4E,$00,$F8,$FF,$FF
	DB $01,$4A,$01,$03,$1C,$0B,$0B,$42,$67,$0D,$70,$02,$04,$4E,$00,$F8,$FF,$FF
	DB $01,$5C,$01,$03,$00,$00,$0F,$DF,$67,$0D,$74,$02,$FF,$FF
	;Unknown?
	DB $01,$4A,$02,$03,$06,$0F,$03,$72,$5E,$0D,$59,$01,$00,$0E,$08,$F8,$00,$0E,$08,$F8,$00,$0E,$08,$F8,$FF,$FF
	;Black Hole (and copies?)
	DB $02,$06,$00,$03,$0C,$09,$0A,$CF,$47,$0D,$71,$00,$00,$0E,$08,$F8,$00,$0E,$08,$F8,$FF,$FF
	DB $01,$54,$00,$03,$0D,$0B,$0A,$CF,$47,$0D,$71,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$F8,$00,$0E,$08,$F8,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$FF,$FF
	DB $01,$D8,$00,$03,$0B,$0E,$0A,$CF,$47,$0D,$71,$00,$00,$0E,$08,$08,$00,$0E,$08,$08,$00,$0E,$08,$08,$00,$0E,$08,$08,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$FF,$FF
	;Unknown?
	DB $01,$34,$01,$03,$09,$10,$02,$8E,$51,$0D,$59,$00,$00,$0E,$00,$F8,$00,$0E,$00,$F8,$00,$0E,$08,$F8,$FF,$FF
	DB $02,$06,$00,$03,$0C,$19,$01,$1C,$65,$0D,$6D,$02,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$FF,$FF
	;Venom stages
	DB $01,$6E,$02,$03,$00,$00,$0F,$4F,$68,$0D,$74,$02,$FF,$FF
	DB $00,$03,$00,$00,$0F,$1B,$60,$0D,$72,$01,$FF,$FF
	DB $00,$03,$00,$00,$0F,$A5,$55,$0D,$5C,$00,$FF,$FF
	;Out of this Dimension
	DB $00,$03,$00,$00,$0E,$0B,$48,$0D,$73,$00,$FF,$FF

RunLevelScript:			;03EDA1
	php
	sep #$20
	phb
	jsr RunLevelScriptCommands
	plb
	plp
	rtl
RunLevelScriptCommands:
	sep #$20
	lda LevelScriptBank
	pha
	plb
	rep #$20
	lda $8000,x
	and #$FF
	txy
	tax
	jmp (LevelScriptCommandJumpTable,x)
LevelScriptCommandJumpTable:
	DW LevelCommand00_LoadObject16BehNum
	DW LevelCommand02
	DW LevelCommand04_LoopSection
	DW LevelCommand06_Reset
	DW LevelCommand08_Nop
	DW LevelCommand0A_RandomGroupBeh16
	DW LevelCommand0C
	DW LevelCommand0E_ShowStageNum
	DW LevelCommand10_SetupLevelBGMusicEtc
	DW LevelCommand12_SetZTimer16
	DW LevelCommand14_ChangeMusic
	DW LevelCommand16
	DW LevelCommand18
	DW LevelCommand1A
	DW LevelCommand1C
	DW LevelCommand1E
	DW LevelCommand20
	DW LevelCommand22
	DW LevelCommand24
	DW LevelCommand26
	DW LevelCommand28_CallScript
	DW LevelCommand2A_Return
	DW LevelCommand2C_JumpConditionally
	DW LevelCommand2E_Jump
	DW LevelCommand30
	DW LevelCommand32
	DW LevelCommand34
	DW LevelCommand36_SetObjPropertyByte
	DW LevelCommand38_SetObjPropertyWord
	DW LevelCommand3A_SetObjPropertyLong
	DW LevelCommand3C
	DW LevelCommand3E
	DW LevelCommand40
	DW LevelCommand42
	DW LevelCommand44_FadeToBlack
	DW LevelCommand46
	DW LevelCommand48
	DW LevelCommand4A
	DW LevelCommand4C
	DW LevelCommand4E
	DW LevelCommand50
	DW LevelCommand52
	DW LevelCommand54
	DW LevelCommand56
	DW LevelCommand58
	DW LevelCommand5A
	DW LevelCommand5C_StoreByte
	DW LevelCommand5E_StoreWord
	DW LevelCommand60_StoreLong
	DW LevelCommand62
	DW LevelCommand64
	DW LevelCommand66
	DW LevelCommand68
	DW LevelCommand6A
	DW LevelCommand6C
	DW LevelCommand6E
	DW LevelCommand70_LoadObject8BehNum
	DW LevelCommand72
	DW LevelCommand74_LoadMacroObj16
	DW LevelCommand70_LoadObject8BehNum
	DW LevelCommand78_RunASMBlock
	DW LevelCommand7A
	DW LevelCommand7C_BranchLessThan
	DW LevelCommand7E_BranchGreaterThan
	DW LevelCommand80_BranchEqual
	DW LevelCommand82
	DW LevelCommand84
	DW LevelCommand86_LoadObject16BehAddr
	DW LevelCommand14_ChangeMusic
	DW LevelCommand8A_SetZTimer8
	DW LevelCommand8C_SetBehEvent
LevelCommand8C_SetBehEvent:
	tyx
	phx
	ldx $16F7
	bne LevelCommand8C_SetBehEvent_L2
LevelCommand8C_SetBehEvent_L1:
	plx
	jmp LevelCommand8C_SetBehEvent_L3
LevelCommand8C_SetBehEvent_L2:
	plx
	ldy $16F7
	lda $8001,x
	sta $0028,y
LevelCommand8C_SetBehEvent_L3:
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand8A_SetZTimer8:
	tyx
	lda $8001,x				;\Get next byte...
	and #$00FF				;|
	asl					;|...shift left four bits...
	asl					;|
	asl					;|
	asl					;|
	sta ZTimer				;/...and store in ZTimer
	inx					;\Increment level script pointer twice...
	inx					;|
	stx LevelScriptPointer			;|
	rts					;/..efore stopping level script processing this frame
LevelCommand14_ChangeMusic:
	tyx
	sep #$20
	lda $14D7				;\Check if we are allowed to change the music...
	and #$80				;|
	bne LevelCommand14_ChangeMusic_L1	;/...and if not, skip this
	lda $8001,x				;\Get next byte...
	sta $1F47				;|...and store in current music ID...
	stz $1F46				;/...clearing the music loaded flag too
LevelCommand14_ChangeMusic_L1:
	inx					;\Increment level script pointer twice...
	inx					;|
	jmp RunLevelScriptCommands		;/..efore getting the next command byte
LevelCommand82:
	tyx
	phx
	lda $8001,x
	jsl CODE_03E9CF
	plx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand78_RunASMBlock:
	tyx
	txa
	clc
	adc #$00
	bra LevelCommand8C_SetBehEvent_L1
CODE_03EEAA:
	sep #$20
	lda #$00
	pha
	plb
	lda #$03
	pha
	ldy #$EDAA
	phy
	lda LevelScriptBank
	pha
	phx
	ldx $16F7
	rtl
LevelCommand7A:
	tyx
	phx
	sep #$20
	lda #$03
	pha
	ldy #$EEDA
	phy
	lda $8003,x
	pha
	ldy $8001,x
	phy
	ldx $16F7
	lda #$00
	pha
	plb
	rtl
CODE_03EEDB:
	rep #$30
	plx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand7C_BranchLessThan:
	tyx
	lda $8001,x
	sta D,$5D
	lda $8002,x
	sta D,$5E
	sep #$20
	lda [D,$5D]
	cmp $8004,x
	bpl LevelCommand7C_BranchLessThan_L1
	rep #$20
	lda $8005,x
	tax
	jmp RunLevelScriptCommands
LevelCommand7C_BranchLessThan_L1:
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand7E_BranchGreaterThan:
	tyx
	lda $8001,x
	sta D,$5D
	lda $8002,x
	sta D,$5E
	sep #$20
	lda [D,$5D]
	cmp $8004,x
	beq LevelCommand7E_BranchGreaterThan_L1
	bmi LevelCommand7E_BranchGreaterThan_L1
	rep #$20
	lda $8005,x
	tax
	jmp RunLevelScriptCommands
LevelCommand7E_BranchGreaterThan_L1:
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand80_BranchEqual:
	tyx
	lda $8001,x
	sta D,$5D
	lda $8002,x
	sta D,$5E
	sep #$20
	lda [D,$5D]
	cmp $8004,x
	bne LevelCommand80_BranchEqual_L1
	rep #$20
	lda $8005,x
	tax
	jmp RunLevelScriptCommands
LevelCommand80_BranchEqual_L1:
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand6C:
	tyx
	inx
	ldy #$001E
	sty $1EE9
	sty $1EEB
	ldy #$0002
	sty $1EEF
	lda #$001E
	sta $1EED
	jmp RunLevelScriptCommands
LevelCommand6E:
	tyx
	inx
	ldy #$003E
	sty $1EE9
	sty $1EEB
	ldy #$0002
	sty $1EEF
	lda #$001E
	sta $1EED
	jmp RunLevelScriptCommands
CODE_03EF90:
	php
	rep #$30
	lda $1774
	beq CODE_03EFA7
	sta $1EE9
	ldy #$0002
	sty $1EEF
	lda #$001E
	sta $1EED
CODE_03EFA7:
	plp
	rtl
LevelCommand68:
	tyx
	phx
	ldx $16F7
	bne LevelCommand68_L1
	plx
	jmp LevelCommand68_L2
LevelCommand68_L1:
	plx
	lda $8001,x
	clc
	adc $16F7
	tay
	lda $8003,x
	sta D,$5D
	lda $8004,x
	sta D,$5E
	sep #$20
	lda [D,$5D]
	clc
	adc $0000,y
	sta $0000,y
LevelCommand68_L2:
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand6A:
	tyx
	phx
	ldx $16F7
	bne LevelCommand6A_L1
	plx
	jmp LevelCommand6A_L2
LevelCommand6A_L1:
	plx
	lda $8001,x
	clc
	adc $16F7
	tay
	lda $8003,x
	sta D,$5D
	lda $8004,x
	sta D,$5E
	rep #$20
	lda [D,$5D]
	clc
	adc $0000,y
	sta $0000,y
LevelCommand6A_L2:
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand66:
	tyx
	phx
	jsl CODE_03F018
	plx
	inx
	jmp RunLevelScriptCommands
CODE_03F018:
	lda $1F13
	ora #$0008
	sta $1F13
	rtl
CODE_03F022:
	php
	rep #$30
	ldx $1238
	beq CODE_03F046
	lda $1786
	ora $1787
	beq CODE_03F04A
	lda $1F05
	and #$00FF
	bne CODE_03F04A
	lda $1786
	sta D,$16,x
	lda $1787
	sta D,$17,x
	bra CODE_03F04A
CODE_03F046:
	jml DoSoftReset
CODE_03F04A:
	sep #$20
	stz $1F05
	lda $16C9
	sta $1FE4
	lda $1785
	bit #$18
	beq CODE_03F071
	bit #$08
	beq CODE_03F067
	lda #$01
	sta $16F9
	bra CODE_03F074
CODE_03F067:
	lda #FF
	sta $16F9
	sta $16FA
	bra CODE_03F077
CODE_03F071:
	stz $16F9
CODE_03F074:
	stz $16FA
CODE_03F077:
	lda $1785
	bit #$01
	beq CODE_03F083
	jsr CODE_03F484
	bra CODE_03F086
CODE_03F083:
	jsr CODE_03F4AB
CODE_03F086:
	lda $1785
	bit #$02
	beq CODE_03F094
	lda #$01
	sta $1953
	bra CODE_03F097
CODE_03F094:
	stz $1953
CODE_03F097:
	lda #$00
	sta $701A26
	sta $701A27
	lda $1785
	bit #$20
	beq CODE_03F0B4
	lda #$01
	sta $701A26
	sta $701A27
	bra CODE_03F0C2
CODE_03F0B4:
	bit #$40
	beq CODE_03F0CA
	lda #$02
	sta $701A26
	sta $701A27
CODE_03F0C2:
	lda #$FF
	sta $16F9
	sta $16FA
CODE_03F0CA:
	lda $1785
	bit #$04
	beq CODE_03F0D8
	lda #$01
	sta $16F1
	bra CODE_03F0DB
CODE_03F0D8:
	stz $16F1
CODE_03F0DB:
	plp
	rtl
LevelCommand60_StoreLong:
	tyx
	lda $8001,x
	sta D,$5D
	lda $8002,x
	sta D,$5E
	lda $8004,x
	sta [D,$5D]
	inc D,$5D
	inc D,$5D
	sep #$20
	lda $8006,x
	sta [D,$5D]
	inx
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand5E_StoreWord:
	tyx
	lda $8003,x
	sta D,$5D
	lda $8004,x
	sta D,$5E
	lda $8001,x
	sta [D,$5D]
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand5C_StoreByte:
	tyx
	lda $8002,x
	sta D,$5D
	lda $8003,x
	sta D,$5E
	sep #$20
	lda $8001,x
	sta [D,$5D]
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand5A:
	tyx
	phx
	ldx $16F7
	bne LevelCommand5A_L1
	plx
	jmp LevelCommand5A_L2
LevelCommand5A_L1:
	plx
	ldy $16F7
	sep #$20
	lda #$01
	sta $001D,y
	inc $173C
LevelCommand5A_L2:
	inx
	jmp RunLevelScriptCommands
LevelCommand84:
	tyx
	phx
	ldx $16F7
	bne LevelCommand84_L1
	plx
	jmp LevelCommand84_L2
LevelCommand84_L1:
	plx
	ldy $16F7
	sep #$20
	lda #$80
	sta $0020,y
	inc $173C
LevelCommand84_L2:
	inx
	jmp RunLevelScriptCommands
LevelCommand56:
	tyx
	sep #$20
	stz $16F1
	inx
	jmp RunLevelScriptCommands
LevelCommand58:
	tyx
	sep #$20
	lda #$01
	sta $16F1
	inx
	jmp RunLevelScriptCommands
LevelCommand52_DisableScreen:
	tyx
	sep #$20
	stz $18B2
	stz $18B3
	lda #$80
	jsl CODE_02F8DF
	sta INIDISP
	inx
	jmp RunLevelScriptCommands
LevelCommand54_EnableScreen:
	tyx
	sep #$20
	stz $18B2
	lda #$0F
	sta $18B3
	jsl CODE_02F8DF
	sta INIDISP
	inx
	jmp RunLevelScriptCommands
LevelCommand4C:
	tyx
	sep #$20
	lda $18B3
	bne LevelCommand4C_L1
	cmp #$80
	bne LevelCommand4C_L1
	inx
	jmp RunLevelScriptCommands
LevelCommand4C_L1:
	lda #$01
	sta ZTimer
	stz ZTimer+1
	stx LevelScriptPointer
	rts
LevelCommand4A:
	tyx
	phx
	ldx $16F7
	bne LevelCommand4A_L1
	plx
	jmp LevelCommand4A_L2
LevelCommand4A_L1:
	plx
	lda $8001,x
	sta D,$5D
	lda $8002,x
	sta D,$5E
	lda $16F7
	sta [D,$5D]
LevelCommand4A_L2:
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand46:
	tyx
	phx
	ldx $16F7
	bne LevelCommand46_L1
	plx
	jmp LevelCommand46_L2
LevelCommand46_L1:
	plx
	lda $8001,x
	clc
	adc $16F7
	tay
	lda $8003,x
	sta D,$5D
	lda $8004,x
	sta D,$5E
	sep #$20
	lda [D,$5D]
	sta $0000,y
LevelCommand46_L2:
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand48:
	tyx
	phx
	lda $16F7
	bne LevelCommand48_L1
	plx
	jmp LevelCommand48_L2
LevelCommand48_L1:
	plx
	lda $8001,x
	clc
	adc $16F7
	tay
	lda $8003,x
	sta D,$5D
	lda $8004,x
	sta D,$5E
	rep #$20
	lda [D,$5D]
	sta $0000,y
LevelCommand48_L2:
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand42:
	tyx
	sep #$20
	lda #$01
	sta $18B2
	inx
	jmp RunLevelScriptCommands
LevelCommand44_FadeToBlack:
	tyx
	sep #$20
	lda #$FF
	sta $18B2
	inx
	jmp RunLevelScriptCommands
LevelCommand4E:
	tyx
	sep #$20
	lda #$02
	sta $18B2
	inx
	jmp RunLevelScriptCommands
LevelCommand50:
	tyx
	sep #$20
	lda #$FE
	sta $18B2
	inx
	jmp RunLevelScriptCommands
LevelCommand36_SetObjPropertyByte:
	tyx
	phx
	ldx $16F7
	bne LevelCommand36_SetObjPropertyByte_L1
	plx
	jmp LevelCommand36_SetObjPropertyByte_L2
LevelCommand36_SetObjPropertyByte_L1:
	phx
	lda $8001,x
	clc
	adc $16F7
	tay
	sep #$20
	lda $8003,x
	sta $0000,y
LevelCommand36_SetObjPropertyByte_L2:
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand38_SetObjPropertyWord:
	tyx
	phx
	ldx $16F7
	bne LevelCommand38_SetObjPropertyWord_L1
	plx
	jmp LevelCommand38_SetObjPropertyWord_L2
LevelCommand38_SetObjPropertyWord_L1:
	plx
	lda $8001,x
	clc
	adc $16F7
	tay
	lda $8003,x
	sta $0000,y
LevelCommand38_SetObjPropertyWord_L2:
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand3A_SetObjPropertyLong:
	tyx
	phx
	ldx $16F7
	bne LevelCommand3A_SetObjPropertyLong_L1
	plx
	jmp LevelCommand3A_SetObjPropertyLong_L2
LevelCommand3A_SetObjPropertyLong_L1:
	plx
	lda $8001,x
	clc
	adc $16F7
	tay
	lda $8003,x
	sta $0000,y
	sep #$20
	lda $8005,x
	sta $0002,y
LevelCommand3A_SetObjPropertyLong_L2:
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand3C:
	tyx
	phx
	lda $16F7
	bne LevelCommand3C_L1
	plx
	jmp LevelCommand3C_L2
LevelCommand3C_L1:
	plx
	lda $16F7
	clc
	adc $8001,x
	txy
	tax
	sep #$20
	lda $8003,x
	sta $7E2000,x
	tyx
LevelCommand3C_L2:
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand3E:
	tyx
	phx
	ldx $16F7
	bne LevelCommand3E_L1
	plx
	jmp LevelCommand3E_L2
LevelCommand3E_L1:
	plx
	lda $16F7
	clc
	adc $8001,x
	txy
	tax
	lda $8003,x
	sta $7E2000,x
	tyx
LevelCommand3E_L2:
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand40:
	tyx
	phx
	ldx $16F7
	bne LevelCommand40_L1
	plx
	jmp LevelCommand40_L2
LevelCommand40_L1:
	plx
	lda $16F7
	clc
	adc $8001,x
	txy
	tax
	lda $8003,x
	sta $7E2000,x
	sep #$20
	lda $8005,x
	sta $7E2002,x
	tyx
LevelCommand40_L2:
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
CODE_03F369:
	tyx
	lda $8001,x
	sta ZTimer
	inx
	inx
	inx
	stx LevelScriptPointer
	rts
LevelCommand30:
	tyx
	sep #$20
	phx
	ldx $16F7
	bne LevelCommand30_L1
	plx
	jmp LevelCommand30_L2
LevelCommand30_L1:
	plx
	lda $8001,x
	ldy $16F7
	sta $0012,y
LevelCommand30_L2:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand32:
	tyx
	phx
	ldx $16F7
	bne LevelCommand32_L1
	plx
	jmp LevelCommand32_L2
LevelCommand32_L1:
	plx
	sep #$20
	lda $8001,x
	ldy $16F7
	sta $0012,y
LevelCommand32_L2:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand34:
	tyx
	sep #$20
	phx
	ldx $16F7
	bne LevelCommand34_L1
	plx
	jmp LevelCommand34_L2
LevelCommand34_L1:
	plx
	lda $8001,x
	ldy $16F7
	sta $0014,x
LevelCommand34_L2:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand2E_Jump:
	tyx
	sep #$20
	lda $8003,x
	sta LevelScriptBank
	rep #$20
	lda $8001,x
	tax
	jmp RunLevelScriptCommands
LevelCommand2C_JumpConditionally:
	tyx
	phx
	sep #$20
	lda #$03
	pha
	rep #$20
	lda #LevelCommand2C_JumpConditionally_L1
	pha
	sep #$20
	lda $8003,x
	pha
	rep #$20
	lda $8001,x
	dec
	pha
	sep #$20
	lda #$00
	pha
	plb
LevelCommand2C_JumpConditionally_L1:
	rtl
CODE_03F3FE:
	bcs CODE_03F41A
	sep #$20
	lda LevelScriptBank
	pha
	plb
	rep #$30
	plx
	inx
	inx
	inx
	inx
	inx
	inx
	stx LevelScriptPointer
	lda #$0001
	sta ZTimer
	rts
CODE_03F41A:
	sep #$20
	lda LevelScriptBank
	pha
	plb
	rep #$30
	plx
	lda $8004,x
	tax
	jmp RunLevelScriptCommands
LevelCommand28_CallScript:
	tyx
	ldy $1730
	txa
	sta $1703,y
	sep #$20
	lda LevelScriptBank
	sta $1705,y
	rep #$20
	iny
	iny
	iny
	sty $1730
	sep #$20
	lda $8003,x
	sta LevelScriptBank
	rep #$20
	lda $8001,x
	tax
	inc $1732
	jmp RunLevelScriptCommands
LevelCommand2A_Return:
	tyx
	ldy $1730
	dey
	sep #$20
	lda $1703,y
	sta LevelScriptBank
	rep #$20
	dey
	dey
	ldx $1703,y
	sty $1730
	inx
	inx
	inx
	inx
	dec $1732
	jmp RunLevelScriptCommands
LevelCommand1E:
	tyx
	jsr CODE_03F484
	inx
	jmp RunLevelScriptCommands
CODE_03F480:
	jsr CODE_03F484
	rtl
CODE_03F484:
	php
	sep #$20
	lda $194D
	sta BG2VOFS
	lda $194E
	sta BG2VOFS
	lda #$01
	sta $1954
	lda #$02
	sta BGMODE
	plp
	rts
LevelCommand20:
	tyx
	jsr CODE_03F4AB
	inx
	jmp RunLevelScriptCommands
CODE_03F4A7:
	jsr CODE_03F4AB
	rtl
CODE_03F4AB:
	php
	sep #$20
	stz $1954
	lda #$01
	sta BGMODE
	lda $194D
	sta BG2VOFS
	lda $194E
	sta BG2VOFS
	plp
	rts
LevelCommand22:
	tyx
	sep #$20
	lda #$01
	sta $1953
	inx
	jmp RunLevelScriptCommands
LevelCommand24:
	tyx
	sep #$20
	stz $1953
	inx
	jmp RunLevelScriptCommands
LevelCommand1C:
	tyx
	sep #$20
	lda $8001,x
	sta $1955
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand16:
	tyx
	stz $16F9
	inx
	jmp RunLevelScriptCommands
LevelCommand18:
	tyx
	lda #$0001
	sta $16F9
	inx
	jmp RunLevelScriptCommands
LevelCommand1A:
	tyx
	lda #$FFFF
	sta $16F9
	inx
	jmp RunLevelScriptCommands
LevelCommand64:
	tyx
	phx
	lda $16DF
	tax
	
	
	
	
	
	
	
	
