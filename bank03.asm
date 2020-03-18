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
DATA_038F9A:
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
	DB $00,$5C,$00,$18
	jsr DecompressTilemap
	DL $16ED34
	DB $00,$70,$00,$20
	jsr LoadPalette
	DL $7F0360
	DB $E0,$00
	lda.b #$00
	sta.b CurNMITask
	lda HDMAENMirror
	ora.b #$04
	sta HDMAENMirror
	lda #$16
	sta $1785
	ldx #$822A
	stx $1786
	lda #$0B
	sta $1788
	sep #$20
	lda #$00
	sta $14DB
	jsl CODE_06BA91
	lda #$05
	sta $14DC
	rep #$20
	lda #$0000
	sta $169C
	sta $194D
	sep #$20
	lda #$0C
	sta $1FE2
	rep #$20
	lda #$0000
	sta $7001A8
	lda #$00A0
	sta $7001AA
	lda #$0001
	sta $7001AC
	sep #$20
	jsl LoadAudio_BlackHole
	stz $16C9
	lda #$01
	sta $18C2
	stz $194F
	stz $1950
	lda #$8A
	sta $70004E
	lda #$8B
	sta $70004F
	lda HDMAENMirror
	sta HDMAEN
LoadPreset_BlackHole_Wait:
	lda.b CurNMITask
	beq LoadPreset_BlackHole_Exit
	cmp #$20
	bne LoadPreset_BlackHole_Wait
LoadPreset_BlackHole_Exit:
	rtl
LoadPreset_Scramble:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14DB6E
	DB $00,$5C,$00,$18
	jsr DecompressTilemap
	DL $14DC0E
	DB $00,$70,$00,$20
	jsr LoadPalette
	DL $7F00E0
	DB $E0,$00
	lda #$10
	sta.b CurNMITask
	lda HDMAENMirror
	ora #$04
	sta HDMAENMirror
	lda #$02
	sta $1785
	ldx #$8004
	stx $1786
	lda #$0B
	sta $1788
	sep #$20
	lda #$00
	sta $14DB
	jsl CODE_06BA91
	lda #$02
	sta $14DC
	lda #$08
	sta $1FE2
	rep #$20
	lda #$8FAE
	sta $700050
	sep #$20
	rep #$10
	jsl LoadAudio_Scramble1
	lda #$00
	sta $70021C
	rep #$20
	lda #$0000
	sta $195F
	sep #$20
	lda #$01
	sta $16C9
	lda HDMAENMirror
	ora #$10
	sta HDMAENMirror
	stz $194F
	stz $1950
	stz $1862
	lda #$8A
	sta $70004E
	lda #$8B
	sta $70004F
	lda HDMAENMirror
	sta HDMAEN
LoadPreset_Scramble_Wait:
	lda.b CurNMITask
	beq LoadPreset_Scramble_Exit
	cmp #$20
	bne LoadPreset_Scramble_Wait
LoadPreset_Scramble_Exit:
	rtl
LoadPreset_Unk09:
	jml CODE_1FBDEE
LoadPreset_Unk0F:
	jml CODE_1FBDEE
LoadPreset_Corneria12:
	sep #$20
	jsr SetNMITaskInitMode2
	jsr DecompressTileset
	DL $14FECE
	DB $00,$5C,$00,$18
	jsr DecompressTilemap
	DL $1581E4
	DB $00,$70,$00,$20
	jsr LoadPalette
	DL $7F0360
	DB $E0,$00
	lda #$03
	sta $1897
	jsl CODE_02F492
	lda #$10
	sta.b CurNMITask
	rep #$20
	lda #$8FB6
	sta $700050
	sep #$20
	rep #$10
	lda HDMAENMirror
	ora #$40
	sta HDMAENMirror
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
;Tileset/tilemap/palette loading
DoDecompressTileset:
	php
	rep #$20
	lda.w #$2800
	sta.l $70002C
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
	sta.l $700090
	lda.w #$4000
	sta.l $70002C
	sep #$20
	lda.b #BANKOF(DecompressGraphics)
	ldx.w #DecompressGraphics
	jsl RunSuperFXRoutine
	plp
	rtl
DoDecompressTilemap2:
	php
	rep #$20
	lda #$0000
	sta $700090
	lda #$4000
	sta $70002C
	sep #$20
	lda.b #BANKOF(DecompressGraphics)
	ldx.w #DecompressGraphics
	jsl RunSuperFXRoutine
	plp
	rtl
DoDecompressTileset2:
	php
	rep #$20
	lda #$2800
	sta $70002C
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
LoadPalette:
	rep #$20
	pla
	tax
	clc
	adc.w #$0005
	pha
	lda.l $030001,x
	sta.w $1892
	sep #$20
	lda.l $030003,x
	sta.w $1894
	rep #$20
	lda.l $030004
	sta.w $1895
	lda.w $1892
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
	PRESETFUNCPTR(LoadPreset_ToMap)
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
	ldx #$0000
	jsr LoadAudio
	plp
	rtl
LoadAudio_Title:
	php
	rep #$10
	ldx #$001C
	jsr LoadAudio
	plp
	rtl
LoadAudio_Controls:
	php
	rep #$10
	ldx #$0025
	jsr LoadAudio
	plp
	rtl
LoadAudio_Training:
	php
	rep #$10
	ldx #$0033
	jsr LoadAudio
	plp
	rtl
LoadAudio_Map:
	php
	rep #$10
	ldx #$0041
	jsr LoadAudio
	plp
	rtl
LoadAudio_Scramble1:
	php
	rep #$10
	ldx #$0061
	jsr LoadAudio
	plp
	rtl
LoadAudio_Corneria1:
	php
	rep #$10
	ldx #$0074
	jsr LoadAudio
	plp
	rtl
LoadAudio_Asteroid1:
	php
	rep #$10
	ldx #$008C
	jsr LoadAudio
	plp
	rtl
LoadAudio_SpaceArmadaBlastIn:
	php
	rep #$10
	ldx #$009A
	jsr LoadAudio
	plp
	rtl
LoadAudio_SpaceArmada:
	php
	rep #$10
	ldx #$00A8
	jsr LoadAudio
	plp
	rtl
LoadAudio_Meteor:
	php
	rep #$10
	ldx #$00B6
	jsr LoadAudio
	plp
	rtl
LoadAudio_VenomAtmosphere1:
	php
	rep #$10
	ldx #$00CE
	jsr LoadAudio
	plp
	rtl
LoadAudio_Venom1:
	php
	rep #$10
	ldx #$00DC
	jsr LoadAudio
	plp
	rtl
LoadAudio_Scramble2:
	php
	rep #$10
	ldx #$00EF
	jsr LoadAudio
	plp
	rtl
LoadAudio_Silence2:
	php
	rep #$10
	ldx #$0102
	jsr LoadAudio
	plp
	rtl
LoadAudio_SectorX:
	php
	rep #$10
	ldx #$0110
	jsr LoadAudio
	plp
	rtl
LoadAudio_Titania:
	php
	rep #$10
	ldx #$011E
	jsr LoadAudio
	plp
	rtl
LoadAudio_SectorY:
	php
	rep #$10
	ldx #$0136
	jsr LoadAudio
	plp
	rtl
LoadAudio_VenomAtmosphere2:
	php
	rep #$10
	ldx #$0144
	jsr LoadAudio
	plp
	rtl
LoadAudio_Highway:
	php
	rep #$10
	ldx #$0152
	jsr LoadAudio
	plp
	rtl
LoadAudio_Scramble3:
	php
	rep #$10
	ldx #$0165
	jsr LoadAudio
	plp
	rtl
LoadAudio_Silence3:
	php
	rep #$10
	ldx #$0178
	jsr LoadAudio
	plp
	rtl
LoadAudio_Asteroid3:
	php
	rep #$10
	ldx #$0186
	jsr LoadAudio
	plp
	rtl
LoadAudio_Fortuna:
	php
	rep #$10
	ldx #$0194
	jsr LoadAudio
	plp
	rtl
LoadAudio_SectorZ:
	php
	rep #$10
	ldx #$01AC
	jsr LoadAudio
	plp
	rtl
LoadAudio_Macbeth:
	php
	rep #$10
	ldx #$01BA
	jsr LoadAudio
	plp
	rtl
LoadAudio_VenomAtmosphere3:
	php
	rep #$10
	ldx #$01CD
	jsr LoadAudio
	plp
	rtl
LoadAudio_Venom3:
	php
	rep #$10
	ldx #$01DB
	jsr LoadAudio
	plp
	rtl
LoadAudio_Continue:
	php
	rep #$10
	ldx #$004F
	jsr LoadAudio
	plp
	rtl
LoadAudio_BlackHole:
	php
	rep #$10
	ldx #$0058
	jsr LoadAudio
	plp
	rtl
LoadAudio_Intro:
	php
	rep #$10
	ldx #$0009
	jsr LoadAudio
	plp
	rtl
LoadAudio_Ending:
	php
	rep #$10
	ldx #$01EE
	jsr LoadAudio
	plp
	rtl
LoadAudio_Credits:
	php
	rep #$10
	ldx #$01F7
	jsr LoadAudio
	plp
	rtl
LoadAudio_GameOver:
	php
	rep #$10
	ldx #$0200
	jsr LoadAudio
	plp
	rtl
LoadAudio_OutOfThisDimension:
	php
	rep #$10
	ldx #$0209
	jsr LoadAudio
	plp
	rtl
LoadAudio_BossTunnel:
	php
	rep #$10
	ldx #$0217
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
	sta MusicID					;/
	inx
	stx TempLdAudioPktOffs
	lda InitDataSentFlag				;\If initialization data hasn't been set yet...
	beq LoadAudio_SkipSetBlockID			;|branch to skip this, otherwise...
	lda #$FF					;|set the block ID to $FF
	sta APUI00					;/
LoadAudio_SkipSetBlockID:
	lda #$01					;\Set flag
	sta InitDataSentFlag				;/
	rep #$20
	ldy #$0000
	lda #$BBAA					;\Wait until SPC700 is ready to receive data
LoadAudio_WaitSPCReady:					;|
	cmp APUI00					;|
	bne LoadAudio_WaitSPCReady			;/
	sep #$20					;\Send transfer signal/block ID to SPC700
	lda #$CC					;|
	pha						;|
	jmp LoadAudio_L17				;/
LoadAudio_L3:
	lda [D,TempLdAudPtr],y
	iny
	bne LoadAudio_L4
	inc.b TempLdAudPtr+2
	stz.b TempLdAudPtr+1
	stz.b TempLdAudPtr
	ldy #$8000
LoadAudio_L4:
	xba
	lda #$00
	bra LoadAudio_L8
LoadAudio_L5:
	xba
	lda [D,TempLdAudPtr],y
	iny
	bne LoadAudio_L6
	inc.b TempLdAudPtr+2
	stz.b TempLdAudPtr+1
	stz.b TempLdAudPtr
	ldy #$8000
LoadAudio_L6:
	xba
LoadAudio_L7:
	cmp APUI00
	bne LoadAudio_L7
	inc
LoadAudio_L8:
	rep #$20
	sta APUI00
	sep #$20
	dex
	bne LoadAudio_L5
LoadAudio_L9:
	cmp APUI00
	bne LoadAudio_L9
LoadAudio_L10:
	adc #$03
	beq LoadAudio_L10
	pha
LoadAudio_L11:
	rep #$20
	lda [D,TempLdAudPtr],y
	beq LoadAudio_L17
	iny
	bne LoadAudio_L12
	jml CODE_1FBDEE
LoadAudio_L12:
	iny
	bne LoadAudio_L13
	jml CODE_1FBDEE
LoadAudio_L13:
	tax
	lda [D,TempLdAudPtr],y
	iny
	bne LoadAudio_L14
	jml CODE_1FBDEE
LoadAudio_L14:
	iny
	bne LoadAudio_L15
	jml CODE_1FBDEE
LoadAudio_L15:
	sta APUI02
	sep #$20
	dpx #$0001
	lda #$00
	rol
	sta APUI01
	pla
	sta APUI00
LoadAudio_L16:
	cmp APUI00
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
	sta APUI02					;/
	sep #$30
	lda.b #$00
	xba
	pla
	rep #$20
	sta APUI00
	sep #$20
LoadAudio_WaitReturn:
	cmp APUI00
	bne LoadAudio_WaitReturn
	stz APUI01
	stz APUI02
	stz APUI03
	stz MusicLoaded
	lda TIMEUP
	cli
	rts
LoadAudio_L20:
	lda [D,TempLdAudPtr],y
	iny
	xba
	lda #$00
	bra LoadAudio_L23
LoadAudio_L21:
	xba
	lda [D,TempLdAudPtr],y
	iny
	xba
LoadAudio_L22:
	cmp APUI00
	bne LoadAudio_L22
	inc
LoadAudio_L23:
	rep #$20
	sta APUI00
	sep #$20
	dex
	bne LoadAudio_L21
LoadAudio_L24:
	cmp APUI00
	bne LoadAudio_L24
LoadAudio_L25:
	adc #$03
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
	sta APUI02
	sep #$20
	cpx #$0001
	lda #$00
	rol
	sta APUI01
	pla
	sta APUI01
LoadAudio_L28:
	cmp APUI00
	bne LoadAudio_L28
	bra LoadAudio_L20
CODE_03B269:
	sep #$20
	lda $14D1
	and #$08
	beq CODE_03B279
	lda $14D7
	and #$80
	bne CODE_03B298
CODE_03B279:
	lda $1FD2
	cmp #$10
	beq CODE_03B298
	cmp #$0F
	beq CODE_03B298
	cmp #$0B
	beq CODE_03B298
	cmp #$0C
	beq CODE_03B298
	cmp #$0D
	beq CODE_03B298
	jsr CODE_03B3D2
	jsr CODE_03B350
	bra CODE_03B29B
CODE_03B298:
	stz APUI02
CODE_03B29B:
	jsr CODE_03B29F
	rtl
CODE_03B29F:
	sep #$20
	rep #$10
	ldx $15A2
	lda.b $2E,x
	and #$04
	beq CODE_03B2B0
	jml CODE_03B2C7
CODE_03B2B0:
	lda $14D0
	and #$40
	bne CODE_03B2C7
	lda $14D8
	and #$02
	beq CODE_03B2C7
	lda $14D7
	and #$80
	bne CODE_03B2D0
	bra CODE_03B2D9
CODE_03B2C7:
	lda #$00
	sta APUI01
	sta $1FE1
	rts
CODE_03B2D0:
	lda #$4B
	sta APUI01
	sta $1FE1
	rts
CODE_03B2D9:
	lda $16C9
	bne CODE_03B2F1
	lda $18C2
	bit #$01
	bne CODE_03B2ED
	lda #$C0
	bra CODE_03B2F7
CODE_03B2E9:
	lda #$C0
	bra CODE_03B2F7
CODE_03B2ED:
	lda #$00
	bra CODE_03B2F7
CODE_03B2F1:
	cmp #$02
	beq CODE_03B2E9
	lda #$80
CODE_03B2F7:
	ora $14F3
	sta $14C5
	lda Pad1LoCur
	bit #$30
	beq CODE_03B340
	rep #$30
	ldx $1238
	lda.b $0C,x
	tax
	sec
	sbc $1F44
	stx $1F44
	bpl CODE_03B319
	eor #$FFFF
	inc
CODE_03B319:
	cmp #$0002
	bcc CODE_03B337
	cmp #$0004
	bcc CODE_03B332
	cmp #$0008
	bcc CODE_03B32D
	lda #$0003
	bra CODE_03B33A
CODE_03B32D:
	lda #$0002
	bra CODE_03B33A
CODE_03B332:
	lda #$0001
	bra CODE_03B33A
CODE_03B337:
	lda #$0000
CODE_03B33A:
	ora $14C5
	sta $14C5
CODE_03B340:
	sep #$20
	lda $14C5
	sta APUI01
	sta $1FE1
	rts
CODE_03B34C:
	sta APUI02
	rts
CODE_03B350:
	rep #$30
	ldx FirstObject
CODE_03B355:
	sep #$20
	lda.b $2A,x
	cmp #$FF
	bne CODE_03B395
	lda.b $1F,x
	and #$08
	bne CODE_03B367
	jml CODE_03B395
CODE_03B367:
	lda.b $20,x
	and #$02
	beq CODE_03B371
	jml CODE_03B395
CODE_03B371:
	rep #$20
	ldy $1238
	lda $14F6
	sec
	sbc.b $0C,x
	bmi CODE_03B385
	bra CODE_03B38A
CODE_03B385:
	cmp #$FED4
	bcc CODE_03B395
CODE_03B38A:
	lda.b $10,x
	sec
	sbc $0010,y
	cmp #$0064
	bcc CODE_03B39B
CODE_03B395:
	ldy.b $00,x
	tyx
	bne CODE_03B355
	rts
CODE_03B39B:
	sep #$20
	lda.b $20,x
	ora #$02
	sta.b $20,x
	rep #$20
	lda $14F6
	sec
	sbc.b $0C,x
	bmi CODE_03B3BB
	cmp #$0050
	bcc CODE_03B3C9
	sep #$20
	lda #$6D
	jsl CODE_03B7F9
	rts
CODE_03B3BB:
	cmp #$FFB0
	bcs CODE_03B3C9
	sep #$20
	lda #$6F
	jsl CODE_03B7F9
	rts
CODE_03B3C9:
	sep #$20
	lda #$6E
	jsl CODE_03B7F9
	rts
CODE_03B3D2:
	rep #$30
	ldx FirstObject
	lda #$7FFF
	stz $1F3D
	
	
	
	
	
	
	
	
	
	
	
	
DATA_03B539:
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

CODE_03B639:
	lda #$1E
	sta $1F48
	sta $1F49
	sta $1F4A
	lda #$1F
	sta $1F4B
	lda #$20
	sta $1F4C
	jmp CODE_03B799
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
PlaySESurround:
	phx
	phy
	php
	ldy.w PlayerObject
	jsl CODE_1FD0AB
	rep #$20
	lda.w $1250
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
	lda.w $14F6
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
	lda.w $1FCF
	bne PushSoundEffectToQueue_Exit
	lda.w $14D1
	and.b #$08
	beq PushSoundEffectToQueue_Insert
	lda.w $14D7
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
CODE_03B827:
	php
	bra CODE_03B82D
	php
	sep #$30
CODE_03B82D:
	lda.b #$3A
	sta.b $EF
	lda.b #$AF
	sta.b $F0
	lda.b #$55
	sta.b $F1
	lda.b #$7F
	sta.b $F2
	stz.b $98
	stz.b $B9
	stz.b $95
	stz.b $9C
	stz.b $9D
	stz.b $99
	stz.b $DC
	stz.w $1634
	stz.w $1636
	stz.w $1638
	stz.w $1249
	stz.w $124A
	lda.b #$00
	sta.w $15CA
	jsl RunSuperFXCalculateMatrixEx
	jsl CopyDebugFont
	jsl CODE_03B86F
	plp
	rtl
CODE_03B86F:
	lda.b #$FF
	sta.w $15BF
	jsl RunSuperFXUnkRoutine01A861
	lda.b $CA
	sta.l $700034
	lda.b $CC
	sta.l $700036
	lda.b $2A
	sta.l $700038
	lda.b $2E
	sta.l $70003A
	lda.b $2C
	sta.l $70003C
	lda.b $30
	sta.l $70003E
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
	stz.w $1633
	stz.w $1635
	stz.w $1637
	lda.w $1633
	sta.w $162D
	lda.w $1635
	sta.w $162F
	lda.w $1637
	sta.w $1631
	sep #$20
	jsl RunSuperFXCalculateMatrix
	rep #$20
	lda.w Unknown_15D7.XX
	sta.w Unknown_161B.XX
	
	
	
	
	
RunSuperFXMultiplyPointByMatrix:
	phx
	phy
	php
	rep #$30
	lda.b TempVecX
	sta.l InputVecX
	lda.b TempVecY
	sta.l InputVecY
	lda.b TempVecZ
	sta.l InputVecZ
	sep #$20
	lda.b #BANKOF(MultiplyPointByMatrix)
	ldx.w #MultiplyPointByMatrix
	jsl RunSuperFXRoutine
	rep #$20
	lda.l OutputVecX
	sta.b $B3
	lda.l OutputVecY
	sta.b $B5
	lda.l OutputVecZ
	sta.b $B7
	plp
	ply
	plx
	rtl
RunSuperFXCalculateMatrix:
	rep #$20
	lda.w $162D
	sta.l DesiredXRot
	lda.w $162F
	sta.l DesiredYRot
	lda.w $1631
	sta.l DesiredZRot
	sep #$20
	rep #$10
	lda.b #BANKOF(CalculateMatrix)
	ldx.w #CalculateMatrix
	jsl RunSuperFXRoutine
	lda.l ObjectMatrix.XX
	sta.w $15D7
	lda.l ObjectMatrix.YX
	sta.w $16D9
	lda.l ObjectMatrix.ZX
	sta.w $16DB
	lda.l ObjectMatrix.XY
	sta.w $15DD
	lda.l ObjectMatrix.YY
	sta.w $16DF
	lda.l ObjectMatrix.ZY
	sta.w $16E1
	lda.l ObjectMatrix.XZ
	sta.w $15E3
	lda.l ObjectMatrix.YZ
	sta.w $16E5
	lda.l ObjectMatrix.ZZ
	sta.w $16E7
	sep #$30
	rtl
CODE_03B9F2:
	lda.b TempVecX
	sta.b $84
	lda.b TempVecX+1
	sta.b $85
	lda.b TempVecZ
	sta.b $86
	lda.b TempVecZ+1
	sta.b $87
	jsl CODE_03BA45
	lda.b $88
	sta.b $72
	lda.b $89
	sta.b $73
	lda.b TempVecY
	sta.b $84
	lda.b TempVecY+1
	sta.b $85
	lda.b TempVecZ
	sta.b $86
	lda.b TempVecZ+1
	sta.b $87
	jsl CODE_03BA45
	
	
	
	
CODE_03BA45:
	ldx.b #$00
	lda.b $87
	beq CODE_03BA57
	inx
	lsr
	beq CODE_03BA55
CODE_03BA4F:
	ror.b $86
	inx
	lsr
	bne CODE_03BA4F
CODE_03BA55:
	ror.b $86
CODE_03BA57:
	stx.b $92
	ldx.b #$00
	lda.b $85
	sta.b $8B
	bpl CODE_03BA6E
	lda.b #$00
	sec
	sbc.b $84
	sta.b $84
	lda.b #$00
	sbc.b $85
	sta.b $85
CODE_03BA6E:
	beq CODE_03BA7F
	inx
	lsr
	beq CODE_03BA7A
CODE_03BA74:
	ror.b $84
	inx
	lsr
	bne CODE_03BA74
CODE_03BA7A:
	ror.b $84
	jmp CODE_03BA96
CODE_03BA7F:
	lda.b $84
	bmi CODE_03BA96
	bne CODE_03BA90
	lda.b $CA
	sta.b $88
	lda.b $CB
	sta.b $89
	jmp CODE_03BAF6
CODE_03BA90:
	dex
	asl
	bpl CODE_03BA90
	sta.b $84
CODE_03BA96:
	lda.b $86
	cmp.b $84
	bcc CODE_03BAA4
CODE_03BA9C:
	dex
	lsr
	cmp.b $84
	bcs CODE_03BA9C
	sta.b $86
CODE_03BAA4:
	txa
	sec
	sbc.b $92
	sta.b $8A
	ldx.b $84
	lda DATA_0083D5,x
	ldx.b $86
	sec
	sbc DATA_0083D5,x
	tax
	lda DATA_0082D5,x
	sta.b $89
	lda DATA_0081D5,x
	lda.b $8A
	bmi CODE_03BACD
	beq CODE_03BAD3
CODE_03BAC4:
	asl
	rol.b $89
	dex
	bne CODE_03BAC4
	jmp CODE_03BAD3
CODE_03BACD:
	lsr.b $89
	ror
	inx
	bne CODE_03BACD
CODE_03BAD3:
	sta.b $88
	bit.b $8B
	bpl CODE_03BAE9
	sec
	lda.b $CA
	sbc.b $88
	sta.b $88
	lda.b $CB
	sbc.b $89
	sta.b $89
	jmp CODE_03BAF6
CODE_03BAE9:
	clc
	lda.b $88
	adc.b $CA
	sta.b $88
	lda.b $89
	adc.b $CB
	sta.b $89
CODE_03BAF6:
	rtl
CODE_03BAF7:
	bpl CODE_03BAFC
	brl CODE_03BCF5
CODE_03BAFC:
	rep #$30
	lda.b $C1
	and #$00FF
	eor #$00FF
	sec
	sbc #$0780
	sta.b TempVecX
	lda.b $C5
	and #$00FF
	eor #$00FF
	sec
	sbc #$0780
	sta.b TempVecZ
	lda #$0000
	sec
	sbc.b $C3
	sta.b TempVecY
	lda.b $C1
	and #$FF00
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sep #$20
	sta $164B
	rep #$20
	lda.b $C5
	and #$FF00
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	sep #$20
	sta $164C
	jsl RunSuperFXMultiplyPointByMatrix
	rep #$20
	lda.b $B3
	sta.b TempVecX
	lda.b $B5
	sta.b TempVecY
	lda.b $B7
	sta.b TempVecZ
	sep #$20
	rep #$20
	lda $161B
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	sta $1639
	
	
	
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
WaitScanline:
	php
	rep #$30
	phx
	pha
	sep #$20
	stz $16DC
WaitScanline_Wait:
	sep #$20
	lda SLHV
	lda OPVCT
	xba
	lda OPVCT
	xba
	cmp ScanlineToWaitFor
	bne WaitScanline_Wait
	rep #$30
	pla
	plx
	plp
	rtl
CODE_03BDAF:
	php
	sep #$20
	lda #$03
	sta Lives
	stz Continues
	rep #$20
	lda #$00FC
	sta $16CE
	lda #$0092
	sta $16D0
	lda #$0018
	sta $16D2
	lda #$019A
	sta $16D4
	stz StageID
	stz $16DD
	stz $16DF
	plp
	rtl
Map:
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
	stx.b $30
	stz.b $34
	lda #$0001
	sta.b $36
	jsl $03CD09
	jsr $C511
	sep #$20
	lda.b $45
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
	jsl LoadMapGraphics
	rep #$30
	lda #$2020
	sta VMADDL
	ldx #$0000
Map_CpyGfxLoop1:
	lda MapShipGraphic,x
	sta VMDATAL
	inx
	inx
	cpx #$03C0
	bne Map_CpyGfxLoop1
	lda #$5020
	sta VMADDL
	ldx #$0000
Map_CpyGfxLoop2:
	lda MapShipGraphic,x
	sta VMDATAL
	inx
	inx
	cpx #$03C0
	bne Map_CpyGfxLoop2
	rep #$20
	stz.b $04
	lda #$0010
	sta $15C2
	dec StageID
	bmi Map_L3
	inc StageID
	jsl CODE_03CC3E
	lda $16D9
	pha
	dec StageID
	jsl CODE_03CC3E
	pla
Map_L3:
	pha
	inc StageID
	sep #$20
	rep #$10
	lda $16D9
	bpl Map_L4
	lda #$00
Map_L4:
	rep #$20
	asl a
	tax
	lda DATA_03D408,x
	sta.b $32
	sta.b $38
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
	lda.l TIMEUP
	cli
	jsl LoadAudio_Map
	pla
	cmp #$0E
	beq Map_L5
	cmp #$0A
	bne Map_L6
Map_L5:
	lda #$0F
	sta $1F47
	stz $1F46
Map_L6:
	lda #$FF
Map_L7:
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
	bne Map_L7
	sep #$20
	rep #$10
	lda StageID
	beq Map_L8
	brl Main_L20
Map_L8:
	lda #$0A
	sta StageID
	rep #$20
	lda #$0010
	sta $70009A
Map_Loop:
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
	beq Map_L10
	sec
	sbc #$0004
	sta $70009A
Map_L10:
	jsr CODE_03C891
	lda $15BB
	bit #$0002
	beq Map_L11
	jsl CODE_03CC3E
	bra Map_DoIncDec
Map_L11:
	jsl CODE_03CC22
Map_DoIncDec:
	jsl UpdateInput
	lda.w Pad1Down					;\Check if Select/Start/D-pad pressed...
	bit #$2F00					;|
	beq Map_SkipIncDec				;/...if not, skip all of this
	lda #$0010
	sta $70009A
	jsr CODE_03BD7A
	jsl CODE_03CC22
	lda.w Pad1Down					;\If Down/Right not pressed...
	bit #$2A00					;|
	sep #$20					;|
	bne Map_DoDec					;|...skip past this, otherwise...
	lda TempLevelID					;|...increment level/route ID...
	inc						;|
	cmp #$03					;|...if 3 or more, loop around to 0
	bne Map_IncLoop					;|
	lda #$00					;|
Map_IncLoop:						;|
	sta TempLevelID					;/
	bra Map_FinishIncDec
Map_DoDec:
	lda TempLevelID					;\Decrement level/route ID...
	dec						;|
	cmp #$FF					;|... if negative, loop around to 2
	bne Map_DecLoop					;|
	lda #$02					;|
Map_DecLoop:						;|
	sta TempLevelID					;/
Map_FinishIncDec:
	lda #$11
	jsl CODE_03B7F9
	jsl CODE_03C67F
	rep #$20
Map_SkipIncDec:
	lda.w Pad1Down					;\Check if Start/A/B pressed...
	bit #$9080					;|
	bne Map_L18					;|...if so, branch ahead, otherwise...
	brl Map_Loop					;/...go back
Map_L18:
	stz StageID
	stz $16D9
	jsl CODE_03CC3E
	sep #$20
	lda #$F1
	sta $1F47
	stz $1F46
	rep #$20
	jmp Map_L23
Map_L20:
	sep #$20
	jsr CODE_03C67F
Map_L21:
	ldx.b $02
	phx
	lda #$FF
	sta $16D9
	jsr CODE_03C511
	jsr CODE_03C58F
	jsr CODE_03CA7B
	jsr CODE_03C78D
	jsr CODE_03C891
	plx
	stx.b $02
	jsr CODE_03C484
	bcc Map_L21
	jsr CODE_03BD7A
	jsl CODE_03CC3E
	lda #$08
	sta.b CurNMITask
	lda $16D9
	pha
	lda #$FE
	sta $16D9
Map_L22:
	jsr CODE_03C511
	jsr CODE_03C58F
	jsr CODE_03CA7B
	jsr CODE_03C78D
	jsr CODE_03C891
	jsl UpdateInput
	rep #$20
	lda.w Pad1Down
	bit #$D0C0
	sep #$20
	beq Map_L22
	pla
	sta $16D9
Map_L23:
	sep #$20
	rep #$10
	lda #$F1
	sta $1F47
	stz $1F46
	lda #$10
	jsl CODE_03B7F9
	lda #$01
	sta.b $34
	lda #$53
Map_L24:
	pha
	jsr CODE_03BD7A
	pla
	dec
	bne Map_L24
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
Map_L25:
	phx
	lda #$01
Map_L26:
	pha
	txa
	jsr CODE_03CB4F
	pla
	dec
	bne Map_L26
	plx
	txa
	ora #$E0
	sta COLDATA
	inx
	cpx #$0020
	bne Map_L25
	jsr CODE_03C74D
	sep #$20
	jsr CODE_03BD7A
Map_L27:
	sep #$20
	lda SLHV
	lda OPHCT
	xba
	lda OPHCT
	xba
	rep #$20
	and #$01FF
	cmp #$0000
	bcc Map_L27
	cmp #$000F
	bcs Map_L27
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
	stz.b $10
	stz.b $11
	stz.b $14
	stz.b $16
	stz.b $1E
	stz.b $20
	ldx #$20
Map_L28:
	phx
	stx.b $1C
	jsr CODE_03C8CB
	rep #$20
	lda.b $18
	clc
	adc.b $10
	sta.b $10
	lda.b $1A
	clc
	adc.b $12
	sta.b $12
	jsr CODE_03BD7A
	sep #$20
	lda.b $10
	sta BG1HOFS
	lda.b $11
	sta BG1HOFS
	lda.b $12
	sta BG1VOFS
	lda.b $13
	sta BG1VOFS
	plx
	dex
	bne Map_L28
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
	jsl DoDecompressTileset
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
	jsl DoDecompressTileset2
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
	sta.b CurNMITask
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
	bne Map_L29
	lda #$0D
	sta $1F47
	stz $1F46
	bra Map_L30
Map_L29:
	lda #$0B
	sta $1F47
	stz $1F46
Map_L30:
	ldx #$0028
Map_L31:
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
	bne Map_L33
	lda $7001F2
	inc
	cmp #$007E
	beq Map_L34
	sta $7001F2
	plx
	cpx #$0014
	bne Map_L32
	sep #$20
	lda #$FE
	sta $7EF0C6
Map_L32:
	rep #$20
	inx
	phx
	bra Map_L34
Map_L33:
	rep #$20
	phx
	lda $7001F2
	inc
	cmp #$003A
	beq Map_L34
	sta $7001F2
Map_L34:
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
	bcs Map_L35
	txy
	sep #$20
	dex
	lda DATA_03D68C,x
	tyx
	rep #$20
Map_L35:
	dex
	beq Map_L36
	brl Map_L31
Map_L36:
	sep #$20
	rep #$10
	ldx #$00DE
	stx VTIMEL
	lda #$01
	sta SCMRMirror
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
Map_L37:
	jsr CODE_03C777
	jsr CODE_03D1BB
	jsr CODE_03C763
	rep #$20
	lda $7000BC
	sep #$20
	bne Map_L39
	lda $7000BE
	cmp #$27
	beq Map_L38
	lda #$89
	jsl CODE_03B7F9
Map_L38:
	lda $7EF0C7
	inc
	sta $7EF0C7
	bra Map_L37
Map_L39:
	lda #$00
	sta $7EF0C7
Map_L40:
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
	bne Map_L41
	lda $7000BE
	cmp #$27
	beq Map_L41
	lda #$89
	jsl CODE_03B7F9
Map_L41:
	lda #$32
Map_L42:
	pha
	jsl ReadJoypads
	lda #$78
	sta ScanlineToWaitFor
	jsl WaitScanline
	sep #$20
	rep #$10
	lda.w Pad1Down+1
	bit #$10
	bne Map_L43
	lda.w Pad1Down+1
	bit #$80
	bne Map_L43
	lda.w Pad1Down
	bit #$80
	bne Map_L43
	pla
	dec
	beq Map_L42
	lda $7EF0C7
	cmp #$FF
	beq Map_L44
	inc
	sta $7EF0C7
	bra Map_L40
Map_L43:
	pla
Map_L44:
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
Map_L45:
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
	bne Map_L45
	jsr CODE_03D11C
	jsr CODE_03BD7A
	rep #$30
	lda $1FF7
	sta LevelScriptPointer
	sep #$20
	lda $1FF9
	sta LevelScriptBank
	rep #$20
	jml GameEnd
	
	

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
DATA_03D66C:
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
	DB $FF,$03,$FF,$03,$FF,$03,$FF,$03
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
	
	
	
	
;;;;;;;;;;;;;;;;;;;;;
;LEVEL SCRIPT PARSER;
;;;;;;;;;;;;;;;;;;;;;
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
	lda LevelScriptBank
	pha
	plb
	rep #$20
	lda $8000,x
	and #$FF
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
LevelCommand8C_SetBehEvent:
	tyx
	phx						;\Get current object in X...
	ldx CurScriptObject				;|
	bne LevelCommand8C_NotNull			;|if not null, branch to continue...
	plx						;|
	jmp LevelCommand8C_Exit				;/...otherwise branch to leave
LevelCommand8C_NotNull:
	plx						;\Set CurScriptObject.Event
	ldy CurScriptObject				;|
	lda $8001,x					;|
	sta $0028,y					;/
LevelCommand8C_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand8A_SetZTimer8:
	tyx
	lda $8001,x					;\Get ZTimer
	and #$00FF					;|
	asl						;|...shift left four bits
	asl						;|
	asl						;|
	asl						;|
	sta ZTimer					;/
	inx						;\Move on to next command...
	inx						;|
	stx LevelScriptPointer				;|...save script pointer and leave
	rts						;/
LevelCommand14_SetMusic:
	tyx
	sep #$20
	lda $14D7
	and #$80
	bne LevelCommand14_Exit
	lda $8001,x					;\Get next byte...
	sta MusicID					;|...and store in current music ID...
	stz MusicLoaded					;/...clearing the music loaded flag too
LevelCommand14_Exit:
	inx						;\Move on to next command
	inx						;|
	jmp RunLevelScriptCommands			;/
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
	bra LevelCommand8C_NotNull
CODE_03EEAA:
	sep #$20
	lda #$00
	pha
	plb
	lda.b #BANKOF(STACKIFY(RunLevelScriptCommands))
	pha
	ldy.w #STACKIFY(RunLevelScriptCommands)
	phy
	lda LevelScriptBank
	pha
	phx
	ldx CurScriptObject
	rtl
LevelCommand7A:
	tyx
	phx
	sep #$20
	lda.b #BANKOF(STACKIFY(LevelCommand7A_L1))
	pha
	ldy.w #STACKIFY(LevelCommand7A_L1)
	phy
	lda $8003,x
	pha
	ldy $8001,x
	phy
	ldx CurScriptObject
	lda #$00
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
	lda $8001,x					;\Get address to test
	sta.b TempScrBWPtr				;|
	lda $8002,x					;|
	sta.b TempScrBWPtr+1				;/
	sep #$20					;\Compare with command parameter...
	lda [D,TempScrBWPtr]				;|
	cmp $8004,x					;|
	bpl LevelCommand7C_Exit				;/...if greater or equal, branch to leave
	rep #$20					;\Set X to new script pointer
	lda $8005,x					;|
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
	lda $8001,x					;\Get address to test
	sta.b TempScrBWPtr				;|
	lda $8002,x					;|
	sta.b TempScrBWPtr+1				;/
	sep #$20					;\Compare with command parameter...
	lda [D,TempScrBWPtr]				;|
	cmp $8004,x					;|
	beq LevelCommand7E_Exit				;|...if less than, branch to leave
	bmi LevelCommand7E_Exit				;/
	rep #$20					;\Set X to new script pointer
	lda $8005,x					;|
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
	lda $8001,x					;\Get address to test
	sta.b TempScrBWPtr				;|
	lda $8002,x					;|
	sta.b TempScrBWPtr+1				;/
	sep #$20					;\Compare with command parameter...
	lda [D,TempScrBWPtr]				;|
	cmp $8004,x					;|
	bne LevelCommand80_Exit				;/...if not equal, branch to leave
	rep #$20					;\Set X to new script pointer
	lda $8005,x					;|
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
	ldy #$001E
	sty Unknown_1EE9
	sty Unknown_1EEB
	ldy #$0002
	sty Unknown_1EEF
	lda #$001E
	sta Unknown_1EED
	jmp RunLevelScriptCommands
LevelCommand6E:
	tyx
	inx
	ldy #$003E
	sty Unknown_1EE9
	sty Unknown_1EEB
	ldy #$0002
	sty Unknown_1EEF
	lda #$001E
	sta Unknown_1EED
	jmp RunLevelScriptCommands
CODE_03EF90:
	php
	rep #$30
	lda $1774
	beq CODE_03EFA7
	sta Unknown_1EE9
	ldy #$0002
	sty $1EEF
	lda #$001E
	sta Unknown_1EED
CODE_03EFA7:
	plp
	rtl
LevelCommand68:
	tyx
	phx
	ldx CurScriptObject
	bne LevelCommand68_L1
	plx
	jmp LevelCommand68_L2
LevelCommand68_L1:
	plx
	lda $8001,x
	clc
	adc CurScriptObject
	tay
	lda $8003,x
	sta.b TempScrBWPtr
	lda $8004,x
	sta.b TempScrBWPtr+1
	sep #$20
	lda [D,TempScrBWPtr]
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
	ldx CurScriptObject
	bne LevelCommand6A_L1
	plx
	jmp LevelCommand6A_L2
LevelCommand6A_L1:
	plx
	lda $8001,x
	clc
	adc CurScriptObject
	tay
	lda $8003,x
	sta.b TempScrBWPtr
	lda $8004,x
	sta.b TempScrBWPtr+1
	rep #$20
	lda [D,TempScrBWPtr]
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
LevelCommand66_InitPresetSettings:
	tyx
	phx
	jsl SetPresetInitFlag
	plx
	inx
	jmp RunLevelScriptCommands
SetPresetInitFlag:
	lda CurMainLoopLoaderTasks
	ora #$0008
	sta CurMainLoopLoaderTasks
	rtl
InitPresetSettings:
	php
	rep #$30
	ldx Unknown_1238
	beq CODE_03F046
	lda $1786
	ora $1787
	beq CODE_03F04A
	lda Unknown_1F05
	and #$00FF
	bne CODE_03F04A
	lda $1786
	sta.b $16,x
	lda $1787
	sta.b $17,x
	bra CODE_03F04A
CODE_03F046:
	jml CODE_1FBDEE
CODE_03F04A:
	sep #$20
	stz Unknown_1F05
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
	lda $8001,x					;\Form address
	sta.b TempScrBWPtr				;|
	lda $8002,x					;|
	sta.b TempScrBWPtr+1				;/
	lda $8004,x					;\Store long at address
	sta [D,TempScrBWPtr]				;|
	inc.b TempScrBWPtr				;|
	inc.b TempScrBWPtr				;|
	sep #$20					;|
	lda $8006,x					;|
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
	lda $8003,x					;\Form address
	sta.b TempScrBWPtr				;|
	lda $8004,x					;|
	sta.b TempScrBWPtr+1				;/
	lda $8001,x					;\Store word at address
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
	lda $8002,x					;\Form address
	sta.b TempScrBWPtr				;|
	lda $8003,x					;|
	sta.b TempScrBWPtr+1				;/
	sep #$20					;\Store byte at address
	lda $8001,x					;|
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
	ldx CurScriptObject
	bne LevelCommand5A_NotNull
	plx
	jmp LevelCommand5A_Exit
LevelCommand5A_NotNull:
	plx
	ldy CurScriptObject
	sep #$20
	lda #$01
	sta $001D,y
	inc Unknown_173C
LevelCommand5A_Exit:
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand84:
	tyx
	phx
	ldx CurScriptObject
	bne LevelCommand84_NotNull
	plx
	jmp LevelCommand84_Exit
LevelCommand84_NotNull:
	plx
	ldy CurScriptObject
	sep #$20
	lda #$80
	sta $0020,y
	inc Unknown_173C
LevelCommand84_Exit:
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand56_DisableFGTilt:
	tyx
	sep #$20					;\Disable foreground tilting
	stz BGTiltFlag					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand58_EnableFGTilt:
	tyx
	sep #$20					;\Enable foreground tilting
	lda #$01					;|
	sta BGTiltFlag					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand52_DisableScreen:
	tyx
	sep #$20					;\Disable any fading effect
	stz FadeMode					;|
	stz FadeTimer					;/
	lda #$80					;\Disable screen
	jsl CODE_02F8DF					;|
	sta INIDISP					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand54_EnableScreen:
	tyx
	sep #$20					;\Disable any fading effect
	stz FadeMode					;/
	lda #$0F					;\Enable screen
	sta FadeTimer					;|
	jsl CODE_02F8DF					;|
	sta INIDISP					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand4C:
	tyx
	sep #$20
	lda FadeTimer
	bne LevelCommand4C_L1
	lda $7E45F4
	cmp #$80
	bne LevelCommand4C_L1
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand4C_L1:
	lda #$01
	sta ZTimer
	stz ZTimer+1
	stx LevelScriptPointer
	rts
LevelCommand4A:
	tyx
	phx
	ldx CurScriptObject
	bne LevelCommand4A_NotNull
	plx
	jmp LevelCommand4A_Exit
LevelCommand4A_NotNull:
	plx
	lda $8001,x
	sta.b TempScrBWPtr
	lda $8002,x
	sta.b TempScrBWPtr+1
	lda CurScriptObject
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
	ldx CurScriptObject
	bne LevelCommand46_NotNull
	plx
	jmp LevelCommand46_Exit
LevelCommand46_NotNull:
	plx
	lda $8001,x
	clc
	adc CurScriptObject
	tay
	lda $8003,x
	sta.b TempScrBWPtr
	lda $8004,x
	sta.b TempScrBWPtr+1
	sep #$20
	lda [D,TempScrBWPtr]
	sta $0000,y
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
	lda CurScriptObject
	bne LevelCommand48_NotNull
	plx
	jmp LevelCommand48_Exit
LevelCommand48_NotNull:
	plx
	lda $8001,x
	clc
	adc CurScriptObject
	tay
	lda $8003,x
	sta.b TempScrBWPtr
	lda $8004,x
	sta.b TempScrBWPtr+1
	rep #$20
	lda [D,TempScrBWPtr]
	sta $0000,y
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
	lda #$01					;|
	sta FadeMode					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand44_FadeToBlack:
	tyx
	sep #$20					;\Set FadeMode to -1
	lda #$FF					;|
	sta FadeMode					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand4E_FadeFromBlackFast:
	tyx
	sep #$20					;\Set FadeMode to 2
	lda #$02					;|
	sta FadeMode					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand50_FadeToBlackFast:
	tyx
	sep #$20					;\Set FadeMode to -2
	lda #$FE					;|
	sta FadeMode					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand36_SetObjPropertyByte:
	tyx
	phx						;\Get current object in X...
	ldx CurScriptObject				;|
	bne LevelCommand36_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand36_Exit				;/...otherwise branch to leave
LevelCommand36_NotNull:
	plx						;\Store byte in object properties
	lda $8001,x					;|
	clc						;|
	adc CurScriptObject				;|
	tay						;|
	sep #$20					;|
	lda $8003,x					;|
	sta $0000,y					;/
LevelCommand36_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
LevelCommand38_SetObjPropertyWord:
	tyx
	phx						;\Get current object in X...
	ldx CurScriptObject				;|
	bne LevelCommand38_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand38_Exit				;/...otherwise branch to leave
LevelCommand38_NotNull:
	plx						;\Store word in object properties
	lda $8001,x					;|
	clc						;|
	adc CurScriptObject				;|
	tay						;|
	lda $8003,x					;|
	sta $0000,y					;/
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
	ldx CurScriptObject				;|
	bne LevelCommand3A_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand3A_Exit				;/...otherwise branch to leave
LevelCommand3A_NotNull:
	plx						;\Store long in object properties
	lda $8001,x					;|
	clc						;|
	adc CurScriptObject				;|
	tay						;|
	lda $8003,x					;|
	sta $0000,y					;|
	sep #$20					;|
	lda $8005,x					;|
	sta $0002,y					;/
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
	ldx CurScriptObject				;|
	bne LevelCommand3C_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand3C_Exit				;/...otherwise branch to leave
LevelCommand3C_NotNull:
	plx
	lda CurScriptObject
	clc
	adc $8001,x
	txy
	tax
	sep #$20
	lda $8003,x
	sta $7E2000,x
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
	ldx CurScriptObject				;|
	bne LevelCommand3E_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand3E_Exit				;/...otherwise branch to leave
LevelCommand3E_NotNull:
	plx
	lda CurScriptObject
	clc
	adc $8001,x
	txy
	tax
	lda $8003,x
	sta $7E2000,x
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
	ldx CurScriptObject				;|
	bne LevelCommand40_NotNull			;|...if not null, branch to continue...
	plx						;|
	jmp LevelCommand40_Exit				;/...otherwise branch to leave
LevelCommand40_NotNull:
	plx
	lda CurScriptObject
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
LevelCommand40_Exit:
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	inx						;|
	jmp RunLevelScriptCommands			;/
UnusedCommand_SetZTimer16:
	tyx
	lda $8001,x
	sta ZTimer
	inx
	inx
	inx
	stx LevelScriptPointer
	rts
LevelCommand30_SetObjXRotation:
	tyx
	sep #$20
	phx
	ldx CurScriptObject
	bne LevelCommand30_NotNull
	plx
	jmp LevelCommand30_Exit
LevelCommand30_NotNull:
	plx
	lda $8001,x
	ldy CurScriptObject
	sta $0012,y
LevelCommand30_Exit:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand32_SetObjYRotation:
	tyx
	phx
	ldx CurScriptObject
	bne LevelCommand32_NotNull
	plx
	jmp LevelCommand32_Exit
LevelCommand32_NotNull:
	plx
	sep #$20
	lda $8001,x
	ldy CurScriptObject
	sta $0012,y
LevelCommand32_Exit:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand34_SetObjZRotation:
	tyx
	sep #$20
	phx
	ldx CurScriptObject
	bne LevelCommand34_NotNull
	plx
	jmp LevelCommand34_Exit
LevelCommand34_NotNull:
	plx
	lda $8001,x
	ldy CurScriptObject
	sta $0014,x
LevelCommand34_Exit:
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand2E_Jump:
	tyx
	sep #$20					;\Set script pointer...
	lda $8003,x					;|
	sta LevelScriptBank				;|
	rep #$20					;|
	lda $8001,x					;|
	tax						;|
	jmp RunLevelScriptCommands			;/...and leave
LevelCommand2C_JumpConditionally:
	tyx
	phx
	sep #$20
	lda.b #BANKOF(STACKIFY(CODE_03F3FE))
	pha
	rep #$20
	lda.w #STACKIFY(CODE_03F3FE)
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
	ldy ScriptCallStackPtr				;\Save level script pointer to call stack
	txa						;|
	sta ScriptCallStack,y				;|
	sep #$20					;|
	lda LevelScriptBank				;|
	sta ScriptCallStack+2,y				;/
	rep #$20					;\Update call stack pointer
	iny						;|
	iny						;|
	iny						;|
	sty ScriptCallStackPtr				;/
	sep #$20					;\Update script pointer
	lda $8003,x					;|
	sta LevelScriptBank				;|
	rep #$20					;|
	lda $8001,x					;|
	tax						;/
	inc ScriptCallStackSz				;\Increment stack size and leave
	jmp RunLevelScriptCommands			;/
LevelCommand2A_Return:
	tyx
	ldy ScriptCallStackPtr				;\Restore level script pointer
	dey						;|
	sep #$20					;|
	lda ScriptCallStack,y				;|
	sta LevelScriptBank				;|
	rep #$20					;|
	dey						;|
	dey						;|
	ldx ScriptCallStack,y				;/
	sty ScriptCallStackPtr				; Update call stack pointer
	inx						;\Move on to next command
	inx						;|
	inx						;|
	inx						;/
	dec ScriptCallStackSz				;\Increment stack size and leave
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
	lda VerticalScroll				;|
	sta BG2VOFS					;|
	lda VerticalScroll+1				;|
	sta BG2VOFS					;/
	lda #$01					;\Enable background tilting/shearing
	sta Mode2Flag					;/
	lda #$02					;\Set BGMODE to 2
	sta BGMODE					;/
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
	stz BGTiltFlag					;/
	lda #$01					;\Set BGMODE to 1
	sta BGMODE					;/
	lda VerticalScroll				;\Update vertical scroll
	sta BG2VOFS					;|
	lda VerticalScroll+1				;|
	sta BG2VOFS					;/
	plp
	rts
LevelCommand22:
	tyx
	sep #$20
	lda #$01
	sta Unknown_1953
	inx
	jmp RunLevelScriptCommands
LevelCommand24:
	tyx
	sep #$20
	stz Unknown_1953
	inx
	jmp RunLevelScriptCommands
LevelCommand1C:
	tyx
	sep #$20
	lda $8001,x
	sta Unknown_1955
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand16_DisablePointEffects:
	tyx
	stz PointEffect					; Set PointEffect to 0 (none)
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand18_EnableGridOfDots:
	tyx
	lda #$0001					;\Set PointEffect to 1 (grid of dots)
	sta PointEffect					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand1A_EnableColoredStars:
	tyx
	lda #$FFFF					;\Set PointEffect to -1 (colored stars)
	sta PointEffect					;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand64_RunLoadPresetFunc:
	tyx
	phx
	lda Unknown_16DF
	tax
	lda.l PresetFunctionTable,x
	sta.b TempPtr
	lda.l PresetFunctionTable+1,x
	ora.b TempPtr
	beq LevelCommand64_Exit
	plx
	stx LevelScriptPointer
	rts
LevelCommand64_Exit:
	plx
	inx
	jmp RunLevelScriptCommands
LevelCommand62:
	tyx
	lda $8001,x
	and #$00FF
	sta Unknown_16E1
	lda $8002,x
	sta Unknown_16DF
	sta Preset
	inx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
LevelCommand10_SetPreset:
	tyx
	phx
	rep #$20
	lda $8001,x
	jsl DoSetPreset
	plx
	inx
	inx
	inx
	jmp RunLevelScriptCommands
DoSetPreset:
	sta Preset
	lda CurMainLoopLoaderTasks
	ora #$0004
	sta CurMainLoopLoaderTasks
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
	lda.b #BANKOF(STACKIFY(LoadPreset_Ret))
	pha
	rep #$20
	lda.w #STACKIFY(LoadPreset_Ret)
	pha
	sep #$20
	lda.b TempPtr
	pha
	ldx.b TempPtr+2
	dex
	phx
	rtl
LoadPreset_Ret:
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
	lda #$0032					;\Set stage number text to appear for 50 frames
	sta StageNumTextTimer				;/
	inx						;\Move on to next command
	jmp RunLevelScriptCommands			;/
LevelCommand70_LoadObject8BehNum:
	tyx
	lda $8001,x					;\Get ZTimer...
	and #$00FF					;|
	asl						;|...shift left four bits
	asl						;|
	asl						;|
	asl						;|
	sta ZTimer					;/
	phx
	ldx FirstObject
	txy
	ldx FirstFreeObject
	bne LevelCommand70_LoadObject8BehNum_L1
	tyx
	jmp LevelCommand70_LoadObject8BehNum_L12
LevelCommand70_LoadObject8BehNum_L1:
	lda.b $00,x
	sta FirstFreeObject
	tya
	bne LevelCommand70_LoadObject8BehNum_L2
	lda FirstObject
	sta.b $00,x
	stz.b $02,x
	stx FirstObject
	bra LevelCommand70_LoadObject8BehNum_L3
LevelCommand70_LoadObject8BehNum_L2:
	lda $0000,y
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
	lda $8002,x
	bit #$0080
	beq LevelCommand70_PosX
	ora #$FF00
	bra LevelCommand70_SkipX
LevelCommand70_PosX:
	and #$00FF
LevelCommand70_SkipX:
	asl
	asl
	sta $000C,y
	lda $8003,x
	bit #$0080
	beq LevelCommand70_PosY
	ora #$FF00
	bra LevelCommand70_SkipY
LevelCommand70_PosY:
	and #$00FF
LevelCommand70_SkipY:
	asl
	asl
	sta $000E,y
	lda $8004,x
	and #$00FF
	asl
	asl
	asl
	asl
	phy
	ldy Unknown_1238
	clc
	adc $0010,y
	ply
	sta $0010,y
	lda $8000,x
	and #$00FF
	cmp #$0076
	bne LevelCommand70_LoadObject8BehNum_L9
	lda $8005,x
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
	lda BehaviorFunctionTable+3,x
	rep #$20
	and #$00FF
	asl
	tax
	lda ModelIDTable,x
	sta $0004,y
	plx
	bra LevelCommand70_LoadObject8BehNum_L10
LevelCommand70_LoadObject8BehNum_L9:
	lda $8005,x
	phx
	and #$00FF
	asl
	tax
	lda ModelIDTable,x
	sta $0004,y
	plx
	lda $8006,x
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
LevelCommand70_LoadObject8BehNum_L10:
	rep #$20
	sty CurScriptObject
	jsr SkipCommand7076
	lda ZTimer
	bne LevelCommand70_LoadObject8BehNum_L11
	jmp RunLevelScriptCommands
LevelCommand70_LoadObject8BehNum_L11:
	stx LevelScriptPointer
	rts
LevelCommand70_LoadObject8BehNum_L12:
	rep #$20
	ldx #$0000
	stx CurScriptObject
	plx
	jsr SkipCommand7076
	lda $16FB
	bne LevelCommand70_LoadObject8BehNum_L11
	jmp RunLevelScriptCommands
SkipCommand7076:
	lda $8000,x					;\Get command byte
	and #$00FF					;/
	cmp #$0076					;\If $76, branch ahead
	beq SkipCommand7076_Is76			;/
	txa						;\Otherwise, skip 7 bytes to move on to next command
	clc						;|
	adc #$0007					;|
	tax						;|
	rts						;/
SkipCommand7076_Is76:
	txa						;\Skip 6 bytes to move on to next command
	clc						;|
	adc #$0006					;|
	tax						;|
	rts						;/
LevelCommand72:
	tyx
	lda $8001,x
	and #$00FF
	asl
	asl
	sta ZTimer
	phx
	ldx FirstObject
	txy
	ldx FirstFreeObject
	bne LevelCommand72_L1
	tyx
	jmp LevelCommand72_L12
LevelCommand72_L1:
	lda.b $00,x
	sta FirstFreeObject
	tya
	bne LevelCommand72_L2
	lda FirstObject
	sta.b $00,x
	stz.b $02,x
	stx FirstObject
	bra LevelCommand72_L3
LevelCommand72_L2:
	lda $0000,y
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
	lda $8002,x
	bit #$0080
	beq LevelCommand72_L5
	ora #$FF00
	bra LevelCommand72_L6
LevelCommand72_L5:
	and #$00FF
LevelCommand72_L6:
	asl
	asl
	sta $000C,y
	lda $8003,x
	bit #$0080
	beq LevelCommand72_L7
	ora #$FF00
	bra LevelCommand72_L8
LevelCommand72_L7:
	and #$00FF
LevelCommand72_L8:
	asl
	asl
	sta $000E,y
	lda $8004,x
	bit #$0080
	beq LevelCommand72_L9
	ora #$FF00
	bra LevelCommand72_L10
LevelCommand72_L9:
	and #$00FF
LevelCommand72_L10:
	asl
	asl
	asl
	asl
	phy
	ldy Unknown_1238
	clc
	adc $0010,y
	ply
	sta $0010,y
	lda $8005,x
	sta $0004,y
	lda $8006,x
	sta $0016,y
	sep #$20
	lda $8008,x
	sta $0018,y
	rep #$20
	sty CurScriptObject
	txa
	clc
	adc #$0007
	tax
	lda ZTimer
	bne LevelCommand72_L11
	jmp RunLevelScriptCommands
LevelCommand72_L11:
	stx LevelScriptPointer
	rts
LevelCommand72_L12:
	rep #$20
	stz CurScriptObject
	pla
	clc
	adc #$0007
	tax
	lda ZTimer
	bne LevelCommand72_L11
	jmp RunLevelScriptCommands
LevelCommand00_LoadObject16BehNum:
	tyx
	lda $8001,x					;\Get ZTimer
	sta ZTimer					;/
	phx
	ldx FirstObject					;\Get FirstObject in Y
	txy						;/
	ldx FirstFreeObject				;\Get FirstFreeObject in X
	bne LevelCommand00_Do				;|...if not null, continue...
	tyx						;|
	jmp LevelCommand00_Exit				;/...otherwise exit
LevelCommand00_Do:
	lda.b $00,x					;\Update FirstFreeObject with FirstFreeObject.NextObj
	sta FirstFreeObject				;/
	tya						;\If FirstObject is not null, branch
	bne LevelCommand00_FirstObjNotNull		;/
	lda FirstObject					;\Otherwise, make FirstFreeObject FirstObject...
	sta.b $00,x					;|...by setting FirstFreeObject.NextObj...
	stz.b $02,x					;|...and FirstFreeObject.PrevObj to 0...
	bra LevelCommand00_SkipInit			;/...skip alternate initialization
LevelCommand00_FirstObjNotNull:
	lda $0000,y					;\Set FirstFreeObject.NextObj to FirstObject.NextObj
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
	lda $8003,x					;\Init object X position
	sta $000C,y					;/
	lda $8005,x					;\Init object Y position
	sta $000E,y					;/
	phy						;\Init object Z position
	ldy Unknown_1238				;|
	lda $0010,y					;|
	ply						;|
	clc						;|
	adc $8007,x					;|
	sta $0010,y					;/
	lda $8009,x					;\Init object model ID
	phx						;|
	and #$00FF					;|
	asl						;|
	tax						;|
	lda ModelIDTable,x				;|
	sta $0004,x					;|
	plx						;/
	lda $8009,x					;\Init object behavior function pointer
	phx						;|
	and #$00FF					;|
	asl						;|
	asl						;|
	tax						;|
	lda.l BehaviorFunctionTable,x			;|
	sta $0016,y					;|
	sep #$20					;|
	lda.l BehaviorFunctionTable+2,x			;|
	sta $0018,y					;|
	plx						;/
	sty CurScriptObject				; Set current object being processed in level script
	rep #$20					;\Move on to next command
	txa						;|
	clc						;|
	adc #$000B					;|
	tax						;/
	lda ZTimer					;\If ZTimer is not 0...
	bne LevelCommand00_ZTimerNotNull		;|...branch to leave, otherwise...
	jmp RunLevelScriptCommands			;/...get the next script command
LevelCommand00_ZTimerNotNull:
	stx LevelScriptPointer				;\Save script pointer and leave
	rts						;/
LevelCommand00_Exit:
	rep #$20					;\Set current object being processed to null
	stz CurScriptObject				;/
	pla						;\Move on to next command
	clc						;|
	adc #$000B					;|
	tax						;/
	lda ZTimer					;\If ZTimer is not 0...
	bne LevelCommand00_ZTimerNotNull		;|...branch to leave, otherwise...
	jmp RunLevelScriptCommands			;/...get the next script command
LevelCommand74_LoadMacroObj16:
	tyx
	lda $8001,x					;\Get ZTimer
	sta ZTimer					;/
	phx
	ldx FirstObject
	txy
	ldx FirstFreeObject
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
	ldy Unknown_1238
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
	stx LevelScriptPointer				;\Save script pointer and leave
	rts						;/
LevelCommand04_LoopSection:
	tya
	ldx #$0000
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
	jml CODE_1FBDEE
LevelCommand08_Nop:
	inx
	jmp RunLevelScriptCommands
LevelCommand86_LoadObject16BehAddr:
	tyx
	lda $8001,x
	sta ZTimer
	phx
	ldx FirstObject
	txy
	ldx FirstFreeObject
	bne LevelCommand86_LoadObject16BehAddr_L1
	tyx
	jmp LevelCommand86_LoadObject16BehAddr_L7
LevelCommand86_LoadObject16BehAddr_L1:
	lda.b $00,x
	sta FirstFreeObject
	tya
	bne LevelCommand86_LoadObject16BehAddr_L2
	lda FirstObject
	sta.b $00,x
	stz.b $02,x
	stx FirstObject
	bra LevelCommand86_LoadObject16BehAddr_L3
LevelCommand86_LoadObject16BehAddr_L2:
	lda $0000,y
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
	ldy Unknown_1238
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
	ldy Unknown_1238
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
	lda ZTimer
	bne LevelCommand0A_SwarmBeh16_L6
	jmp RunLevelScriptCommands
LevelCommand0A_SwarmBeh16_L6:
	stx LevelScriptPointer
	rts
LevelCommand0A_SwarmBeh16_L7:
	rep #$20
	stz CurScriptObject
	pla
	clc
	adc #$0010
	tax
	bra LevelCommand0A_SwarmBeh16_L5
LevelCommand0C:
	ldx FirstObject
	beq LevelCommand0C_L2
LevelCommand0C_L1:
	lda.b $00,x
	tax
	beq LevelCommand0C_L2
	lda $8003,y
	cmp.b $04,x
	bne LevelCommand0C_L1
	phy
	jsl CODE_1FBFDC
	ply
LevelCommand0C_L2:
	tya
	clc
	adc #$0005
	tax
	jmp RunLevelScriptCommands
LevelCommand12_SetZTimer16:
	tyx
	inx						;\Get ZTimer...
	inx						;|
	inx						;|
	lda $7FFE,x					;|
	beq LevelCommand12_Return			;|...if zero, branch to leave
	sta ZTimer					;/
	stx LevelScriptPointer				;\Move on to next command
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
	sta $0026,y
	lda.l $058000,x
	and #$00FF
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
	sbc ZTimerVel
	sta.b $26,x
	plp
	rtl
SwarmCommand00_LoadObject:
	lda $0006,y
	tax
	phy
	lda $000C,y
	sta.b TempVecX
	lda $000E,y
	sta.b TempVecY
	lda $0010,y
	sta.b TempVecZ
	phx
	ldx FirstObject
	txy
	ldx FirstFreeObject
	bne CODE_03FBDC
	tyx
	jmp SwarmCommand00_Exit
CODE_03FBDC:
	lda.b $00,x
	sta FirstFreeObject
	tya
	bne CODE_03FBF0
	lda FirstObject
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
	sta $000C,y
	lda.b $08
	clc
	adc.l $058005,x
	sta $000E,y
	lda.b $90
	clc
	adc.l $058007,x
	sta $0010,y
	lda.l $058009,x
	sta $0004,y
	lda.l $05800B,x
	sta $0016,y
	lda.l $05800C,x
	sta $0017,y
	phx
	tyx
	lda #$0000
	sta $7E1CD3,x
	sta $7E1CD0,x
	plx
	sep #$20
	lda #$00
	sta $0008,y
	sta $001D,y
	sta $0012,y
	sta $0013,y
	sta $0014,y
	lda #$08
	sta $0009,y
	rep #$20
	txa
	clc
	adc #$000E
	tax
	ply
	txa
	sta $0006,y
	rts
SwarmCommand00_Exit:
	rep #$20
	pla
	ply
	clc
	adc #$000E
	sta $0006,y
	rts
SwarmCommand0A_NoOp:
	lda $0006,y
	clc
	adc #$0003
	sta $0006,y
	rts
SwarmCommand08_Jump:
	lda $0006,y
	tax
	lda.l $058003,x
	sta $0006,y
	rts
SwarmCommand0E_BranchConditional:
	lda $0006,y
	tax
	phy
	lda.l $058007,x
	and #$00FF
	cmp #$0000
	beq CODE_03FCCB
	cmp #$0001
	beq CODE_03FCD6
	cmp #$0002
	beq CODE_03FCC0
	cmp #$0003
	beq CODE_03FCB5
	bra CODE_03FCEA
CODE_03FCB5:
	lda NumObjectsWithID
	cmp.l $058003,x
	bcs CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCC0:
	lda NumObjectsWithID
	cmp.l $058003,x
	bcc CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCCB:
	lda NumObjectsWithID
	cmp.l $058003,x
	beq CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCD6:
	lda NumObjectsWithID
	cmp.l $058003,x
	bne CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCE1:
	ply
	txa
	clc
	adc #$008
	sta $0006,y
	rts
SwarmCommand0C_CountObjectsWithID:
	lda $0006,y
	tax
	phy
	phx
	stz NumObjectsWithID
	lda.l $058003,x
	ldx FirstObject
SwarmCommand0C_Loop:
	cmp.b $04,x
	bne SwarmCommand0C_SkipInc
	inc NumObjectsWithID
SwarmCommand0C_SkipInc:
	ldy.b $00,x
	tyx
	bne SwarmCommand0C_Loop
	plx
	ply
	txa
	clc
	adc #$0005
	sta $0006,y
	rts
SwarmCommand02:
	lda $0006,y
	tax
	sep #$20
	lda.l $058005,x
	sta.b $02
	lda $0024,y
	inc
	cmp.b $02
	bmi SwarmCommand02_L1
	lda #$00
	sta $0024,y
	rep #$20
	txa
	clc
	adc #$0006
	sta $0006,y
	rts
SwarmCommand02_L1:
	sta $0024,y
	rep #$20
	lda.l $058003,x
	sta $0006,y
	rts
SwarmCommand04_Stop:
	tyx
	jsl CODE_1FD501
	plx
	plx
	plp
	rtl
SwarmCommand06_LoadObject:
	lda $0006,y
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
	sta $15C2
	jsl CODE_02FC58
	sta $15C3
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
	adc $000C,y
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
	adc $000E,y
	sta.b $08
	lda.l $058007,x
	beq CODE_03FDCB
	lsr
	sta.b $90
	lda.l $058007,x
	dec
	and $15C2
	sec
	sbc.b $90
CODE_03FDCB:
	clc
	adc $0010,y
	sta.b $90
	ldx FirstObject
	txy
	ldx FirstFreeObject
	bne CODE_03FDDE
	tyx
	jmp CODE_03FE63
CODE_03FDDE:
	lda.b $00,x
	sta FirstFreeObject
	tya
	bne CODE_03FDF2
	lda FirstObject
	sta.b $00,x
	stz.b $02,x
	stx FirstObject
	bra CODE_03FDFB
CODE_03FDF2:
	lda $0000,y
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
	sta $000C,y
	lda.b $08
	sta $000E,y
	lda.b $90
	sta $0010,y
	lda.l $058009,x
	sta $0004,y
	lda.l $05800B,x
	sta $0016,y
	lda.l $05800C,x
	sta $0017,y
	phx
	tyx
	lda #$0000
	sta $7E1CD3,x
	sta $7E1CD0,x
	plx
	sep #$20
	lda #$0000
	sta $0008,y
	sta $001D,y
	sta $0012,y
	sta $0013,y
	sta $0014,y
	lda #$08
	sta $0009,y
	rep #$20
	txa
	clc
	adc #$000E
	tax
	ply
	txa
	sta $0006,y
	rts
CODE_03FE63:
	rep #$20
	pla
	ply
	clc
	adc #$000E
	sta $0006,y
	rts
