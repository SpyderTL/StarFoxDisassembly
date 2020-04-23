	;Unknown data
	DW $00E4,$0064
;;;;;;;;;;;;;;;
;MATERIAL DATA;
;;;;;;;;;;;;;;;
;The following data are material tables used by the models in the game.
;Each model has an offset associated with it, which is the offset to material 0.
;;;;;;;;
;FORMAT;
;;;;;;;;
;Materials with the first and second byte matching, and from $00-$09, are lit/shaded colors.
;The exact shade used depends on the distance and orientation of the object.
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
	;EXPLOSION?
	DW $4639,$8524,$4639,$463A
	DW $4639,$463A
	;WEIRD ASTEROID SPRITE
	DW $4018,$4018
	;WEAK EXPLOSION
	DW $8814
	;SPARKS
	DW $8825
	;FLASHING RED/BLUE SHOT
	DW $880F
	;SLIGHTLY WEAK EXPLOSION
	DW $8837
	;MEDIUM EXPLOSION
	DW $8840
	;FULL EXPLOSION
	DW $8851
	;FLASHING BLUE
	DW $87F5
	;FLASHING YELLOW
	DW $8806
	;FLASHING WHITE
	DW $87E4
	;SMALL GRAY ASTEROID
	DW $401B
	;SMALL GRAY ASTEROID WITH FACE
	DW $401F
	;FLASHING RED/YELLOW
	DW $87DF
	;SPLASH
	DW $88BF,$882E
	;EGG
	DW $40AA
	;ROCKET LIZARD
	DW $40DF,$40DF
	;NOVA BOMB
	DW $877B
	;SPARKS
	DW $8772
	;SPIKE BALL
	DW $40A9
	;REVERSE EXPLOSION
	DW $875C
	;FLASHING RED/BLUE RING
	DW $874B
	;METAL BALL
	DW $4000
	;AMOEBA
	DW $8719
	;LAVA ROCK
	DW $8710
	;BLACK HOLE
	DW $46D0,$46D0
	;FLASHING RED/BLUE OVAL SHOT
	DW $890F
	;WHITE FLASH
	DW $85B8
	;USED FOR "GAME OVER" SPRITE
	DW $44D4,$45D4,$44D5,$45D5
	;LAVA ERUPTION
	DW $40B4,$8578,$4007
	;Referenced by the material list above
	DB $02		;Number of frames
	DW $463B,$463C		;Frame data
	;BIG ASTEROID
	DW $46D3
	;SMALL ORANGE ASTEROID
	DW $4003
	;WHITE SHOT?
	DW $4005
	;FLASHING METAL BALL
	DW $8707
	;USED FOR ANDROSS ELONGATED BIPYRAMID MODEL
	DW $46A6,$8589
	;Referenced by the material list above
	DB $04		;Number of frames?
	DW $0000,$0707,$0606	;Frame data
	;USED FOR ANDROSS SQUARE/CUBE MODEL
	DW $46A6,$46A6
	;USED FOR ANDROSS BOSS SQUARE AND ORIGAMI
	DW $85BF,$85E8,$8611,$863A
	DW $8663,$868C,$86B5,$86DE
	;SLOT MACHINE WHEELS
	DW $42D2
	;Unknown animated material
	DB $04		;Number of frames
	DW $400C,$400D,$400E,$400E	;Frame data
	;USED FOR BLACK HOLE BILLBOARD SPRITE
	DW $46D0,$41D0
	;Flashing white/blue animation
	DB $02		;Number of frames
	DW $3FEE,$3F77		;Frame data
	;White flash animation
	DB $02		;Number of frames
	DW $40CB,$4013		;Frame data
	;WHITE SHOT?
	DW $4005
	;Animation data for Andross boss square/origami
	DB $20		;Number of frames?
	DW $3FDD,$3FDD,$3FED,$3FED	;Frame data
	DW $3FED,$3FED,$3FED,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DW $3FEE,$3FEE,$3FEE,$3FEE
	DB $20		;Number of frames?
	DW $3FDD,$3FDD,$3FDD,$3FDD	;Frame data
	DW $3FDD,$3FDD,$3FDD,$3FDD
	DW $3FDD,$3FDD,$3FDD,$3FDD
	DW $3FDD,$3FDD,$3FDD,$3FDD
	DW $3FDD,$3FDD,$3FDD,$3FDD
	DB $20		;Number of frames?
	DW $3FDD,$3FDD,$3FDD,$3FDC	;Frame data
	DW $3FDC,$3FDD,$3FDC,$3FCC
	DW $3FCC,$3FCC,$3FCC,$3FCC
	DW $3FCC,$3FCC,$3FCC,$3FCC
	DW $3FCC,$3FCC,$3FCC,$3FCC
	DB $20		;Number of frames?
	DW $3FDD,$3FDC,$3FDC,$3FCC	;Frame data
	DW $3FCC,$3FCB,$3FCB,$3FBB
	DW $3FBB,$3FBB,$3FBB,$3FBB
	DW $3FBB,$3FBB,$3FBB,$3FBB
	DW $3FBB,$3FBB,$3FBB,$3FBB
	DB $20		;Number of frames?
	DW $3FDD,$3FDC,$3FDC,$3FCC	;Frame data
	DW $3FCB,$3FBB,$3FBB,$3FBA
	DW $3FBA,$3FAA,$3FAA,$3FAA
	DW $3FAA,$3FAA,$3FAA,$3FAA
	DW $3FAA,$3FAA,$3FAA,$3FAA
	DB $20		;Number of frames?
	DW $3FDD,$3FDC,$3FCC,$3FCB	;Frame data
	DW $3FBB,$3FBA,$3FAA,$3FA9
	DW $3FA9,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DW $3F99,$3F99,$3F99,$3F99
	DB $20		;Number of frames?
	DW $3F88,$3F77,$3F66,$3F55	;Frame data
	DW $3F88,$3F77,$3F66,$3F55
	DW $3F88,$3F77,$3F55,$3F88
	DW $3F99,$3F99,$3F55,$3F88
	DW $3F99,$3F99,$3F22,$3F22
	DB $20		;Number of frames?
	DW $3F88,$3F77,$3F66,$3F55	;Frame data
	DW $3F88,$3F77,$3F66,$3F55
	DW $3F88,$3F77,$3F55,$3F88
	DW $3F55,$3F88,$3F99,$3F99
	DW $3F99,$3F22,$3F99,$3F22
	;Animation data for flashing metal ball
	DB $04		;Number of frames
	DW $40A7,$40AB,$40DC,$40AB	;Frame data
	;Animation data for lava rock
	DB $04		;Number of frames
	DW $4015,$4016,$4017,$4016	;Frame data
	;Animation data for amoeba
	DB $04		;Number of frames
	DW $40CC,$40CD,$40CC,$40CE	;Frame data
	;Animation data for flashing red/blue rings
	DB $04		;Number of frames
	DW $401E,$401D,$401D,$401D	;Frame data
	DB $04		;Number of frames
	DW $401D,$401E,$401D,$401D	;Frame data
	DB $04		;Number of frames
	DW $401D,$401D,$401E,$401D	;Frame data
	DB $04		;Number of frames
	DW $401D,$401D,$401D,$401E	;Frame data
	DB $02		;Number of frames
	DW $401E,$401D		;Frame data
	DB $08		;Number of frames
	DW $401D,$401E,$401D,$401E	;Frame data
	DW $401D,$401E,$401D,$401E
	;Animation data for reverse explosion
	DB $08		;Number of frames
	DW $463D,$463C,$463B,$463B	;Frame data
	DW $463A,$463A,$4639,$4639
	;Animation data for flashing red/yellow
	DB $02		;Number of frames
	DW $3F11,$3F33		;Frame data
	;Animation data for sparks
	DB $04		;Number of frames
	DW $400A,$400B,$400F,$400B	;Frame data
	;Animation data for nova bomb
	DB $08		;Number of frames
	DW $4019,$401A,$401C,$4019	;Frame data
	DW $401A,$401C,$4019,$401A
	;Animation data for flashing red/blue
	DB $10		;Number of frames
	DW $3F88,$3F77,$3F66,$3F55	;Frame data
	DW $3F44,$3F44,$3F33,$3F33
	DW $3F22,$3F22,$3F11,$3F11
	DW $3F11,$3F22,$3F33,$3F44
	;Animation data for flashing red/yellow
	DB $08		;Number of frames
	DW $3F44,$3F33,$3F22,$3F11,$3E00	;Frame data
	DB $08		;Number of frames
	DW $3F44,$3F33,$3F22,$3F11,$3E06	;Frame data
	;Animation data for flashing red/blue
	DB $08		;Number of frames
	DW $3F88,$3F77,$3F66,$3F55	;Frame data
	DW $3F44,$3F33,$3F22,$3F11
	;Animation data for flashing blue
	DB $08		;Number of frames?
	DW $3F88,$3F77,$3F66,$3F55,$3E1D	;Frame data
	;Animation data for flashing red/yellow
	DB $02		;Number of frames
	DW $3F44,$3F11		;Frame data
	;Animation data for flashing white
	DB $08		;Number of frames
	DW $3FEE,$3FDD,$3FCC,$3FBB	;Frame data
	DW $3FAA,$3F99,$3F99,$3F99
	;Animation data for flashing white/blue
	DB $08		;Number of frames
	DW $3FEE,$3F88,$3FEE,$3F77	;Frame data
	DW $3FEE,$3F88,$3FEE,$3F66
	;Animation data for flashing white/yellow
	DB $04		;Number of frames
	DW $3FEE,$3F33,$3FEE,$3F44	;Frame data
	;Animation data for flashing red/blue shot
	DB $02		;Number of frames
	DW $4010,$4011		;Frame data
	;Animation data for weak explosion
	DB $08		;Number of frames
	DW $4639,$4008,$40C1,$40C2	;Frame data
	DW $40C3,$40C4,$40C5,$40C6
	;Animation data for sparks
	DB $04		;Number of frames
	DW $400A,$400B,$400F,$400B	;Frame data
	;Unknown animation data
	DB $04		;Number of frames
	DW $400C,$400D,$400E,$400D	;Frame data
	;Animation data for slightly weak explosion
	DB $04		;Number of frames
	DW $4639,$463A,$4008,$4009	;Frame data
	;Animation data for medium explosion
	DB $08		;Number of frames
	DW $4639,$463A,$463B,$463E	;Frame data
	DW $463F,$4640,$4640,$4640
	;Animation data for full explosion
	DB $08		;Number of frames
	DW $4639,$463A,$463B,$463C	;Frame data
	DW $463D,$463E,$463F,$4640
	;Animation data for flashing blue/white/yellow/red
	DB $08		;Number of frames
	DW $3F66,$3F66,$3FEE,$3FEE	;Frame data
	DW $3F33,$3F33,$3F11,$3F11
	;A MATERIAL TABLE
	;Flat colors
	DW $3F00,$3F11,$3F22,$3F33
	DW $3F44,$3F55,$3F66,$3F77
	DW $3F88,$3F99,$3FAA,$3FBB
	DW $3FCC,$3FDD,$3FEE,$3FFF
	;Other materials
	DW $8862,$40A8,$40A8
	;ANOTHER MATERIAL TABLE
	;Flat colors
	DW $3F00,$3F11,$3F22,$3F33
	DW $3F44,$3F55,$3F66,$3F77
	DW $3F88,$3FAA,$3FBB,$3FCC
	DW $3FDD,$3FEE,$3FEE,$3FFF
	;Other materials
	DW $8862,$40A8,$40A8
	;Animation data for splash
	DB $08		;Number of frames
	DW $40A0,$40A1,$40A2,$40A3	;Frame data
	DW $40A4,$40A4,$40A5,$40A5
	;YELLOW/WHITE FLASH
	DW $88D2
	;Animation data for yellow/white flash
	DB $02		;Number of frames
	DW $4012,$4013		;Frame data
	;Animation data for flashing white
	DB $08		;Number of frames
	DW $3FEE,$3FDD,$3FCC,$3FBB	;Frame data
	DW $3FAA,$3FA9,$3F99,$3F99
	;Animation data for flashing red
	DB $08		;Number of frames
	DW $3F22,$3F22,$3F21,$3F21	;Frame data
	DW $3F11,$3F11,$3F11,$3F11
	;Animation data for flashing white
	DB $08		;Number of frames
	DW $3FDD,$3FCC,$3FBB,$3FAA	;Frame data
	DW $3FA9,$3F99,$3F99,$3F99
	;Animation data for flashing red/black
	DB $02		;Number of frames
	DW $3F19,$3F22		;Frame data
	;Animation data for flashing red/blue oval shot
	DB $04		;Number of frames
	DW $40C7,$40C9,$40C8,$40C9	;Frame data
;The following table is used to translate the low byte of a textured material into a pointer
;for the upper left corner of the texture to be used (the high byte is used for the size/mirroring).
TexCoordOffsTable:
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
UnkData_038A38:
	DL $14CE26,$14CE26
UnkData_038A3E:
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
	DB $00,$1F,$1F,$1F
;Base color palette, four varieties.
;The first one is unknown.
;The second one is more blue-tinted, the third one is more red-tinted,
;and the fourth one is more green-tinted.
BaseColorTable:
	DW $0000,$0021,$0000,$00A5
	DW $0042,$0129,$0084,$01AD
	DW $00C6,$0231,$0108,$02B5
	DW $014A,$0339,$018C,$03FF
	
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
;This table points to rows of lit colors in LitColorTable
LitColorPointerTable:
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
FlatColorTable:
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
LitColorTable:
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
UnkData_038F9A:
	DB $C0,$B0,$B0,$00,$00,$C0,$B0,$00
	DB $00,$00,$C0,$00,$00,$00,$00,$00
	DB $F6,$F3,$F1,$00,$FE,$FD,$FC,$00
	DB $FE,$FD,$FC,$00,$F6,$F3,$C1,$00
;;;;;;;;;;;;;;;;;;;;;;;;;
;PRESET LOADING ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;
LoadPreset_BlackHole:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $16A648
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16ED34
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0360
	DW $00E0
	lda.b #$00
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$16
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	rep #$20
	lda.w #$0000
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	lda.b #$0C
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_1A8
	lda.w #$00A0
	sta.l UnknownGSU_1AA
	lda.w #$0001
	sta.l UnknownGSU_1AC
	sep #$20
	jsl LoadAudio_BlackHole
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_BlackHole_Wait:
	lda.b CurNMITask
	beq LoadPreset_BlackHole_Exit
	cmp.b #$20
	bne LoadPreset_BlackHole_Wait
LoadPreset_BlackHole_Exit:
	rtl
LoadPreset_Scramble:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14DB6E
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $14DC0E
	DW $7000,$2000
	jsr LoadPalette
	DL $7F00E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$02
	sta.w PresetSettings
	ldx.w #PlayerBeh_Scramble
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Scramble)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$08
	sta.w ShearScrollType
	rep #$20
	lda.w #$8FAE
	sta.l UnknownGSU_050
	sep #$20
	rep #$10
	jsl LoadAudio_Scramble1
	lda.b #$00
	sta.l RenderHUDFlag
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$01
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	stz.w Unknown_18C2
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Scramble_Wait:
	lda.b CurNMITask
	beq LoadPreset_Scramble_Exit
	cmp.b #$20
	bne LoadPreset_Scramble_Wait
LoadPreset_Scramble_Exit:
	rtl
LoadPreset_Unk09:
	jml UnkFunc_1FBDEE
LoadPreset_Unk0F:
	jml UnkFunc_1FBDEE
LoadPreset_Corneria12:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14FECE
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $1581E4
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0360
	DW $00E0
	lda.b #$03
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	rep #$20
	lda.w #$8FB6
	sta.l UnknownGSU_050
	sep #$20
	rep #$10
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$0F
	sta.w PresetSettings
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_Corneria1
	lda.b #$01
	sta.l RenderHUDFlag
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Corneria12_Wait:
	lda.b CurNMITask
	beq LoadPreset_Corneria12_Exit
	cmp.b #$20
	bne LoadPreset_Corneria12_Wait
LoadPreset_Corneria12_Exit:
	rtl
LoadPreset_Corneria3:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14FECE
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $1581E4
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0640
	DW $00E0
	lda.b #$02
	sta.w SuperFXPalette
	lda.b #$10
	sta.b CurNMITask
	rep #$20
	lda.w #$8FB6
	sta.l UnknownGSU_050
	sep #$20
	rep #$10
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$0F
	sta.w PresetSettings
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_Corneria1
	sta.l RenderHUDFlag
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8D
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Corneria3_Wait:
	lda.b CurNMITask
	beq LoadPreset_Corneria3_Exit
	cmp.b #$20
	bne LoadPreset_Corneria3_Wait
LoadPreset_Corneria3_Exit:
	rtl
LoadPreset_Training:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14FECE
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $1581E4
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0360
	DW $00E0
	lda.b #$03
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	ldx.w #PlayerBeh_0BBB03
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_0BBB03)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	rep #$20
	lda.w #$8FB6
	sta.l UnknownGSU_050
	sep #$20
	rep #$10
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$0F
	sta.w PresetSettings
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_Training
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Training_Wait:
	lda.b CurNMITask
	beq LoadPreset_Training_Exit
	cmp.b #$20
	bne LoadPreset_Training_Wait
LoadPreset_Training_Exit:
	rtl
LoadPreset_Asteroid1:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15A408
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16B944
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0D40
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	jsl LoadAudio_Asteroid1
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Asteroid1_Wait:
	lda.b CurNMITask
	beq LoadPreset_Asteroid1_Exit
	cmp.b #$20
	bne LoadPreset_Asteroid1_Wait
LoadPreset_Asteroid1_Exit:
	rtl
LoadPreset_OutOfThisDimension:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $17FDCC
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $0EFC62
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0C60
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	jsl LoadAudio_OutOfThisDimension
	lda.b #$0C
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_1A8
	lda.w #$00A0
	sta.l UnknownGSU_1AA
	lda.w #$0001
	sta.l UnknownGSU_1AC
	sep #$20
	rep #$20
	lda.w #$FFC0
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_OutOfThisDimension_Wait:
	lda.b CurNMITask
	beq LoadPreset_OutOfThisDimension_Exit
	cmp.b #$20
	bne LoadPreset_OutOfThisDimension_Wait
LoadPreset_OutOfThisDimension_Exit:
	rtl
LoadPreset_SpaceArmadaBlastIn:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15FF1C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D71C
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0C60
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	jsl LoadAudio_SpaceArmadaBlastIn
	ldx.w #PlayerBeh_Space2ArmadaBlastIn
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2ArmadaBlastIn)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SpaceArmadaBlastIn_Wait:
	lda.b CurNMITask
	beq LoadPreset_SpaceArmadaBlastIn_Exit
	cmp.b #$20
	bne LoadPreset_SpaceArmadaBlastIn_Wait
LoadPreset_SpaceArmadaBlastIn_Exit:
	rtl
LoadPreset_SpaceArmada:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15FF1C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D71C
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0C60
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2Armada
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2Armada)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	lda.w CurLoaderTasks
	bit.b #$01
	beq LoadPreset_SpaceArmada_SkipLoadAudio
	jsl LoadAudio_SpaceArmada
LoadPreset_SpaceArmada_SkipLoadAudio:
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SpaceArmada_Wait:
	lda.b CurNMITask
	beq LoadPreset_SpaceArmada_Exit
	cmp.b #$20
	bne LoadPreset_SpaceArmada_Wait
LoadPreset_SpaceArmada_Exit:
	rtl
LoadPreset_SpaceArmadaTunnel:
	sep #$20
	jsr SetNMITaskInitMode1
	jsr DecompressTileset
	DL $17849C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16F344
	DW $7000,$2000
	jsr LoadPalette
	DL $7F08E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	lda.b #$02
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2ArmadaTunnel
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2ArmadaTunnel)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$08
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.w CurLoaderTasks
	bit.b #$01
	beq LoadPreset_SpaceArmadaTunnel_SkipLoadAudio
	jsl LoadAudio_SpaceArmada
LoadPreset_SpaceArmadaTunnel_SkipLoadAudio:
	lda.b #$01
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	sta.w Unknown_18C2
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SpaceArmadaTunnel_Wait:
	lda.b CurNMITask
	beq LoadPreset_SpaceArmadaTunnel_Exit
	cmp.b #$20
	bne LoadPreset_SpaceArmadaTunnel_Wait
LoadPreset_SpaceArmadaTunnel_Exit:
	rtl
LoadPreset_SpaceArmadaPart3:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15FF1C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D71C
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0C60
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2Armada
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2Armada)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	lda.w CurLoaderTasks
	bit.b #$01
	beq LoadPreset_SpaceArmadaPart3_SkipLoadAudio
	jsl LoadAudio_SpaceArmada
LoadPreset_SpaceArmadaPart3_SkipLoadAudio:
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SpaceArmadaPart3_Wait:
	lda.b CurNMITask
	beq LoadPreset_SpaceArmadaPart3_Exit
	cmp.b #$20
	bne LoadPreset_SpaceArmadaPart3_Wait
LoadPreset_SpaceArmadaPart3_Exit:
	rtl
LoadPreset_AtomicCoreBoss:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15A6B0
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16C1B8
	DW $7000,$2000
	jsr LoadPalette
	DL $7F00E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_AtomicCoreBoss
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_AtomicCoreBoss)
	sta.w TempPlayerBehPtr+2
	lda.b #$0A
	sta.w ShearScrollType
	rep #$20
	lda.w #$0108
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	rep #$20
	lda.w #$0190
	sta.w Unknown_195F
	sep #$20
	lda.b #$01
	sta.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_AtomicCoreBoss_Wait:
	lda.b CurNMITask
	beq LoadPreset_AtomicCoreBoss_Exit
	cmp.b #$20
	bne LoadPreset_AtomicCoreBoss_Wait
LoadPreset_AtomicCoreBoss_Exit:
	rtl
LoadPreset_AtomicCoreWavyTunnel:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15A6B0
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16C1B8
	DW $7000,$2000
	jsr LoadPalette
	DL $7F00E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$07
	sta.w PresetSettings
	ldx.w #PlayerBeh_AtomicCoreWavyTunnel
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_AtomicCoreWavyTunnel)
	sta.w TempPlayerBehPtr+2
	lda.b #$0A
	sta.w ShearScrollType
	rep #$20
	lda.w #$00F8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	rep #$20
	lda.w #$0190
	sta.w Unknown_195F
	sep #$20
	lda.b #$01
	sta.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_AtomicCoreWavyTunnel_Wait:
	lda.b CurNMITask
	beq LoadPreset_AtomicCoreWavyTunnel_Exit
	cmp.b #$20
	bne LoadPreset_AtomicCoreWavyTunnel_Wait
LoadPreset_AtomicCoreWavyTunnel_Exit:
	rtl
LoadPreset_SpaceArmadaEnd:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15AF04
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16C5AC
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0C60
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_AtomicCoreEnd
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_AtomicCoreEnd)
	sta.w TempPlayerBehPtr+2
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SpaceArmadaEnd_Wait:
	lda.b CurNMITask
	beq LoadPreset_SpaceArmadaEnd_Exit
	cmp.b #$20
	bne LoadPreset_SpaceArmadaEnd_Wait
LoadPreset_SpaceArmadaEnd_Exit:
	rtl
LoadPreset_Meteor:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $16D13C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16CAF4
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0B80
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$0F
	sta.w PresetSettings
	ldx.w #PlayerBeh_Meteor
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Meteor)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	jsl LoadAudio_Meteor
	rep #$20
	lda.w #$8FB2
	sta.l UnknownGSU_050
	sep #$20
	rep #$10
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Meteor_Wait:
	lda.b CurNMITask
	beq LoadPreset_Meteor_Exit
	cmp.b #$20
	bne LoadPreset_Meteor_Wait
LoadPreset_Meteor_Exit:
	rtl
UnusedPresetLoaderFunc_039877:
	rep #$20
	lda.w #$8FAA
	sta.l UnknownGSU_050
	sep #$20
	rep #$10
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8D
	sta.l UnknownGSU_04E+1
	rtl
LoadPreset_VenomAtmosphere1:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $169150
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D9F4
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0280
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$01
	sta.w Unknown_16A2
	lda.b #$A4
	sta.w VerticalScrollBase
	stz.w VerticalScrollBase+1
	jsl LoadAudio_VenomAtmosphere1
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_VenomAtmosphere1_Wait:
	lda.b CurNMITask
	beq LoadPreset_VenomAtmosphere1_Exit
	cmp.b #$20
	bne LoadPreset_VenomAtmosphere1_Wait
LoadPreset_VenomAtmosphere1_Exit:
	rtl
LoadPreset_Venom1:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15FF1C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D71C
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0280
	DW $00E0
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$0F
	sta.w PresetSettings
	ldx.w #PlayerBeh_Venom13
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Venom13)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_Venom1
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	inc.w Unknown_1F0B
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Venom1_Wait:
	lda.b CurNMITask
	beq LoadPreset_Venom1_Exit
	cmp.b #$20
	bne LoadPreset_Venom1_Wait
LoadPreset_Venom1_Exit:
	rtl
LoadPreset_VenomBossTunnel:
	jsl DoLoadPreset_VenomBossTunnel
	lda.b #$12
	sta.w MusicID
	stz.w MusicLoaded
	ldx.w #PlayerBeh_Venom13BossTunnel
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Venom13BossTunnel)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$01
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_VenomBossTunnel_Wait:
	lda.b CurNMITask
	beq LoadPreset_VenomBossTunnel_Exit
	cmp.b #$20
	bne LoadPreset_VenomBossTunnel_Wait
LoadPreset_VenomBossTunnel_Exit:
	rtl
DoLoadPreset_VenomBossTunnel:
	sep #$20
	jsr SetNMITaskInitMode1
	jsr DecompressTileset
	DL $0DFBB9
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16FF94
	DW $7000,$2000
	jsr LoadPalette
	DL $7F08E0
	DW $00E0
	lda.b #$01
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$02
	sta.w PresetSettings
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$08
	sta.w ShearScrollType
	rtl
LoadPreset_VenomBoss:
	sep #$20
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $16A648
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $15BC14
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0560
	DW $00E0
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$06
	sta.w PresetSettings
	ldx.w #PlayerBeh_VenomBoss
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_VenomBoss)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$0C
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_1A8
	lda.w #$00A0
	sta.l UnknownGSU_1AA
	lda.w #$0001
	sta.l UnknownGSU_1AC
	sep #$20
	lda.b #$01
	sta.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_VenomBoss_Wait:
	lda.b CurNMITask
	beq LoadPreset_VenomBoss_Exit
	cmp.b #$20
	bne LoadPreset_VenomBoss_Wait
LoadPreset_VenomBoss_Exit:
	rtl
LoadPreset_VenomBossTunnelEnd:
	sep #$20
	jsr SetNMITaskInitMode1
	jsr DecompressTileset
	DL $0DFBB9
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16FF94
	DW $7000,$2000
	jsr LoadPalette
	DL $7F08E0
	DW $00E0
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$02
	sta.w PresetSettings
	ldx.w #PlayerBeh_Venom13BossTunnelEnd
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Venom13BossTunnelEnd)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$08
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	rep #$20
	lda.w #$8FAA
	sta.l UnknownGSU_050
	sep #$20
	rep #$10
	lda.b #$01
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	stz.w Unknown_18C2
	lda.b #$0A
	sta.l UnknownGSU_04E
	lda.b #$8D
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_VenomBossTunnelEnd_Wait:
	lda.b CurNMITask
	beq LoadPreset_VenomBossTunnelEnd_Exit
	cmp.b #$20
	bne LoadPreset_VenomBossTunnelEnd_Wait
LoadPreset_VenomBossTunnelEnd_Exit:
	rtl
LoadPreset_VenomBossEnd:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $16A014
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $1FF963
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0000
	DW $00E0
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	ldx.w #PlayerBeh_VenomBossEnd
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_VenomBossEnd)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	rep #$20
	lda.w #$00E0
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_VenomBossEnd_Wait:
	lda.b CurNMITask
	beq LoadPreset_VenomBossEnd_Exit
	cmp.b #$20
	bne LoadPreset_VenomBossEnd_Wait
LoadPreset_VenomBossEnd_Exit:
	rtl
LoadPreset_Ending:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $169150
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D9F4
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0280
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	ldx.w #PlayerBeh_Ending
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Ending)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	rep #$20
	lda.w #$00AC
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_Ending
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Ending_Wait:
	lda.b CurNMITask
	beq LoadPreset_Ending_Exit
	cmp.b #$20
	bne LoadPreset_Ending_Wait
LoadPreset_Ending_Exit:
	rtl
LoadPreset_SectorX:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $158C50
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $1683C8
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0C60
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_SectorX
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SectorX_Wait:
	lda.b CurNMITask
	beq LoadPreset_SectorX_Exit
	cmp.b #$20
	bne LoadPreset_SectorX_Wait
LoadPreset_SectorX_Exit:
	rtl
LoadPreset_Titania:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $159B48
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16AC44
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0000
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.b #$03
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$27
	sta.w PresetSettings
	ldx.w #PlayerBeh_0BBB03
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_0BBB03)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	jsl LoadAudio_Titania
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	rep #$20
	lda.w #$8FB2
	sta.l UnknownGSU_050
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$00
	sta.w ShearScrollType
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$0A
	sta.l UnknownGSU_04E
	lda.b #$8C
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Titania_Wait:
	lda.b CurNMITask
	beq LoadPreset_Titania_Exit
	cmp.b #$20
	bne LoadPreset_Titania_Wait
LoadPreset_Titania_Exit:
	rtl
UnusedPresetLoaderFunc_039E27:
	rep #$20
	lda.w #$8FAA
	sta.w UnknownGSU_050
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	rtl
LoadPreset_TitaniaBoss:
	sep #$20
	jsr SetNMITaskInitMode1
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_090
	lda.w #$0015
	sta.l InputPtr+2
	lda.w #$9C38
	sta.l InputPtr
	lda.w #$6000
	sta.w Unknown_188A
	lda.w #$0800
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
	lda.b #$01
	sta.w Unknown_18B8
	lda.b #$17
	sta.w TM
	rep #$20
	lda.w #$0014
	sta.l InputPtr+2
	lda.w #$FFA6
	sta.l InputPtr
	lda.w #$6400
	sta.w Unknown_188E
	lda.w #$0800
	sta.w Unknown_1890
	jsl DoDecompressTilemap2
	lda.b #$16
	sta.b CurNMITask
LoadPreset_TitaniaBoss_Wait:
	lda.b CurNMITask
	beq LoadPreset_TitaniaBoss_Continue
	cmp.b #$20
	bne LoadPreset_TitaniaBoss_Wait
LoadPreset_TitaniaBoss_Continue:
	jsr DecompressTileset
	DL $14F5B2
	DW $5C00,$0800
	jsr DecompressTilemap
	DL $16B050
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0AA0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.b #$64
	sta.w BG3SC
	lda.b #$06
	sta.w BG34NBA
	lda.b #$18
	sta.w BG3VOFS
	lda.b #$00
	sta.w BG3VOFS
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$02
	sta.w PresetSettings
	ldx.w #PlayerBeh_TitaniaBoss
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_TitaniaBoss)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$06
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$02
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$02
	sta.w Unknown_18C2
	lda.b #$0A
	sta.l UnknownGSU_04E
	lda.b #$8D
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_TitaniaBoss_Wait2:
	lda.b CurNMITask
	beq LoadPreset_TitaniaBoss_Exit
	cmp.b #$20
	bne LoadPreset_TitaniaBoss_Wait2
LoadPreset_TitaniaBoss_Exit:
	rtl
LoadPreset_TitaniaBossTunnel:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $17849C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16AA20
	DW $7000,$2000
	jsr LoadPalette
	DL $7F08E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$02
	sta.w PresetSettings
	ldx.w #PlayerBeh_TitaniaBossTunnel
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_TitaniaBossTunnel)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$04
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$01
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	stz.w Unknown_18C2
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_TitaniaBossTunnel_Wait:
	lda.b CurNMITask
	beq LoadPreset_TitaniaBossTunnel_Exit
	cmp.b #$20
	bne LoadPreset_TitaniaBossTunnel_Wait
LoadPreset_TitaniaBossTunnel_Exit:
	rtl
LoadPreset_SectorY:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $17A664
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16FA8C
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0560
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	jsl LoadAudio_SectorY
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SectorY_Wait:
	lda.b CurNMITask
	beq LoadPreset_SectorY_Exit
	cmp.b #$20
	bne LoadPreset_SectorY_Wait
LoadPreset_SectorY_Exit:
	rts
LoadPreset_VenomAtmosphere2:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $169150
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D9F4
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0280
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	ldx.w #PlayerBeh_Space
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$13
	sta.w PresetSettings
	lda.b #$0A
	sta.w ShearScrollType
	lda.b #$01
	sta.w Unknown_16A2
	lda.b #$A4
	sta.w VerticalScrollBase
	stz.w VerticalScrollBase+1
	jsl LoadAudio_VenomAtmosphere2
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_VenomAtmosphere2_Wait:
	lda.b CurNMITask
	beq LoadPreset_VenomAtmosphere2_Exit
	cmp.b #$20
	bne LoadPreset_VenomAtmosphere2_Wait
LoadPreset_VenomAtmosphere2_Exit:
	rtl
LoadPreset_Highway:
	sep #$20
	jsr SetNMITaskInitMode1
	jsr DecompressTileset
	DL $1788EC
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $15EF34
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0800
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
LoadPreset_Highway_Wait:
	lda.b CurNMITask
	beq LoadPreset_Highway_Continue
	cmp.b #$20
	bne LoadPreset_Highway_Wait
LoadPreset_Highway_Continue:
	lda.b #$64
	sta.w BG3SC
	lda.b #$06
	sta.w BG34NBA
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_090
	lda.w #$0015
	sta.l InputPtr+2
	lda.w #$CE8C
	sta.l InputPtr
	lda.w #$6000
	sta.w Unknown_188A
	lda.w #$0800
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
	lda.b #$01
	sta.w Unknown_18B8
	lda.b #$17
	sta.w TM
	rep #$20
	lda.w #$0015
	sta.l InputPtr+2
	lda.w #$EB10
	sta.l InputPtr
	lda.w #$6400
	sta.w Unknown_188A
	lda.w #$0800
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTilemap2
	lda.b #$16
	sta.b CurNMITask
	lda.b #$04
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$02
	sta.w PresetSettings
	ldx.w #PlayerBeh_Highway
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Highway)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	jsl LoadAudio_Highway
	lda.b #$02
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$02
	sta.w Unknown_18C2
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Highway_Wait2:
	lda.b CurNMITask
	beq LoadPreset_Highway_Exit
	cmp.b #$20
	bne LoadPreset_Highway_Wait2
LoadPreset_Highway_Exit:
	rtl
LoadPreset_Venom2BossTunnel:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $0DFBB9
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16FF94
	DW $7000,$2000
	jsr LoadPalette
	DL $7F08E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$06
	sta.w PresetSettings
	ldx.w #PlayerBeh_Venom2BossTunnel
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Venom2BossTunnel)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$08
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$01
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	stz.w Unknown_18C2
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Venom2BossTunnel_Wait:
	lda.b CurNMITask
	beq LoadPreset_Venom2BossTunnel_Exit
	cmp.b #$20
	bne LoadPreset_Venom2BossTunnel_Wait
LoadPreset_Venom2BossTunnel_Exit:
	rtl
LoadPreset_Venom2BossTunnel2:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $0DFBB9
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16FF94
	DW $7000,$2000
	jsr LoadPalette
	DL $7F08E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$02
	sta.w PresetSettings
	ldx.w #PlayerBeh_Venom2BossTunnelEnd
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Venom2BossTunnelEnd)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$08
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$01
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	stz.w Unknown_18C2
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8D
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Venom2BossTunnel2_Wait:
	lda.b CurNMITask
	beq LoadPreset_Venom2BossTunnel2_Exit
	cmp.b #$20
	bne LoadPreset_Venom2BossTunnel2_Wait
LoadPreset_Venom2BossTunnel2_Exit:
	rtl
UnusedPresetLoaderFunc_03A31E:
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
UnusedPresetLoaderFunc_03A31E_Wait:
	lda.b CurNMITask
	beq UnusedPresetLoaderFunc_03A31E_Exit
	cmp.b #$20
	bne UnusedPresetLoaderFunc_03A31E_Wait
UnusedPresetLoaderFunc_03A31E_Exit:
	rtl
LoadPreset_Asteroid3:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15C964
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16BEF8
	DW $7000,$2000
	jsr LoadPalette
	DL $7F00E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0018
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_Asteroid3
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Asteroid3_Wait:
	lda.b CurNMITask
	beq LoadPreset_Asteroid3_Exit
	cmp.b #$20
	bne LoadPreset_Asteroid3_Wait
LoadPreset_Asteroid3_Exit:
	rtl
LoadPreset_Fortuna:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15E898
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D360
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0280
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.b #$03
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$47
	sta.w PresetSettings
	ldx.w #PlayerBeh_0BBB03
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_0BBB03)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_Fortuna
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$0A
	sta.l UnknownGSU_04E
	lda.b #$8C
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Fortuna_Wait:
	lda.b CurNMITask
	beq LoadPreset_Fortuna_Exit
	cmp.b #$20
	bne LoadPreset_Fortuna_Wait
LoadPreset_Fortuna_Exit:
	rtl
LoadPreset_UnkC3:
	jml UnkFunc_1FBDEE
LoadPreset_SectorZ:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15FF1C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D71C
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0C60
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_SectorZ
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SectorZ_Wait:
	lda.b CurNMITask
	beq LoadPreset_SectorZ_Exit
	cmp.b #$20
	bne LoadPreset_SectorZ_Wait
LoadPreset_SectorZ_Exit:
	rtl
LoadPreset_BossTunnel:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $17849C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16F344
	DW $7000,$2000
	jsr LoadPalette
	DL $7F08E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Venom2BossTunnelEnd
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Venom2BossTunnelEnd)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$08
	sta.w ShearScrollType
	lda.b #$01
	sta.w EngineSoundFlag
	lda.w HDMAENMirror
	ora.b #$10
	sta.w HDMAENMirror
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	stz.w Unknown_18C2
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_BossTunnel_Wait:
	lda.b CurNMITask
	beq LoadPreset_BossTunnel_Exit
	cmp.b #$20
	bne LoadPreset_BossTunnel_Wait
LoadPreset_BossTunnel_Exit:
	rtl
LoadPreset_SectorZEnd:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $15FF1C
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16D71C
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0C60
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_AtomicCoreEnd
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_AtomicCoreEnd)
	sta.w TempPlayerBehPtr+2
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_SectorZEnd_Wait:
	lda.b CurNMITask
	beq LoadPreset_SectorZEnd_Exit
	cmp.b #$20
	bne LoadPreset_SectorZEnd_Wait
LoadPreset_SectorZEnd_Exit:
	rtl
LoadPreset_Macbeth:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14DB5E
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16EE24
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0FE0
	DW $00E0
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	rep #$20
	lda.w #$0110
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	ldx.w #PlayerBeh_Macbeth
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Macbeth)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$0F
	sta.w PresetSettings
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	lda.b #$00
	sta.w ShearScrollType
	lda.b #$01
	sta.w Unknown_1FC6
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8D
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Macbeth_Wait:
	lda.b CurNMITask
	beq LoadPreset_Macbeth_Exit
	cmp.b #$20
	bne LoadPreset_Macbeth_Wait
LoadPreset_Macbeth_Exit:
	rtl
LoadPreset_VenomAtmosphere3:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14DB5E
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16EE24
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0FE0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Space2
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Space2)
	sta.w TempPlayerBehPtr+2
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	lda.b #$01
	sta.w Unknown_16A2
	lda.b #$A4
	sta.w VerticalScrollBase
	stz.w VerticalScrollBase+1
	jsl LoadAudio_VenomAtmosphere3
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_VenomAtmosphere3_Wait:
	lda.b CurNMITask
	beq LoadPreset_VenomAtmosphere3_Exit
	cmp.b #$20
	bne LoadPreset_VenomAtmosphere3_Wait
LoadPreset_VenomAtmosphere3_Exit:
	rtl
LoadPreset_Venom3:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $16A014
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $1FF963
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0000
	DW $00E0
	lda.b #$02
	sta.w SuperFXPalette
	jsl LoadSuperFX4BPPPalette
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$0F
	sta.w PresetSettings
	ldx.w #PlayerBeh_Venom13
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Venom13)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$00
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w Unknown_195F
	sep #$20
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	inc.w Unknown_1F0B
	jsl LoadAudio_Venom3
	stz.w EngineSoundFlag
	stz.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Venom3_Wait:
	lda.b CurNMITask
	beq LoadPreset_Venom3_Exit
	cmp.b #$20
	bne LoadPreset_Venom3_Wait
LoadPreset_Venom3_Exit:
	rtl
LoadPreset_Credits:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $17A664
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $16FA8C
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0560
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Invisible
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Invisible)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$00E8
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Credits_Wait:
	lda.b CurNMITask
	beq LoadPreset_Credits_Exit
	cmp.b #$20
	bne LoadPreset_Credits_Wait
LoadPreset_Credits_Exit:
	rtl
LoadPreset_Controls:
	sep #$20
	jsr SetNMITaskInitMode1
	jsr DecompressTileset
	DL $1793FC
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $1796A8
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0440
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.b #$10
	sta.w PresetSettings
	ldx.w #PlayerBeh_Controls
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Controls)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$02
	sta.w MaxViewMode
	lda.b #$0A
	sta.w ShearScrollType
	rep #$20
	lda.w #$0000
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Controls_Wait:
	lda.b CurNMITask
	beq LoadPreset_Controls_Exit
	cmp.b #$20
	bne LoadPreset_Controls_Wait
LoadPreset_Controls_Exit:
	rtl
LoadPreset_Intro:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14D5AA
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $14D896
	DW $7000,$2000
	jsr LoadPalette
	DL $7F00E0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Invisible
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Invisible)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0018
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Intro_Wait:
	lda.b CurNMITask
	beq LoadPreset_Intro_Exit
	cmp.b #$20
	bne LoadPreset_Intro_Wait
LoadPreset_Intro_Exit:
	rtl
LoadPreset_GameOver:
	sep #$20
	jsr SetNMITaskInitMode1
	jsr DecompressTileset
	DL $05FECD
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $00FF96
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0440
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.w HDMAENMirror
	ora.b #$04
	sta.w HDMAENMirror
	lda.b #$17
	sta.w PresetSettings
	ldx.w #PlayerBeh_Invisible
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Invisible)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$0A
	sta.w ShearScrollType
	rep #$20
	lda.w #$FF80
	sta.w VerticalScrollBase2
	sep #$20
	rep #$20
	lda.w #$0000
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_GameOver_Wait:
	lda.b CurNMITask
	beq LoadPreset_GameOver_Exit
	cmp.b #$20
	bne LoadPreset_GameOver_Wait
LoadPreset_GameOver_Exit:
	rtl
LoadPreset_Title:
	sep #$20
	jsr SetNMITaskInitMode1
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_090
	lda.w #$0017
	sta.l InputPtr+2
	lda.w #$9AD8
	sta.l InputPtr
	lda.w #$7000
	sta.w Unknown_188A
	lda.w #$1000
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
	lda.b #$01
	sta.w Unknown_18B8
	lda.b #$17
	sta.w TM
	rep #$20
	lda.w #$0017
	sta.l InputPtr+2
	lda.w #$9C38
	sta.l InputPtr
	lda.w #$6800
	sta.w Unknown_188A
	lda.w #$1000
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTilemap2
	lda.b #$16
	sta.b CurNMITask
LoadPreset_Title_Wait:
	lda.b CurNMITask
	beq LoadPreset_Title_Continue
	cmp.b #$20
	bne LoadPreset_Title_Wait
LoadPreset_Title_Continue:
	jsr DecompressTileset
	DL $17B7A4
	DW $5C00,$1800
	jsr DecompressTilemap
	DL $178260
	DW $7000,$2000
	jsr LoadPalette
	DL $7F0FF0
	DW $00E0
	lda.b #$10
	sta.b CurNMITask
	lda.b #$07
	sta.w BG34NBA
	lda.b #$68
	sta.w BG3SC
	stz.w PaletteBuffer
	stz.w PaletteBuffer+1
	lda.b #$09
	sta.w BG3VOFS
	lda.b #$00
	sta.w BG3VOFS
	lda.b #$10
	sta.w PresetSettings
	ldx.w #PlayerBeh_Invisible
	stx.w TempPlayerBehPtr
	lda.b #BANKOF(PlayerBeh_Invisible)
	sta.w TempPlayerBehPtr+2
	sep #$20
	lda.b #$01
	sta.w CurViewMode
	jsl UpdateViewMode
	lda.b #$05
	sta.w MaxViewMode
	lda.b #$00
	sta.w ShearScrollType
	rep #$20
	lda.w #$0101
	sta.w VerticalScrollBase
	sta.w VerticalScroll
	sep #$20
	jsl LoadAudio_Title
	lda.b #$07
	sta.w TM
	stz.w EngineSoundFlag
	lda.b #$01
	sta.w Unknown_18C2
	stz.w PrevTiltScrollIndex
	stz.w PrevTiltScrollIndex+1
	lda.b #$8A
	sta.l UnknownGSU_04E
	lda.b #$8B
	sta.l UnknownGSU_04E+1
	lda.w HDMAENMirror
	sta.w HDMAEN
LoadPreset_Title_Wait2:
	lda.b CurNMITask
	beq LoadPreset_Title_Exit
	cmp.b #$20
	bne LoadPreset_Title_Wait2
LoadPreset_Title_Exit:
	rtl
;Preset loader helper functions
SetNMITaskInitMode1:
	sep #$20
	rep #$10
SetNMITaskInitMode1_WaitReady:
	lda.b CurNMITask
	beq SetNMITaskInitMode1_SetTask
	cmp.b #$20
	bne SetNMITaskInitMode1_WaitReady
SetNMITaskInitMode1_SetTask:
	lda.b #$24
	sta.b CurNMITask
SetNMITaskInitMode1_Wait:
	lda.b CurNMITask
	beq SetNMITaskInitMode1_Exit
	cmp.b #$20
	bne SetNMITaskInitMode1_Wait
SetNMITaskInitMode1_Exit:
	rts
SetNMITaskInitMode2:
	sep #$20
	rep #$10
SetNMITaskInitMode2_WaitReady:
	lda.b CurNMITask
	beq SetNMITaskInitMode2_SetTask
	cmp.b #$20
	bne SetNMITaskInitMode2_WaitReady
SetNMITaskInitMode2_SetTask:
	lda.b #$26
	sta.b CurNMITask
SetNMITaskInitMode2_Wait:
	lda.b CurNMITask
	beq SetNMITaskInitMode2_Exit
	cmp.b #$20
	bne SetNMITaskInitMode2_Wait
SetNMITaskInitMode2_Exit:
	rts
DoDecompressTileset:
	php
	rep #$20
	lda.w #$2800
	sta.l InputVecY
	sep #$20
	lda.b #BANKOF(DecompressGraphics)
	ldx.w #DecompressGraphics
	jsl RunSuperFXRoutine
	plp
	rtl
DoDecompressTilemap:
	php
	rep #$20
	lda.w #$00C0
	sta.l UnknownGSU_090
	lda.w #$4000
	sta.l InputVecY
	sep #$20
	lda.b #BANKOF(DecompressGraphics)
	ldx.w #DecompressGraphics
	jsl RunSuperFXRoutine
	plp
	rtl
DoDecompressTilemap2:
	php
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_090
	lda.w #$4000
	sta.l InputVecY
	sep #$20
	lda.b #BANKOF(DecompressGraphics)
	ldx.w #DecompressGraphics
	jsl RunSuperFXRoutine
	plp
	rtl
DoDecompressTileset2:
	php
	rep #$20
	lda.w #$2800
	sta.l InputVecY
	sep #$20
	lda.b #BANKOF(DecompressGraphics)
	ldx.w #DecompressGraphics
	jsl RunSuperFXRoutine
	plp
	rtl
DecompressTileset:
	rep #$20
	pla
	tax
	clc
	adc.w #$0007
	pha
	lda.w #$0000
	sta.l UnknownGSU_090
	lda.l $030003,x
	and.w #$00FF
	sta.l InputPtr+2
	lda.l $030001,x
	sta.l InputPtr
	lda.l $030004,x
	sta.w Unknown_188A
	lda.l $030006,x
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
	rts
DecompressTilemap:
	rep #$20
	pla
	tax
	clc
	adc.w #$0007
	pha
	lda.l $030001,x
	sta.l InputPtr
	lda.l $030003,x
	and.w #$00FF
	sta.l InputPtr+2
	lda.l $030004,x
	sta.w Unknown_188E
	lda.l $030006,x
	sta.w Unknown_1890
	sep #$20
	jsl DoDecompressTilemap
	rts
LoadPalette:
	rep #$20
	pla
	tax
	clc
	adc.w #$0005
	pha
	lda.l $030001,x
	sta.w Unknown_1892
	sep #$20
	lda.l $030003,x
	sta.w Unknown_1892+2
	rep #$20
	lda.l $030004
	sta.w Unknown_1895
	lda.w Unknown_1892
	clc
	adc.w #$00DF
	tay
	phy
	sep #$20
	phb
	lda
	pha
	plb
	ldx.w #$00DF
LoadPalette_Loop:
	lda.w $0000,y
	sta.w PaletteBuffer,x
	dey
	dex
	bpl LoadPalette_Loop
	plb
	ply
	rts
;Preset loading function table
PresetFunctionTable:
	PRESETFUNCPTR(LoadPreset_Scramble)
	PRESETFUNCPTR(LoadPreset_Unk09)
	PRESETFUNCPTR(LoadPreset_Unk0F)
	PRESETFUNCPTR(LoadPreset_Corneria3)
	PRESETFUNCPTR(LoadPreset_Corneria12)
	PRESETFUNCPTR(LoadPreset_Asteroid1)
	PRESETFUNCPTR(LoadPreset_SpaceArmadaBlastIn)
	PRESETFUNCPTR(LoadPreset_SpaceArmada)
	PRESETFUNCPTR(LoadPreset_SpaceArmadaTunnel)
	PRESETFUNCPTR(LoadPreset_SpaceArmadaPart3)
	PRESETFUNCPTR(LoadPreset_AtomicCoreBoss)
	PRESETFUNCPTR(LoadPreset_AtomicCoreWavyTunnel)
	PRESETFUNCPTR(LoadPreset_SpaceArmadaEnd)
	PRESETFUNCPTR(LoadPreset_Meteor)
	PRESETFUNCPTR(LoadPreset_VenomAtmosphere1)
	PRESETFUNCPTR(LoadPreset_Venom1)
	PRESETFUNCPTR(LoadPreset_VenomBossTunnel)
	PRESETFUNCPTR(LoadPreset_VenomBoss)
	PRESETFUNCPTR(LoadPreset_VenomBossTunnelEnd)
	PRESETFUNCPTR(LoadPreset_VenomBossEnd)
	PRESETFUNCPTR(LoadPreset_Ending)
	PRESETFUNCPTR(LoadPreset_Credits)
	PRESETFUNCPTR(LoadPreset_SectorX)
	PRESETFUNCPTR(LoadPreset_Titania)
	PRESETFUNCPTR(LoadPreset_TitaniaBoss)
	PRESETFUNCPTR(LoadPreset_TitaniaBossTunnel)
	PRESETFUNCPTR(LoadPreset_SectorY)
	PRESETFUNCPTR(LoadPreset_Highway)
	PRESETFUNCPTR(LoadPreset_Venom2BossTunnel)
	PRESETFUNCPTR(LoadPreset_Venom2BossTunnel2)
	PRESETFUNCPTR(LoadPreset_Asteroid3)
	PRESETFUNCPTR(LoadPreset_Fortuna)
	PRESETFUNCPTR(LoadPreset_UnkC3)
	PRESETFUNCPTR(LoadPreset_SectorZ)
	PRESETFUNCPTR(LoadPreset_BossTunnel)
	PRESETFUNCPTR(LoadPreset_SectorZEnd)
	PRESETFUNCPTR(LoadPreset_Macbeth)
	PRESETFUNCPTR(LoadPreset_VenomAtmosphere3)
	PRESETFUNCPTR(LoadPreset_Venom3)
	PRESETFUNCPTR(LoadPreset_BlackHole)
	PRESETFUNCPTR(LoadPreset_Intro)
	PRESETFUNCPTR(LoadPreset_Title)
	PRESETFUNCPTR(LoadPreset_Controls)
	PRESETFUNCPTR(LoadPreset_GameOver)
	PRESETFUNCPTR(LoadPreset_OutOfThisDimension)
	PRESETFUNCPTR(LoadPreset_Training)
	PRESETFUNCPTR(0)
	DB $00
;;;;;;;;;;;;;;;;;;;;;;;;
;AUDIO LOADING ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;
;Audio packet loading routines
LoadAudio_InitData:
	php
	rep #$10
	ldx.w #$0000
	jsr LoadAudio
	plp
	rtl
LoadAudio_Title:
	php
	rep #$10
	ldx.w #$001C
	jsr LoadAudio
	plp
	rtl
LoadAudio_Controls:
	php
	rep #$10
	ldx.w #$0025
	jsr LoadAudio
	plp
	rtl
LoadAudio_Training:
	php
	rep #$10
	ldx.w #$0033
	jsr LoadAudio
	plp
	rtl
LoadAudio_Map:
	php
	rep #$10
	ldx.w #$0041
	jsr LoadAudio
	plp
	rtl
LoadAudio_Scramble1:
	php
	rep #$10
	ldx.w #$0061
	jsr LoadAudio
	plp
	rtl
LoadAudio_Corneria1:
	php
	rep #$10
	ldx.w #$0074
	jsr LoadAudio
	plp
	rtl
LoadAudio_Asteroid1:
	php
	rep #$10
	ldx.w #$008C
	jsr LoadAudio
	plp
	rtl
LoadAudio_SpaceArmadaBlastIn:
	php
	rep #$10
	ldx.w #$009A
	jsr LoadAudio
	plp
	rtl
LoadAudio_SpaceArmada:
	php
	rep #$10
	ldx.w #$00A8
	jsr LoadAudio
	plp
	rtl
LoadAudio_Meteor:
	php
	rep #$10
	ldx.w #$00B6
	jsr LoadAudio
	plp
	rtl
LoadAudio_VenomAtmosphere1:
	php
	rep #$10
	ldx.w #$00CE
	jsr LoadAudio
	plp
	rtl
LoadAudio_Venom1:
	php
	rep #$10
	ldx.w #$00DC
	jsr LoadAudio
	plp
	rtl
LoadAudio_Scramble2:
	php
	rep #$10
	ldx.w #$00EF
	jsr LoadAudio
	plp
	rtl
LoadAudio_Silence2:
	php
	rep #$10
	ldx.w #$0102
	jsr LoadAudio
	plp
	rtl
LoadAudio_SectorX:
	php
	rep #$10
	ldx.w #$0110
	jsr LoadAudio
	plp
	rtl
LoadAudio_Titania:
	php
	rep #$10
	ldx.w #$011E
	jsr LoadAudio
	plp
	rtl
LoadAudio_SectorY:
	php
	rep #$10
	ldx.w #$0136
	jsr LoadAudio
	plp
	rtl
LoadAudio_VenomAtmosphere2:
	php
	rep #$10
	ldx.w #$0144
	jsr LoadAudio
	plp
	rtl
LoadAudio_Highway:
	php
	rep #$10
	ldx.w #$0152
	jsr LoadAudio
	plp
	rtl
LoadAudio_Scramble3:
	php
	rep #$10
	ldx.w #$0165
	jsr LoadAudio
	plp
	rtl
LoadAudio_Silence3:
	php
	rep #$10
	ldx.w #$0178
	jsr LoadAudio
	plp
	rtl
LoadAudio_Asteroid3:
	php
	rep #$10
	ldx.w #$0186
	jsr LoadAudio
	plp
	rtl
LoadAudio_Fortuna:
	php
	rep #$10
	ldx.w #$0194
	jsr LoadAudio
	plp
	rtl
LoadAudio_SectorZ:
	php
	rep #$10
	ldx.w #$01AC
	jsr LoadAudio
	plp
	rtl
LoadAudio_Macbeth:
	php
	rep #$10
	ldx.w #$01BA
	jsr LoadAudio
	plp
	rtl
LoadAudio_VenomAtmosphere3:
	php
	rep #$10
	ldx.w #$01CD
	jsr LoadAudio
	plp
	rtl
LoadAudio_Venom3:
	php
	rep #$10
	ldx.w #$01DB
	jsr LoadAudio
	plp
	rtl
LoadAudio_Continue:
	php
	rep #$10
	ldx.w #$004F
	jsr LoadAudio
	plp
	rtl
LoadAudio_BlackHole:
	php
	rep #$10
	ldx.w #$0058
	jsr LoadAudio
	plp
	rtl
LoadAudio_Intro:
	php
	rep #$10
	ldx.w #$0009
	jsr LoadAudio
	plp
	rtl
LoadAudio_Ending:
	php
	rep #$10
	ldx.w #$01EE
	jsr LoadAudio
	plp
	rtl
LoadAudio_Credits:
	php
	rep #$10
	ldx.w #$01F7
	jsr LoadAudio
	plp
	rtl
LoadAudio_GameOver:
	php
	rep #$10
	ldx.w #$0200
	jsr LoadAudio
	plp
	rtl
LoadAudio_OutOfThisDimension:
	php
	rep #$10
	ldx.w #$0209
	jsr LoadAudio
	plp
	rtl
LoadAudio_BossTunnel:
	php
	rep #$10
	ldx.w #$0217
	jsr LoadAudio
	plp
	rtl
;Audio packet data
;	    MM  PP  PP  PP  ZZ  ZZ (PP  PP  PP  ZZ  ZZ...)
AudioPacketData:
	DB $00,$00,$80,$18,$C2,$28,$00,$00,$00									;(Initialization Data)
	DB $12,$C2,$A8,$18,$CC,$73,$8E,$9C,$19,$74,$35,$33,$FA,$0C,$5C,$05,$00,$00,$00				;Intro
	DB $12,$BE,$B5,$1B,$E7,$59,$00,$00,$00									;Title
	DB $12,$C2,$A8,$18,$CC,$73,$CD,$FB,$0F,$1E,$04,$00,$00,$00						;Controls
	DB $03,$02,$D2,$19,$B0,$2D,$45,$B9,$1E,$F3,$07,$00,$00,$00						;Training
	DB $01,$8E,$9C,$19,$74,$35,$A2,$A6,$1B,$1C,$0F,$00,$00,$00						;Map
	DB $0A,$75,$95,$1D,$7E,$11,$00,$00,$00									;Continue
	DB $03,$71,$FC,$0A,$A8,$01,$00,$00,$00									;Black Hole
	DB $10,$BA,$94,$1E,$A7,$0B,$77,$8E,$1F,$CA,$05,$7E,$92,$1A,$24,$94,$00,$00,$00				;Scramble 1
	DB $03,$C2,$A8,$18,$CC,$73,$02,$D2,$19,$B0,$2D,$BA,$94,$1E,$A7,$0B,$77,$8E,$1F,$CA,$05,$00,$00,$00	;Corneria 1
	DB $03,$C1,$CD,$1E,$42,$0C,$89,$FB,$11,$AB,$02,$00,$00,$00						;Asteroid 1
	DB $09,$03,$DA,$1E,$B3,$06,$4A,$9F,$1F,$3E,$04,$00,$00,$00						;Space Armada (Blast In)
	DB $03,$03,$DA,$1E,$B3,$06,$4A,$9F,$1F,$3E,$04,$00,$00,$00						;Space Armada
	DB $03,$02,$D2,$19,$B0,$2D,$B2,$FF,$19,$CC,$12,$61,$A0,$1E,$BE,$0C,$38,$9A,$1F,$12,$05,$00,$00,$00	;Meteor
	DB $03,$C1,$CD,$1E,$42,$0C,$88,$A3,$1F,$FB,$03,$00,$00,$00						;Venom 1 Atmosphere
	DB $03,$44,$F1,$1E,$02,$07,$88,$A3,$1F,$FB,$03,$B0,$AF,$1F,$35,$08,$00,$00,$00				;Venom 1
	DB $10,$BA,$94,$1E,$A7,$0B,$77,$8E,$1F,$CA,$05,$7E,$92,$1A,$24,$94,$00,$00,$00				;Scramble 2
	DB $03,$C2,$A8,$18,$CC,$73,$02,$D2,$19,$B0,$2D,$00,$00,$00						;Silence 2
	DB $03,$AC,$EB,$1E,$98,$05,$89,$FB,$11,$AB,$02,$00,$00,$00						;Sector X
	DB $03,$02,$D2,$19,$B0,$2D,$B2,$FF,$19,$CC,$12,$1F,$AD,$1E,$26,$0C,$41,$94,$1F,$F7,$05,$00,$00,$00	;Titania
	DB $03,$79,$F8,$10,$4A,$07,$89,$FB,$11,$AB,$02,$00,$00,$00						;Sector Y
	DB $03,$C1,$CD,$1E,$42,$0C,$88,$A3,$1F,$FB,$03,$00,$00,$00						;Venom 2 Atmosphere
	DB $03,$B6,$E0,$1E,$F6,$0A,$88,$A3,$1F,$FB,$03,$B0,$AF,$1F,$35,$08,$00,$00,$00				;Highway
	DB $10,$BA,$94,$1E,$A7,$0B,$77,$8E,$1F,$CA,$05,$7E,$92,$1A,$24,$94,$00,$00,$00				;Scramble 3
	DB $03,$C2,$A8,$18,$CC,$73,$02,$D2,$19,$B0,$2D,$00,$00,$00						;Silence 3
	DB $03,$C1,$CD,$1E,$42,$0C,$89,$FB,$11,$AB,$02,$00,$00,$00						;Asteroid 3
	DB $03,$02,$D2,$19,$B0,$2D,$B2,$FF,$19,$CC,$12,$B6,$F2,$08,$FE,$08,$62,$FC,$0E,$7E,$03,$00,$00,$00	;Fortuna
	DB $03,$AC,$EB,$1E,$98,$05,$4A,$9F,$1F,$3E,$04,$00,$00,$00						;Sector Z
	DB $03,$02,$D2,$19,$B0,$2D,$38,$C1,$1E,$89,$0C,$34,$FE,$11,$C5,$01,$00,$00,$00				;Macbeth
	DB $03,$C1,$CD,$1E,$42,$0C,$83,$A7,$1F,$2D,$08,$00,$00,$00						;Venom 3 Atmosphere
	DB $03,$44,$F1,$1E,$02,$07,$83,$A7,$1F,$2D,$08,$B0,$AF,$1F,$35,$08,$00,$00,$00				;Venom 3
	DB $03,$A5,$8F,$1C,$D0,$85,$00,$00,$00									;Ending
	DB $12,$F3,$A6,$1D,$C7,$6D,$00,$00,$00									;Credits
	DB $0C,$D0,$F8,$09,$2D,$01,$00,$00,$00									;Game Over
	DB $03,$02,$D2,$19,$B0,$2D,$46,$F8,$1E,$31,$16,$00,$00,$00						;Out Of This Dimension
	DB $12,$D0,$F8,$09,$2D,$01,$00,$00,$00									;Boss Tunnel
;Main audio loading routine
LoadAudio:
	sep #$20
	sei
	lda.l AudioPacketData,x				;\Set MusicID
	sta.w MusicID					;/
	inx
	stx.w TempLdAudioPktOffs
	lda.w InitDataSentFlag				;\If initialization data hasn't been set yet...
	beq LoadAudio_SkipSetBlockID			;|branch to skip this, otherwise...
	lda.b #$FF					;|set the block ID to $FF
	sta.w APUI00					;/
LoadAudio_SkipSetBlockID:
	lda.b #$01					;\Set flag
	sta.w InitDataSentFlag				;/
	rep #$20
	ldy.w #$0000
	lda.w #$BBAA					;\Wait until SPC700 is ready to receive data
LoadAudio_WaitSPCReady:					;|
	cmp.w APUI00					;|
	bne LoadAudio_WaitSPCReady			;/
	sep #$20					;\Send transfer signal/block ID to SPC700
	lda.b #$CC					;|
	pha						;|
	jmp LoadAudio_L17				;/
LoadAudio_L3:
	lda [D,TempLdAudPtr],y
	iny
	bne LoadAudio_L4
	inc.b TempLdAudPtr+2
	stz.b TempLdAudPtr+1
	stz.b TempLdAudPtr
	ldy.w #$8000
LoadAudio_L4:
	xba
	lda.b #$00
	bra LoadAudio_L8
LoadAudio_L5:
	xba
	lda [D,TempLdAudPtr],y
	iny
	bne LoadAudio_L6
	inc.b TempLdAudPtr+2
	stz.b TempLdAudPtr+1
	stz.b TempLdAudPtr
	ldy.w #$8000
LoadAudio_L6:
	xba
LoadAudio_L7:
	cmp.w APUI00
	bne LoadAudio_L7
	inc
LoadAudio_L8:
	rep #$20
	sta.w APUI00
	sep #$20
	dex
	bne LoadAudio_L5
LoadAudio_L9:
	cmp.w APUI00
	bne LoadAudio_L9
LoadAudio_L10:
	adc.b #$03
	beq LoadAudio_L10
	pha
LoadAudio_L11:
	rep #$20
	lda [D,TempLdAudPtr],y
	beq LoadAudio_L17
	iny
	bne LoadAudio_L12
	jml UnkFunc_1FBDEE
LoadAudio_L12:
	iny
	bne LoadAudio_L13
	jml UnkFunc_1FBDEE
LoadAudio_L13:
	tax
	lda [D,TempLdAudPtr],y
	iny
	bne LoadAudio_L14
	jml UnkFunc_1FBDEE
LoadAudio_L14:
	iny
	bne LoadAudio_L15
	jml UnkFunc_1FBDEE
LoadAudio_L15:
	sta.w APUI02
	sep #$20
	cpx.w #$0001
	lda.b #$00
	rol
	sta.w APUI01
	pla
	sta.w APUI00
LoadAudio_L16:
	cmp.w APUI00
	bne LoadAudio_L16
	jmp LoadAudio_L3
LoadAudio_L17:
	rep #$20
	ldx.w TempLdAudioPktOffs			; Load X with audio packet header pointer
	lda.l AudioPacketData,x				;\Set offset of audio packet data
	sta.w TempLdAudioBnkOffs			;/
	lda.l AudioPacketData+3,x			;\Set size of audio packet data
	sta.w TempLdAudioSz				;/
	sep #$20					;\Set bank of audio packet data
	lda.l AudioPacketData+2,x			;|
	sta.b TempLdAudPtr+2				;/
	inx						;\Increment current header pointer
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	stx.w TempLdAudioPktOffs			;/
	rep #$20					;\Clear out low word of temp packet pointer...
	stz.b TempLdAudPtr				;|
	lda.w TempLdAudioBnkOffs			;|...load A with low word of pointer...
	beq LoadAudio_Finish				;|...if zero, branch to finish up and leave...
	tay						;/...otherwise, use Y register instead for the low word...
	clc						;\Add size of audio packet data...
	adc.w TempLdAudioSz				;|
	bcc LoadAudio_L26				;|...if size would cause overflow in ROM pointer, branch...
	jmp LoadAudio_L11				;/...otherwise, jump here instead
LoadAudio_Finish:
	rep #$20					;\Set SPC700 PC register
	lda.w #$0400					;|
	sta.w APUI02					;/
	sep #$30
	lda.b #$00
	xba
	pla
	rep #$20
	sta.w APUI00
	sep #$20
LoadAudio_WaitReturn:
	cmp.w APUI00
	bne LoadAudio_WaitReturn
	stz.w APUI01
	stz.w APUI02
	stz.w APUI03
	stz.w MusicLoaded
	lda.w TIMEUP
	cli
	rts
LoadAudio_L20:
	lda [D,TempLdAudPtr],y
	iny
	xba
	lda.b #$00
	bra LoadAudio_L23
LoadAudio_L21:
	xba
	lda [D,TempLdAudPtr],y
	iny
	xba
LoadAudio_L22:
	cmp.w APUI00
	bne LoadAudio_L22
	inc
LoadAudio_L23:
	rep #$20
	sta.w APUI00
	sep #$20
	dex
	bne LoadAudio_L21
LoadAudio_L24:
	cmp.w APUI00
	bne LoadAudio_L24
LoadAudio_L25:
	adc.b #$03
	beq LoadAudio_L25
	pha
LoadAudio_L26:
	rep #$20
	lda [D,TempLdAudPtr],y
	bne LoadAudio_L27
	brl LoadAudio_L17
LoadAudio_L27:
	iny
	iny
	tax
	lda [D,TempLdAudPtr],y
	iny
	iny
	sta.w APUI02
	sep #$20
	cpx.w #$0001
	lda.b #$00
	rol
	sta.w APUI01
	pla
	sta.w APUI01
LoadAudio_L28:
	cmp.w APUI00
	bne LoadAudio_L28
	bra LoadAudio_L20
;Other audio loading routines
UnkFunc_03B269:
	sep #$20
	lda.w Unknown_14D1
	and.b #$08
	beq UnkFunc_03B269_L1
	lda.w Unknown_14D7
	and.b #$80
	bne UnkFunc_03B269_L2
UnkFunc_03B269_L1:
	lda.w Unknown_1FD2
	cmp.b #$10
	beq UnkFunc_03B269_L2
	cmp.b #$0F
	beq UnkFunc_03B269_L2
	cmp.b #$0B
	beq UnkFunc_03B269_L2
	cmp.b #$0C
	beq UnkFunc_03B269_L2
	cmp.b #$0D
	beq UnkFunc_03B269_L2
	jsr UnkFunc_03B3D2
	jsr UnkFunc_03B350
	bra UnkFunc_03B269_L3
UnkFunc_03B269_L2:
	stz.w APUI02
UnkFunc_03B269_L3:
	jsr UnkFunc_03B29F
	rtl
UnkFunc_03B29F:
	sep #$20
	rep #$10
	ldx.w Unknown_15A2
	lda.b $2E,x
	and.b #FLAGS2E_UNK04
	beq UnkFunc_03B29F_L1
	jml UnkFunc_03B29F_L2
UnkFunc_03B29F_L1:
	lda.w Unknown_14D0
	and.b #$40
	bne UnkFunc_03B29F_L2
	lda.w Unknown_14D8
	and.b #$02
	beq UnkFunc_03B29F_L2
	lda.w Unknown_14D7
	and.b #$80
	bne UnkFunc_03B29F_L3
	bra UnkFunc_03B29F_L4
UnkFunc_03B29F_L2:
	lda.b #$00
	sta.w APUI01
	sta.w Unknown_1FE1
	rts
UnkFunc_03B29F_L3:
	lda.b #$4B
	sta.w APUI01
	sta.w Unknown_1FE1
	rts
UnkFunc_03B29F_L4:
	lda.w EngineSoundFlag
	bne UnkFunc_03B29F_L7
	lda.w Unknown_18C2
	bit.b #$01
	bne UnkFunc_03B29F_L6
	lda.b #$C0
	bra UnkFunc_03B29F_L8
UnkFunc_03B29F_L5:
	lda.b #$C0
	bra UnkFunc_03B29F_L8
UnkFunc_03B29F_L6:
	lda.b #$00
	bra UnkFunc_03B29F_L8
UnkFunc_03B29F_L7:
	cmp.b #$02
	beq UnkFunc_03B29F_L5
	lda.b #$80
UnkFunc_03B29F_L8:
	ora.w Unknown_1F43
	sta.w TempMiscW
	lda.w Pad1LoCur
	bit.b #$30
	beq UnkFunc_03B29F_L14
	rep #$30
	ldx.w PlayerObject
	lda.b $0C,x
	tax
	sec
	sbc.w Unknown_1F44
	stx.w Unknown_1F44
	bpl UnkFunc_03B29F_L9
	eor.w #$FFFF
	inc
UnkFunc_03B29F_L9:
	cmp.w #$0002
	bcc UnkFunc_03B29F_L12
	cmp.w #$0004
	bcc UnkFunc_03B29F_L11
	cmp.w #$0008
	bcc UnkFunc_03B29F_L10
	lda.w #$0003
	bra UnkFunc_03B29F_L13
UnkFunc_03B29F_L10:
	lda.w #$0002
	bra UnkFunc_03B29F_L13
UnkFunc_03B29F_L11:
	lda.w #$0001
	bra UnkFunc_03B29F_L13
UnkFunc_03B29F_L12:
	lda.w #$0000
UnkFunc_03B29F_L13:
	ora.w TempMiscW
	sta.w TempMiscW
UnkFunc_03B29F_L14:
	sep #$20
	lda.w TempMiscW
	sta.w APUI01
	sta.w Unknown_1FE1
	rts
UnkFunc_03B34C:
	sta.w APUI02
	rts
UnkFunc_03B350:
	rep #$30
	ldx.w FirstObject
UnkFunc_03B350_L1:
	sep #$20
	lda.b $2A,x
	cmp.b #$FF
	bne UnkFunc_03B350_L6
	lda.b $1F,x
	and.b #FLAGS1F_UNK08
	bne UnkFunc_03B350_L2
	jml UnkFunc_03B350_L6
UnkFunc_03B350_L2:
	lda.b $20,x
	and.b #$02
	beq UnkFunc_03B350_L3
	jml UnkFunc_03B350_L6
UnkFunc_03B350_L3:
	rep #$20
	ldy.w PlayerObject
	lda.w Unknown_14F6
	sec
	sbc.b $0C,x
	bmi UnkFunc_03B350_L4
	cmp.w #$012C
	bcs UnkFunc_03B350_L6
	bra UnkFunc_03B350_L5
UnkFunc_03B350_L4:
	cmp #$FED4
	bcc UnkFunc_03B350_L6
UnkFunc_03B350_L5:
	lda.b $10,x
	sec
	sbc.w $0010,y
	cmp.w #$0064
	bcc UnkFunc_03B350_L7
UnkFunc_03B350_L6:
	ldy.b $00,x
	tyx
	bne UnkFunc_03B350_L1
	rts
UnkFunc_03B350_L7:
	sep #$20
	lda.b $20,x
	ora.b #$02
	sta.b $20,x
	rep #$20
	lda.w Unknown_14F6
	sec
	sbc.b $0C,x
	bmi UnkFunc_03B350_L8
	cmp.w #$0050
	bcc UnkFunc_03B350_L9
	sep #$20
	lda.b #$6D
	jsl PushSoundEffectToQueue
	rts
UnkFunc_03B350_L8:
	cmp.w #$FFB0
	bcs UnkFunc_03B350_L9
	sep #$20
	lda.b #$6F
	jsl PushSoundEffectToQueue
	rts
UnkFunc_03B350_L9:
	sep #$20
	lda.b #$6E
	jsl PushSoundEffectToQueue
	rts
UnkFunc_03B3D2:
	rep #$30
	ldx.w FirstObject
	lda.w #$7FFF
	stz.w Unknown_1F3D
UnkFunc_03B3D2_L1:
	ldy.b $04,x
	cpy.w #$C7C0
	bne UnkFunc_03B3D2_L2
	brl UnkFunc_03B3D2_L21
UnkFunc_03B3D2_L2:
	cpy.w #$D9B0
	bne UnkFunc_03B3D2_L3
	brl UnkFunc_03B3D2_L21
UnkFunc_03B3D2_L3:
	cpy.w #$D994
	bne UnkFunc_03B3D2_L4
	brl UnkFunc_03B3D2_L21
UnkFunc_03B3D2_L4:
	cpy.w #$D95C
	bne UnkFunc_03B3D2_L5
	brl UnkFunc_03B3D2_L21
UnkFunc_03B3D2_L5:
	cpy.w #$C050
	bne UnkFunc_03B3D2_L6
	brl UnkFunc_03B3D2_L21
UnkFunc_03B3D2_L6:
	pha
	sep #$20
	lda.b $08,x
	bit.b #FLAGS08_UNK01
	bne UnkFunc_03B3D2_L9
	lda.w Object2ListRel+$1E,x
	bne UnkFunc_03B3D2_L7
	lda.w Object2ListRel+$1F,x
	beq UnkFunc_03B3D2_L9
UnkFunc_03B3D2_L7:
	ldy PlayerObject
	rep #$20
	lda.b $10,x
	sec
	sbc.w $0010,y
	bpl UnkFunc_03B3D2_L8
	eor.w #$FFFF
	inc
UnkFunc_03B3D2_L8:
	sta.w Unknown_1250
	pla
	cmp.w Unknown_1250
	bcc UnkFunc_03B3D2_L10
	lda.w Unknown_1250
	stx.w Unknown_1F3D
	sta.w TempLdAudioBnkOffs
	bra UnkFunc_03B3D2_L10
UnkFunc_03B3D2_L9:
	rep #$20
	pla
UnkFunc_03B3D2_L10:
	ldy.b $00,x
	tyx
	bne UnkFunc_03B3D2_L1
	ldx.w Unknown_1F3D
	bne UnkFunc_03B3D2_L11
	brl UnkFunc_03B3D2_L19
UnkFunc_03B3D2_L11:
	cpx.w UnkAudio_1F66
	beq UnkFunc_03B3D2_L12
	brl UnkFunc_03B3D2_L19
UnkFunc_03B3D2_L12:
	lda.w Object2ListRel+$1E,x
	and.w #$00FF
	beq UnkFunc_03B3D2_L13
	brl UnkFunc_03B3D2_L20
UnkFunc_03B3D2_L13:
	lda.w Object2ListRel+$1F,x
	and.w #$00FF
	sta.w Unknown_1F3D
	ldy.w PlayerTempObject
	jsl FaceTargetObjectY
	xba
	rep #$20
	and.b #$FF
	tax
	lda.l UnkData_03B539,x
	and.b #$FF
	ora.w Unknown_1F3D
	sta.w Unknown_1F3D
	lda.w TempLdAudioBnkOffs
	cmp.w #$00FA
	bcc UnkFunc_03B3D2_L17
	cmp.w #$028A
	bcc UnkFunc_03B3D2_L16
	cmp.w #$047E
	bcc UnkFunc_03B3D2_L15
	cmp.w #$0C4E
	bcs UnkFunc_03B3D2_L19
UnkFunc_03B3D2_L14:
	sep #$20
	lda.b #$30
	bra UnkFunc_03B3D2_L18
UnkFunc_03B3D2_L15:
	sep #$20
	lda.b #$20
	bra UnkFunc_03B3D2_L18
UnkFunc_03B3D2_L16:
	sep #$20
	lda.b #$10
	bra UnkFunc_03B3D2_L18
UnkFunc_03B3D2_L17:
	sep #$20
	lda.b #$00
UnkFunc_03B3D2_L18:
	ora.w Unknown_1F3D
	sta.w APUI02
	rts
UnkFunc_03B3D2_L19:
	sep #$20
	stz.w APUI02
	stx.w UnkAudio_1F66
	rts
UnkFunc_03B3D2_L20:
	sep #$20
	sta.w APUI02
	rts
UnkFunc_03B3D2_L21:
	rep #$20
	lda.w Object2ListRel+$1F,x
	and.w #$00FF
	sta.w Unknown_1F3D
	stx.w UnkAudio_1F66
	ldy.w PlayerObject
	lda.b $10,x
	sec
	sbc.w $0010,y
	bmi UnkFunc_03B3D2_L19
	sta.w TempLdAudioBnkOffs
	lda.w Unknown_14F6
	sec
	sbc.b $0C,x
	bmi UnkFunc_03B3D2_L22
	cmp.w #$0050
	bcc UnkFunc_03B3D2_L23
	lda.w Unknown_1F3D
	ora.w #$0040
	bra UnkFunc_03B3D2_L24
UnkFunc_03B3D2_L22:
	cmp.w #$FFB0
	bcs UnkFunc_03B3D2_L23
	lda.w Unknown_1F3D
	ora.w #$00C0
	bra UnkFunc_03B3D2_L24
UnkFunc_03B3D2_L23:
	lda.w Unknown_1F3D
	ora.w #$0080
UnkFunc_03B3D2_L24:
	sta.w Unknown_1F3D
	lda.w TempLdAudioBnkOffs
	cmp.w #$01F4
	bcc UnkFunc_03B3D2_L19
	cmp.w #$1388
	bcc UnkFunc_03B3D2_L17
	cmp.w #$2710
	bcc UnkFunc_03B3D2_L16
	cmp.w #$2710
	bcs UnkFunc_03B3D2_L25
	brl UnkFunc_03B3D2_L15
UnkFunc_03B3D2_L25:
	cmp.w #$2AF8
	bcs UnkFunc_03B3D2_L26
	brl UnkFunc_03B3D2_L14
UnkFunc_03B3D2_L16:
	bra UnkFunc_03B3D2_L19
UnkData_03B539:
	DB $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	DB $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	DB $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	DB $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	DB $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	DB $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	DB $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40
	DB $40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$40,$80,$80,$80
	DB $80,$80,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
	DB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
	DB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
	DB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
	DB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
	DB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
	DB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
	DB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
;Surround sound effect loading routines
UnkFunc_03B639:
	lda.b #$1E
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$1F
	sta.w SESurroundTable+3
	lda.b #$20
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B651:
	lda.b #$21
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$22
	sta.w SESurroundTable+3
	lda.b #$23
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B669:
	lda.b #$24
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$25
	sta.w SESurroundTable+3
	lda.b #$26
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B681:
	lda.b #$27
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$28
	sta.w SESurroundTable+3
	lda.b #$29
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B699:
	lda.b #$3C
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$3D
	sta.w SESurroundTable+3
	lda.b #$3E
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B6B1:
	lda.b #$3F
	sta.w SESurroundTable
	lda.b #$40
	sta.w SESurroundTable+1
	lda.b #$41
	sta.w SESurroundTable+2
	lda.b #$42
	sta.w SESurroundTable+3
	lda.b #$43
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B6CD:
	lda.b #$44
	sta.w SESurroundTable
	lda.b #$45
	sta.w SESurroundTable+1
	lda.b #$46
	sta.w SESurroundTable+2
	lda.b #$47
	sta.w SESurroundTable+3
	lda.b #$48
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B6E9:
	lda.b #$49
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$4A
	sta.w SESurroundTable+3
	lda.b #$4B
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B701:
	lda.b #$5C
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$5D
	sta.w SESurroundTable+3
	lda.b #$5E
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B719:
	lda.b #$54
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$55
	sta.w SESurroundTable+3
	lda.b #$55
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B731:
	lda.b #$52
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$53
	sta.w SESurroundTable+3
	lda.b #$53
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B749:
	lda.b #$68
	sta.w SESurroundTable
	lda.b #$69
	sta.w SESurroundTable+1
	lda.b #$6A
	sta.w SESurroundTable+2
	lda.b #$6B
	sta.w SESurroundTable+3
	lda.b #$6C
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B765:
	lda.b #$74
	sta.w SESurroundTable
	lda.b #$75
	sta.w SESurroundTable+1
	lda.b #$76
	sta.w SESurroundTable+2
	lda.b #$77
	sta.w SESurroundTable+3
	lda.b #$78
	sta.w SESurroundTable+4
	jmp PlaySESurround
UnkFunc_03B781:
	lda.b #$49
	sta.w SESurroundTable
	sta.w SESurroundTable+1
	sta.w SESurroundTable+2
	lda.b #$4A
	sta.w SESurroundTable+3
	lda.b #$4B
	sta.w SESurroundTable+4
	jmp PlaySESurround
;Main surround sound effect processing routine
PlaySESurround:
	phx
	phy
	php
	ldy.w PlayerObject
	jsl UnkAngleGetterHelperFunc_1FD0AB
	rep #$20
	lda.w Unknown_1250
	cmp.w #$07D0
	bcc PlaySESurround_Near
	cmp.w #$047E
	bcc PlaySESurround_Mid
	cmp.w #$0C4E
	bcc PlaySESurround_Far
PlaySESurround_Exit:
	plp
	ply
	plx
	rtl
PlaySESurround_Near:
	lda.w Unknown_14F6
	sec
	sbc.b $0C,x
	bmi PlaySESurround_NearRight
	cmp.w #$00AA
	bcc PlaySESurround_NearCenter
	sep #$20
	lda.w SESurroundTable+$00
	jmp PlaySESurround_PushSE
PlaySESurround_NearRight:
	cmp.w #$FF56
	bcs PlaySESurround_NearCenter
	sep #$20
	lda.w SESurroundTable+$02
	jmp PlaySESurround_PushSE
PlaySESurround_NearCenter:
	sep #$20
	lda.w SESurroundTable+$01
	jmp PlaySESurround_PushSE
PlaySESurround_Mid:
	sep #$20
	lda.w SESurroundTable+$03
	jmp PlaySESurround_PushSE
PlaySESurround_Far:
	sep #$20
	lda.w SESurroundTable+$04
PlaySESurround_PushSE:
	jsl PushSoundEffectToQueue
	jmp PlaySESurround_Exit
PushSoundEffectToQueue:
	php
	pha
	sep #$20
	lda.w Unknown_1FCF
	bne PushSoundEffectToQueue_Exit
	lda.w Unknown_14D1
	and.b #$08
	beq PushSoundEffectToQueue_Insert
	lda.w Unknown_14D7
	and.b #$80
	bne PushSoundEffectToQueue_Exit
PushSoundEffectToQueue_Insert:
	pla
	phx
	ldx.w SEQueuePtr
	sta.w SoundEffectQueue,x
	lda.w SEQueuePtr
	inc
	and.b #$0F
	sta.w SEQueuePtr
	plx
	plp
	rtl
PushSoundEffectToQueue_Exit:
	pla
	plp
	rtl
;;;;;;;;;;;;;;;;;;;;;;;;;
;MISC. UTILITY FUNCTIONS;
;;;;;;;;;;;;;;;;;;;;;;;;;
UnkFunc_03B827:
	php
	bra UnkFunc_03B827_L1
	php
	sep #$30
UnkFunc_03B827_L1:
	lda.b #$3A					;\Seed PRNG
	sta.b PRNGBuffer				;|
	lda.b #$AF					;|
	sta.b PRNGBuffer+1				;|
	lda.b #$55					;|
	sta.b PRNGBuffer+2				;|
	lda.b #$7F					;|
	sta.b PRNGBuffer+3				;/
	stz.b Unused_98
	stz.b Unused_B9
	stz.b Unused_95
	stz.b Unused_9B
	stz.b Unknown_9C
	stz.b Unused_9D
	stz.b Unused_DC
	stz.w Unknown_1633+1
	stz.w Unknown_1635+1
	stz.w Unknown_1637+1
	stz.w Unused_1249
	stz.w Unused_124A
	lda.b #$00
	sta.w Unknown_15CA
	jsl RunSuperFXCalculateMatrixEx
	jsl CopyDebugFont
	jsl UnkFunc_03B86F
	plp
	rtl
UnkFunc_03B86F:
	lda.b #$FF
	sta.w Unknown_15BF
	jsl RunSuperFXUnkRoutine01A861
	lda.b Unknown_CA
	sta.l UnknownGSU_034
	lda.b Unknown_CC
	sta.l UnknownGSU_036
	lda.b Unknown_2A
	sta.l UnknownGSU_038
	lda.b Unknown_2E
	sta.l UnknownGSU_03A
	lda.b Unknown_2C
	sta.l UnknownGSU_03C
	lda.b Unknown_30
	sta.l UnknownGSU_03E
	rtl
CopyDebugFont:
	php
	sep #$30
	ldy.b #$00
	ldx.b #$00
	lda.b #$80
	sta.b $60
CopyDebugFont_Loop:
	lda.w DebugFont,x
	sta.w CopiedDebugFont,x
	inx
	iny
	iny
	dec.b $60
	bne CopyDebugFont_Loop
	plp
	rtl
RunSuperFXCalculateMatrixEx:
	php
	rep #$20
	stz.w Unknown_1633
	stz.w Unknown_1635
	stz.w Unknown_1637
	lda.w Unknown_1633
	sta.w Unknown_162D
	lda.w Unknown_1635
	sta.w Unknown_162F
	lda.w Unknown_1637
	sta.w Unknown_1631
	sep #$20
	jsl RunSuperFXCalculateMatrix
	rep #$20
	lda.w Unknown_15D7.XX
	sta.w Unknown_161B.XX
	lda.w Unknown_15D7.YX
	sta.w Unknown_161B.YX
	lda.w Unknown_15D7.ZX
	sta.w Unknown_161B.ZX
	lda.w Unknown_15D7.XY
	sta.w Unknown_161B.XY
	lda.w Unknown_15D7.YY
	sta.w Unknown_161B.YY
	lda.w Unknown_15D7.ZY
	sta.w Unknown_161B.ZY
	lda.w Unknown_15D7.XZ
	sta.w Unknown_161B.XZ
	lda.w Unknown_15D7.YZ
	sta.w Unknown_161B.YZ
	lda.w Unknown_15D7.ZZ
	sta.w Unknown_161B.ZZ
	sep #$20
	lda.b #$7F
	sta.w TempIdentityMatrix.XX+1
	stz.w TempIdentityMatrix.YX+1
	stz.w TempIdentityMatrix.ZX+1
	stz.w TempIdentityMatrix.XY+1
	sta.w TempIdentityMatrix.YY+1
	stz.w TempIdentityMatrix.ZY+1
	stz.w TempIdentityMatrix.XZ+1
	stz.w TempIdentityMatrix.YZ+1
	sta.w TempIdentityMatrix.ZZ+1
	stz.w TempIdentityMatrix.XX
	stz.w TempIdentityMatrix.YX
	stz.w TempIdentityMatrix.ZX
	stz.w TempIdentityMatrix.XY
	stz.w TempIdentityMatrix.YY
	stz.w TempIdentityMatrix.ZY
	stz.w TempIdentityMatrix.XZ
	stz.w TempIdentityMatrix.YZ
	stz.w TempIdentityMatrix.ZZ
	plp
	rtl
RunSuperFXMultiplyPointByMatrix:
	phx
	phy
	php
	rep #$30
	lda.b TempVecXG
	sta.l InputVecX
	lda.b TempVecYG
	sta.l InputVecY
	lda.b TempVecZG
	sta.l InputVecZ
	sep #$20
	lda.b #BANKOF(MultiplyPointByMatrix)
	ldx.w #MultiplyPointByMatrix
	jsl RunSuperFXRoutine
	rep #$20
	lda.l OutputVecX
	sta.b Unknown_B3
	lda.l OutputVecY
	sta.b Unknown_B5
	lda.l OutputVecZ
	sta.b Unknown_B7
	plp
	ply
	plx
	rtl
RunSuperFXCalculateMatrix:
	rep #$20
	lda.w Unknown_162D
	sta.l DesiredXRot
	lda.w Unknown_162F
	sta.l DesiredYRot
	lda.w Unknown_1631
	sta.l DesiredZRot
	sep #$20
	rep #$10
	lda.b #BANKOF(CalculateMatrix)
	ldx.w #CalculateMatrix
	jsl RunSuperFXRoutine
	lda.l ObjectMatrix.XX
	sta.w UnkMatrix_15D7.XX
	lda.l ObjectMatrix.YX
	sta.w UnkMatrix_15D7.YX
	lda.l ObjectMatrix.ZX
	sta.w UnkMatrix_15D7.ZX
	lda.l ObjectMatrix.XY
	sta.w UnkMatrix_15D7.XY
	lda.l ObjectMatrix.YY
	sta.w UnkMatrix_15D7.YY
	lda.l ObjectMatrix.ZY
	sta.w UnkMatrix_15D7.ZY
	lda.l ObjectMatrix.XZ
	sta.w UnkMatrix_15D7.XZ
	lda.l ObjectMatrix.YZ
	sta.w UnkMatrix_15D7.YZ
	lda.l ObjectMatrix.ZZ
	sta.w UnkMatrix_15D7.ZZ
	sep #$30
	rtl
UnkFunc_03B9F2:
	lda.b TempVecXG
	sta.b Unknown_84
	lda.b TempVecXG+1
	sta.b Unknown_84+1
	lda.b TempVecZG
	sta.b Unknown_86
	lda.b TempVecZG+1
	sta.b Unknown_86+1
	jsl UnkFunc_03BA45
	lda.b Unknown_88
	sta.b Unknown_72
	lda.b Unknown_72+1
	sta.b Unknown_72+1
	lda.b TempVecYG
	sta.b Unknown_84
	lda.b TempVecYG+1
	sta.b Unknown_84+1
	lda.b TempVecZG
	sta.b Unknown_86
	lda.b TempVecZG+1
	sta.b Unknown_86+1
	jsl UnkFunc_03BA45
	lda.b Unknown_88
	sta.b Unknown_74
	lda.b Unknown_88+1
	sta.b Unknown_74+1
	clc
	lda.b Unknown_CC
	adc.b Unknown_74
	sta.b Unknown_74
	lda.b Unknown_CC+1
	adc.b Unknown_74+1
	sta.b Unknown_74+1
	sec
	lda.b Unknown_74
	sbc.b Unknown_CA
	sta.b Unknown_74
	lda.b Unknown_74+1
	sbc.b Unknown_CA+1
	sta.b Unknown_74+1
	rtl
UnkFunc_03BA45:
	ldx.b #$00
	lda.b Unknown_86+1
	beq UnkFunc_03BA45_L3
	inx
	lsr
	beq UnkFunc_03BA45_L2
UnkFunc_03BA45_L1:
	ror.b Unknown_86
	inx
	lsr
	bne UnkFunc_03BA45_L1
UnkFunc_03BA45_L2:
	ror.b Unknown_86
UnkFunc_03BA45_L3:
	stx.b Unused_92
	ldx.b #$00
	lda.b Unknown_84+1
	sta.b Unused_8B
	bpl UnkFunc_03BA45_L4
	lda.b #$00
	sec
	sbc.b Unknown_84
	sta.b Unknown_84
	lda.b #$00
	sbc.b Unknown_84+1
	sta.b Unknown_84+1
UnkFunc_03BA45_L4:
	beq UnkFunc_03BA45_L7
	inx
	lsr
	beq UnkFunc_03BA45_L6
UnkFunc_03BA45_L5:
	ror.b Unknown_84
	inx
	lsr
	bne UnkFunc_03BA45_L5
UnkFunc_03BA45_L6:
	ror.b Unknown_84
	jmp UnkFunc_03BA45_L9
UnkFunc_03BA45_L7:
	lda.b Unknown_84
	bmi UnkFunc_03BA45_L9
	bne UnkFunc_03BA45_L8
	lda.b Unknown_CA
	sta.b Unknown_88
	lda.b Unknown_CA+1
	sta.b Unknown_88+1
	jmp UnkFunc_03BA45_L16
UnkFunc_03BA45_L8:
	dex
	asl
	bpl UnkFunc_03BA45_L8
	sta.b Unknown_84
UnkFunc_03BA45_L9:
	lda.b Unknown_86
	cmp.b Unknown_84
	bcc UnkFunc_03BA45_L11
UnkFunc_03BA45_L10:
	dex
	lsr
	cmp.b Unknown_84
	bcs UnkFunc_03BA45_L10
	sta.b Unknown_86
UnkFunc_03BA45_L11:
	txa
	sec
	sbc.b Unused_92
	sta.b Unused_8A
	ldx.b Unknown_84
	lda UnkData_0083D5,x
	ldx.b Unknown_86
	sec
	sbc UnkData_0083D5,x
	tax
	lda UnkData_0082D5,x
	sta.b Unknown_88+1
	lda UnkData_0081D5,x
	lda.b Unused_8A
	bmi UnkFunc_03BA45_L13
	beq UnkFunc_03BA45_L14
UnkFunc_03BA45_L12:
	asl
	rol.b Unknown_88+1
	dex
	bne UnkFunc_03BA45_L12
	jmp UnkFunc_03BA45_L14
UnkFunc_03BA45_L13:
	lsr.b Unknown_88+1
	ror
	inx
	bne UnkFunc_03BA45_L13
UnkFunc_03BA45_L14:
	sta.b Unknown_88
	bit.b Unused_8B
	bpl UnkFunc_03BA45_L15
	sec
	lda.b Unknown_CA
	sbc.b Unknown_88
	sta.b Unknown_88
	lda.b Unknown_CA+1
	sbc.b Unknown_88+1
	sta.b Unknown_88+1
	jmp UnkFunc_03BA45_L16
UnkFunc_03BA45_L15:
	clc
	lda.b Unknown_88
	adc.b Unknown_CA
	sta.b Unknown_88
	lda.b Unknown_88+1
	adc.b Unknown_CA+1
	sta.b Unknown_88+1
UnkFunc_03BA45_L16:
	rtl
RunSuperFXUnknown:
	bpl RunSuperFXUnknown_L1
	brl RunSuperFXUnknown_L2
RunSuperFXUnknown_L1:
	rep #$30
	lda.b Unknown_C1
	and.w #$00FF
	eor.w #$00FF
	sec
	sbc.w #$0780
	sta.b TempVecXG
	lda.b Unknown_C5
	and.w #$00FF
	eor.w #$00FF
	sec
	sbc.w #$0780
	sta.b TempVecZG
	lda.w #$0000
	sec
	sbc.b Unknown_C3
	sta.b TempVecYG
	lda.b Unknown_C1
	and.w #$FF00
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sep #$20
	sta.w Unknown_164B
	rep #$20
	lda.b Unknown_C5
	and.w #$FF00
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sep #$20
	sta.w Unknown_164C
	jsl RunSuperFXMultiplyPointByMatrix
	rep #$20
	lda.b Unknown_B3
	sta.b TempVecXG
	lda.b Unknown_B5
	sta.b TempVecYG
	lda.b Unknown_B7
	sta.b TempVecZG
	sep #$20
	rep #$20
	lda.l UnkMatrix_161B.XX
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.XX
	lda.l UnkMatrix_161B.YX
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.YX
	lda.l UnkMatrix_161B.ZX
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.ZX
	lda.l UnkMatrix_161B.XY
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.XY
	lda.l UnkMatrix_161B.YY
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.YY
	lda.l UnkMatrix_161B.ZY
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.ZY
	lda.l UnkMatrix_161B.XZ
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.XZ
	lda.l UnkMatrix_161B.YZ
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.YZ
	lda.l UnkMatrix_161B.ZZ
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	cmp.w #$8000
	ror
	sta.l UnkMatrix_1639.ZZ
	sep #$20
	rep #$20
	lda.b TempVecXG
	sta.l InputVecX
	lda.b TempVecYG
	sta.l InputVecY
	lda.b TempVecZG
	sta.l InputVecZ
	lda.w UnkMatrix_1639.XX
	sta.l UnknownGSU_142
	lda.w UnkMatrix_1639.YX
	sta.l UnknownGSU_144
	lda.w UnkMatrix_1639.ZX
	sta.l UnknownGSU_146
	lda.w UnkMatrix_1639.XZ
	sta.l UnknownGSU_148
	lda.w UnkMatrix_1639.YZ
	sta.l UnknownGSU_14A
	lda.w UnkMatrix_1639.ZZ
	sta.l UnknownGSU_14C
	sep #$20
	rep #$10
	lda.w Unknown_164B
	sta.l UnknownGSU_150
	lda.w Unknown_164B
	sta.l UnknownGSU_152
	sep #$20
	rtl
RunSuperFXUnkRoutine01A861:
	sep #$20
	rep #$10
	lda.b #BANKOF(UnkFuncGSU_01A861)
	ldx.w #UnkFuncGSU_01A861
	jsl RunSuperFXRoutine
	sep #$30
	rtl
RunSuperFXUnknown_L2:
	rep #$20
	lda.w Unknown_1F0D
	and.w #$00FF
	beq RunSuperFXUnknown_L3
	lda.w Unknown_1FD4
	sta.l UnknownGSU_0C6
	lda.w Unknown_1FD6
	sta.l UnknownGSU_0C8
	lda.w Unknown_1FD8
	sta.l UnknownGSU_0CA
	bra RunSuperFXUnknown_L4
RunSuperFXUnknown_L3:
	lda.b Unknown_C1
	sta.l UnknownGSU_0C6
	lda.b Unknown_C3
	sta.l UnknownGSU_0C8
	lda.b Unknown_C5
	sta.l UnknownGSU_0CA
	lda.w Unknown_14C2
	and.w #$00FF
	beq RunSuperFXUnknown_L4
	lda.w Unknown_14CD
	sta.l UnknownGSU_0CA
RunSuperFXUnknown_L4:
	lda.w UnkMatrix_161B.XX
	sta.l ObjectMatrix.XX
	lda.w UnkMatrix_161B.YX
	sta.l ObjectMatrix.YX
	lda.w UnkMatrix_161B.ZX
	sta.l ObjectMatrix.ZX
	lda.w UnkMatrix_161B.XY
	sta.l ObjectMatrix.XY
	lda.w UnkMatrix_161B.YY
	sta.l ObjectMatrix.YY
	lda.w UnkMatrix_161B.ZY
	sta.l ObjectMatrix.ZY
	lda.w UnkMatrix_161B.XZ
	sta.l ObjectMatrix.XZ
	lda.w UnkMatrix_161B.YZ
	sta.l ObjectMatrix.YZ
	lda.w UnkMatrix_161B.ZZ
	sta.l ObjectMatrix.ZZ
	sep #$30
	rtl
WaitVBlank:
	php
	sep #$20
	lda.b #$DE
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	lda.b #$00
WaitVBlank_Extra:
	dec a
	bne WaitVBlank_Extra
	plp
	rts
WaitScanline:
	php
	rep #$30
	phx
	pha
	sep #$20
	stz.w ScanlineToWaitFor+1
WaitScanline_Wait:
	sep #$20
	lda.w SLHV
	lda.w OPVCT
	xba
	lda.w OPVCT
	xba
	cmp.w ScanlineToWaitFor
	bne WaitScanline_Wait
	rep #$30
	pla
	plx
	plp
	rtl
InitPlayerState:
	php
	sep #$20
	lda.b #$03
	sta.w Lives
	stz.w Continues
	rep #$20
	lda.w #$00FC
	sta.w Unknown_16CE
	lda.w #$0092
	sta.w Unknown_16D0
	lda.w #$0018
	sta.w Unknown_16D2
	lda.w #$019A
	sta.w Unknown_16D4
	stz.w StageID
	stz.w Unknown_16DD
	stz.w Unknown_16DF
	plp
	rtl
;;;;;;;;;;;;;;;
;MAP FUNCTIONS;
;;;;;;;;;;;;;;;
;Main map processing loop
Map:
	sep #$20
	rep #$10
	jsr UnkMapFunc_03D11C
	stz.w UnkAudio_1F51
	ldx.w #$0000
	stx.w SEQueuePtrOld
	stx.w SEQueuePtr
	stz.w Unknown_1FCF
	sei
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_1D6
	sta.w Unknown_16E4
	lda.w #$0000
	sta.l UnknownGSU_1D8
	sta.w Unknown_16E6
	lda.w #$0096
	sta.w Unknown_16E8
	sta.l UnknownGSU_1DA
	ldx.w #$1281
	stx.b Unknown_30
	stz.b Unknown_34
	lda.w #$0001
	sta.b Unknown_36
	jsl LoadMapGraphics
	jsr UnkMapFunc_03C511
	sep #$20
	lda.b $45
	lsr
	lsr
	sta.w SCBR
	lda.b #$FF
	sta.w Unknown_16D9
	lda.b #$06
	sta.l UnknownGSU_09A
	jsr UnkMapFunc_03CA7B
	jsr UnkMapFunc_03C71C
	jsr UnkMapFunc_03C891
	jsr UnkMapFunc_03C71C
	jsr UnkMapFunc_03C891
	jsl UnkMapFunc_03CB35
	rep #$30
	lda.w #$2020
	sta.w VMADDL
	ldx.w #$0000
Map_CpyGfxLoop1:
	lda.w MapShipGraphic,x
	sta.w VMDATAL
	inx
	inx
	cpx.w #$03C0
	bne.w Map_CpyGfxLoop1
	lda.w #$5020
	sta.w VMADDL
	ldx.w #$0000
Map_CpyGfxLoop2:
	lda.w MapShipGraphic,x
	sta.w VMDATAL
	inx
	inx
	cpx.w #$03C0
	bne.w Map_CpyGfxLoop2
	rep #$20
	stz.b $04
	lda.w #$0010
	sta.w TempVecZL
	dec.w StageID
	bmi Map_L3
	inc.w StageID
	jsl ReadLevelHeader
	lda.w Unknown_16D9
	pha
	dec.w StageID
	jsl ReadLevelHeader
	pla
Map_L3:
	pha
	inc.w StageID
	sep #$20
	rep #$10
	lda.w Unknown_16D9
	bpl Map_L4
	lda.b #$00
Map_L4:
	rep #$20
	asl a
	tax
	lda.l UnkData_03D408,x
	sta.b $32
	sta.b $38
	jsr UnkMapFunc_03C67F
	sep #$30
	lda.b #$08
	sta.w HDMAEN
	lda.b #$BE
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$30
	lda.b #$64
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$30
	rep #$20
	pla
	sep #$20
	pha
	lda.l TIMEUP
	cli
	jsl LoadAudio_Map
	pla
	cmp.b #$0E
	beq Map_L5
	cmp.b #$0A
	bne Map_L6
Map_L5:
	lda.b #$0F
	sta.w MusicID
	stz.w MusicLoaded
Map_L6:
	lda.b #$FF
Map_L7:
	pha
	lda.b #$C8
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$30
	jsr.w WaitVBlank
	pla
	inc a
	inc a
	sta.l UnkData_7E4605+3
	sta.l UnkData_7E4605+5
	sta.l UnkData_7E4605+7
	cmp.b #$0F
	bne Map_L7
	sep #$20
	rep #$10
	lda.w StageID
	beq Map_L8
	brl Main_L20
Map_L8:
	lda.b #$0A
	sta.w StageID
	rep #$20
	lda.w #$0010
	sta.l UnknownGSU_09A
Map_Loop:
	inc.w Unknown_15BB
	jsr UnkMapFunc_03C511
	jsr UnkMapFunc_03C58F
	lda.l UnknownGSU_09A
	pha
	lda.w #$0006
	sta.l UnknownGSU_09A
	lda.w #$FFFE
	sta.w Unknown_16D9
	jsr UnkMapFunc_03CA7B
	pla
	sta.l UnknownGSU_09A
	jsr UnkMapFunc_03C78D
	lda.l UnknownGSU_09A
	beq Map_L10
	sec
	sbc.w #$0004
	sta.l UnknownGSU_09A
Map_L10:
	jsr UnkMapFunc_03C891
	lda.w Unknown_15BB
	bit.w #$0002
	beq Map_L11
	jsl ReadLevelHeader
	bra Map_DoIncDec
Map_L11:
	jsl UnkMapFunc_03CC22
Map_DoIncDec:
	jsl UpdateInput
	lda.w Pad1Down					;\Check if Select/Start/D-pad pressed...
	bit.w #$2F00					;|
	beq Map_SkipIncDec				;/...if not, skip all of this
	lda.w #$0010
	sta.l UnknownGSU_09A
	jsr WaitVBlank
	jsl UnkMapFunc_03CC22
	lda.w Pad1Down					;\If Down/Right not pressed...
	bit.w #$2A00					;|
	sep #$20					;|
	bne Map_DoDec					;|...skip past this, otherwise...
	lda.w TempLevelID				;|...increment level/route ID...
	inc						;|
	cmp.b #$03					;|...if 3 or more, loop around to 0
	bne Map_IncLoop					;|
	lda.b #$00					;/
Map_IncLoop:
	sta.w TempLevelID
	bra Map_FinishIncDec
Map_DoDec:
	lda.w TempLevelID				;\Decrement level/route ID...
	dec						;|
	cmp.b #$FF					;|... if negative, loop around to 2
	bne Map_DecLoop					;|
	lda.b #$02					;/
Map_DecLoop:
	sta.w TempLevelID
Map_FinishIncDec:
	lda.b #$11
	jsl PushSoundEffectToQueue
	jsl UnkMapFunc_03C67F
	rep #$20
Map_SkipIncDec:
	lda.w Pad1Down					;\Check if Start/A/B pressed...
	bit.w #$9080					;|
	bne Map_L18					;|...if so, branch ahead, otherwise...
	brl Map_Loop					;/...go back
Map_L18:
	stz.w StageID
	stz.w Unknown_16D9
	jsl ReadLevelHeader
	sep #$20
	lda.b #$F1
	sta.w MusicID
	stz.w MusicLoaded
	rep #$20
	jmp Map_L23
Map_L20:
	sep #$20
	jsr UnkMapFunc_03C67F
Map_L21:
	ldx.b $02
	phx
	lda.b #$FF
	sta.w Unknown_16D9
	jsr UnkMapFunc_03C511
	jsr UnkMapFunc_03C58F
	jsr UnkMapFunc_03CA7B
	jsr UnkMapFunc_03C78D
	jsr UnkMapFunc_03C891
	plx
	stx.b $02
	jsr UnkMapFunc_03C484
	bcc Map_L21
	jsr WaitVBlank
	jsl ReadLevelHeader
	lda.b #$08
	sta.b CurNMITask
	lda.w Unknown_16D9
	pha
	lda.b #$FE
	sta.w Unknown_16D9
Map_L22:
	jsr UnkMapFunc_03C511
	jsr UnkMapFunc_03C58F
	jsr UnkMapFunc_03CA7B
	jsr UnkMapFunc_03C78D
	jsr UnkMapFunc_03C891
	jsl UpdateInput
	rep #$20
	lda.w Pad1Down
	bit.w #$D0C0
	sep #$20
	beq Map_L22
	pla
	sta.w Unknown_16D9
Map_L23:
	sep #$20
	rep #$10
	lda.b #$F1
	sta.w MusicID
	stz.w MusicLoaded
	lda.b #$10
	jsl PushSoundEffectToQueue
	lda.b #$01
	sta.b Unknown_34
	lda.b #$53
Map_L24:
	pha
	jsr WaitVBlank
	pla
	dec
	bne Map_L24
	sei
	lda.b #$E0
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	jsr UnkMapFunc_03C611
	jsr WaitVBlank
	jsr WaitVBlank
	sep #$20
	rep #$10
	ldx.w #$0000
Map_L25:
	phx
	lda.b #$01
Map_L26:
	pha
	txa
	jsr UnkMapFunc_03CB4F
	pla
	dec
	bne Map_L26
	plx
	txa
	ora.b #$E0
	sta.w COLDATA
	inx
	cpx.w #$0020
	bne Map_L25
	jsr UnkMapFunc_03C74D
	sep #$20
	jsr WaitVBlank
Map_L27:
	sep #$20
	lda.w SLHV
	lda.w OPHCT
	xba
	lda.w OPHCT
	xba
	rep #$20
	and.w #$01FF
	cmp.w #$0000
	bcc Map_L27
	cmp.w #$000F
	bcs Map_L27
	sep #$20
	lda.b #$01
	sta.w TM
	rep #$20
	jsr UnkMapFunc_03C5BF
	jsr UnkMapFunc_03C956
	lda.w TIMEUP
	rep #$20
	cli
	jsr UnkMapFunc_03C78D
	sei
	jsr UnkMapFunc_03C896
	jsr UnkMapFunc_03C5C0
	stz.b MapScrollX
	stz.b MapScrollY
	stz.b Unknown_14
	stz.b Unknown_16
	stz.b Unknown_1E
	stz.b Unknown_20
	ldx.w #$0020
Map_L28:
	phx
	stx.b $1C
	jsr UnkMapFunc_03C8CB
	rep #$20
	lda.b MapScrollXSpeed
	clc
	adc.b MapScrollX
	sta.b MapScrollX
	lda.b MapScrollYSpeed
	clc
	adc.b MapScrollY
	sta.b MapScrollY
	jsr WaitVBlank
	sep #$20
	lda.b MapScrollX
	sta BG1HOFS
	lda.b MapScrollX+1
	sta BG1HOFS
	lda.b MapScrollY
	sta BG1VOFS
	lda.b MapScrollY+1
	sta BG1VOFS
	plx
	dex
	bne Map_L28
	sep #$20
	rep #$10
	lda.b #$02
	sta.w HDMAEN
	lda.b #$64
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$62
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_090
	lda.w #$0011
	sta.l InputPtr+2
	lda.w #$FB89
	sta.l InputPtr
	lda.w #$6820
	sta.w Unknown_188A
	lda.w #$1000
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
	lda.b #$B8
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	jsl NMITask14
	rep #$20
	lda.w #$0017
	sta.l InputPtr+2
	lda.w #$8718
	sta.l InputPtr
	lda.w #$7C00
	sta.w Unknown_188A
	lda.w #$0800
	sta.w Unknown_188C
	lda.w #$0002
	sta.l UnknownGSU_090
	sep #$20
	jsl DoDecompressTileset2
	lda.b #$B8
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	jsl NMITask14
	jsr UnkMapFunc_03C5D4
	lda.b #$B8
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$03
	sta.w TM
	lda.b #$82
	sta.w CGADSUB
	stz.w CGWSEL
	lda.b #$FF
	sta.w COLDATA
	sta.l Unknown_7EF0C6
	ldx.w #$00BA
	stx.w VTIMEL
	lda.b #$22
	sta.b CurNMITask
	lda.w TIMEUP
	cli
	jsr UnkMapFunc_03C777
	jsr UnkMapFunc_03C763
	jsr UnkMapFunc_03C74D
	rep #$20
	lda.w #$000F
	sta.l UnknownGSU_1F2
	lda.w #$7800
	sta.l UnknownGSU_030
	jsr UnkMapFunc_03CA1C
	jsr UnkMapFunc_03C87B
	sep #$20
	lda.b #$D8
	sta.w BG1VOFS
	stz.w BG1VOFS
	stz.w BG1HOFS
	stz.w BG1HOFS
	lda.b #$2C
	sta.w BG1SC
	rep #$20
	lda.w Unknown_16D9
	asl
	tax
	sep #$20
	lda.l UnkData_03D391,x
	bit.b #$80
	bne Map_L29
	lda.b #$0D
	sta.w MusicID
	stz.w MusicLoaded
	bra Map_L30
Map_L29:
	lda.b #$0B
	sta.w MusicID
	stz.w MusicLoaded
Map_L30:
	ldx.w #$0028
Map_L31:
	phx
	jsr UnkMapFunc_03C58F
	jsr UnkMapFunc_03CA1C
	jsr UnkMapFunc_03C87B
	rep #$20
	lda.w Unknown_16D9
	asl
	tax
	lda.l UnkData_03D391,x
	bit.b #$80
	bne Map_L33
	lda.l UnknownGSU_1F2
	inc
	cmp.w #$007E
	beq Map_L35
	sta.l UnknownGSU_1F2
	bit.w #$0001
	beq Map_L35
	plx
	cpx.w #$0014
	bne Map_L32
	sep #$20
	lda.b #$FE
	sta.l Unknown_7EF0C6
Map_L32:
	rep #$20
	inx
	phx
	bra Map_L35
Map_L33:
	plx
	cpx.w #$0006
	bne Map_L34
	sep #$20
	lda.b #$FE
	sta.l Unknown_7EF0C6
Map_L34:
	rep #$20
	phx
	lda.l UnknownGSU_1F2
	inc
	cmp.w #$003A
	beq Map_L35
	sta.l UnknownGSU_1F2
Map_L35:
	lda.l DesiredYRot
	clc
	adc.w #$0400
	sta.l DesiredYRot
	lda.l UnknownGSU_1D6
	sec
	sbc.w #$000A
	sta.l UnknownGSU_1D6
	lda.l UnknownGSU_1DA
	clc
	adc.w #$000A
	sta.l UnknownGSU_1DA
	plx
	cpx.w #$0012
	bcs Map_L36
	txy
	sep #$20
	dex
	lda.l UnkData_03D68C,x
	tyx
	rep #$20
Map_L36:
	dex
	beq Map_L37
	brl Map_L31
Map_L37:
	sep #$20
	rep #$10
	ldx.w #$00DE
	stx.w VTIMEL
	lda.b #$01
	sta.w SCMRMirror
	lda.b #$00
	sta.l Unknown_7EF0C7
	lda.b #$22
	sta.l UnkData_7E45FC+4
	lda.b #$DC
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$20
	stz.w BG2VOFS
	stz.w BG2VOFS
	stz.w BG2HOFS
	stz.w BG2HOFS
Map_L38:
	jsr UnkMapFunc_03C777
	jsr UnkMapFunc_03D1BB
	jsr UnkMapFunc_03C763
	rep #$20
	lda.l UnknownGSU_0BC
	sep #$20
	bne Map_L40
	lda.l UnknownGSU_0BE
	cmp.b #$27
	beq Map_L39
	lda.b #$89
	jsl PushSoundEffectToQueue
Map_L39:
	lda.l Unknown_7EF0C7
	inc
	sta.l Unknown_7EF0C7
	bra Map_L38
Map_L40:
	lda.b #$00
	sta.l Unknown_7EF0C7
Map_L41:
	jsr UnkMapFunc_03C777
	lda.l Unknown_7EF0C7
	pha
	lda.b #$FF
	sta.l Unknown_7EF0C7
	jsl UnkMapFunc_03D1BB
	pla
	sta.l Unknown_7EF0C7
	jsr UnkMapFunc_03D133
	jsr UnkMapFunc_03C763
	rep #$20
	lda.l UnknownGSU_0BC
	sep #$20
	bne Map_L42
	lda.l UnknownGSU_0BE
	cmp.b #$27
	beq Map_L42
	lda.b #$89
	jsl PushSoundEffectToQueue
Map_L42:
	lda.b #$32
Map_L43:
	pha
	jsl MapReadJoypads
	lda.b #$78
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.w Pad1Down+1
	bit.b #$10
	bne Map_L44
	lda.w Pad1Down+1
	bit.b #$80
	bne Map_L44
	lda.w Pad1Down
	bit.b #$80
	bne Map_L44
	pla
	dec
	beq Map_L43
	lda.l Unknown_7EF0C7
	cmp.b #$FF
	beq Map_L45
	inc
	sta.l Unknown_7EF0C7
	bra Map_L41
Map_L44:
	pla
Map_L45:
	lda.b #$13
	jsl PushSoundEffectToQueue
	lda.b #$E0
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$DE
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$E0
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$DE
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	sei
	sep #$20
	lda.b #$83
	sta.w CGADSUB
	stz.w CGWSEL
	lda.b #$E0
	sta.w COLDATA
	lda.b #$00
Map_L46:
	pha
	lda.b #$DD
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$DC
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$20
	pla
	ora.b #$E0
	sta.w COLDATA
	and.b #$1F
	inc
	cmp.b #$20
	bne Map_L46
	jsr UnkMapFunc_03D11C
	jsr WaitVBlank
	rep #$30
	lda.w InitScriptPointer
	sta.w LevelScriptPointer
	sep #$20
	lda.w InitScriptBank
	sta.w LevelScriptBank
	rep #$20
	jml MainGame
;Helper map functions
UnkMapFunc_03C453:
	php
	sep #$20
	rep #$10
	jsl ReadLevelHeader
	lda.w Unknown_16D9
	rep #$20
	and.w #$00FF
	asl
	asl
	tax
	lda.l UnkData_03D3C6,x
	sta.b Unknown_38
	sta.b Unknown_32
	sep #$20
	lda.w StageID
	pha
	lda.b #$14
	sta.w StageID
	jsl ReadLevelHeader
	pla
	sta.w StageID
	plp
	rts
UnkMapFunc_03C484:
	php
	rep #$30
	lda.b Unknown_32
	cmp.b Unknown_38
	beq UnkMapFunc_03C484_L1
	brl UnkMapFunc_03C484_L7
UnkMapFunc_03C484_L1:
	sep #$20
	lda.b TempVecXG
	beq UnkMapFunc_03C484_L2
	lda.l LevelHeaderOffsetTable,x
	bpl UnkMapFunc_03C484_L3
UnkMapFunc_03C484_L2:
	jsl ReadLevelHeader
	lda.w Unknown_16D9
	rep #$20
	stz.b TempVecXG
	asl
	tax
	lda.l UnkData_03D42A,x
	sta.b Unknown_38
	cmp.b Unknown_32
	beq UnkMapFunc_03C484_L8
	sep #$20
	lda.b Unknown_38+1
	cmp.b Unknown_32+1
	bmi UnkMapFunc_03C484_L7
	lda.b Unknown_38+1
	sta.b Unknown_32+1
	rep #$20
	lda.b Unknown_38
	cmp.b Unknown_32
	beq UnkMapFunc_03C484_L8
	sep #$20
	jmp UnkMapFunc_03C484_L7
UnkMapFunc_03C484_L3:
	cmp.b #$04
	beq UnkMapFunc_03C484_L5
	cmp.b #$02
	beq UnkMapFunc_03C484_L4
	lda.b #$02
	bra UnkMapFunc_03C484_L6
UnkMapFunc_03C484_L4:
	lda.b #$01
	bra UnkMapFunc_03C484_L6
UnkMapFunc_03C484_L5:
	lda.b #$00
UnkMapFunc_03C484_L6:
	sta.b Unknown_36
	rep #$20
	ldy.b Unknown_30
	lda.l LevelHeaderOffsetTable,x
	sta.w $0002,y
	lda.b TempVecYG
	sta.w $0000,y
	iny
	iny
	iny
	iny
	sty.b Unknown_30
	lda.b TempVecYG
	clc
	adc.l LevelHeaderOffsetTable+2,x
	sta.b TempVecYG
	sec
	sbc.w #$0810
	sta.b TempVecYG
	inx
	inx
	inx
	inx
	stx.b TempVecXG
UnkMapFunc_03C484_L7:
	plp
	clc
	rts
UnkMapFunc_03C484_L8:
	plp
	sec
	rts
UnkMapFunc_03C511:
	php
	sep #$20
	lda.b Unknown_56
	bne UnkMapFunc_03C511_L1
	lda.w Unknown_16ED
	beq UnkMapFunc_03C511_L1
	lda.b #$91
	jsl PushSoundEffectToQueue
UnkMapFunc_03C511_L1:
	lda.w Unknown_16ED
	sta.b Unknown_56
	rep #$30
	lda.w Unknown_16E8
	sta.l UnknownGSU_1DA
	lda.w Unknown_16ED
	and.w #$00FF
	bne UnkMapFunc_03C511_L2
	lda.l UnknownGSU_1D6
	ldx.w Unknown_16E4
	jsr UnkMapFunc_03C575
	sta.w UnknownGSU_1D6
	lda.l UnknownGSU_1D8
	ldx.w Unknown_16E6
	jsr UnkMapFunc_03C575
	sta.w UnknownGSU_1D8
	plp
	rts
UnkMapFunc_03C511_L2:
	lda.l UnknownGSU_1D6
	ldx.w Unknown_16E4
	jsr UnkMapFunc_03C57F
	sta.w UnknownGSU_1D6
	lda.l UnknownGSU_1D8
	ldx.w Unknown_16E6
	jsr UnkMapFunc_03C57F
	sta.w UnknownGSU_1D8
	plp
	rts
UnkMapFunc_03C575:
	stx.b TempVecXG
	cmp.b TempVecXG
	bmi UnkMapFunc_03C575_L1
	dec
	rts
UnkMapFunc_03C575_L1:
	inc
	rts
UnkMapFunc_03C57F:
	stx.b TempVecXG
	cmp.b TempVecXG
	bmi UnkMapFunc_03C57F_L1
	sec
	sbc.w #$0010
	rts
UnkMapFunc_03C57F_L1:
	clc
	adc.w #$0010
	rts
UnkMapFunc_03C58F:
	php
	rep #$30
	ldx.w #$0000
UnkMapFunc_03C58F_L1:
	lda.b $24,x
	clc
	adc.w UnkData_03C5A7,x
	sta.b $24,x
	inx
	inx
	cpx.w #$000C
	bne UnkMapFunc_03C58F_L1
	plp
	rts
UnkData_03C5A7:
	DW $0600,$FD00,$0400,$0300,$FB00,$FB00
UnkData_03C5B3:
	DW $1C00,$F600,$2800,$3200,$EC00,$E400
UnkMapFunc_03C5BF:
	rts
UnkMapFunc_03C5C0:
	php
	sep #$20
	jsr WaitVBlank
	stz.w COLDATA
	stz.w CGWSEL
	stz.w CGADSUB
	stz.w WOBJSEL
	plp
	rts
UnkMapFunc_03C5D4:
	php
	rep #$30
	lda.w #$00B8
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	rep #$30
	sei
	sep #$20
	lda.b #$80
	sta.w VMAIN
	rep #$20
	ldx.w #$5200
	ldy.w #$6C20
UnkMapFunc_03C5D4_L1:
	stx.w VMADDL
	lda.w RDVRAML
	sty.w VMADDL
	sta.w VMDATAL
	inx
	iny
	cpx.w #$5340
	bne UnkMapFunc_03C5D4_L1
	sep #$20
	lda.w TIMEUP
	rep #$20
	cli
	plp
	rts
UnkMapFunc_03C611:
	php
	rep #$30
	lda.w #$00E0
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	rep #$30
	lda.w Unknown_16D9
	asl
	asl
	tax
	sep #$20
	lda.l UnkData_03D3C6,x
	inc
	sta.w WH0
	clc
	adc.b #$1D
	sta.w WH1
	lda.l UnkData_03D3C6+1,x
	lsr
	sta.b TempVecXG
	
	
	
	
	
	
	
	
	
	
	





PreShadedPalette:
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
UnkData_03D66C:
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
UnkData_03D68C:
	DB $FF,$FF,$FE,$FD,$FC,$FA,$F8,$F6
	DB $F4,$F2,$F0,$EE,$EC,$EA,$E7,$E4
	DB $E1
LevelHeaderOffsetTable:
	DW Level2Headers-LevelHeaderOffsetTable
	DW Level1Headers-LevelHeaderOffsetTable
	DW Level3Headers-LevelHeaderOffsetTable
LevelHeaderTable:
	;Level 2
Level2Headers:
	DB $03,$04,$14,$00,$8C,$5C,$0D,$58,$01,$04,$4E,$00,$F8,$FF,$FF,$02,$04,$00
	DB $03,$04,$0E,$03,$72,$5E,$0D,$59,$01,$04,$4E,$00,$F8,$04,$4E,$00,$F8,$02,$0E,$08,$F8,$FF,$FF,$01,$32,$00
	DB $03,$09,$08,$05,$CD,$5E,$0D,$6A,$01,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF,$01,$54,$00
	DB $03,$12,$05,$09,$50,$5F,$0D,$6B,$01,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF,$01,$72,$00
	DB $03,$00,$00,$0F,$AB,$5F,$0D,$72,$01,$FF,$FF,$01,$56,$02
	;Level 1
Level1Headers:
	DB $03,$06,$15,$00,$8E,$4F,$0D,$58,$00,$02,$0E,$08,$F8,$FF,$FF,$02,$02,$00
	DB $03,$0B,$11,$02,$8E,$51,$0D,$59,$00,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF,$01,$B4,$00
	DB $03,$14,$0E,$06,$E9,$51,$0D,$5A,$00,$03,$0E,$08,$00,$FF,$FF,$01,$C6,$00
	DB $03,$18,$0B,$08,$AC,$54,$0D,$5B,$00,$04,$4E,$00,$F8,$FF,$FF,$01,$D8,$00
	DB $03,$00,$00,$0F,$28,$55,$0D,$5C,$00,$FF,$FF,$01,$62,$02
	;Level 3
Level3Headers:
	DB $03,$06,$17,$00,$F5,$62,$0D,$6C,$02,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF,$02,$00,$00
	DB $03,$0C,$15,$01,$1C,$65,$0D,$6D,$02,$02,$0E,$08,$F8,$02,$0E,$08,$F8,$FF,$FF,$01,$12,$01
	DB $03,$12,$13,$04,$77,$65,$0D,$6E,$02,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$03,$0E,$08,$00,$FF,$FF,$01,$34,$01
	DB $03,$1B,$13,$07,$FE,$65,$0D,$6F,$02,$02,$0E,$08,$F8,$04,$4E,$00,$F8,$FF,$FF,$01,$4A,$01
	DB $03,$1C,$0B,$0B,$42,$67,$0D,$70,$02,$04,$4E,$00,$F8,$FF,$FF,$01,$5C,$01
	DB $03,$00,$00,$0F,$DF,$67,$0D,$74,$02,$FF,$FF,$01,$4A,$02
	;Unknown?
	DB $03,$06,$0F,$03,$72,$5E,$0D,$59,$01,$00,$0E,$08,$F8,$00,$0E,$08,$F8,$00,$0E,$08,$F8,$FF,$FF,$02,$06,$00
	;Black Hole (and copies?)
	DB $03,$0C,$09,$0A,$CF,$47,$0D,$71,$00,$00,$0E,$08,$F8,$00,$0E,$08,$F8,$FF,$FF,$01,$54,$00
	DB $03,$0D,$0B,$0A,$CF,$47,$0D,$71,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$F8,$00,$0E,$08,$F8,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$FF,$FF,$01,$D8,$00
	DB $03,$0B,$0E,$0A,$CF,$47,$0D,$71,$00,$00,$0E,$08,$08,$00,$0E,$08,$08,$00,$0E,$08,$08,$00,$0E,$08,$08,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$FF,$FF,$01,$34,$01
	;Unknown?
	DB $03,$09,$10,$02,$8E,$51,$0D,$59,$00,$00,$0E,$00,$F8,$00,$0E,$00,$F8,$00,$0E,$08,$F8,$FF,$FF,$02,$06,$00
	DB $03,$0C,$19,$01,$1C,$65,$0D,$6D,$02,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$00,$0E,$08,$00,$FF,$FF,$01,$6E,$02
	;Venom stages
	DB $03,$00,$00,$0F,$4F,$68,$0D,$74,$02,$FF,$FF,$00
	DB $03,$00,$00,$0F,$1B,$60,$0D,$72,$01,$FF,$FF,$00
	DB $03,$00,$00,$0F,$A5,$55,$0D,$5C,$00,$FF,$FF,$00
	;Out of this Dimension
	DB $03,$00,$00,$0E,$0B,$48,$0D,$73,$00,$FF,$FF,$00
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
;;;;;;;;;;;;;;;
;OAM FUNCTIONS;
;;;;;;;;;;;;;;;
ClearOAMBufferEx:
	php
	sep #$20
	rep #$10
	stz.w Unknown_15AB
	stz.w Unknown_15B8
	stz.w StageNumTextTimer
	stz.w Unknown_15B5
	rep #$20
	lda.w #$0000
	sta.l UnknownGSU_090
	lda.w #$0014
	sta.l InputPtr+2
	lda.w #$E0FE
	sta.l InputPtr
	lda.w #$6800
	sta.w Unknown_188A
	lda.w #$1000
	sta.w Unknown_188C
	sep #$20
	jsl DoDecompressTileset
	jsl NMITask14
	ldx.w #$021F
ClearOAMBufferEx_ClearLoop:
	stz.w OAMBuffer,x
	dex
	bpl ClearOAMBufferEx_ClearLoop
	lda.b #$04
	sta.w BBAD0
	ldx.w #$0000
	stx.w OAMADDL
	ldx.w #OAMBuffer
	stx.w A1T0L
	lda.b #BANKOF(OAMBuffer)
	sta.w A1B0
	ldx.w #$0220
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$00
	sta.w MDMAEN
	plp
	rtl
UpdateOAMBuffer:
	sep #$20
	rep #$10
	lda.w Unknown_1F0D
	bne UpdateOAMBuffer_Exit
	ldx.w #$0000
	stx.w OAMBufferPtr
	stx.w Unknown_15B1
	stx.w Unknown_15B3
	lda.w Unknown_1962
	inc
	bne UpdateOAMBuffer_SkipHUD
	lda.l RenderHUDFlag
	beq UpdateOAMBuffer_SkipHUD
	jsr DrawNovaBombs
	jsr DrawCrosshair
	jsr DrawLives
	jsr DrawHUDShieldText
	jsr DrawEnemyText
	jsr UnkOAMFunc_03E1C6
	jsr UnkOAMFunc_03DDDF
UpdateOAMBuffer_SkipHUD:
	jsr UnkOAMFunc_03E932
	sep #$20
	lda.w Unknown_1FD1
	bne UpdateOAMBuffer_L2
	jsr UnkOAMFunc_03DD34
UpdateOAMBuffer_L2:
	jsr DrawStageNumText
	jsr DoClearOAMBuffer
UpdateOAMBuffer_Exit:
	rtl
ClearOAMBuffer:
	jsr DoClearOAMBuffer
	rtl
DoClearOAMBuffer:
	rep #$20
	lda.w #$0148
	sec
	sbc.w OAMBufferPtr
	bmi DoClearOAMBuffer_L2
	ldx.w OAMBufferPtr
DoClearOAMBuffer_ClearLoop:
	stz.w OAMBuffer,x
	inx
	inx
	dec
	dec
	bpl DoClearOAMBuffer_ClearLoop
	rts
DoClearOAMBuffer_L2:
	sep #$20
	sep #$20
	lda.b #$00
	sta.w INIDISP
	lda.b #$00
DoClearOAMBuffer_L3:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec
	bne DoClearOAMBuffer_L3
	lda.b #$0F
	sta.w INIDISP
	rts
DrawLives:
	rep #$30
	ldx.w OAMBufferPtr
	lda.w #$20BD
	sta.w OAMBuffer+2,x
	lda.w #$1110
	sta.w OAMBuffer,x
	lda.w #$20E2
	sta.w OAMBuffer+6,x
	lda.w #$1118
	sta.w OAMBuffer+4,x
	lda.w Lives
	and.w #$00FF
	bne DrawLives_NotZero
	lda.w #$0001
DrawLives_NotZero:
	dec
	sta.b TempVecXG
	lda.w #$20E3
	clc
	adc.b TempVecXG
	sta.w OAMBuffer+10,x
	lda.w #$1120
	sta.w OAMBuffer+8,x
	txa
	clc
	adc.w #$000C
	sta.w OAMBufferPtr
	rts
DrawHUDShieldText:
	rep #$30
	ldx.w OAMBufferPtr
	lda.w #$B718
	sta.w OAMBuffer,x
	lda.w #$B720
	sta.w OAMBuffer+4,x
	lda.w #$B728
	sta.w OAMBuffer+8,x
	lda.w #$B730
	sta.w OAMBuffer+12,x
	lda.w #$20CB
	sta.w OAMBuffer+2,x
	lda.w #$20CC
	sta.w OAMBuffer+6,x
	lda.w #$20CD
	sta.w OAMBuffer+10,x
	lda.w #$20CE
	sta.w OAMBuffer+12,x
	txa
	clc
	adc.w #$0010
	sta.w OAMBufferPtr
	rts
UnkOAMFunc_03DC8A:
	php
	rep #$20
	stz.b TempVecXG
	stz.b TempVecYG
	stz.b TempVecZG
	stz.b TempVecXL
	stz.b TempVecYL
	stz.w TempVecZL
	sep #$20
	stz.b TempVecXG
	stz.b TempVecYG
	lda.b #$E2
	sta.b TempVecZG
	lda.b $12,x
	jsl GetLocalYZ8RotateX
	lda.b TempVecXL
	sta.b TempVecXG
	lda.b TempVecYL
	sta.b TempVecYG
	lda.w TempVecZL
	sta.b TempVecZG
	lda.b $13,x
	jsl GetLocalZX8RotateNegY
	lda.b TempVecXL
	bit.w #$0080
	beq UnkOAMFunc_03DC8A_L1
	ora.w #$FF00
	bra UnkOAMFunc_03DC8A_L2
UnkOAMFunc_03DC8A_L1:
	and.w #$00FF
UnkOAMFunc_03DC8A_L2:
	clc
	adc.b $0C,x
	sec
	sbc.b Unknown_C1
	sta.l InputVecX
	lda.b TempVecYL
	bit.w #$0080
	beq UnkOAMFunc_03DC8A_L3
	ora.w #$FF00
	bra UnkOAMFunc_03DC8A_L4
UnkOAMFunc_03DC8A_L3:
	and.w #$00FF
UnkOAMFunc_03DC8A_L4:
	clc
	adc.b $0E,x
	sec
	sbc.b Unknown_C3
	sta.l InputVecY
	lda.b TempVecZL
	bit.w #$0080
	beq UnkOAMFunc_03DC8A_L5
	ora.w #$FF00
	bra UnkOAMFunc_03DC8A_L6
UnkOAMFunc_03DC8A_L5:
	and.w #$00FF
UnkOAMFunc_03DC8A_L6:
	clc
	adc.b $10,x
	sec
	sbc.b Unknown_C5
	sta.l InputVecZ
	sep #$20
	lda.b #BANKOF(UnkFuncGSU_01823E)
	ldx.w #UnkFuncGSU_01823E
	jsl RunSuperFXRoutine
	rep #$20
	lda.l OutputVecX
	sta.b TempVecXG
	lda.l OutputVecY
	sta.l TempVecYG
	lda.l OutputVecZ
	sta.b TempVecZG
	sep #$30
	jsl UnkFunc_03B9F2
	plp
	rtl
UnkOAMFunc_03DD34:
	sep #$20
	lda.w Unknown_15B5
	and.b #$FF
	beq UnkOAMFunc_03DD34_L2
	dec
	sta.w Unknown_15B5
	lda.w Unknown_15BB
	and.b #$07
	cmp.b #$03
	beq UnkOAMFunc_03DD34_L2
	bcc UnkOAMFunc_03DD34_L2
	rep #$20
	ldy OAMBufferPtr
	sty Unknown_15B1
	lda.w #$4848
	sta.b TempMiscX
	ldx.w OAMBufferPtr
	phx
	ldx.w #$000E
	jsr DoDrawStageNumText
	plx
	rep #$20
UnkOAMFunc_03DD34_L1:
	lda.w OAMBuffer+2,x
	ora.w #$0400
	sta.w OAMBuffer+2,x
	inx
	inx
	inx
	inx
	cpx.w OAMBufferPtr
	bne UnkOAMFunc_03DD34_L1
	ldy.w OAMBufferPtr
	sty.w Unknown_15B3
UnkOAMFunc_03DD34_L2:
	rts
DrawStageNumText:
	rep #$20
	lda.w StageNumTextTimer
	bne DrawStageNumText_L1
	rts
DrawStageNumText_L1:
	dec
	sta.w StageNumTextTimer
	rep #$20
	lda.w StageNumTextTimer
	and.w #$0007
	cmp.w #$0003
	bcs DrawStageNumText_L2
	rts
DrawStageNumText_L2:
	lda.w Unknown_1FDE
	and.w #$00FF
	bne DrawStageNumText_L3
	ldy.w OAMBufferPtr
	sty.w Unknown_15B1
	lda.w #$4850
	sta.b TempMiscX
	ldx.w #$0000
	jsr DoDrawStageNumText
	lda.w StageID
	inc
	asl
	tax
	lda.l StageNumTextDataOffsetTable,x
	tax
	jsr DoDrawStageNumText
	ldy.w OAMBufferPtr
	sty.w Unknown_15B3
	rts
DrawStageNumText_L3:
	ldy.w OAMBufferPtr
	sty.w Unknown_15B1
	lda.w #$4848
	sta.b TempMiscX
	ldx.w #$0088
	jsr DoDrawStageNumText
	ldy.w OAMBufferPtr
	sty.w Unknown_15B3
	rts
UnkOAMFunc_03DDDF:
	rep #$20
	lda.w Unknown_15B8
	and.w #$00FF
	beq UnkOAMFunc_03DDDF_L1
	ldy.w OAMBufferPtr
	sty.w Unknown_15B1
	lda.w #$3020
	sta.b TempMiscX
	ldx.w #$0000
	jsr DoDrawStageNumText
	lda.w StageID
	inc
	asl
	tax
	lda.w StageNumTextDataOffsetTable,x
	tax
	jsr DoDrawStageNumText
	lda.b TempMiscX
	clc
	adc.w #$0008
	sta.b TempMiscX
	ldx.w #$0020
	jsr DoDrawStageNumText
	ldy.w OAMBufferPtr
	sty.w Unknown_15B3
UnkOAMFunc_03DDDF_L1:
	rts
DoDrawStageNumText:
	ldy.w OAMBufferPtr
DoDrawStageNumText_Loop:
	phx
	lda.w StageNumTextDataBase,x
	cmp.w #$FFFF
	bne DoDrawStageNumText_DrawGlyph
	brl DoDrawStageNumText_Exit
DoDrawStageNumText_DrawGlyph:
	tax
	lda.w StageNumTextDataBase,x
	cmp.w #$FFFE
	bne DoDrawStageNumText_DrawGlyphWide
	lda.w StageNumTextDataBase+2,x
	sta.w OAMBuffer+2,y
	lda.w StageNumTextDataBase+4,x
	sta.w OAMBuffer+6,y
	lda.b TempMiscX
	sta.w OAMBuffer,y
	lda.b TempMiscX
	clc
	adc.w #$0800
	sta.w OAMBuffer+4,y
	tya
	clc
	adc.w #$0008
	tay
	lda.b TempMiscX
	clc
	adc.w #$0008
	sta.b TempMiscX
	bra DoDrawStageNumText_Next
DoDrawStageNumText_DrawGlyphWide:
	sta.w OAMBuffer+2,y
	lda.w StageNumTextDataBase+2,x
	sta.w OAMBuffer+6,y
	lda.w StageNumTextDataBase+4,x
	sta.w OAMBuffer+10,y
	lda.w StageNumTextDataBase+6,x
	sta.w OAMBuffer+14,y
	lda.b TempMiscX
	sta.w OAMBuffer,y
	lda.b TempMiscX
	clc
	adc.w #$0008
	sta.w OAMBuffer+4,y
	lda.b TempMiscX
	clc
	adc.w #$0800
	sta.w OAMBuffer+8,y
	lda.b TempMiscX
	clc
	adc.w #$0808
	sta.w OAMBuffer+12,y
	tya
	clc
	adc.w #$0010
	tay
	lda.b TempMiscX
	clc
	adc.w #$0010
	sta.b TempMiscX
DoDrawStageNumText_Next:
	plx
	inx
	inx
	jmp DoDrawStageNumText_Loop
DoDrawStageNumText_Exit:
	sty.w OAMBufferPtr
	plx
	rts
StageNumTextDataBase:
	DW $01AE,$01B6,$0158,$0178,$0170,$0102,$FFFF
	DW $01AE,$0168,$01A6,$0158,$018E,$0160,$0186,$0170,$FFFF
	DW $0168,$0186,$0170,$0158,$01A6,$FFFF
StageNumTextDataOffsetTable:
	DW StageNumTextDataNumber0-StageNumTextDataBase
	DW StageNumTextDataNumber1-StageNumTextDataBase
	DW StageNumTextDataNumber2-StageNumTextDataBase
	DW StageNumTextDataNumber3-StageNumTextDataBase
	DW StageNumTextDataNumber4-StageNumTextDataBase
	DW StageNumTextDataNumber5-StageNumTextDataBase
	DW StageNumTextDataNumber6-StageNumTextDataBase
	DW StageNumTextDataNumber7-StageNumTextDataBase
	DW StageNumTextDataNumber8-StageNumTextDataBase
	DW StageNumTextDataNumber9-StageNumTextDataBase
	DW StageNumTextDataNumber10-StageNumTextDataBase
	DW StageNumTextDataNumber11-StageNumTextDataBase
	DW StageNumTextDataNumber12-StageNumTextDataBase
	DW StageNumTextDataNumber13-StageNumTextDataBase
StageNumTextDataNumber0:
	DW $0150,$FFFF
StageNumTextDataNumber1:
	DW $0108,$FFFF
StageNumTextDataNumber2:
	DW $0110,$FFFF
StageNumTextDataNumber3:
	DW $0118,$FFFF
StageNumTextDataNumber4:
	DW $0120,$FFFF
StageNumTextDataNumber5:
	DW $0128,$FFFF
StageNumTextDataNumber6:
	DW $0130,$FFFF
StageNumTextDataNumber7:
	DW $0138,$FFFF
StageNumTextDataNumber8:
	DW $0140,$FFFF
StageNumTextDataNumber9:
	DW $0148,$FFFF
StageNumTextDataNumber10:
	DW $0108,$0150,$FFFF
StageNumTextDataNumber11:
	DW $0108,$0108,$FFFF
StageNumTextDataNumber12:
	DW $0108,$0110,$FFFF
StageNumTextDataNumber13:
	DW $0108,$0118,$FFFF
	DW $32E7,$32E8,$30CF,$30CF			;small 45?
	DW $32E9,$32EA,$30CF,$30CF			;small 67?
	DW $32EB,$32EC,$30CF,$30CF			;small 89?
	DW $32ED,$32EE,$30CF,$30CF			;glitch?
	DW $FFFE,$32EF,$30CF				;glitch?
	DW $32F0,$32F1,$32CF,$32CF			;weird triangle and small E?
	DW $FFFE,$32F2,$30CF				;small N glitch?
	DW $32F3,$32F4,$32CF,$32CF			;small MY glitch?
	DW $32F5,$32F6,$32CF,$32CF			;nothing?
	DW $32F7,$32F8,$32CF,$32CF			;nothing?
	DW $FFFE,$32F9,$32CF				;nothing?
	DW $FFFE,$30CF,$30CF				;space
	DW $FFFE,$3094,$3095				;hyphen/dash
	DW $30CF,$3096,$30CF,$3097			;1
	DW $3098,$3099,$309A,$309B			;2
	DW $309C,$309D,$309E,$309F			;3
	DW $30A0,$30A1,$30A2,$30A3			;4
	DW $30A4,$30A5,$30A6,$30A7			;5
	DW $30A8,$30A9,$30AA,$30AB			;6
	DW $30AC,$30AD,$30AE,$30AF			;7
	DW $30B0,$30B1,$30B2,$30B3			;8
	DW $30B4,$30B5,$30B6,$30B7			;9
	DW $30B8,$30B9,$30BA,$30BB			;0
	DW $3088,$3089,$308A,$308B			;A
	DW $30D7,$30D8,$30DF,$30E0			;B
	DW $30D0,$30D1,$30D2,$30D3			;C
	DW $3090,$3091,$3092,$3093			;E
	DW $308C,$308D,$308E,$308F			;G
	DW $FFFE,$3096,$3097				;I
	DW $30D4,$30CF,$30D5,$30D6			;L
	DW $30DB,$30DC,$30DD,$30DE			;M
	DW $30C2,$30C3,$30C4,$30C5			;N
	DW $30B8,$30B9,$30BA,$30BB			;O
	DW $30D7,$30D8,$30D9,$30DA			;R
	DW $3080,$3081,$3082,$3083			;S
	DW $3084,$3085,$3086,$3087			;T
	DW $30ED,$30EE,$30EF,$70EF			;U
	DW $30B4,$30B5,$30C6,$30C7			;glitch?
	DW $30B8,$30C8,$30BA,$B0C8			;glitch?
DrawNovaBombs:
	rep #$20
	lda.w #$B6E1
	sta.b TempMiscX
	ldx.w OAMBufferPtr
	ldy.w NovaBombs
	beq DrawNovaBombs_Exit
	sep #$20
	lda.w Unknown_1FC8
	beq DrawNovaBombs_L1
	dec.w Unknown_1FC8
	dey
	bne DrawNovaBombs_L1
	bra DrawNovaBombs_L3
DrawNovaBombs_L1:
	rep #$20
DrawNovaBombs_L2:
	lda.b TempMiscX
	sta.w OAMBuffer,x
	lda.w #$20BC
	sta.w OAMBuffer+2,x
	lda.b TempMiscX
	sec
	sbc.w #$0009
	sta.b TempMiscX
	inx
	inx
	inx
	inx
	dey
	bne DrawNovaBombs_L2
DrawNovaBombs_L3:
	sep #$20
	lda.w Unknown_1FC8
	beq DrawNovaBombs_Exit
	lda.w Unknown_15BB
	and.b #$07
	cmp.b #$03
	bcc DrawNovaBombs_Exit
	rep #$20
	lda.b TempMiscX
	sta.w OAMBuffer,x
	lda.w #$20BC
	sta.w OAMBuffer+2,x
	lda.b TempMiscX
	sec
	sbc.w #$0009
	sta.b TempMiscX
	inx
	inx
	inx
	inx
DrawNovaBombs_Exit:
	stx.w OAMBufferPtr
	rts
DrawCrosshair:
	php
	sep #$20
	rep #$10
	lda.w CurViewMode
	cmp.b #$03
	bne DrawCrosshair_L1
	lda.w Unknown_15AB
	bne DrawCrosshair_L2
DrawCrosshair_L1:
	plp
	rts
DrawCrosshair_L2:
	rep #$20
	lda.w CrosshairX
	sta.b Unknown_72
	lda.w CrosshairY
	sta.b Unknown_74
	rep #$20
	ldx.w OAMBufferPtr
	lda.w #$28E1
	sta.w OAMBuffer+2,x
	sep #$20
	lda.b Unknown_72
	clc
	adc.b #$74
	sta.w OAMBuffer,x
	lda.b Unknown_74
	clc
	adc.b #$5C
	sta.w OAMBuffer+1,x
	rep #$20
	lda.w #$68E1
	sta.w OAMBuffer+6,x
	sep #$20
	lda.b Unknown_72
	clc
	adc.b #$84
	sta.w OAMBuffer+4,x
	lda.b Unknown_74
	clc
	adc.b #$5C
	sta.w OAMBuffer+5,x
	rep #$20
	lda.w #$A8E1
	sta.w OAMBuffer+10,x
	sep #$20
	lda.b Unknown_72
	clc
	adc.b #$74
	sta.w OAMBuffer+8,x
	lda.b Unknown_74
	clc
	adc.b #$6C
	sta.w OAMBuffer+9,x
	rep #$20
	lda.w #$E8E1
	sta.w OAMBuffer+14,x
	sep #$20
	lda.b Unknown_72
	clc
	adc.b #$84
	sta.w OAMBuffer+12,x
	lda.b Unknown_74
	clc
	adc.b #$6C
	sta.w OAMBuffer+13,x
	txa
	clc
	adc.b #$10
	sta.w OAMBufferPtr
	plp
	rts
DrawEnemyText:
	sep #$20
	lda.l EnemyHPBarMax
	and.b #$FF
	bne DrawEnemyText_L1
	rts
DrawEnemyText_L1:
	bpl DrawEnemyText_L2
	lsr
DrawEnemyText_L2:
	sta.b TempVecXG
	lda.b #$C8
	sec
	sbc.b TempVecXG
	rep #$20
	and.b #$FF
	ora.w #$1000
	ldy.w #$20F1
	ldx.w #$0004
	stx.b TempMiscX
	ldx.w OAMBufferPtr
DrawEnemyText_L3:
	sta.w OAMBuffer,x
	pha
	tya
	sta.w OAMBuffer+2,x
	pla
	clc
	adc.w #$0008
	iny
	inx
	inx
	inx
	inx
	inx
	dec.b TempMiscX
	bne DrawEnemyText_L3
	stx.w OAMBufferPtr
	rts
UnkOAMFunc_03E1C6:
	rep #$20
	stz.w TempMiscW
	jsr UnkOAMFunc_03E201
	jsr UnkOAMFunc_03E213
	jsr UnkOAMFunc_03E225
	jsr UnkOAMFunc_03E237
	lda.w Unknown_15BB
	and.w #$0001
	beq UnkOAMFunc_03E1C6_L3
	lda.w Unknown_1FCB
	clc
	adc.w #$0010
	cmp.w #$0040
	bne UnkOAMFunc_03E1C6_L2
	lda.w TempMiscW
	beq UnkOAMFunc_03E1C6_L1
	sep #$20
	lda.b #$8A
	jsl PushSoundEffectToQueue
	rep #$20
UnkOAMFunc_03E1C6_L1:
	lda.w #$0000
UnkOAMFunc_03E1C6_L2:
	sta.w Unknown_1FCB
UnkOAMFunc_03E1C6_L3:
	rts
UnkOAMFunc_03E201:
	lda.w Unknown_1FC7
	bit.w #$0001
	bne UnkOAMFunc_03E201_L1
	rts
UnkOAMFunc_03E201_L1:
	inc.w TempMiscW
	lda.w #$0000
	jmp UnkOAMFunc_03E249
UnkOAMFunc_03E213:
	lda.w Unknown_1FC7
	bit.w #$0002
	bne UnkOAMFunc_03E213_L1
	rts
UnkOAMFunc_03E213_L1:
	inc.w TempMiscW
	lda.w #$0040
	jmp UnkOAMFunc_03E249
UnkOAMFunc_03E225:
	lda.w Unknown_1FC7
	bit.w #$0004
	bne UnkOAMFunc_03E225_L1
	rts
UnkOAMFunc_03E225_L1:
	inc.w TempMiscW
	lda.w #$00C0
	jmp UnkOAMFunc_03E249
UnkOAMFunc_03E237:
	lda.w Unknown_1FC7
	bit.w #$0008
	bne UnkOAMFunc_03E237_L1
	rts
UnkOAMFunc_03E237_L1:
	inc.w TempMiscW
	lda.w #$0080
	jmp UnkOAMFunc_03E249
UnkOAMFunc_03E249:
	clc
	adc.w Unknown_1FCB
	tax
	ldy.w OAMBufferPtr
	lda.l UnkOAMData_03E292,x
	sta.w OAMBuffer,y
	lda.l UnkOAMData_03E292+2,x
	sta.w OAMBuffer+2,y
	lda.l UnkOAMData_03E292+4,x
	sta.w OAMBuffer+4,y
	lda.l UnkOAMData_03E292+6,x
	sta.w OAMBuffer+6,y
	lda.l UnkOAMData_03E292+8,x
	sta.w OAMBuffer+8,y
	lda.l UnkOAMData_03E292+10,x
	sta.w OAMBuffer+10,y
	lda.l UnkOAMData_03E292+12,x
	sta.w OAMBuffer+12,y
	lda.l UnkOAMData_03E292+14,x
	sta.w OAMBuffer+14,y
	tya
	clc
	adc.w #$0010
	sta.w OAMBufferPTr
	rts
UnkOAMData_03E292:
	DW $1877,$20BE,$187F,$60BE,$0000,$0000,$0000,$0000
	DW $1877,$20BE,$187F,$60BE,$2177,$20BE,$217F,$60BE
	DW $0000,$0000,$0000,$0000,$2177,$20BE,$217F,$60BE
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $C177,$A0BE,$C17F,$e0BE,$0000,$0000,$0000,$0000
	DW $C177,$A0BE,$C17F,$e0BE,$B877,$A0BE,$B87F,$E0BE
	DW $0000,$0000,$0000,$0000,$B877,$A0BE,$B87F,$E0BE
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $68E1,$20F0,$70E1,$A0F0,$0000,$0000,$0000,$0000
	DW $68E1,$20F0,$70E1,$A0F0,$68D8,$20F0,$70D8,$A0F0
	DW $0000,$0000,$0000,$0000,$68D8,$20F0,$70D8,$A0F0
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	DW $6818,$60F0,$7018,$E0F0,$0000,$0000,$0000,$0000
	DW $6818,$60F0,$7018,$E0F0,$6821,$60F0,$7021,$E0F0
	DW $0000,$0000,$0000,$0000,$6821,$60F0,$7021,$E0F0
	DW $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
UnkOAMFunc_03E932:
	sep #$20
	lda.w Unknown_1FCD
	beq UnkOAMFunc_03E932_L2
	lda.w Continues
	rep #$20
	and.w #$00FF
	ldx.w #$2400
	stx.w TempMiscW
	ldx.w OAMBufferPtr
UnkOAMFunc_03E932_L1:
	pha
	jsr UnkOAMFunc_03E3C0
	lda.w TempMiscW
	clc
	adc.w #$0011
	sta.w TempMiscW
	pla
	dec
	bne UnkOAMFunc_03E932_L1
	stx.w OAMBufferPtr
UnkOAMFunc_03E932_L2:
	rts
UnkOAMFunc_03E3C0:
	lda.w TempMiscW
	sta.w OAMBuffer,x
	lda.w #$24C0
	sta.w OAMBuffer+2,x
	lda.w TempMiscW
	clc
	adc.w #$0008
	sta.w OAMBuffer+4,x
	lda.w #$64C0
	sta.w OAMBuffer+6,x
	lda.w TempMiscW
	clc
	adc.w #$0800
	sta.w OAMBuffer+8,x
	lda.w #$24C1
	sta.w OAMBuffer+10,x
	lda.w TempMiscW
	clc
	adc.w #$0808
	sta.w OAMBuffer+12,x
	lda.w #$24C1
	sta.w OAMBuffer+14,x
	txa
	clc
	adc.w #$0010
	tax
	rts
;;;;;;;;;;;;;;;;;;;;
;CONTINUE FUNCTIONS;
;;;;;;;;;;;;;;;;;;;;
;Main continue processing loop
Continue:
	php
	phb
	sep #$20
	rep #$10
	lda.b #$00
	pha
	plb
	lda.w Continues
	bne Continue_L1
	brl Continue_L24
Continue_L1:
	stz.b CurNMITask
	stz.w HDMAEN
	lda.b #$96
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$8C
	sta.w ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.b #$80
	sta.w INIDISP
	
	
	
	
	
	
	
	
	
	
;Helper continue functions
	
	
	
	
	
	
	
	
	
	
ContinueArwingCalculateMatrix:
	php
	rep #$20
	lda.w #$0000
	sta.l OutputVecX
	sta.l OutputVecY
	lda.w Unknown_15BB
	sta.l VertexAnimFrame
	sta.l UnknownGSU_046
	inc.w Unknown_15BB
	lda.b Unknown_20
	sta.l UnknownGSU_01A
	
	
	
	
	
	
	
	
	
	
	
	
	
ContinueClearOAMBuffer:
	php
	sep #$20
	rep #$10
	ldx.w #$0220
ContinueClearOAMBuffer_ClearLoop:
	stz.w OAMBuffer,x
	dex
	bpl ContinueClearOAMBuffer_ClearLoop
	jsl ContinueWriteOAMBuffer
	plp
	rtl
ContinueWriteOAMBuffer:
	php
	sep #$20
	rep #$10
	lda.b #$04
	sta.w BBAD0
	ldx.w #$0000
	stx.w OAMADDL
	ldx.w #OAMBuffer
	stx.w A1T0L
	lda.b #BANKOF(OAMBuffer)
	sta.w A1B0
	ldx.w #$0220
	stx.w DAS0L
	lda.b #$00
	sta.w DMAP0
	lda.b #$01
	sta.w MDMAEN
	plp
	rtl
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;;;
;LEVEL SCRIPT ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;
UnkLevelFunc_03E9CF:
	










;Each level script consists of a series of commands, which get parsed here
UpdateZTimer:
	rep #$30
	ldx.w PlayerObject
	lda.b $10,x
	sec
	sbc.w PlayerPrevZPos
	sta.w ZTimerVel
	lda.b $10,x
	sta.w PlayerPrevZPos
	ldx.w LevelScriptPointer
	lda.w ZTimer
	sec
	sbc.w ZTimerVel
	bmi RunLevelScript
	sta.w ZTimer
	rtl
RunLevelScript:
	php
	sep #$20
	phb
	jsr RunLevelScriptCommands
	plb
	plp
	rtl
RunLevelScriptCommands:
	sep #$20
	lda.w LevelScriptBank
	pha
	plb
	rep #$20
	lda.w $8000,x
	and.b #$FF
	txy
	tax
	jmp (LevelScriptCommandJumpTable,x)
;Jump table for level command bytes
LevelScriptCommandJumpTable:
	DW LevelCommand00_LoadObject16BehNum
	DW LevelCommand02_Stop
	DW LevelCommand04_LoopSection
	DW LevelCommand06
	DW LevelCommand08_Nop
	DW LevelCommand0A_SwarmBeh16
	DW LevelCommand0C
	DW LevelCommand0E_ShowStageNum
	DW LevelCommand10_SetPreset
	DW LevelCommand12_SetZTimer16
	DW LevelCommand14_SetMusic
	DW LevelCommand16_DisablePointEffects
	DW LevelCommand18_EnableGridOfDots
	DW LevelCommand1A_EnableColoredStars
	DW LevelCommand1C
	DW LevelCommand1E_EnableBGTilt
	DW LevelCommand20_DisableBGTilt
	DW LevelCommand22
	DW LevelCommand24
	DW LevelCommand26
	DW LevelCommand28_CallScript
	DW LevelCommand2A_Return
	DW LevelCommand2C_JumpConditionally
	DW LevelCommand2E_Jump
	DW LevelCommand30_SetObjXRotation
	DW LevelCommand32_SetObjYRotation
	DW LevelCommand34_SetObjZRotation
	DW LevelCommand36_SetObjPropertyByte
	DW LevelCommand38_SetObjPropertyWord
	DW LevelCommand3A_SetObjPropertyLong
	DW LevelCommand3C_SetObj2PropertyByte
	DW LevelCommand3E_SetObj2PropertyWord
	DW LevelCommand40_SetObj2PropertyLong
	DW LevelCommand42_FadeFromBlack
	DW LevelCommand44_FadeToBlack
	DW LevelCommand46
	DW LevelCommand48
	DW LevelCommand4A
	DW LevelCommand4C
	DW LevelCommand4E_FadeFromBlackFast
	DW LevelCommand50_FadeToBlackFast
	DW LevelCommand52
	DW LevelCommand54
	DW LevelCommand56_DisableFGTilt
	DW LevelCommand58_EnableFGTilt
	DW LevelCommand5A
	DW LevelCommand5C_StoreByte
	DW LevelCommand5E_StoreWord
	DW LevelCommand60_StoreLong
	DW LevelCommand62
	DW LevelCommand64_RunLoadPresetFunc
	DW LevelCommand66_InitPresetSettings
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
	DW LevelCommand14_SetMusic
	DW LevelCommand8A_SetZTimer8
	DW LevelCommand8C_SetBehEvent
;Level command routines
LevelCommand8C_SetBehEvent:
	tyx
	phx						;\Get current object in X...
	ldx.w CurScriptObject				;|
	bne LevelCommand8C_NotNull			;|if not null, branch to continue...
	plx						;|
	jmp LevelCommand8C_Exit				;/...otherwise branch to leave
LevelCommand8C_NotNull:
	plx						;\Set CurScriptObject.Event
	ldy.w CurScriptObject				;|
	lda.w $8001,x					;|
	sta.w $0028,y					;/
LevelCommand8C_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand8A_SetZTimer8:
	tyx
	lda.w $8001,x					;\Get ZTimer
	and.w #$00FF					;|
	asl						;|...shift left four bits
	asl						;|
	asl						;|
	asl						;|
	sta.w ZTimer					;/
	inx						;\Move on to next command...
	inx						;|
	stx.w LevelScriptPointer			;|...save script pointer and leave
	rts						;/
LevelCommand14_SetMusic:
	tyx
	sep #$20
	lda.w Unknown_14D7
	and.b #$80
	bne LevelCommand14_Exit
	lda.w $8001,x					;\Get next byte...
	sta.w MusicID					;|...and store in current music ID...
	stz.w MusicLoaded				;/...clearing the music loaded flag too
LevelCommand14_Exit:
	inx						;\Move on to next command
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand82:
	tyx
	phx
	lda.w $8001,x
	jsl UnkLevelFunc_03E9CF
	plx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand78_RunASMBlock:
	tyx
	txa
	clc
	adc.b #$00
	bra LevelCommand8C_NotNull
	sep #$20
	lda.b #$00
	pha
	plb
	lda.b #BANKOF(STACKIFY(RunLevelScriptCommands))
	pha
	ldy.w #STACKIFY(RunLevelScriptCommands)
	phy
	lda.w LevelScriptBank
	pha
	phx
	ldx.w CurScriptObject
	rtl
LevelCommand7A:
	tyx
	phx
	sep #$20
	lda.b #BANKOF(STACKIFY(LevelCommand7A_L1))
	pha
	ldy.w #STACKIFY(LevelCommand7A_L1)
	phy
	lda.w $8003,x
	pha
	ldy.w $8001,x
	phy
	ldx.w CurScriptObject
	lda.b #$00
	pha
	plb
	rtl
LevelCommand7A_L1:
	rep #$30
	plx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand7C_BranchLessThan:
	tyx
	lda.w $8001,x					;\Get address to test
	sta.b TempScrBWPtr				;|
	lda.w $8002,x					;|
	sta.b TempScrBWPtr+1				;/
	sep #$20					;\Compare with command parameter...
	lda [D,TempScrBWPtr]				;|
	cmp.w $8004,x					;|
	bpl LevelCommand7C_Exit				;/...if greater or equal, branch to leave
	rep #$20					;\Set X to new script pointer
	lda.w $8005,x					;|
	tax						;|
	jmp RunLevelScriptCommands			;/
LevelCommand7C_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand7E_BranchGreaterThan:
	tyx
	lda.w $8001,x					;\Get address to test
	sta.b TempScrBWPtr				;|
	lda.w $8002,x					;|
	sta.b TempScrBWPtr+1				;/
	sep #$20					;\Compare with command parameter...
	lda [D,TempScrBWPtr]				;|
	cmp.w $8004,x					;|
	beq LevelCommand7E_Exit				;|...if less than, branch to leave
	bmi LevelCommand7E_Exit				;/
	rep #$20					;\Set X to new script pointer
	lda.w $8005,x					;|
	tax						;|
	jmp RunLevelScriptCommands			;/
LevelCommand7E_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand80_BranchEqual:
	tyx
	lda.w $8001,x					;\Get address to test
	sta.b TempScrBWPtr				;|
	lda.w $8002,x					;|
	sta.b TempScrBWPtr+1				;/
	sep #$20					;\Compare with command parameter...
	lda [D,TempScrBWPtr]				;|
	cmp.w $8004,x					;|
	bne LevelCommand80_Exit				;/...if not equal, branch to leave
	rep #$20					;\Set X to new script pointer
	lda.w $8005,x					;|
	tax						;|
	jmp RunLevelScriptCommands			;/
LevelCommand80_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand6C:
	tyx
	inx
	ldy.w #$001E
	sty.w Unknown_1EE9
	sty.w Unknown_1EEB
	ldy.w #$0002
	sty.w Unknown_1EEF
	lda.w #$001E
	sta.w Unknown_1EED
	jmp RunLevelScriptCommands
LevelCommand6E:
	tyx
	inx
	ldy.w #$003E
	sty.w Unknown_1EE9
	sty.w Unknown_1EEB
	ldy.w #$0002
	sty.w Unknown_1EEF
	lda.w #$001E
	sta.w Unknown_1EED
	jmp RunLevelScriptCommands
UnusedLevelCommandFunc_03EF90:
	php
	rep #$30
	lda.w Unknown_1774
	beq UnusedLevelCommandFunc_03EF90_L1
	sta.w Unknown_1EE9
	ldy.w #$0002
	sty.w Unknown_1EEF
	lda.w #$001E
	sta.w Unknown_1EED
UnusedLevelCommandFunc_03EF90_L1:
	plp
	rtl
LevelCommand68:
	tyx
	phx
	ldx.w CurScriptObject
	bne LevelCommand68_L1
	plx
	jmp LevelCommand68_L2
LevelCommand68_L1:
	plx
	lda.w $8001,x
	clc
	adc.w CurScriptObject
	tay
	lda.w $8003,x
	sta.b TempScrBWPtr
	lda.w $8004,x
	sta.b TempScrBWPtr+1
	sep #$20
	lda [D,TempScrBWPtr]
	clc
	adc.w $0000,y
	sta.w $0000,y
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
	ldx.w CurScriptObject
	bne LevelCommand6A_L1
	plx
	jmp LevelCommand6A_L2
LevelCommand6A_L1:
	plx
	lda.w $8001,x
	clc
	adc.w CurScriptObject
	tay
	lda.w $8003,x
	sta.b TempScrBWPtr
	lda.w $8004,x
	sta.b TempScrBWPtr+1
	rep #$20
	lda [D,TempScrBWPtr]
	clc
	adc.w $0000,y
	sta.w $0000,y
LevelCommand6A_L2:
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand66_InitPresetSettings:
	tyx
	phx
	jsl SetPresetInitFlag
	plx
	inx
	jmp RunLevelScriptCommands
SetPresetInitFlag:
	lda.w CurMainLoopLoaderTasks
	ora.w #$0008
	sta.w CurMainLoopLoaderTasks
	rtl
InitPresetSettings:
	php
	rep #$30
	ldx.w PlayerObject
	beq InitPresetSettings_L1
	lda.w TempPlayerBehPtr
	ora.w TempPlayerBehPtr+1
	beq InitPresetSettings_L2
	lda.w Unknown_1F05
	and.w #$00FF
	bne InitPresetSettings_L2
	lda.w TempPlayerBehPtr
	sta.b $16,x
	lda.w TempPlayerBehPtr+1
	sta.b $17,x
	bra InitPresetSettings_L2
InitPresetSettings_L1:
	jml UnkFunc_1FBDEE
InitPresetSettings_L2:
	sep #$20
	stz.w Unknown_1F05
	lda.w EngineSoundFlag
	sta.w Unknown_1FE4
	lda.w PresetSettings
	bit.b #$18
	beq InitPresetSettings_L4
	bit.b #$08
	beq InitPresetSettings_L3
	lda.b #$01
	sta.w PointEffect
	bra InitPresetSettings_L5
InitPresetSettings_L3:
	lda.b #FF
	sta.w PointEffect
	sta.w PointEffect+1
	bra InitPresetSettings_L6
InitPresetSettings_L4:
	stz.w PointEffect
InitPresetSettings_L5:
	stz.w PointEffect+1
InitPresetSettings_L6:
	lda.w PresetSettings
	bit.b #$01
	beq InitPresetSettings_L7
	jsr DoCmdUpdateScrollMode2
	bra InitPresetSettings_L8
InitPresetSettings_L7:
	jsr DoCmdUpdateScrollMode1
InitPresetSettings_L8:
	lda.w PresetSettings
	bit.b #$02
	beq InitPresetSettings_L9
	lda.b #$01
	sta.w ShearScrollFlag
	bra InitPresetSettings_L10
InitPresetSettings_L9:
	stz.w ShearScrollFlag
InitPresetSettings_L10:
	lda.b #$00
	sta.l $701A26
	sta.l $701A27
	lda.w PresetSettings
	bit.b #$20
	beq InitPresetSettings_L11
	lda.b #$01
	sta.l $701A26
	sta.l $701A27
	bra InitPresetSettings_L12
InitPresetSettings_L11:
	bit.b #$40
	beq InitPresetSettings_L13
	lda.b #$02
	sta.l $701A26
	sta.l $701A27
InitPresetSettings_L12:
	lda.b #$FF
	sta.w PointEffect
	sta.w PointEffect+1
InitPresetSettings_L13:
	lda.w PresetSettings
	bit.b #$04
	beq InitPresetSettings_L14
	lda.b #$01
	sta.w FGTiltFlag
	bra InitPresetSettings_L15
InitPresetSettings_L14:
	stz.w FGTiltFlag
InitPresetSettings_L15:
	plp
	rtl
LevelCommand60_StoreLong:
	tyx
	lda.w $8001,x					;\Form address
	sta.b TempScrBWPtr				;|
	lda.w $8002,x					;|
	sta.b TempScrBWPtr+1				;/
	lda.w $8004,x					;\Store long at address
	sta [D,TempScrBWPtr]				;|
	inc.b TempScrBWPtr				;|
	inc.b TempScrBWPtr				;|
	sep #$20					;|
	lda.w $8006,x					;|
	sta [D,TempScrBWPtr]				;/
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand5E_StoreWord:
	tyx
	lda.w $8003,x					;\Form address
	sta.b TempScrBWPtr				;|
	lda.w $8004,x					;|
	sta.b TempScrBWPtr+1				;/
	lda.w $8001,x					;\Store word at address
	sta [D,TempScrBWPtr]				;/
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand5C_StoreByte:
	tyx
	lda.w $8002,x					;\Form address
	sta.b TempScrBWPtr				;|
	lda.w $8003,x					;|
	sta.b TempScrBWPtr+1				;/
	sep #$20					;\Store byte at address
	lda.w $8001,x					;|
	sta [D,TempScrBWPtr]				;/
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand5A:
	tyx
	phx
	ldx.w CurScriptObject
	bne LevelCommand5A_NotNull
	plx
	jmp LevelCommand5A_Exit
LevelCommand5A_NotNull:
	plx
	ldy.w CurScriptObject
	sep #$20
	lda.b #$01
	sta.w $001D,y
	inc Unknown_173C
LevelCommand5A_Exit:
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand84:
	tyx
	phx
	ldx.w CurScriptObject
	bne LevelCommand84_NotNull
	plx
	jmp LevelCommand84_Exit
LevelCommand84_NotNull:
	plx
	ldy.w CurScriptObject
	sep #$20
	lda.b #$80
	sta.w $0020,y
	inc Unknown_173C
LevelCommand84_Exit:
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand56_DisableFGTilt:
	tyx
	sep #$20					;\Disable foreground tilting
	stz.w BGTiltFlag				;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand58_EnableFGTilt:
	tyx
	sep #$20					;\Enable foreground tilting
	lda.b #$01					;|
	sta.w BGTiltFlag				;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand52_DisableScreen:
	tyx
	sep #$20					;\Disable any fading effect
	stz.w FadeMode					;|
	stz.w FadeTimer					;/
	lda.b #$80					;\Disable screen
	jsl SetPlayfieldINIDISPHDMATableValue		;|
	sta.w INIDISP					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand54_EnableScreen:
	tyx
	sep #$20					;\Disable any fading effect
	stz.w FadeMode					;/
	lda.b #$0F					;\Enable screen
	sta.w FadeTimer					;|
	jsl SetPlayfieldINIDISPHDMATableValue		;|
	sta.w INIDISP					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand4C:
	tyx
	sep #$20
	lda.w FadeTimer
	bne LevelCommand4C_L1
	lda.l DefaultINIDISPHDMATable+3
	cmp.b #$80
	bne LevelCommand4C_L1
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand4C_L1:
	lda.b #$01
	sta.w ZTimer
	stz.w ZTimer+1
	stx.w LevelScriptPointer
	rts
LevelCommand4A:
	tyx
	phx
	ldx.w CurScriptObject
	bne LevelCommand4A_NotNull
	plx
	jmp LevelCommand4A_Exit
LevelCommand4A_NotNull:
	plx
	lda.w $8001,x
	sta.b TempScrBWPtr
	lda.w $8002,x
	sta.b TempScrBWPtr+1
	lda.w CurScriptObject
	sta [D,TempScrBWPtr]
LevelCommand4A_Exit:
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand46:
	tyx
	phx
	ldx.w CurScriptObject
	bne LevelCommand46_NotNull
	plx
	jmp LevelCommand46_Exit
LevelCommand46_NotNull:
	plx
	lda.w $8001,x
	clc
	adc.w CurScriptObject
	tay
	lda.w $8003,x
	sta.b TempScrBWPtr
	lda.w $8004,x
	sta.b TempScrBWPtr+1
	sep #$20
	lda [D,TempScrBWPtr]
	sta.w $0000,y
LevelCommand46_Exit:
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
	lda.w CurScriptObject
	bne LevelCommand48_NotNull
	plx
	jmp LevelCommand48_Exit
LevelCommand48_NotNull:
	plx
	lda.w $8001,x
	clc
	adc.w CurScriptObject
	tay
	lda.w $8003,x
	sta.b TempScrBWPtr
	lda.w $8004,x
	sta.b TempScrBWPtr+1
	rep #$20
	lda [D,TempScrBWPtr]
	sta.w $0000,y
LevelCommand48_Exit:
	inx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand42_FadeFromBlack:
	tyx
	sep #$20					;\Set FadeMode to 1
	lda.b #$01					;|
	sta.w FadeMode					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand44_FadeToBlack:
	tyx
	sep #$20					;\Set FadeMode to -1
	lda.b #$FF					;|
	sta.w FadeMode					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand4E_FadeFromBlackFast:
	tyx
	sep #$20					;\Set FadeMode to 2
	lda.b #$02					;|
	sta.w FadeMode					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand50_FadeToBlackFast:
	tyx
	sep #$20					;\Set FadeMode to -2
	lda.b #$FE					;|
	sta.w FadeMode					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand36_SetObjPropertyByte:
	tyx
	phx						;\Get current object in X...
	ldx.w CurScriptObject				;|
	bne LevelCommand36_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand36_Exit				;/...otherwise branch to leave
LevelCommand36_NotNull:
	plx						;\Store byte in object properties
	lda.w $8001,x					;|
	clc						;|
	adc.w CurScriptObject				;|
	tay						;|
	sep #$20					;|
	lda.w $8003,x					;|
	sta.w $0000,y					;/
LevelCommand36_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand38_SetObjPropertyWord:
	tyx
	phx						;\Get current object in X...
	ldx.w CurScriptObject				;|
	bne LevelCommand38_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand38_Exit				;/...otherwise branch to leave
LevelCommand38_NotNull:
	plx						;\Store word in object properties
	lda.w $8001,x					;|
	clc						;|
	adc.w CurScriptObject				;|
	tay						;|
	lda.w $8003,x					;|
	sta.w $0000,y					;/
LevelCommand38_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand3A_SetObjPropertyLong:
	tyx
	phx						;\Get current object in X...
	ldx.w CurScriptObject				;|
	bne LevelCommand3A_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand3A_Exit				;/...otherwise branch to leave
LevelCommand3A_NotNull:
	plx						;\Store long in object properties
	lda.w $8001,x					;|
	clc						;|
	adc.w CurScriptObject				;|
	tay						;|
	lda.w $8003,x					;|
	sta.w $0000,y					;|
	sep #$20					;|
	lda.w $8005,x					;|
	sta.w $0002,y					;/
LevelCommand3A_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand3C_SetObj2PropertyByte:
	tyx
	phx						;\Get current object in X...
	ldx.w CurScriptObject				;|
	bne LevelCommand3C_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand3C_Exit				;/...otherwise branch to leave
LevelCommand3C_NotNull:
	plx
	lda.w CurScriptObject
	clc
	adc.w $8001,x
	txy
	tax
	sep #$20
	lda.w $8003,x
	sta.l Object2List,x
	tyx
LevelCommand3C_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand3E_SetObj2PropertyWord:
	tyx
	phx						;\Get current object in X...
	ldx.w CurScriptObject				;|
	bne LevelCommand3E_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand3E_Exit				;/...otherwise branch to leave
LevelCommand3E_NotNull:
	plx
	lda.w CurScriptObject
	clc
	adc.w $8001,x
	txy
	tax
	lda.w $8003,x
	sta.l Object2List,x
	tyx
LevelCommand3E_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand40_SetObj2PropertyLong:
	tyx
	phx						;\Get current object in X...
	ldx.w CurScriptObject				;|
	bne LevelCommand40_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand40_Exit				;/...otherwise branch to leave
LevelCommand40_NotNull:
	plx
	lda.w CurScriptObject
	clc
	adc.w $8001,x
	txy
	tax
	lda.w $8003,x
	sta.l Object2List,x
	sep #$20
	lda.w $8005,x
	sta.l Object2List+2,x
	tyx
LevelCommand40_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
UnusedLevelCommandFunc_SetZTimer16:
	tyx
	lda.w $8001,x
	sta.w ZTimer
	inx
	inx
	inx
	stx.w LevelScriptPointer
	rts
LevelCommand30_SetObjXRotation:
	tyx
	sep #$20
	phx
	ldx.w CurScriptObject
	bne LevelCommand30_NotNull
	plx
	jmp LevelCommand30_Exit
LevelCommand30_NotNull:
	plx
	lda.w $8001,x
	ldy.w CurScriptObject
	sta.w $0012,y
LevelCommand30_Exit:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand32_SetObjYRotation:
	tyx
	phx
	ldx.w CurScriptObject
	bne LevelCommand32_NotNull
	plx
	jmp LevelCommand32_Exit
LevelCommand32_NotNull:
	plx
	sep #$20
	lda.w $8001,x
	ldy.w CurScriptObject
	sta.w $0012,y
LevelCommand32_Exit:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand34_SetObjZRotation:
	tyx
	sep #$20
	phx
	ldx.w CurScriptObject
	bne LevelCommand34_NotNull
	plx
	jmp LevelCommand34_Exit
LevelCommand34_NotNull:
	plx
	lda.w $8001,x
	ldy.w CurScriptObject
	sta.w $0014,x
LevelCommand34_Exit:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand2E_Jump:
	tyx
	sep #$20					;\Set script pointer...
	lda.w $8003,x					;|
	sta.w LevelScriptBank				;|
	rep #$20					;|
	lda.w $8001,x					;|
	tax						;|
	jmp RunLevelScriptCommands			;/...and leave
LevelCommand2C_JumpConditionally:
	tyx
	phx
	sep #$20
	lda.b #BANKOF(STACKIFY(LevelCommand2C_Return))
	pha
	rep #$20
	lda.w #STACKIFY(LevelCommand2C_Return)
	pha
	sep #$20
	lda.w $8003,x
	pha
	rep #$20
	lda.w $8001,x
	dec
	pha
	sep #$20
	lda.b #$00
	pha
	plb
	rtl
LevelCommand2C_Return:
	bcs LevelCommand2C_JumpConditionally_L2
	sep #$20
	lda.w LevelScriptBank
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
	stx.w LevelScriptPointer
	lda.w #$0001
	sta.w ZTimer
	rts
LevelCommand2C_JumpConditionally_L2:
	sep #$20
	lda.w LevelScriptBank
	pha
	plb
	rep #$30
	plx
	lda.w $8004,x
	tax
	jmp RunLevelScriptCommands
LevelCommand28_CallScript:
	tyx
	ldy.w ScriptCallStackPtr			;\Save level script pointer to call stack
	txa						;|
	sta.w ScriptCallStack,y				;|
	sep #$20					;|
	lda.w LevelScriptBank				;|
	sta.w ScriptCallStack+2,y			;/
	rep #$20					;\Update call stack pointer
	iny						;|
	iny						;|
	iny						;|
	sty.w ScriptCallStackPtr			;/
	sep #$20					;\Update script pointer
	lda.w $8003,x					;|
	sta.w LevelScriptBank				;|
	rep #$20					;|
	lda.w $8001,x					;|
	tax						;/
	inc.w ScriptCallStackSz				;\Increment stack size and leave
	jmp RunLevelScriptCommands			;/
LevelCommand2A_Return:
	tyx
	ldy.w ScriptCallStackPtr			;\Restore level script pointer
	dey						;|
	sep #$20					;|
	lda.w ScriptCallStack,y				;|
	sta.w LevelScriptBank				;|
	rep #$20					;|
	dey						;|
	dey						;|
	ldx.w ScriptCallStack,y				;/
	sty.w ScriptCallStackPtr			; Update call stack pointer
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;/
	dec.w ScriptCallStackSz				;\Increment stack size and leave
	jmp RunLevelScriptCommands			;/
LevelCommand1E_EnableBGTilt:
	tyx
	jsr DoCmdUpdateScrollMode2
	inx
	jmp RunLevelScriptCommands
CmdUpdateScrollMode2:
	jsr DoCmdUpdateScrollMode2
	rtl
DoCmdUpdateScrollMode2:
	php
	sep #$20					;\Update vertical scroll
	lda.w VerticalScroll				;|
	sta.w BG2VOFS					;|
	lda.w VerticalScroll+1				;|
	sta.w BG2VOFS					;/
	lda.b #$01					;\Enable background tilting/shearing
	sta.w Mode2Flag					;/
	lda.b #$02					;\Set BGMODE to 2
	sta.w BGMODE					;/
	plp
	rts
LevelCommand20_DisableBGTilt:
	tyx
	jsr DoCmdUpdateScrollMode1
	inx
	jmp RunLevelScriptCommands
CmdUpdateScrollMode1:
	jsr DoCmdUpdateScrollMode1
	rtl
DoCmdUpdateScrollMode1:
	php
	sep #$20					;\Disable background tilting/shearing
	stz.w BGTiltFlag					;/
	lda.b #$01					;\Set BGMODE to 1
	sta.w BGMODE					;/
	lda.w VerticalScroll				;\Update vertical scroll
	sta.w BG2VOFS					;|
	lda.w VerticalScroll+1				;|
	sta.w BG2VOFS					;/
	plp
	rts
LevelCommand22:
	tyx
	sep #$20
	lda.b #$01
	sta.w Unknown_1953
	inx
	jmp RunLevelScriptCommands
LevelCommand24:
	tyx
	sep #$20
	stz.w Unknown_1953
	inx
	jmp RunLevelScriptCommands
LevelCommand1C:
	tyx
	sep #$20
	lda.w $8001,x
	sta.w Unknown_1955
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand16_DisablePointEffects:
	tyx
	stz.w PointEffect				; Set PointEffect to 0 (none)
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand18_EnableGridOfDots:
	tyx
	lda.w #$0001					;\Set PointEffect to 1 (grid of dots)
	sta.w PointEffect				;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand1A_EnableColoredStars:
	tyx
	lda.w #$FFFF					;\Set PointEffect to -1 (colored stars)
	sta.w PointEffect				;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand64_RunLoadPresetFunc:
	tyx
	phx
	lda.w Unknown_16DF
	tax
	lda.l PresetFunctionTable,x
	sta.b TempPtr
	lda.l PresetFunctionTable+1,x
	ora.b TempPtr
	beq LevelCommand64_Exit
	plx
	stx.w LevelScriptPointer
	rts
LevelCommand64_Exit:
	plx
	inx
	jmp RunLevelScriptCommands
LevelCommand62:
	tyx
	lda.w $8001,x
	and.w #$00FF
	sta.w Unknown_16E1
	lda.w $8002,x
	sta.w Unknown_16DF
	sta.w Preset
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand10_SetPreset:
	tyx
	phx
	rep #$20
	lda.w $8001,x
	jsl DoSetPreset
	plx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
DoSetPreset:
	sta.w Preset
	lda.w CurMainLoopLoaderTasks
	ora.w #$0004
	sta.w CurMainLoopLoaderTasks
	rtl
LoadPreset:
	rep #$20
	ldx Preset
LoadPreset_Loop:
	lda.l PresetFunctionTable,x
	sta.b TempPtr
	lda.l PresetFunctionTable+1,x
	sta.b TempPtr+2
	ora.b TempPtr
	beq LoadPreset_Exit
	phx
	sep #$20
	lda.b #BANKOF(STACKIFY(LoadPreset_Return))
	pha
	rep #$20
	lda.w #STACKIFY(LoadPreset_Return)
	pha
	sep #$20
	lda.b TempPtr
	pha
	ldx.b TempPtr+2
	dex
	phx
	rtl
LoadPreset_Return:
	rep #$20
	plx
	inx
	inx
	inx
	bra LoadPreset_Loop
LoadPreset_Exit:
	rtl
LevelCommand0E_ShowStageNum:
	tyx
	lda.w #$0032					;\Set stage number text to appear for 50 frames
	sta.w StageNumTextTimer				;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand70_LoadObject8BehNum:
	tyx
	lda.w $8001,x					;\Get ZTimer...
	and.w #$00FF					;|
	asl						;|...shift left four bits
	asl						;|
	asl						;|
	asl						;|
	sta.w ZTimer					;/
	phx
	ldx.w FirstObject
	txy
	ldx.w FirstFreeObject
	bne LevelCommand70_LoadObject8BehNum_L1
	tyx
	jmp LevelCommand70_LoadObject8BehNum_L12
LevelCommand70_LoadObject8BehNum_L1:
	lda.b $00,x
	sta.w FirstFreeObject
	tya
	bne LevelCommand70_LoadObject8BehNum_L2
	lda.w FirstObject
	sta.b $00,x
	stz.b $02,x
	stx.w FirstObject
	bra LevelCommand70_LoadObject8BehNum_L3
LevelCommand70_LoadObject8BehNum_L2:
	lda.w $0000,y
	sta.b $00,x
	stx.b $00,y
	sty.b $02,x
LevelCommand70_LoadObject8BehNum_L3:
	ldy.b $00,x
	beq LevelCommand70_LoadObject8BehNum_L4
	stx.b $0002,y
LevelCommand70_LoadObject8BehNum_L4:
	txy
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda.w $8002,x
	bit.w #$0080
	beq LevelCommand70_PosX
	ora.w #$FF00
	bra LevelCommand70_SkipX
LevelCommand70_PosX:
	and.w #$00FF
LevelCommand70_SkipX:
	asl
	asl
	sta.w $000C,y
	lda.w $8003,x
	bit.w #$0080
	beq LevelCommand70_PosY
	ora.w #$FF00
	bra LevelCommand70_SkipY
LevelCommand70_PosY:
	and.w #$00FF
LevelCommand70_SkipY:
	asl
	asl
	sta.w $000E,y
	lda.w $8004,x
	and.w #$00FF
	asl
	asl
	asl
	asl
	phy
	ldy.w PlayerObject
	clc
	adc.w $0010,y
	ply
	sta.w $0010,y
	lda.w $8000,x
	and.w #$00FF
	cmp.w #$0076
	bne LevelCommand70_LoadObject8BehNum_L9
	lda.w $8005,x
	phx
	and.w #$00FF
	asl
	asl
	tax
	lda.l BehaviorFunctionTable,x
	sta.w $0016,y
	sep #$20
	lda.l BehaviorFunctionTable+2,x
	sta.w $0018,y
	lda.l BehaviorFunctionTable+3,x
	rep #$20
	and.w #$00FF
	asl
	tax
	lda.l ModelIDTable,x
	sta.w $0004,y
	plx
	bra LevelCommand70_LoadObject8BehNum_L10
LevelCommand70_LoadObject8BehNum_L9:
	lda.w $8005,x
	phx
	and.w #$00FF
	asl
	tax
	lda.l ModelIDTable,x
	sta.w $0004,y
	plx
	lda.w $8006,x
	phx
	and.w #$00FF
	asl
	asl
	tax
	lda.l BehaviorFunctionTable,x
	sta.w $0016,y
	sep #$20
	lda.l BehaviorFunctionTable+2,x
	sta.w $0018,y
	plx
LevelCommand70_LoadObject8BehNum_L10:
	rep #$20
	sty.w CurScriptObject
	jsr SkipCommand7076
	lda.w ZTimer
	bne LevelCommand70_LoadObject8BehNum_L11
	jmp RunLevelScriptCommands
LevelCommand70_LoadObject8BehNum_L11:
	stx.w LevelScriptPointer
	rts
LevelCommand70_LoadObject8BehNum_L12:
	rep #$20
	ldx.w #$0000
	stx.w CurScriptObject
	plx
	jsr SkipCommand7076
	lda.w ZTimer
	bne LevelCommand70_LoadObject8BehNum_L11
	jmp RunLevelScriptCommands
SkipCommand7076:
	lda.w $8000,x					;\Get command byte
	and.w #$00FF					;/
	cmp.w #$0076					;\If $76, branch ahead
	beq SkipCommand7076_Is76			;/
	txa						;\Otherwise, skip 7 bytes to move on to next command
	clc						;|
	adc.w #$0007					;|
	tax						;|
	rts						;/
SkipCommand7076_Is76:
	txa						;\Skip 6 bytes to move on to next command
	clc						;|
	adc.w #$0006					;|
	tax						;|
	rts						;/
LevelCommand72:
	tyx
	lda.w $8001,x
	and.w #$00FF
	asl
	asl
	sta.w ZTimer
	phx
	ldx.w FirstObject
	txy
	ldx.w FirstFreeObject
	bne LevelCommand72_L1
	tyx
	jmp LevelCommand72_L12
LevelCommand72_L1:
	lda.b $00,x
	sta.w FirstFreeObject
	tya
	bne LevelCommand72_L2
	lda.w FirstObject
	sta.b $00,x
	stz.b $02,x
	stx.w FirstObject
	bra LevelCommand72_L3
LevelCommand72_L2:
	lda.w $0000,y
	sta.b $00,x
	stx.b $00,y
	sty.b $02,x
LevelCommand72_L3:
	ldy.b $00,x
	beq LevelCommand72_L4
	stx.b $02,y
LevelCommand72_L4:
	txy
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda.w $8002,x
	bit.w #$0080
	beq LevelCommand72_L5
	ora.w #$FF00
	bra LevelCommand72_L6
LevelCommand72_L5:
	and.w #$00FF
LevelCommand72_L6:
	asl
	asl
	sta.w $000C,y
	lda.w $8003,x
	bit.w #$0080
	beq LevelCommand72_L7
	ora.w #$FF00
	bra LevelCommand72_L8
LevelCommand72_L7:
	and.w #$00FF
LevelCommand72_L8:
	asl
	asl
	sta.w $000E,y
	lda.w $8004,x
	bit.w #$0080
	beq LevelCommand72_L9
	ora.w #$FF00
	bra LevelCommand72_L10
LevelCommand72_L9:
	and.w #$00FF
LevelCommand72_L10:
	asl
	asl
	asl
	asl
	phy
	ldy.w PlayerObject
	clc
	adc.w $0010,y
	ply
	sta.w $0010,y
	lda.w $8005,x
	sta.w $0004,y
	lda.w $8006,x
	sta.w $0016,y
	sep #$20
	lda.w $8008,x
	sta.w $0018,y
	rep #$20
	sty.w CurScriptObject
	txa
	clc
	adc.w #$0007
	tax
	lda.w ZTimer
	bne LevelCommand72_L11
	jmp RunLevelScriptCommands
LevelCommand72_L11:
	stx.w LevelScriptPointer
	rts
LevelCommand72_L12:
	rep #$20
	stz.w CurScriptObject
	pla
	clc
	adc.w #$0007
	tax
	lda.w ZTimer
	bne LevelCommand72_L11
	jmp RunLevelScriptCommands
LevelCommand00_LoadObject16BehNum:
	tyx
	lda.w $8001,x					;\Get ZTimer
	sta.w ZTimer					;/
	phx
	ldx.w FirstObject				;\Get FirstObject in Y
	txy						;/
	ldx.w FirstFreeObject				;\Get FirstFreeObject in X
	bne LevelCommand00_Do				;|...if not null, continue...
	tyx						;|
	jmp LevelCommand00_Exit				;/...otherwise exit
LevelCommand00_Do:
	lda.b $00,x					;\Update FirstFreeObject with FirstFreeObject.NextObj
	sta.w FirstFreeObject				;/
	tya						;\If FirstObject is not null, branch
	bne LevelCommand00_FirstObjNotNull		;/
	lda.w FirstObject				;\Otherwise, make FirstFreeObject FirstObject...
	sta.b $00,x					;|...by setting FirstFreeObject.NextObj...
	stz.b $02,x					;|...and FirstFreeObject.PrevObj to 0...
	bra LevelCommand00_SkipInit			;/...skip alternate initialization
LevelCommand00_FirstObjNotNull:
	lda.w $0000,y					;\Set FirstFreeObject.NextObj to FirstObject.NextObj
	sta.b $00,x					;/
	stx.b $00,y					; Set FirstObject.NextObj to FirstFreeObject
	sty.b $02,x					; Set FirstFreeObject.PrevObj to FirstObject
LevelCommand00_SkipInit:
	ldy.b $00,x					;\Get FirstFreeObject.NextObj in Y...
	beq LevelCommand00_SkipSetNextPrev		;|...if null, skip this, otherwise...
	stx.b $02,y					;/...set FirstFreeObject.NextObj.PrevObj to FirstFreeObject
LevelCommand00_SkipSetNextPrev:
	txy
	plx
	sep #$20
	jsl ClearObject					; Zero out all object properties
	rep #$20
	lda.w $8003,x					;\Init object X position
	sta.w $000C,y					;/
	lda.w $8005,x					;\Init object Y position
	sta.w $000E,y					;/
	phy						;\Init object Z position
	ldy.w PlayerObject				;|
	lda.w $0010,y					;|
	ply						;|
	clc						;|
	adc.w $8007,x					;|
	sta.w $0010,y					;/
	lda.w $8009,x					;\Init object model ID
	phx						;|
	and.w #$00FF					;|
	asl						;|
	tax						;|
	lda.l ModelIDTable,x				;|
	sta.w $0004,x					;|
	plx						;/
	lda.w $8009,x					;\Init object behavior function pointer
	phx						;|
	and.w #$00FF					;|
	asl						;|
	asl						;|
	tax						;|
	lda.l BehaviorFunctionTable,x			;|
	sta.w $0016,y					;|
	sep #$20					;|
	lda.l BehaviorFunctionTable+2,x			;|
	sta.w $0018,y					;|
	plx						;/
	sty.w CurScriptObject				; Set current object being processed in level script
	rep #$20					;\Move on to next command
	txa						;|
	clc						;|
	adc.w #$000B					;|
	tax						;/
	lda.w ZTimer					;\If ZTimer is not 0...
	bne LevelCommand00_ZTimerNotNull		;|...branch to leave, otherwise...
	jmp RunLevelScriptCommands			;/...get the next script command
LevelCommand00_ZTimerNotNull:
	stx.w LevelScriptPointer			;\Save script pointer and leave
	rts						;/
LevelCommand00_Exit:
	rep #$20					;\Set current object being processed to null
	stz.w CurScriptObject				;/
	pla						;\Move on to next command
	clc						;|
	adc.w #$000B					;|
	tax						;/
	lda.w ZTimer					;\If ZTimer is not 0...
	bne LevelCommand00_ZTimerNotNull		;|...branch to leave, otherwise...
	jmp RunLevelScriptCommands			;/...get the next script command
LevelCommand74_LoadMacroObj16:
	tyx
	lda.w $8001,x					;\Get ZTimer
	sta.w ZTimer					;/
	phx
	ldx.w FirstObject
	txy
	ldx.w FirstFreeObject
	bne LevelCommand74_LoadMacroObj16_Do
	tyx
	jmp LevelCommand74_LoadMacroObj16_Exit
LevelCommand74_LoadMacroObj16_Do:
	lda.b $00,x
	sta FirstFreeObject
	tya
	bne LevelCommand74_LoadMacroObj16_L2
	lda FirstObject
	sta.b $00,x
	stz.b $02,x
	stx FirstObject
	bra LevelCommand74_LoadMacroObj16_L3
LevelCommand74_LoadMacroObj16_L2:
	lda $0000,y
	sta.b $00,x
	stx.b $00,y
	sty.b $02,x
LevelCommand74_LoadMacroObj16_L3:
	ldy.b $00,x
	beq LevelCommand74_LoadMacroObj16_L4
	stx.b $02,y
LevelCommand74_LoadMacroObj16_L4:
	txy
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda $8003,x
	sta $000C,y
	lda $8005,x
	sta $000E,y
	phy
	ldy PlayerObject
	lda $0010,y
	ply
	clc
	adc $8007,x
	sta $0010,y
	lda $8009,x
	phx
	and #$00FF
	asl
	tax
	lda ModelIDTable,x
	sta $0004,y
	plx
	lda $8009,x
	phx
	and #$00FF
	asl
	asl
	tax
	lda BehaviorFunctionTable,x
	sta $0016,y
	sep #$20
	lda BehaviorFunctionTable+2,x
	sta $0018,y
	plx
	lda $800B,x
	sta $0015,y
	sty CurScriptObject
	rep #$20
	txa
	clc
	adc #$000C
	tax
	lda ZTimer
	bne LevelCommand74_LoadMacroObj16_L5
	jmp RunLevelScriptCommands
LevelCommand74_LoadMacroObj16_L5:
	stx LevelScriptPointer
	rts
LevelCommand74_LoadMacroObj16_Exit:
	rep #$20
	stz CurScriptObject
	pla
	clc
	adc #$000C
	tax
	lda ZTimer
	bne LevelCommand74_LoadMacroObj16_L5
	jmp RunLevelScriptCommands
LevelCommand02_Stop:
	tyx
	stx.w LevelScriptPointer			;\Save script pointer and leave
	rts						;/
LevelCommand04_LoopSection:
	tya
	ldx.w #$0000
LevelCommand04_LoopSection_L1:
	cmp $174B,x
	beq LevelCommand04_LoopSection_L2
	inx
	inx
	cpx #$08
	bne LevelCommand04_LoopSection_L1
	ldx $1753
	sta $174B,x
	lda $8003,y
	sta $1743,x
	inc $1753
	inc $1753
	lda $8001,y
	tax
	jmp RunLevelScriptCommands
LevelCommand04_LoopSection_L2:
	lda $1743,x
	dec
	beq LevelCommand04_LoopSection_L3
	sta $1743,x
	tyx
	lda $8001,x
	tax
	jmp RunLevelScriptCommands
LevelCommand04_LoopSection_L3:
	stz $174B,x
	stz $1743,x
	dec $1753
	dec $1753
	tyx
	inx
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand06:
	jml UnkFunc_1FBDEE
LevelCommand08_Nop:
	inx
	jmp RunLevelScriptCommands
LevelCommand86_LoadObject16BehAddr:
	tyx
	lda.w $8001,x
	sta.w ZTimer
	phx
	ldx.w FirstObject
	txy
	ldx.w FirstFreeObject
	bne LevelCommand86_LoadObject16BehAddr_L1
	tyx
	jmp LevelCommand86_LoadObject16BehAddr_L7
LevelCommand86_LoadObject16BehAddr_L1:
	lda.b $00,x
	sta.w FirstFreeObject
	tya
	bne LevelCommand86_LoadObject16BehAddr_L2
	lda.w FirstObject
	sta.b $00,x
	stz.b $02,x
	stx.w FirstObject
	bra LevelCommand86_LoadObject16BehAddr_L3
LevelCommand86_LoadObject16BehAddr_L2:
	lda.w $0000,y
	sta.b $00,x
	stx.b $00,y
	sty.b $02,x
LevelCommand86_LoadObject16BehAddr_L3:
	ldy.b $00,x
	beq LevelCommand86_LoadObject16BehAddr_L4
	stx.b $02,y
LevelCommand86_LoadObject16BehAddr_L4:
	txy
	sty
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda $8003,x
	sta $000C,y
	lda $8005,x
	sta $000E,y
	phy
	ldy PlayerObject
	lda $0010,y
	ply
	clc
	adc $8007,x
	sta $0010,y
	lda $8009,x
	sta $0004,y
	lda $800B,x
	sta $0016,y
	lda $800C,x
	sta $0017,y
	rep #$20
	txa
	clc
	adc #$000E
	tax
LevelCommand86_LoadObject16BehAddr_L5:
	lda ZTimer
	bne LevelCommand86_LoadObject16BehAddr_L6
	jmp RunLevelScriptCommands
LevelCommand86_LoadObject16BehAddr_L6:
	stx LevelScriptPointer
	rts
LevelCommand86_LoadObject16BehAddr_L7:
	rep #$20
	stz CurScriptObject
	pla
	clc
	adc #$000E
	tax
	bra LevelCommand86_LoadObject16BehAddr_L5
LevelCommand0A_SwarmBeh16:
	tyx
	lda $8001,x
	sta ZTimer
	phx
	ldx FirstObject
	txy
	ldx FirstFreeObject
	bne LevelCommand0A_SwarmBeh16_L1
	tyx
	jmp LevelCommand0A_SwarmBeh16_L7
LevelCommand0A_SwarmBeh16_L1:
	lda.b $00,x
	sta FirstFreeObject
	tya
	bne LevelCommand0A_SwarmBeh16_L2
	lda FirstObject
	sta.b $00,x
	stz.b $02,x
	stx FirstObject
	bra LevelCommand0A_SwarmBeh16_L3
LevelCommand0A_SwarmBeh16_L2:
	lda $0000,y
	sta.b $00,x
	stx.b $00,y
	sty.b $02,x
LevelCommand0A_SwarmBeh16_L3:
	ldy.b $00,x
	beq LevelCommand0A_SwarmBeh16_L4
	stx.b $0002,y
LevelCommand0A_SwarmBeh16_L4:
	txy
	sty CurScriptObject
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda $8003,x
	sta $000C,y
	lda $8005,x
	sta $000E,y
	phy
	ldy PlayerObject
	lda $0010,y
	ply
	clc
	adc $8007,x
	sta $0010,y
	lda $8009,x
	sta $0004,y
	lda $800B,x
	sta $0016,y
	lda $800C,x
	sta $8017,y
	lda $800E,x
	sta $0006,y
	lda #$0008
	sta $0009,y
	rep #$20
	txa
	clc
	adc #$0010
	tax
LevelCommand0A_SwarmBeh16_L5:
	lda.w ZTimer
	bne LevelCommand0A_SwarmBeh16_L6
	jmp RunLevelScriptCommands
LevelCommand0A_SwarmBeh16_L6:
	stx.w LevelScriptPointer
	rts
LevelCommand0A_SwarmBeh16_L7:
	rep #$20
	stz.w CurScriptObject
	pla
	clc
	adc.w #$0010
	tax
	bra LevelCommand0A_SwarmBeh16_L5
LevelCommand0C:
	ldx.w FirstObject
	beq LevelCommand0C_L2
LevelCommand0C_L1:
	lda.b $00,x
	tax
	beq LevelCommand0C_L2
	lda.w $8003,y
	cmp.b $04,x
	bne LevelCommand0C_L1
	phy
	jsl CODE_1FBFDC
	ply
LevelCommand0C_L2:
	tya
	clc
	adc.w #$0005
	tax
	jmp RunLevelScriptCommands
LevelCommand12_SetZTimer16:
	tyx
	inx						;\Get ZTimer...
	inx						;|
	inx						;|
	lda.w $7FFE,x					;|
	beq LevelCommand12_Return			;|...if zero, branch to leave
	sta.w ZTimer					;/
	stx.w LevelScriptPointer			;\Move on to next command
	rts						;/
LevelCommand12_Return:
	jmp RunLevelScriptCommands
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SWARM PROCESSING ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
ProcessSwarm:
	php
	rep #$20
ProcessSwarm_Loop:
	lda.b $26,x
	bmi ProcessSwarm_RunCmd
	bne ProcessSwarm_End
ProcessSwarm_RunCmd:
	phx
	lda.b $06,x
	txy
	tax
	pea #STACKIFY(ProcessSwarm_Return)
	lda.l $058001,x
	sta.w $0026,y
	lda.l $058000,x
	and.w #$00FF
	tax
	jmp (SwarmCommandJumpTable,x)
;Jump table for swarm command bytes
SwarmCommandJumpTable:
	DW SwarmCommand00_LoadObject
	DW SwarmCommand02
	DW SwarmCommand04_Stop
	DW SwarmCommand06_LoadObject
	DW SwarmCommand08_Jump
	DW SwarmCommand0A_NoOp
	DW SwarmCommand0C_CountObjectsWithID
	DW SwarmCommand0E_BranchConditional
ProcessSwarm_Return:
	plx
	bra ProcessSwarm_Loop
ProcessSwarm_End:
	sec
	sbc.w ZTimerVel
	sta.b $26,x
	plp
	rtl
SwarmCommand00_LoadObject:
	lda.w $0006,y
	tax
	phy
	lda.w $000C,y
	sta.b TempVecXG
	lda.w $000E,y
	sta.b TempVecYG
	lda.w $0010,y
	sta.b TempVecZG
	phx
	ldx.w FirstObject
	txy
	ldx.w FirstFreeObject
	bne CODE_03FBDC
	tyx
	jmp SwarmCommand00_Exit
CODE_03FBDC:
	lda.b $00,x
	sta.w FirstFreeObject
	tya
	bne CODE_03FBF0
	lda.w FirstObject
	sta.b $00,x
	stz.b $02,x
	stx FirstObject
	bra CODE_03FBF9
CODE_03FBF0:
	lda $0000,y
	sta.b $00,x
	stx.b $00,y
	sty.b $02,x
CODE_03FBF9:
	ldy.b $00,x
	beq CODE_03FBFF
	stx.b $02,y
CODE_03FBFF:
	txy
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda.b $02
	clc
	adc.l $058003,x
	sta.w $000C,y
	lda.b $08
	clc
	adc.l $058005,x
	sta.w $000E,y
	lda.b $90
	clc
	adc.l $058007,x
	sta.w $0010,y
	lda.l $058009,x
	sta.w $0004,y
	lda.l $05800B,x
	sta.w $0016,y
	lda.l $05800C,x
	sta.w $0017,y
	phx
	tyx
	lda.w #$0000
	sta $7E1CD3,x
	sta $7E1CD0,x
	plx
	sep #$20
	lda.b #$00
	sta.w $0008,y
	sta.w $001D,y
	sta.w $0012,y
	sta.w $0013,y
	sta.w $0014,y
	lda.b #$08
	sta.w $0009,y
	rep #$20
	txa
	clc
	adc.w #$000E
	tax
	ply
	txa
	sta.w $0006,y
	rts
SwarmCommand00_Exit:
	rep #$20
	pla
	ply
	clc
	adc.w #$000E
	sta.w $0006,y
	rts
SwarmCommand0A_NoOp:
	lda.w $0006,y
	clc
	adc.w #$0003
	sta.w $0006,y
	rts
SwarmCommand08_Jump:
	lda.w $0006,y
	tax
	lda.l $058003,x
	sta.w $0006,y
	rts
SwarmCommand0E_BranchConditional:
	lda.w $0006,y
	tax
	phy
	lda.l $058007,x
	and.w #$00FF
	cmp.w #$0000
	beq CODE_03FCCB
	cmp.w #$0001
	beq CODE_03FCD6
	cmp.w #$0002
	beq CODE_03FCC0
	cmp.w #$0003
	beq CODE_03FCB5
	bra CODE_03FCEA
CODE_03FCB5:
	lda.w NumSwarmObjects
	cmp.l $058003,x
	bcs CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCC0:
	lda.w NumSwarmObjects
	cmp.l $058003,x
	bcc CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCCB:
	lda.w NumSwarmObjects
	cmp.l $058003,x
	beq CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCD6:
	lda.w NumSwarmObjects
	cmp.l $058003,x
	bne CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCE1:
	ply
	txa
	clc
	adc #$008
	sta.w $0006,y
	rts
SwarmCommand0C_CountObjectsWithID:
	lda.w $0006,y
	tax
	phy
	phx
	stz.w NumSwarmObjects
	lda.l $058003,x
	ldx.w FirstObject
SwarmCommand0C_Loop:
	cmp.b $04,x
	bne SwarmCommand0C_SkipInc
	inc.w NumSwarmObjects
SwarmCommand0C_SkipInc:
	ldy.b $00,x
	tyx
	bne SwarmCommand0C_Loop
	plx
	ply
	txa
	clc
	adc.w #$0005
	sta.w $0006,y
	rts
SwarmCommand02:
	lda.w $0006,y
	tax
	sep #$20
	lda.l $058005,x
	sta.b $02
	lda.w $0024,y
	inc
	cmp.b $02
	bmi SwarmCommand02_L1
	lda.b #$00
	sta.w $0024,y
	rep #$20
	txa
	clc
	adc.w #$0006
	sta.w $0006,y
	rts
SwarmCommand02_L1:
	sta.w $0024,y
	rep #$20
	lda.l $058003,x
	sta.w $0006,y
	rts
SwarmCommand04_Stop:
	tyx
	jsl CODE_1FD501
	plx
	plx
	plp
	rtl
SwarmCommand06_LoadObject:
	lda.w $0006,y
	tax
	phy
	phx
	sep #$20
	jsl CODE_02FC58
	sta.b $04
	jsl CODE_02FC58
	sta.b $05
	jsl CODE_02FC58
	sta.b $0A
	jsl CODE_02FC58
	sta.b $0B
	jsl CODE_02FC58
	sta.w $15C2
	jsl CODE_02FC58
	sta.w $15C3
	rep #$20
	lda.l $058003,x
	beq CODE_03FD98
	lsr
	sta.b $02
	lda.l $058003,x
	dec
	and.b $04
	sec
	sbc.b $02
CODE_03FD98:
	clc
	adc.w $000C,y
	sta.b $02
	lda.l $058005,x
	beq CODE_03FDB1
	lsr
	sta.b $08
	lda.l $058005,x
	dec
	and.b $0A
	sec
	sbc.b $08
CODE_03FDB1:
	clc
	adc.w $000E,y
	sta.b $08
	lda.l $058007,x
	beq CODE_03FDCB
	lsr
	sta.b $90
	lda.l $058007,x
	dec
	and.w $15C2
	sec
	sbc.b $90
CODE_03FDCB:
	clc
	adc.w $0010,y
	sta.b $90
	ldx.w FirstObject
	txy
	ldx.w FirstFreeObject
	bne CODE_03FDDE
	tyx
	jmp CODE_03FE63
CODE_03FDDE:
	lda.b $00,x
	sta.w FirstFreeObject
	tya
	bne CODE_03FDF2
	lda.w FirstObject
	sta.b $00,x
	stz.b $02,x
	stx FirstObject
	bra CODE_03FDFB
CODE_03FDF2:
	lda.w $0000,y
	sta.b $00,x
	stx.b $00,y
	sty.b $02,x
CODE_03FDFB:
	ldy.b $00,x
	beq CODE_03FE01
	stx.b $02,y
CODE_03FE01:
	txy
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda.b $02
	sta.w $000C,y
	lda.b $08
	sta.w $000E,y
	lda.b $90
	sta.w $0010,y
	lda.l $058009,x
	sta.w $0004,y
	lda.l $05800B,x
	sta.w $0016,y
	lda.l $05800C,x
	sta.w $0017,y
	phx
	tyx
	lda.w #$0000
	sta $7E1CD3,x
	sta $7E1CD0,x
	plx
	sep #$20
	lda.w #$0000
	sta.w $0008,y
	sta.w $001D,y
	sta.w $0012,y
	sta.w $0013,y
	sta.w $0014,y
	lda.b #$08
	sta.w $0009,y
	rep #$20
	txa
	clc
	adc.w #$000E
	tax
	ply
	txa
	sta.w $0006,y
	rts
CODE_03FE63:
	rep #$20
	pla
	ply
	clc
	adc.w #$000E
	sta.w $0006,y
	rts
