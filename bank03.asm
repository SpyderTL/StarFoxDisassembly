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
	DB $00,$1F,$1F,$1F,$00,$00,$21,$00
	DB $00,$00,$A5,$00,$42,$00,$29,$01
	DB $84,$00,$AD,$01,$C6,$00,$31,$02
	DB $08,$01,$B5,$02,$4A,$01,$39,$03
	DB $8C,$01,$FF,$03
;Base color palette, three varieties.
;The first one is more blue-tinted, the second one is more red-tinted,
;and the third one is more green-tinted.
BaseColorTable:
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
LoadPreset_BlackHole:
	sep #$20
	jsr CODE_03AB12
	jsr DecompressTileset
	DL $16A648
	DB $00,$5C,$00,$18
	jsr DecompressTilemap
	DL $16ED34
	DB $00,$70,$00,$20
	jsr CODE_03ABFE
	DB $60,$03,$7F,$E0,$00
	lda #$00
	sta D,CurNMITask
	lda $120E
	ora #$04
	sta $120E
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
	lda $120E
	sta HDMAEN
CODE_039056:
	lda D,CurNMITask
	beq CODE_03905E
	cmp #$20
	bne CODE_039056
CODE_03905E:
	rtl
LoadPreset_Scramble:
	sep #$20
	jsr CODE_03AB12
	jsr DecompressTileset
	DL $14DB6E
	DB $00,$5C,$00,$18
	jsr DecompressTilemap
	DL $14DC0E
	DB $00,$70,$00,$20
	JSR CODE_03ABFE
	DB $E0,$00,$7F,$E0,$00
	lda #$10
	sta D,CurNMITask
	lda $120E
	ora #$04
	sta $120E
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
	lda $120E
	ora #$10
	sta $120E
	stz $194F
	stz $1950
	stz $1862
	lda #$8A
	sta $70004E
	lda #$8B
	sta $70004F
	lda $120E
	sta HDMAEN
CODE_0390FA:
	lda D,CurNMITask
	beq CODE_039102
	cmp #$20
	bne CODE_0390FA
CODE_039102:
	rtl
CODE_039103:
	jml CODE_1FBDEE
CODE_039107:
	jml CODE_1FBDEE
CODE_03910B:
	sep #$20
	jsr CODE_03AB12
	
; Missing

CODE_03A963:
	sep #$20
	jsr CODE_03AAF9
	jsr CODE_03AB95
	cmp $05FE

DATA_03A96E:


CODE_03AAF9:
	sep #$20
	rep #$10
CODE_03AAFD:
	lda D, $00
	beq CODE_03AB05
	cmp #$20
	bne CODE_03AAFD
CODE_03AB05:
	lda #$24
	sta D, $00
CODE_03AB09:
	lda D, $00
	beq CODE_03AB11
	cmp #$20
	bne CODE_03AB09
CODE_03AB11:
	rts
	
CODE_03AB12:
	sep #$20
	rep #$10
CODE_03AB16:
	lda D,CurNMITask
	beq CODE_03AB1E
	cmp #$20
	bne CODE_03AB16
CODE_03AB1E:
	lda #$26
	sta D,CurNMITask
CODE_03AB22:
	lda D,CurNMITask
	beq CODE_03AB2A
	cmp #$20
	bne CODE_03AB22
CODE_03AB2A:
	rts
DoDecompressTileset:
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
DoDecompressTilemap:
	php
	rep #$20
	lda #$00C0
	sta $700090
	lda #$4000
	sta $70002C
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
PresetFunctionTable:
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
LoadAudio:
	sep #$20
	sei
	lda.l AudioPacketData,x
	sta $14F7
	inx
	stx $1F63
	lda $1F65
	lda #$FF
	sta APUI00
LoadAudio_L1:
	lda #$01
	sta $1F65
	rep #$20
	ldy #$0000
	lda #$BBAA
LoadAudio_L2:
	cmp APUI00
	bne LoadAudio_L2
	sep #$20
	lda #$CC
	pha
	jmp LoadAudio_L17
LoadAudio_L3:
	lda [D,$FA],y
	iny
	bne LoadAudio_L4
	inc D,$FC
	stz D,$FB
	stz D,$FA
	ldy #$8000
LoadAudio_L4:
	xba
	lda #$00
	bra LoadAudio_L8
LoadAudio_L5:
	xba
	lda [D,$FA],y
	iny
	bne LoadAudio_L6
	inc D,$FC
	stz D,$FB
	stz D,$FA
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
	lda [D,$FA],y
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
	lda [D,$FA],y
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
	ldx $1F63
	lda.l AudioPacketData,x
	sta $1F3F
	lda.l AudioPacketData+3,x
	sta $1F41
	sep #$20
	lda.l AudioPacketData+2,x
	sta D,$FC
	inx
	inx
	inx
	inx
	inx
	stx $1F63
	rep #$20
	stz D,$FA
	lda $1F3F
	beq LoadAudio_L18
	tay
	clc
	adc $1F41
	bcc LoadAudio_L26
	jmp LoadAudio_L11
LoadAudio_L18:
	rep #$20
	lda #$0400
	sta APUI02
	sep #$30
	lda #$00
	xba
	pla
	rep #$20
	sta APUI00
	sep #$20
LoadAudio_L19:
	cmp APUI00
	bne LoadAudio_L19
	stz APUI01
	stz APUI02
	stz APUI03
	stz $1F46
	lda TIMEUP
	cli
	rts
LoadAudio_L20:
	lda [D,$FA],y
	iny
	xba
	lda #$00
	bra LoadAudio_L23
LoadAudio_L21:
	xba
	lda [D,$FA],y
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
	lda [D,$FA],y
	bne LoadAudio_L27
	brl LoadAudio_L17
LoadAudio_L27:
	iny
	iny
	tax
	lda [D,$FA],y
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
	lda D,$2E,x
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
	lda D,$0C,x
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
	lda D,$2A,x
	cmp #$FF
	bne CODE_03B395
	lda D,$1F,x
	and #$08
	bne CODE_03B367
	jml CODE_03B395
CODE_03B367:
	lda D,$20,x
	and #$02
	beq CODE_03B371
	jml CODE_03B395
CODE_03B371:
	rep #$20
	ldy $1238
	lda $14F6
	sec
	sbc D,$0C,x
	bmi CODE_03B385
	bra CODE_03B38A
CODE_03B385:
	cmp #$FED4
	bcc CODE_03B395
CODE_03B38A:
	lda D,$10,x
	sec
	sbc $0010,y
	cmp #$0064
	bcc CODE_03B39B
CODE_03B395:
	ldy D,$00,x
	tyx
	bne CODE_03B355
	rts
CODE_03B39B:
	sep #$20
	lda D,$20,x
	ora #$02
	sta D,$20,x
	rep #$20
	lda $14F6
	sec
	sbc D,$0C,x
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
	
CODE_03B3DD:
	ldy D, $04, X
	cpy #$C7C0
	bne CODE_03B3E7
	jmp CODE_03B4CD
CODE_03B3E7:
	cpy #$D9B0
	bne CODE_03B3EF
	jmp CODE_03B4CD
CODE_03B3EF:
	cpy #$D994
	bne CODE_03B3F7
	jmp CODE_03B4CD
CODE_03B3F7:
	cpy #$D95C
	bne CODE_03B3FF
	jmp CODE_03B4CD
CODE_03B3FF:
	cpy #$C050
	bne CODE_03B407
	jmp CODE_03B4CD
CODE_03B407:
	pha
	sep #$20
	lda D, $08, X
	bit #$01
	bne CODE_03B441
	lda $7E1CE8, X
	bne CODE_03B41C
	lda $7E1CE9, X
	beq CODE_03B441
CODE_03B41C:
	ldy $1238
	rep #$20
	lda D, $10, X
	sec
	sbc $, Y0010
	bpl CODE_03B42D
	eor #$FFFF
	inc
CODE_03B42D:
	sta $1250
	pla
	cmp $1250
	bmi CODE_03B444
	lda $1250
	stx $1F3D
	sta $1F3F
	jmp CODE_03B444
CODE_03B441:
	rep #$20
	pla
CODE_03B444:
	ldy D, $00, X
	tyx
	bne CODE_03B3DD
	ldx $1F3D
	bne CODE_03B451
	jmp CODE_03B4BE
CODE_03B451:
	cpx $1F66
	beq CODE_03B459
	jmp CODE_03B4BE
CODE_03B459:
	lda $7E1CE8, X
	and #$00FF
	beq CODE_03B465
	jmp CODE_03B4C7
CODE_03B465:
	lda $7E1CE9, X
	and #$00FF
	sta $1F3D
	ldy $1236
	jsr CODE_1FD021
	xba
	rep #$20
	and #$00FF
	tax
	lda $03B539, X
	and #$00FF
	ora $1F3D
	sta $1F3D
	lda $1F3F
	cmp #$00FA
	bmi CODE_03B4B3
	cmp #$028A
	bmi CODE_03B4AD
	cmp #$047E
	bmi CODE_03B4A7
	cmp #$0C4E
	bcs CODE_03B4BE
CODE_03B4A1:
	sep #$20
	lda #$30
	jmp CODE_03B4B7
CODE_03B4A7:
	sep #$20
	lda #$20
	jmp CODE_03B4B7
CODE_03B4AD:
	sep #$20
	lda #$10
	jmp CODE_03B4B7
CODE_03B4B3:
	sep #$20
	lda #$00
CODE_03B4B7:
	ora $1F3D
	sta $2142
	rts
CODE_03B4BE:
	sep #$20
	stz $2142
	stx $1F66
	rts

CODE_03B4C7:
	sep #$30
	sta $2142
	rts

CODE_03B4CD:
	rep #$20
	lda $7E1CE9, X
	and #$00FF
	sta $1F3D
	stx $1F66
	ldy $1238
	lda D, $10, X
	sec
	sbc $, Y0010
	bmi CODE_03B4BE
	sta $1F3F
	lda $14F6
	sec
	sbc D, $0C, X
	bmi CODE_03B4FF
	cmp #$0050
	bmi CODE_03B50C
	lda $1F3D
	ora #$0040
	jmp CODE_03B512
CODE_03B4FF:
	cmp #$FFB0
	bcs CODE_03B50C
	lda $1F3D
	ora #$00C0
	jmp CODE_03B512
CODE_03B50C:
	lda $1F3D
	ora #$0080
CODE_03B512:
	sta $1F3D
	lda $1F3F
	cmp #$01F4
	bmi CODE_03B4BE
	cmp #$1388
	bmi CODE_03B4B3
	cmp #$2710
	bmi CODE_03B4AD
	cmp #$2710
	bcs CODE_03B52F
	jmp CODE_03B4A7
CODE_03B52F:
	cmp #$2AF8
	bcs CODE_03B537
	jmp CODE_03B4A1
CODE_03B537:
	jmp CODE_03B4BE
	
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

; missing

CODE_03B799:
	phx
	phy
	php
	ldy $1238
	jsr CODE_1FD0AB
	rep #$20
	lda $1250
	cmp #$07D0
	bmi CODE_03B7BB
	cmp #$047E
	bmi CODE_03B7E5
	cmp #$0C4E
	bmi CODE_03B7ED
CODE_03B7B7:
	plp
	ply
	plx
	rtl
CODE_03B7BB:
	lda $14F6
	sec
	sbc D, $0C, X
	bmi CODE_03B7D0
	cmp #$00AA
	bmi CODE_03B7DD
	sep #$20
	lda $1F48
	jmp CODE_03B7F2
CODE_03B7D0:
	cmp #$FF56
	bcs CODE_03B7DD
	sep #$20
	lda $1F4A
	jmp CODE_03B7F2
CODE_03B7DD:
	sep #$20
	lda $1F49
	jmp CODE_03B7F2
CODE_03B7E5:
	sep #$20
	lda $1F4B
	jmp CODE_03B7F2
CODE_03B7ED:
	sep #$20
	lda $1F4C
CODE_03B7F2:
	jsr CODE_03B7F9
	jmp CODE_03B7B7

CODE_03B7F9:
	php
	pha
	sep #$20
	lda $1FCF
	bne CODE_03B824
	lda $14D1
	and #$08
	beq CODE_03B810
	lda $14D7
	and #$80
	bne CODE_03B824
CODE_03B810:
	pla
	phx
	ldx $1F4D
	sta $1F53, X
	lda $1F4D
	inc
	and #$0F
	sta $1F4D
	plx
	plp
	rtl
CODE_03B824:
	pla
	plp
	rtl

CODE_03B827:
	php
	jmp CODE_03B82D

; missing

CODE_03B82D:
	lda #$3A
	sta D, $EF
	lda #$A7
	sta D, $F0
	lda #$55
	sta D, $F1
	lda #$7F
	sta D, $F2
	stz $98
	stz $B9
	stz $95
	stz $9B
	stz $9C
	stz $9D
	stz $99
	stz $DC
	stz $1634
	stz $1636
	stz $1638
	stz $1249
	stz $124A
	lda #$00
	sta $15CA
	jsr CODE_03B8B8
	jsr CODE_03B89D
	jsr CODE_03B86F
	plp
	rtl

CODE_03B86F:
	lda #$FF
	sta $15BF
	jsr CODE_03BCE5
	lda D, $CA
	sta $700034
	lda D, $CC
	sta $700036
	lda D, $2A
	sta $700038
	lda D, $2E
	sta $70003A
	lda D, $2C
	sta $70003C
	lda D, $30
	sta $70003E
	rtl

CopyDebugFont:
	php
	sep #$30
	ldy #$00
	ldx #$00
	lda #$80
	sta D,$60
CopyDebugFont_L1:
	lda DebugFont,y  ;FIXED
	sta $701A2C,x
	inx
	iny
	iny
	dec D,$60
	bne CopyDebugFont_L1
	plp
	rtl
	
CODE_03B8B8:
	php
	rep #$20
	stz $1633
	stz $1635
	stz $1637
	lda $1633
	sta $162D
	lda $1635
	sta $162F
	lda $1637
	sta $1631
	sep #$20
	jsr CODE_03B98A
	rep #$20
	lda $15D7
	sta $161B
	lda $15D9
	sta $161D
	lda $15DB
	sta $161F
	lda $15DD
	sta $1621
	lda $15DF
	sta $1623
	lda $15E1
	sta $1625
	lda $15E3
	sta $1627
	lda $15E5
	sta $1629
	lda $15E7
	sta $162B
	sep #$20
	lda #$7F
	sta $160A
	stz $160C
	stz $160E
	stz $1610
	sta $1612
	stz $1614
	stz $1616
	stz $1618
	sta $161A
	stz $1609
	stz $160B
	stz $160D
	stz $160F
	stz $1611
	stz $1613
	stz $1615
	stz $1617
	stz $1619
	plp
	rtl

CODE_03B950:
	phx
	phy
	php
	rep #$30
	lda D, $02
	sta $700062
	lda D, $08
	sta $70002C
	lda D, $90
	sta $70002E
	sep #$20
	lda #$01
	ldx #$823E
	jsr CODE_7E4EE9
	rep #$20
	lda $700026
	sta D, $B3
	lda $700028
	sta D, $B5
	lda $70002A
	sta D, $B7
	plp
	ply
	plx
	rtl

CODE_03B98A:
	rep #$20
	lda $162D
	sta $700020
	lda $162F
	sta $700022
	lda $1631
	sta $700024
	sep #$20
	rep #$10
	lda #$01
	ldx #$8295
	jsr CODE_7E4EE9
	rep #$20
	lda $7000D2
	sta $15D7
	lda $7000D4
	sta $15D9
	lda $7000D6
	sta $15DB
	lda $7000D8
	sta $15DD
	lda $7000DA
	sta $15DF
	lda $7000DC
	sta $15E1
	lda $7000DE
	sta $15E3
	lda $7000E0
	sta $15E5
	lda $7000E2
	sta $15E7
	sep #$30
	rtl

CODE_03B9F2:
	lda D, $02
	sta D, $84
	lda D, $03
	sta D, $85
	lda D, $90
	sta D, $86
	lda D, $91
	sta D, $87
	jsr CODE_03BA45
	lda D, $88
	sta D, $72
	lda D, $89
	sta D, $73
	lda D, $08
	sta D, $84
	lda D, $09
	sta D, $85
	lda D, $90
	sta D, $86
	lda D, $91
	sta D, $87
	jsr CODE_03BA45
	lda D, $88
	sta D, $74
	lda D, $89
	sta D, $75
	clc
	lda D, $CC
	adc D, $74
	sta D, $74
	lda D, $CD
	adc D, $75
	sta D, $75
	sec
	lda D, $74
	sbc D, $CA
	sta D, $74
	lda D, $75
	sbc D, $CB
	sta D, $75
	rtl

CODE_03BA45:
	ldx #$00
	lda D, $87
	beq CODE_03BA57
	inx
	lsr A
	beq CODE_03BA55
CODE_03BA4F:
	ror D, $86
	inx
	lsr A
	bne CODE_03BA4F
CODE_03BA55:
	ror D, $86
CODE_03BA57:
	stx D, $92
	ldx #$00
	lda D, $85
	sta D, $8B
	bpl CODE_03BA6E
	lda #$00
	sec
	sbc D, $84
	sta D, $84
	lda #$00
	sbc D, $85
	sta D, $85
CODE_03BA6E:
	beq CODE_03BA7F
	inx
	lsr A
	beq CODE_03BA7A
CODE_03BA74:
	ror D, $84
	inx
	lsr A
	bne CODE_03BA74
CODE_03BA7A:
	ror D, $84
	jmp CODE_03BA96
	lda D, $84
	bmi CODE_03BA96
	bne CODE_03BA90
	lda D, $CA
	sta D, $88
	lda D, $CB
	sta D, $89
	jmp CODE_03BAF6
CODE_03BA90:
	dex
	asl
	bpl CODE_03BA90
	sta D, $84
CODE_03BA96:
	lda D, $86
	cmp D, $84
	bmi CODE_03BAA4
CODE_03BA9C:
	dex
	lsr A
	cmp D, $84
	bcs CODE_03BA9C
	sta D, $86
CODE_03BAA4:
	txa
	sec
	sbc D, $92
	sta D, $8A
	ldx D, $84
	lda $83D5, X
	ldx D, $86
	sec
	sbc $83D5, X
	tax
	lda $82D5, X
	sta D, $89
	lda $81D5, X
	ldx D, $8A
	bmi CODE_03BACD
	beq CODE_03BAD3
CODE_03BAC4:
	asl
	rol D, $89
	dex
	bne CODE_03BAC4
	jmp CODE_03BAD3
CODE_03BACD:
	lsr D, $89
	ror a
	inx
	bne CODE_03BACD
CODE_03BAD3:
	sta D, $88
	bit D, $8B
	bpl CODE_03BAE9
	sec
	lda D, $CA
	sbc D, $88
	sta D, $88
	lda D, $CB
	sbc D, $89
	sta D, $89
	jmp CODE_03BAF6
CODE_03BAE9:
	clc
	lda D, $88
	adc D, $CA
	sta D, $88
	lda D, $89
	adc D, $CB
	sta D, $89
CODE_03BAF6:
	rtl

CODE_03BAF7:
	bpl CODE_03BAFC
	jmp CODE_03BCF5
	rep #$30
	lda D, $C1
	and #$00FF
	eor #$00FF
	sec
	sbc $0780
	sta D, $02
	lda D, $C5
	and #$00FF
	eor #$00FF
	sec
	sbc $0780
	sta D, $90
	lda #$0000
	sec
	sbc D, $C3
	sta D, $08
	lda D, $C1
	and #$FF00
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	sep #$20
	sta $164B
	rep #$20
	lda D, $C5
	and #$FF00
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	lsr A
	sep #$20
	sta $164C
	jsr CODE_03B950
	rep #$20
	lda D, $B3
	sta D, $02
	lda D, $B5
	sta D, $08
	lda D, $B7
	sta D, $90
	sep #$20
	rep #$20
	lda $161B
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $1639
	lda $161D
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $163B
	lda $161F
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $163D
	lda $1621
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $163F
	lda $1623
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $1641
	lda $1625
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $1643
	lda $1627
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $1645
	lda $1629
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $1647
	lda $162B
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	cmp #$8000
	ror a
	sta $1649
	sep #$20
	rep #$20
	lda D, $02
	sta $700062
	lda D, $08
	sta $70002C
	lda D, $90
	sta $70002E
	lda $1639
	sta $700142
	lda $163B
	sta $700144
	lda $163D
	sta $700146
	lda $1645
	sta $700148
	lda $1647
	sta $70014A
	lda $1649
	sta $70014C
	sep #$20
	rep #$10
	lda $164B
	sta $700150
	lda $164C
	sta $700152
	sep #$30
	rtl

CODE_03BCE5:
	sep #$20
	rep #$10
	lda #$01
	ldx #$A861
	jsr CODE_7E4EE9
	sep #$30
	rtl

CODE_03BCF5:
	rep #$20
	lda $1F0D
	and #$00FF
	beq CODE_03BD16
	lda $1FD4
	sta $7000C6
	lda $1FD6
	sta $7000C8
	lda $1FD8
	sta $7000CA
	jmp CODE_03BD38
CODE_03BD16:
	lda D, $C1
	sta $7000C6
	lda D, $C3
	sta $7000C8
	lda D, $C5
	sta $7000CA
	lda $14C2
	and #$00FF
	beq CODE_03BD38
	lda $0014CD
	sta $7000CA
CODE_03BD38:
	lda $161B
	sta $7000D2
	lda $161D
	sta $7000D4
	lda $161F
	sta $7000D6
	lda $1621
	sta $7000D8
	lda $1623
	sta $7000DA
	lda $1625
	sta $7000DC
	lda $1627
	sta $7000DE
	lda $1629
	sta $7000E0
	lda $162B
	sta $7000E2
	sep #$30
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
WaitScanline:
	php
	rep #$30
	phx
	pha
	sep #$20
	stz $16DC
WaitScanline_L1:
	sep #$20
	lda SLHV
	lda OPVCT
	xba
	lda OPVCT
	xba
	cmp ScanlineToWaitFor
	bne WaitScanline_L1
	rep #$30
	pla
	plx
	plp
	rtl
CODE_03BDAF:
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
	jsl LoadMapGraphics
	rep #$30
	lda #$2020
	sta VMADDL
	ldx #$0000
Map_L1:
	lda $A08B,x
	sta VMDATAL
	inx
	inx
	cpx #$03C0
	bne Map_L1
	lda #$5020
	sta VMADDL
	ldx #$0000
Map_L2:
	lda $A08B,x
	sta VMDATAL
	inx
	inx
	cpx #$03C0
	bne Map_L2
	rep #$20
	stz D,$04
	lda #$0010
	sta $15C2
	dec StageID
	bmi Map_L3
	inc StageID
	jsl $03CC3E
	lda $16D9
	pha
	dec StageID
	jsl $03CC3E
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
Map_L9:
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
	bra Map_L12
Map_L11:
	jsl CODE_03CC22
Map_L12:
	jsl UpdateInput
	lda Pad1Down		;\Check if Select/Start/D-pad been pressed...
	bit #$2F00		;|
	beq Map_L17		;/...if not, skip this
	lda #$0010
	sta $70009A
	jsr CODE_03BD7A
	jsl CODE_03CC22
	lda Pad1Down		;\If Down/Right not pressed...
	bit #$2A00		;|
	sep #$20		;|
	bne Map_MapSelDoDec	;|...skip past this, otherwise...
	lda LevelID		;|...increment level/route ID...
	inc			;|
	cmp #$03		;|...if 3 or more, loop around to 0
	bne Map_MapSelIncLoop	;|
	lda #$00		;|
Map_MapSelIncLoop:		;|
	sta LevelID		;/
	bra Map_L16
Map_MapSelDoDec:
	lda LevelID		;\Decrement level/route ID...
	dec			;|
	cmp #$FF		;|... if negative, loop around to 2
	bne Map_MapSelDecLoop	;|
	lda #$02		;|
Map_MapSelDecLoop:		;|
	sta LevelID		;/
Map_L16:
	lda #$11
	jsl CODE_03B7F9
	jsl CODE_03C67F
	rep #$20
Map_L17:
	lda Pad1Down
	bit #$9080
	bne Map_L18
	brl Map_L9
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
	bcc Map_L21
	jsr CODE_03BD7A
	jsl CODE_03CC3E
	lda #$08
	sta D,CurNMITask
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
	lda Pad1Down
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
	sta D,$34
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
	stz D,$10
	stz D,$11
	stz D,$14
	stz D,$16
	stz D,$1E
	stz D,$20
	ldx #$20
Map_L28:
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
	lda Pad1Down+1
	bit #$10
	bne Map_L43
	lda Pad1Down+1
	bit #$80
	bne Map_L43
	lda Pad1Down
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

CODE_03C484:
	php
	rep #$30
	lda D, $32
	cmp D, $38
	beq CODE_03C490
	jmp CODE_03C50B
CODE_03C490:
	sep #$20
	ldx D, $02
	beq CODE_03C49C
	lda $03D69D, X
	bpl CODE_03C4CC
CODE_03C49C:
	jsr CODE_03CC3E
	lda $16D9
	rep #$20
	stz $02
	asl
	tax
	lda $03D42A, X
	sta D, $38
	cmp D, $32
	beq CODE_03C50E
	sep #$20
	lda D, $39
	cmp D, $33
	bmi CODE_03C50B
	lda D, $33
	sta D, $39
	rep #$20
	lda D, $32
	cmp D, $38
	beq CODE_03C50E
	sep #$20
	jmp CODE_03C50B
CODE_03C4CC:
	cmp #$04
	beq CODE_03C4DC
	cmp #$02
	beq CODE_03C4D8
	lda #$02
	jmp CODE_03C4DE
CODE_03C4D8:
	lda #$01
	jmp CODE_03C4DE
CODE_03C4DC:
	lda #$00
CODE_03C4DE:
	sta D, $36
	rep #$20
	ldy D, $30
	lda $03D69D, X
	sta $, Y0002
	lda D, $08
	sta $, Y0000
	iny
	iny
	iny
	iny
	sty D, $30
	lda D, $08
	clc
	adc $03D69F, X
	sta D, $08
	sec
	sbc $0810
	sta D, $38
	inx
	inx
	inx
	inx
	stx D, $02
CODE_03C50B:
	plp
	clc
	rts
CODE_03C50E:
	plp
	sec
	rts

CODE_03C511:
	php
	sep #$20
	lda D, $56
	bne CODE_03C523
	lda $16ED
	beq CODE_03C523
	lda #$91
	jsr CODE_03B7F9
CODE_03C523:
	lda $16ED
	sta D, $56
	rep #$30
	lda $16E8
	sta $7001DA
	lda $16ED
	and #$00FF
	bne CODE_03C557
	lda $7001D6
	ldx $16E4
	jsr CODE_03C575
	sta $7001D6
	lda $7001D8
	ldx $16E6
	jsr CODE_03C575
	sta $7001D8
	plp
	rts
CODE_03C557:
	lda $7001D6
	ldx $16E4
	jsr CODE_03C57F
	sta $7001D6
	lda $7001D8
	ldx $16E6
	jsr CODE_03C57F
	sta $7001D8
	plp
	rts

CODE_03C575:
	stx D, $02
	cmp D, $02
	bmi CODE_03C57D
	dec
	rts
CODE_03C57D:
	inc
	rts

CODE_03C57F:
	stx D, $02
	cmp D, $02
	bmi CODE_03C58A
	sec
	sbc $0010
	rts
CODE_03C58A:
	clc
	adc #$0010
	rts

CODE_03C58F:
	php
	rep #$30
	ldx #$0000
CODE_03C595:
	lda D, $24, X
	clc
	adc $03C5A7, X
	sta D, $24, X
	inx
	inx
	cpx #$000C
	bne CODE_03C595
	plp
	rts

DATA_03C5A7:

CODE_03C5BF:
	rts

CODE_03C5C0:
	php
	sep #$20
	jsr CODE_03BD7A
	stz $2132
	stz $2130
	stz $2131
	stz $2125
	plp
	rts

CODE_03C5D4:
	php
	rep #$30
	lda #$00B8
	sta $16DB
	jsr CODE_03BD8D
	rep #$30
	sei
	sep #$20
	lda #$80
	sta $2115
	rep #$20
	ldx #$5200
	ldy #$6C20
CODE_03C5F3:
	stx $2116
	lda $2139
	sty $2116
	sta $2118
	inx
	iny
	cpx #$5340
	bne CODE_03C5F3
	sep #$20
	lda $004211
	rep #$20
	cli
	plp
	rts

CODE_03C611:
	php
	rep #$30
	lda #$00E0
	sta $16DB
	jsr CODE_03BD8D
	rep #$30
	lda $16D9
	asl
	asl
	tax
	sep #$20
	lda $03D3C6, X
	inc
	sta $2126
	clc
	adc #$1D
	sta $2127
	lda $03D3C7, X
	lsr A
	sta D, $02
	sta $7E4610
	lda $03D3C7, X
	sec
	sbc D, $02
	sta $7E4612
	lda #$0C
	sta $420C
	lda #$30
	sta $2125
	stz $212A
	lda #$0C
	stz $212B
	lda #$03
	sta $212C
	lda #$01
	sta $212D
	stz $212E
	stz $212F
	lda #$20
	sta $2130
	lda #$93
	sta $2131
	lda #$E0
	sta $2132
	plp
	rts

CODE_03C67F:
	php
	rep #$30
	phx
	lda D, $02
	pha
	lda $14C5
	pha
	jsr CODE_02E8A8
	jsr CODE_03BD7A
	lda #$7F38
	sta $2116
	lda $16D8
	and #$00FF
	asl
	tax
	lda $03C716, X
	sta $2118
	inc
	sta $2118
	inc
	sta $2118
	inc
	sta $2118
	inc
	sta $2118
	inc
	sta $2118
	lda #$7F18
	sta $2116
	lda #$0064
	jsr CODE_03C6F9
	lda #$000A
	jsr CODE_03C6F9
	lda #$0001
	jsr CODE_03C6F9
	lda #$18A8
	sta $2118
	sta $2118
	ldy $1898
	beq CODE_03C6EF
	lda #$7EFB
	sta $2116
	lda #$18DE
CODE_03C6E9:
	sta $2118
	dey
	bne CODE_03C6E9
CODE_03C6EF:
	pla
	sta $14C5
	pla
	sta D, $02
	plx
	plp
	rts

CODE_03C6F9:
	sta D, $02
	ldx #$FFFF
	lda $14C5
CODE_03C701:
	inx
	sec
	sbc D, $02
	bpl CODE_03C701
	clc
	adc D, $02
	sta $14C5
	txa
	clc
	adc #$18A8
	sta $2118
	rts

CODE_03C716:
	sty D, $18, X
	stx $9A18
	clc
CODE_03C71C:
	php
	sep #$20
	rep #$10
	ldx D, $4A
	lda #$80
	sta $2115
	lda #$18
	sta $4371
	stx $2116
	ldx #$2C00
	stx $4372
	lda #$70
	sta $4374
	ldx #$4000
	stx $4375
	lda #$01
	sta $4370
	lda #$80
	sta $420B
	plp
	rts

CODE_03C74D:
	php
	sep #$20
	rep #$10
	sep #$20
	lda #$01
	ldx #$B09B
	jsr CODE_7E4EE9
	sep #$20
	rep #$10
	plp
	rts

CODE_03C763:
	php
	sep #$20
	rep #$10
CODE_03C768:
	lda $1FE5
	bne CODE_03C768
	inc $1FE5
CODE_03C770:
	lda $1FE5
	bne CODE_03C770
	plp
	rts

CODE_03C777:
	php
	sep #$20
	rep #$10
	sep #$20
	lda #$01
	ldx #$B0AB
	jsr CODE_7E4EE9
	sep #$20
	rep #$10
	plp
	rts

CODE_03C78D:
	php
	sep #$20
	rep #$10
CODE_03C792:
	lda $1FE5
	bne CODE_03C792
	lda #$01
	sta $1FE5
CODE_03C79C:
	lda $1FE5
	bne CODE_03C79C
	plp
	rts

CODE_03C7A3:
	php
	rep #$20
	lda $15BB
	and #$0007
	rol
	tax
	sep #$20
	jmp $03C7B3, X

DATA_03C7B3:
; Funtion Pointer Table

CODE_03C87B:
	php
	sep #$20
	rep #$10
CODE_03C880:
	lda $1FE5
	bne CODE_03C880
	lda #$04
	sta $1FE5
03C88A:
	lda $1FE5
	bne CODE_03C88A
	plp
	rts

CODE_03C891:
	php
	rep #$20
	jmp CODE_03C8A5

CODE_03C896:
	php
	rep #$20
	lda #$00E0
	sta $16DB
	jsr CODE_03BD8D
	rep #$30
CODE_03C8A5:
	lda #$0000
	cmp D, $4A
	beq CODE_03C8B5
	sta D, $4A
	lda #$3000
	sta D, $4C
	jmp CODE_03C8BC
CODE_03C8B5:
	sta D, $4C
	lda #$3000
	sta D, $4A
CODE_03C8BC:
	sep #$20
	lda D, $4B
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$50
	sta $210B
	plp
	rts

CODE_03C8CB:
	php
	rep #$30
	lda $16D9
	and #$00FF
	asl
	asl
	tax
	lda D, $1E
	sta D, $22
	lda $03D3C6, X
	and #$00FF
	sec
	sbc $0070
	sec
	sbc D, $10
	beq CODE_03C8EE
	jsr CODE_03C913
CODE_03C8EE:
	sta D, $18
	lda D, $22
	sta D, $1E
	lda D, $20
	sta D, $22
	lda $03D3C7, X
	and #$00FF
	sec
	sbc $0058
	sec
	sbc D, $12
	beq CODE_03C90B
	jsr CODE_03C913
CODE_03C90B:
	sta D, $1A
	lda D, $22
	sta D, $20
	plp
	rts

CODE_03C913:
	php
	phx
	rep #$10
	cmp #$8000
	bcs CODE_03C939
	ldx #$FFFF
CODE_03C91F:
	inx
	sec
	sbc D, $1C
	bcs CODE_03C91F
	clc
	adc D, $1C
	clc
	adc D, $22
	cmp D, $1C
	bmi CODE_03C933
	sec
	sbc D, $1C
	inx
CODE_03C933:
	sta D, $22
	txa
	plx
	plp
	rts
CODE_03C939:
	ldx #$0001
CODE_03C93C:
	dex
	clc
	adc D, $1C
	bmi CODE_03C93C
	sec
	sbc D, $1C
	clc
	adc D, $22
	cmp D, $1C
	bmi CODE_03C950
	sec
	sbc D, $1C
	dex
CODE_03C950:
	sta D, $22
	txa
	plx
	plp
	rts

CODE_03C956:
	php
	rep #$30
	lda $16D9
	jsr CODE_03C9C8
	lda $16D9
	and #$0003
	xba
	lsr A
	lsr A
	lsr A
	clc
	adc #$0010
	sta $7001F8
	lda $16D9
	and #$00FC
	asl
	asl
	asl
	clc
	adc #$0010
	sta $7001FA
	lda #$0006
	sta $70009A
	lda #$7800
	sta $700030
	lda $16D9
	asl
	tax
	lda $03D391, X
	sta $700098
	lda #$000F
	sta $7001F2
	sep #$20
	lda $700098
	bmi CODE_03C9B7
	lda #$01
	ldx #$CBF6
	jsr CODE_7E4EE9
	jmp CODE_03C9C6
CODE_03C9B7:
	and #$7F
	sta $700098
	lda #$01
	ldx #$B807
	jsr CODE_7E4EE9
CODE_03C9C6:
	plp
	rts

CODE_03C9C8:
	php
	rep #$30
	asl
	pha
	asl
	tax
	lda $03D3C6, X
	and #$00FF
	sta $700026
	lda $03D3C7, X
	and #$00FF
	sta $700028
	lda #$0000
	sta $70002A
	plx
	lda $03D392, X
	and #$00FF
	tax
	lda $000024, X
	sta $700022
	lda $03C5B3, X
	cmp #$FFFF
	bne CODE_03CA16
	tay
	lda $700022
	sta $700024
	tya
	sta $700022
	jmp CODE_03CA1A
CODE_03CA16:
	sta $700024
CODE_03CA1A:
	plp
	rts

CODE_03CA1C:
	php
	rep #$30
	lda #$0040
	sta $7001F8
	sta $7001FA
	lda #$0006
	sta $70009A
	lda #$0020
	sta $7000B6
	lda $7001F2
	clc
	adc #$0011
	sta $7000BC
	lda $16D9
	jsr CODE_03C9C8
	lda $16D9
	asl
	tax
	lda $03D391, X
	sta $700098
	sep #$20
	lda $700098
	bmi CODE_03CA6A
	lda #$01
	ldx #$CC59
	jsr CODE_7E4EE9
	jmp CODE_03CA79
CODE_03CA6A:
	and #$7F
	sta $700098
	lda #$01
	ldx #$B807
	jsr CODE_7E4EE9
CODE_03CA79:
	plp
	rts

CODE_03CA7B:
	php
	rep #$30
	lda $70009A
	eor #$000F
	and #$000F
	xba
	asl
	asl
	asl
	lda #$7800
	sta $700030
	ldx #$0000
	lda #$FFF0
	sta $7001F8
	lda #$0010
	sta $7001FA
CODE_03CAA4:
	lda $7EF0DA
	bne CODE_03CAB5
	cpx #$000E
	bne CODE_03CAB5
	jsr CODE_03CB10
	jmp CODE_03CB08
CODE_03CAB5:
	phx
	txa
	asl
	tax
	lda $03D391, X
	and #$00FF
	sta $700098
	txa
	lsr A
	tax
	phx
	txa
	jsr CODE_03C9C8
	plx
	jsr CODE_03CB10
	lda #$000F
	sta $7001F2
	sep #$20
	cpx $16D9
	beq CODE_03CB05
	lda $700098
	bmi CODE_03CAF6
	lda $16D9
	cmp #$FE
	beq CODE_03CB05
	lda #$01
	ldx #$CBF6
	jsr CODE_7E4EE9
	jmp CODE_03CB05
CODE_03CAF6:
	and #$7F
	sta $700098
	lda #$01
	ldx #$B807
	jsr CODE_7E4EE9
CODE_03CB05:
	rep #$20
	plx
CODE_03CB08:
	inx
	cpx #$0010
	bne CODE_03CAA4
	plp
	rts

CODE_03CB10:
	lda $7001F8
	clc
	adc #$0020
	sta $7001F8
	cmp #$0080
	bmi CODE_03CB34
	lda #$0010
	sta $7001F8
	lda $7001FA
	clc
	adc #$0020
	sta $7001FA
CODE_03CB34:
	rts

CODE_03CB35:
	php
	sep #$20
	rep #$10
	stz $2121
	ldx #$0000
CODE_03CB40:
	lda $03D46C, X
	sta $2122
	inx
	cpx #$0200
	bne CODE_03CB40
	plp
	rtl

CODE_03CB4F:
	php
	sep #$20
	rep #$10
	pha
	jsr CODE_03BD7A
	pla
	rep #$20
	and #$00FE
	tax
	sep #$20
	stz $2121
	lda $03D44C, X
	sta $2122
	lda $03D44D, X
	sta $2122
	plp
	rts

CODE_03CB74:
	rts

CODE_03CB75:
	rts

CODE_03CB76:
	php
	rep #$30
	lda $15C2
	cmp #$000E
	bcs CODE_03CBA8
CODE_03CB81:
	jsr CODE_03CB75
	lda $15C2
	inc
	sta $15C2
	cmp #$000E
	bmi CODE_03CBA2
	ldx D, $30
	lda D, $0C
	sta D, $00, X
	lda D, $0A
	sta D, $02, X
	inx
	inx
	inx
	inx
	stx D, $30
	jmp CODE_03CBA2
CODE_03CBA2:
	plp
	clc
	rts
CODE_03CBA5:
	plp
	sec
	rts
CODE_03CBA8:
	jsr CODE_03CBC1
	bcs CODE_03CBA5
	stz $15C2
	jmp CODE_03CB81

CODE_03CBB2:
	sep #$20
	asl
	asl
	asl
	xba
	asl
	asl
	asl
	xba
	rep #$20
	sta D, $0C
	rts

CODE_03CBC1:
	php
	rep #$30
	ldx D, $02
	lda D, $08
	clc
	adc $03D69F, X
	sta D, $08
	lda $03D69D, X
	cmp #$FFFF
	beq CODE_03CBE5
	sta D, $0A
	inx
	inx
	inx
	inx
	stx D, $02
	inc D, $04
	plp
	clc
	rts
CODE_03CBE5:
	plp
	sec
	rts

CODE_03CBE8:
	php
	sep #$20
CODE_03CBEB:
	lda $4212
	bit #$01
	beq CODE_03CBEB
CODE_03CBF2:
	lda $4212
	bit #$01
	bne CODE_03CBF2
	jmp CODE_03CBFC

CODE_03CBFB:
	php
CODE_03CBFC:
	rep #$20
	lda $4218
	pha
	eor $1201
	and $4218
	sta $1209
	lda $421A
	pha
	eor $1205
	and $421A
	sta $120B
	pla
	sta $1205
	pla
	sta $1201
	plp
	rtl

CODE_03CC22:
	php
	sep #$20
	rep #$10
	ldx #$1281
	stx D, $30
	ldy #$0014
	lda #$F8
CODE_03CC31:
	sta D, $00, X
	sta D, $01, X
	inx
	inx
	inx
	inx
	dey
	bne CODE_03CC31
	plp
	rtl

CODE_03CC3E:
	php
	rep #$30
	ldx #$1281
	stx D, $30
	sep #$20
	lda #$1E
	sta $16DB
	jsr CODE_03BD8D
	sep #$20
	rep #$10
	lda $16D6
	sta D, $02
	stz $03
	rep #$30
	lda $16D8
	asl
	and #$00FF
	tax
	lda $03D69D, X
	tax
CODE_03CC6B:
	lda $03D69D, X
	and #$00FF
	bne CODE_03CC77
	jmp CODE_03CCFF
CODE_03CC77:
	cmp #$0003
	beq CODE_03CC93
	cmp #$0002
	beq CODE_03CC88
	lda $03D69E, X
	tax
	jmp CODE_03CC6B
CODE_03CC88:
	lda $03D69E, X
	tax
	lda $16CE, X
	tax
	jmp CODE_03CC6B
CODE_03CC93:
	lda $03D69E, X
	jsr CODE_03CBB2
	tay
	lda $03D6A0, X
	and #$00FF
	sta $16D9
	lda $03D6A1, X
	sta $1FF7
	lda $03D6A2, X
	sta $1FF8
	sep #$20
	lda $03D6A4, X
	sta $7EF0C8
	lda $03D6A5, X
	sta $1FFD
	rep #$20
	txa
	clc
	adc #$0009
	tax
	lda D, $02
	beq CODE_03CD02
CODE_03CCD0:
	tya
	phx
	ldx D, $30
	sta D, $00, X
	plx
	clc
	adc $03D69F, X
	tay
	lda $03D69D, X
	cmp #$FFFF
	beq CODE_03CCF8
	phx
	ldx D, $30
	sta D, $02, X
	inx
	inx
	inx
	inx
	stx D, $30
	plx
	inx
	inx
	inx
	inx
	jmp CODE_03CCD0
CODE_03CCF8:
	inx
	inx
	dec D, $02
	jmp CODE_03CC6B

CODE_03CCFF:
	plp
	sec
	rtl

CODE_03CD02:
	stx D, $02
	sty D, $08
	plp
	clc
	rtl

CODE_03CD09:
	php
	sep #$30
	sei
	stz $00
	lda #$03
	sta $1260
	jsr CODE_02F907
	stz $2121
	stz $2116
	stz $2117
	lda #$80
	sta $2100
	sta $2115
	lda #$00
	ldx #$80
CODE_03CD2D:
	ldy #$00
CODE_03CD2F:
	sta $2118
	sta $2119
	dey
	bne CODE_03CD2F
	dex
	bne CODE_03CD2D
	lda #$00
	sta D, $2A
	lda #$00
	sta D, $2B
	lda #$7F
	sta D, $2E
	lda #$00
	sta D, $2F
	lda #$00
	sta D, $2C
	lda #$00
	sta D, $2D
	lda #$7F
	sta D, $30
	lda #$00
	sta D, $31
	lda #$40
	sta D, $CA
	lda #$00
	sta D, $CB
	lda #$40
	sta D, $CC
	lda #$00
	sta D, $CD
	jsr CODE_03B827
	sep #$30
	lda #$80
	sta D, $9C
	lda #$FF
	sta $15BF
	rep #$30
	lda #$7800
	sta $2116
	lda #$0101
	ldx #$0400
CODE_03CD88:
	sta $2118
	dex
	bne CODE_03CD88
	lda #$7C00
	sta $2116
	lda #$0000
	ldx #$0400
CODE_03CD9A:
	sta $2118
	dex
	bne CODE_03CD9A
	sep #$20
	rep #$10
	jsr CODE_03CFE7
	rep #$10
	ldx #$0000
	stx D, $4A
	ldx #$3000
	stx D, $4C
	ldx #$2C00
	stx D, $44
	ldx #$2C00
	stx D, $46
	lda D, $45
	lsr A
	lsr A
	sta $3038
	lda D, $4B
	lsr A
	lsr A
	lsr A
	lsr A
	ora #$50
	sta $210B
	lda #$01
	sta $2101
	lda #$78
	sta $2107
	lda #$7C
	sta $2108
	lda #$03
	sta $2105
	stz $2123
	stz $2124
	stz $2125
	stz $212A
	stz $212B
	stz $212E
	stz $212F
	stz $2126
	stz $2127
	stz $2130
	lda #$13
	sta $212C
	stz $212D
	stz $2131
	stz $2132
	rep #$20
	ldx #$0000
CODE_03CE15:
	lda $028FD6, X
	sta $7E4169, X
	inx
	inx
	cpx #$0D80
	bmi CODE_03CE15
	sep #$20
	lda #$00
	sta $4310
	lda #$00
	sta $4311
	ldx #$45FC
	stx $4312
	lda #$7E
	sta $4314
	stz $4317
	lda #$00
	sta $4320
	lda #$25
	sta $4321
	ldx #$4610
	stx $4322
	lda #$7E
	sta $4324
	stz $4327
	lda #$00
	sta $4330
	lda #$00
	sta $4331
	ldx #$4605
	stx $4332
	lda #$7E
	sta $4334
	stz $4337
	rep #$20
	lda #$0000
	sta $700090
	lda #$0015
	sta $700064
	lda #$D8C0
	sta $700062
	lda #$5200
	sta $188A
	lda #$1C00
	sta $188C
	sep #$20
	jsr CODE_03AB2B
	jsr CODE_7E33BA
	rep #$20
	lda #$0016
	sta $700064
	lda #$B334
	sta $700062
	lda #$7C00
	sta $188A
	lda #$2000
	sta $188C
	lda #$0020
	sta $700090
	sep #$20
	jsr CODE_03AB7E
	jsr CODE_7E33BA
	jsr CODE_03C74D
	jsr CODE_03CF14
	sep #$20
	rep #$10
	jsr CODE_02F42F
	lda #$80
	sta $7E4608
	sta $7E460A
	sta $7E460C
	lda #$E0
	sta $16DB
	jsr CODE_03BD8D
	sep #$20
	rep #$10
	lda #$08
	sta D, $00
	lda #$31
	sta $4200
	stz $FD
	stz $1FE5
	rep #$20
	lda $038000
	sta $4209
	lda $038002
	sta $4207
	sep #$20
	plp
	rtl

CODE_03CF14:
	php
	sep #$20
	rep #$10
	ldx #$021F
CODE_03CF1C:
	stz $1261
	dex
	bpl CODE_03CF1C
	lda #$04
	sta $4301
	ldx #$0000
	stx $2102
	ldx #$1261
	stx $4302
	lda #$00
	sta $4304
	ldx #$0220
	stx $4305
	lda #$00
	sta $4300
	lda #$01
	sta $420B
	plp
	rtl

CODE_03CF4A:
	stx $2116
	sta $2118
	clc
	adc #$0010
	sta $2118
	clc
	adc #$0010
	sta $2118
	clc
	adc #$0010
	sta $2118
	pha
	txa
	clc
	adc #$0020
	tax
	pla
	sec
	sbc $002F
	stx $2116
	sta $2118
	clc
	adc #$0010
	sta $2118
	clc
	adc #$0010
	sta $2118
	clc
	adc #$0010
	sta $2118
	pha
	txa
	clc
	adc #$0020
	tax
	pla
	sec
	sbc $002F
	stx $2116
	sta $2118
	clc
	adc #$0010
	sta $2118
	clc
	adc #$0010
	sta $2118
	clc
	adc #$0010
	sta $2118
	pha
	txa
	clc
	adc #$0020
	tax
	pla
	sec
	sbc $002F
	stx $2116
	sta $2118
	clc
	adc #$0010
	sta $2118
	clc
	adc #$0010
	sta $2118
	clc
	adc #$0010
	sta $2118
	pha
	txa
	clc
	adc #$0020
	tax
	pla
	sec
	sbc $002F
	rts

CODE_03CFE7:
	php
	sep #$20
	lda #$80
	sta $2115
	rep #$30
	lda #$7800
	sta $2116
	lda #$0100
	ldx #$0400
CODE_03CFFD:
	sta $2118
	dex
	bne CODE_03CFFD
	ldx #$0000
	txy
CODE_03D007:
	phx
	lda $03D3C4, X
	tax
	tya
	jsr CODE_03CF4A
	tya
	clc
	adc #$0040
	cmp #$0100
	bmi CODE_03D01F
	sec
	sbc $00FC
CODE_03D01F:
	tay
	plx
	inx
	inx
	inx
	inx
	cpx #$0040
	bne CODE_03D007
	ldx #$2000
	stx $2116
	ldx #$0000
	ldy #$0020
CODE_03D036:
	stx $2118
	dey
	bne CODE_03D036
	ldx #$5000
	stx $2116
	ldx #$0000
	ldy #$0020
CODE_03D048:
	stx $2118
	dey
	bne CODE_03D048
	lda #$2C00
	sta $2116
	sep #$20
	lda #$80
	sta $2115
	rep #$30
	lda #$2C00
	sta $2116
	lda #$0000
	ldy #$0000
CODE_03D069:
	pha
	lda #$3900
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	pla
	ldx #$0000
CODE_03D089:
	sta $2118
	clc
	adc #$0010
	inx
	cpx #$0010
	bne CODE_03D089
	pha
	lda #$3900
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	pla
	sec
	sbc $00FF
	iny
	cpy #$0010
	bne CODE_03D069
	lda #$3900
	ldx #$0080
CODE_03D0C3:
	sta $2118
	sta $2118
	sta $2118
	sta $2118
	dex
	bne CODE_03D0C3
	plp
	rtl

CODE_03D0D4:
	plp
	rtl

CODE_03D0D6:
	php
	rep #$20
	lda #$0224
	sta $16CE
	sta $7EF0DA
	plp
	rtl

CODE_03D0FB:
	php
	rep #$20
	lda #$019A
	sta $16D4
	plp
	rtl

CODE_03D106:
	php
	rep #$20
	lda #$0184
	sta $16D4
	plp
	rtl

CODE_03D111:
	php
	rep #$20
	lda #$01CC
	sta $16D4
	plp
	rtl

CODE_03D11C:
	php
	sep #$20
	lda $16D8
	beq CODE_03D12C
	cmp #$01
	bne CODE_03D12E
	lda #$00
	jmp CODE_03D12E
CODE_03D12C:
	lda #$01
CODE_03D12E:
	sta $16D8
	plp
	rts

CODE_03D133:
	php
	rep #$30
	lda $7EF0C8
	and #$00FF
	dec
	cmp #$FFFF
	beq CODE_03D1B9
	asl
	tax
	lda $01FBD9, X
	inc
	inc
	sta $7000A6
	lda #$0005
	sta $700206
	lda #$00C0
	sta $7000A8
	lda #$0002
	sta $700062
	sta $70002C
	lda $7EF0C7
	and #$00FF
	sta $7000BC
	txa
	sep #$20
	lda #$01
	ldx #$B509
	jsr CODE_7E4EE9
	rep #$20
	rep #$10
	rep #$30
	lda #$000D
	sta $700206
	lda #$00BE
	sta $7000A8
	lda #$0000
	sta $700062
	sta $70002C
	lda $7EF0C7
	and #$00FF
	sta $7000BC
	txa
	sep #$20
	lda #$01
	ldx #$B509
	jsr CODE_7E4EE9
	rep #$20
	rep #$10
CODE_03D1B9:
	plp
	rts

CODE_03D1BB:
	php
	rep #$30
	lda $16D9
	and #$00FF
	tax
	lda $03D3B3, X
	and #$00FF
	dec
	cmp #$FFFF
	beq CODE_03D24E
	asl
	tax
	lda $01FBD9, X
	inc
	inc
	sta $7000A6
	lda #$0001
	sta $700206
	lda #$00C0
	sta $7000A8
	lda #$0002
	sta $700062
	lda #$0032
	sta $70002C
	lda $7EF0C7
	and #$00FF
	sta $7000BC
	txa
	sep #$20
	lda #$01
	ldx #$B509
	jsr CODE_7E4EE9
	rep #$20
	rep #$10
	rep #$30
	lda #$0004
	sta $700206
	lda #$00BE
	sta $7000A8
	lda #$0000
	sta $700062
	lda #$0030
	sta $70002C
	lda $7EF0C7
	and #$00FF
	sta $7000BC
	txa
	sep #$20
	lda #$01
	ldx #$B509
	jsr CODE_7E4EE9
	rep #$20
	rep #$10
CODE_03D24E:
	plp
	rts

; Missing

CODE_03DB17:
	php
	sep #$20
	rep #$10
	stz $15AB
	stz $15B8
	stz $15B9
	stz $15B5
	rep #$20
	lda #$0000
	sta $700090
	lda #$0014
	sta $700064
	lda #$E0FE
	sta $700062
	lda #$6800
	sta $188A
	lda #$1000
	sta $188C
	sep #$20
	jsr CODE_03AB2B
	jsr CODE_7E33BA
	ldx #$021F
CODE_03DB58:
	stz $1261
	dex
	bpl CODE_03DB58
	lda #$04
	sta $4301
	ldx #$0000
	stx $2102
	ldx #$1261
	stx $4302
	lda #$00
	sta $4304
	ldx #$0220
	stx $4305
	lda #$00
	sta $4300
	lda #$01
	sta $420B
	plp
	rtl

b03p3Col_PreShadedPalette:
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
LevelHeaderTable:
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
LevelScriptCommandJumpTable:
	DW LevelCommand00_LoadObject16BehNum
	DW LevelCommand02
	DW LevelCommand04_LoopSection
	DW LevelCommand06
	DW LevelCommand08_Nop
	DW LevelCommand0A_RandomGroupBeh16
	DW LevelCommand0C
	DW LevelCommand0E_ShowStageNum
	DW LevelCommand10_SetPreset
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
	jml CODE_1FBDEE
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
	lda.l PresetFunctionTable,x
	sta D,TempPresetFuncPtr
	lda.l PresetFunctionTable+1,x
	ora D,TempPresetFuncPtr
	beq LevelCommand64_L1
	plx
	stx LevelScriptPointer
	rts
LevelCommand64_L1:
	plx
	inx
	jmp RunLevelScriptCommands
LevelCommand62:
	tyx
	lda $8001,x
	and #$00FF
	sta $16E1
	lda $8002,x
	sta $16DF
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
	lda $1F13
	ora #$0004
	sta $1F13
	rtl
LoadPreset:
	rep #$20
	ldx Preset
LoadPreset_L1:
	lda.l PresetFunctionTable,x
	sta D,TempPresetFuncPtr
	lda.l PresetFunctionTable+1,x
	sta D,TempPresetFuncPtr+2
	ora D,TempPresetFuncPtr
	beq LoadPreset_L3
	phx
	sep #$20
	lda.b #BANKOF(STACKIFY(LoadPreset_L2))
	pha
	rep #$20
	lda.w #STACKIFY(LoadPreset_L2)
	pha
	sep #$20
	lda D,TempPresetFuncPtr
	pha
	ldx D,TempPresetFuncPtr+2
	dex
	phx
	rtl
LoadPreset_L2:
	rep #$20
	plx
	inx
	inx
	inx
	bra LoadPreset_L1
LoadPreset_L3:
	rtl
LevelCommand0E_ShowStageNum:
	tyx
	lda #$0032
	sta $15B9
	inx
	jmp RunLevelScriptCommands
LevelCommand70_LoadObject8BehNum:
	tyx
	lda $8001,x					;\Get first command param byte...
	and #$00FF					;|
	asl						;|...shift left four bits...
	asl						;|
	asl						;|
	asl						;|
	sta ZTimer					;/...and store in ZTimer
	phx
	ldx FirstObject
	txy
	ldx LastObject
	bne LevelCommand70_LoadObject8BehNum_L1
	tyx
	jmp LevelCommand70_LoadObject8BehNum_L12
LevelCommand70_LoadObject8BehNum_L1:
	lda D,$00,x
	sta LastObject
	tya
	bne LevelCommand70_LoadObject8BehNum_L2
	lda FirstObject
	sta D,$00,x
	stz D,$02,x
	stx FirstObject
	bra LevelCommand70_LoadObject8BehNum_L3
LevelCommand70_LoadObject8BehNum_L2:
	lda $0000,y
	sta D,$00,x
	stx D,$00,y
	sty D,$02,x
LevelCommand70_LoadObject8BehNum_L3:
	ldy D,$00,x
	beq LevelCommand70_LoadObject8BehNum_L4
	stx D,$0002,y
LevelCommand70_LoadObject8BehNum_L4:
	txy
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda $8002,x
	bit #$0080
	beq LevelCommand70_LoadObject8BehNum_L5
	ora #$FF00
	bra LevelCommand70_LoadObject8BehNum_L6
LevelCommand70_LoadObject8BehNum_L5:
	and #$00FF
LevelCommand70_LoadObject8BehNum_L6:
	asl
	asl
	sta $000C,y
	lda $8003,x
	bit #$0080
	beq LevelCommand70_LoadObject8BehNum_L7
	ora #$FF00
	bra LevelCommand70_LoadObject8BehNum_L8
LevelCommand70_LoadObject8BehNum_L7:
	and #$00FF
LevelCommand70_LoadObject8BehNum_L8:
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
	ldy $1238
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
	sty $16F7
	jsr CODE_03F6B3
	lda ZTimer
	bne LevelCommand70_LoadObject8BehNum_L11
	jmp RunLevelScriptCommands
LevelCommand70_LoadObject8BehNum_L11:
	stx LevelScriptPointer
	rts
LevelCommand70_LoadObject8BehNum_L12:
	rep #$20
	ldx #$0000
	stx $16F7
	plx
	jsr CODE_03F6B3
	lda $16FB
	bne LevelCommand70_LoadObject8BehNum_L11
	jmp RunLevelScriptCommands
CODE_03F6B3:
	lda $8000,x
	and #$00FF
	cmp #$0076
	beq CODE_03F6C5
	txa
	clc
	adc #$0007
	tax
	rts
CODE_03F6C5:
	txa
	clc
	adc #$0006
	tax
	rts
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
	ldx LastObject
	bne LevelCommand72_L1
	tyx
	jmp LevelCommand72_L12
LevelCommand72_L1:
	lda D,$00,x
	sta LastObject
	tya
	bne LevelCommand72_L2
	lda FirstObject
	sta D,$00,x
	stz D,$02,x
	stx FirstObject
	bra LevelCommand72_L3
LevelCommand72_L2:
	lda $0000,y
	sta D,$00,x
	stx D,$00,y
	sty D,$02,x
LevelCommand72_L3:
	ldy D,$00,x
	beq LevelCommand72_L4
	stx D,$02,y
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
	ldy $1238
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
	sty $16F7
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
	stz $16F7
	pla
	clc
	adc #$0007
	tax
	lda ZTimer
	bne LevelCommand72_L11
	jmp RunLevelScriptCommands
LevelCommand00_LoadObject16BehNum:
	tyx
	lda $8001,x
	sta ZTimer
	phx
	ldx FirstObject
	txy
	ldx LastObject
	bne LevelCommand00_LoadObject16BehNum_L1
	tyx
	jmp LevelCommand00_LoadObject16BehNum_L6
LevelCommand00_LoadObject16BehNum_L1:
	lda D,$00,x
	sta LastObject
	tya
	bne LevelCommand00_LoadObject16BehNum_L2
	lda FirstObject
	sta D,$00,x
	stz D,$02,x
	bra LevelCommand00_LoadObject16BehNum_L3
LevelCommand00_LoadObject16BehNum_L2:
	lda $0000,y
	sta D,$00,x
	stx D,$00,y
	sty D,$02,x
LevelCommand00_LoadObject16BehNum_L3:
	ldy D,$00,x
	beq LevelCommand00_LoadObject16BehNum_L4
	stx D,$00,y
LevelCommand00_LoadObject16BehNum_L4:
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
	ldy $1238
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
	sta $0004,x
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
	sty $16F7
	rep #$20
	txa
	clc
	adc #$000B
	tax
	lda ZTimer
	bne LevelCommand00_LoadObject16BehNum_L5
	jmp RunLevelScriptCommands
LevelCommand00_LoadObject16BehNum_L5:
	stx LevelScriptPointer
	rts
LevelCommand00_LoadObject16BehNum_L6:
	rep #$20
	stz $16F7
	pla
	clc
	adc #$000B
	tax
	lda ZTimer
	bne LevelCommand00_LoadObject16BehNum_L5
	jmp RunLevelScriptCommands
LevelCommand74_LoadMacroObj16:
	tyx
	lda $8001,x
	sta ZTimer
	phx
	ldx FirstObject
	txy
	ldx LastObject
	bne LevelCommand74_LoadMacroObj16_L1
	tyx
	jmp LevelCommand74_LoadMacroObj16_L6
LevelCommand74_LoadMacroObj16_L1:
	lda D,$00,x
	sta LastObject
	tya
	bne LevelCommand74_LoadMacroObj16_L2
	lda FirstObject
	sta D,$00,x
	stz D,$02,x
	stx FirstObject
	bra LevelCommand74_LoadMacroObj16_L3
LevelCommand74_LoadMacroObj16_L2:
	lda $0000,y
	sta D,$00,x
	stx D,$00,y
	sty D,$02,x
LevelCommand74_LoadMacroObj16_L3:
	ldy D,$00,x
	beq LevelCommand74_LoadMacroObj16_L4
	stx D,$02,y
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
	ldy $1238
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
	sty $16F7
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
LevelCommand74_LoadMacroObj16_L6:
	rep #$20
	stz $16F7
	pla
	clc
	adc #$000C
	tax
	lda ZTimer
	bne LevelCommand74_LoadMacroObj16_L5
	jmp RunLevelScriptCommands
LevelCommand02_Stop:
	tyx
	stx LevelScriptPointer
	rts
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
	ldx LastObject
	bne LevelCommand86_LoadObject16BehAddr_L1
	tyx
	jmp LevelCommand86_LoadObject16BehAddr_L7
LevelCommand86_LoadObject16BehAddr_L1:
	lda D,$00,x
	sta LastObject
	tya
	bne LevelCommand86_LoadObject16BehAddr_L2
	lda FirstObject
	sta D,$00,x
	stz D,$02,x
	stx FirstObject
	bra LevelCommand86_LoadObject16BehAddr_L3
LevelCommand86_LoadObject16BehAddr_L2:
	lda $0000,y
	sta D,$00,x
	stx D,$00,y
	sty D,$02,x
LevelCommand86_LoadObject16BehAddr_L3:
	ldy D,$00,x
	beq LevelCommand86_LoadObject16BehAddr_L4
	stx D,$02,y
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
	ldy $1238
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
	stz $16F7
	pla
	clc
	adc #$000E
	tax
	bra LevelCommand86_LoadObject16BehAddr_L5
LevelCommand0A_RandomGroupBeh16:
	tyx
	lda $8001,x
	sta ZTimer
	phx
	ldx FirstObject
	txy
	ldx LastObject
	bne LevelCommand0A_RandomGroupBeh16_L1
	tyx
	jmp LevelCommand0A_RandomGroupBeh16_L7
LevelCommand0A_RandomGroupBeh16_L1:
	lda D,$00,x
	sta LastObject
	tya
	bne LevelCommand0A_RandomGroupBeh16_L2
	lda FirstObject
	sta D,$00,x
	stz D,$02,x
	stx FirstObject
	bra LevelCommand0A_RandomGroupBeh16_L3
LevelCommand0A_RandomGroupBeh16_L2:
	lda $0000,y
	sta D,$00,x
	stx D,$00,y
	sty D,$02,x
LevelCommand0A_RandomGroupBeh16_L3:
	ldy D,$00,x
	beq LevelCommand0A_RandomGroupBeh16_L4
	stx D,$0002,y
LevelCommand0A_RandomGroupBeh16_L4:
	txy
	sty $16F7
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda $8003,x
	sta $000C,y
	lda $8005,x
	sta $000E,y
	phy
	ldy $1238
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
LevelCommand0A_RandomGroupBeh16_L5:
	lda ZTimer
	bne LevelCommand0A_RandomGroupBeh16_L6
	jmp RunLevelScriptCommands
LevelCommand0A_RandomGroupBeh16_L6:
	stx LevelScriptPointer
	rts
LevelCommand0A_RandomGroupBeh16_L7:
	rep #$20
	stz $16F7
	pla
	clc
	adc #$0010
	tax
	bra LevelCommand0A_RandomGroupBeh16_L5
LevelCommand0C:
	ldx FirstObject
	beq LevelCommand0C_L2
LevelCommand0C_L1:
	lda D,$00,x
	tax
	beq LevelCommand0C_L2
	lda $8003,y
	cmp D,$04,x
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
	inx
	inx
	inx
	lda $7FFE,x
	beq LevelCommand12_Return
	sta ZTimer
	stx LevelScriptPointer
	rts
LevelCommand12_Return:
	jmp RunLevelScriptCommands
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SWARM PROCESSING ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
ProcessSwarm:
	php
	rep #$20
ProcessSwarm_Loop:
	lda D,$26,x
	bmi ProcessSwarm_RunCmd
	bne ProcessSwarm_End
ProcessSwarm_RunCmd:
	phx
	lda D,$06,x
	txy
	tax
	pea #STACKIFY(ProcessSwarm_Return)
	lda.l $058001,x
	sta $0026,y
	lda.l $058000,x
	and #$00FF
	tax
	jmp (SwarmCommandJumpTable,x)
SwarmCommandJumpTable:
	DW SwarmCommand00_LoadObject
	DW SwarmCommand02_IncHP
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
	sbc $1701
	sta D,$26,x
	plp
	rtl
SwarmCommand00_LoadObject:
	lda $0006,y
	tax
	phy
	lda $000C,y
	sta D,$02
	lda $000E,y
	sta D,$08
	lda $0010,y
	sta D,$90
	phx
	ldx FirstObject
	txy
	ldx LastObject
	bne CODE_03FBDC
	tyx
	jmp CODE_03FC70
CODE_03FBDC:
	lda D,$00,x
	sta LastObject
	tya
	bne CODE_03FBF0
	lda FirstObject
	sta D,$00,x
	stz D,$02,x
	stx FirstObject
	bra CODE_03FBF9
CODE_03FBF0:
	lda $0000,y
	sta D,$00,x
	stx D,$00,y
	sty D,$02,x
CODE_03FBF9:
	ldy D,$00,x
	beq CODE_03FBFF
	stx D,$02,y
CODE_03FBFF:
	txy
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda D,$02
	clc
	adc.l $058003,x
	sta $000C,y
	lda D,$08
	clc
	adc.l $058005,x
	sta $000E,y
	lda D,$90
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
CODE_03FC70:
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
	lda $1755
	cmp.l $058003,x
	bcs CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCC0:
	lda $1755
	cmp.l $058003,x
	bcc CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCCB:
	lda $1755
	cmp.l $058003,x
	beq CODE_03FCE1
	bra CODE_03FCEA
CODE_03FCD6:
	lda $1755
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
	stz $1755
	lda.l $058003,x
	ldx FirstObject
CODE_03FD04:
	cmp D,$04,x
	bne CODE_03FD0B
	inc $1755
CODE_03FD0B:
	ldy D,$00,x
	tyx
	bne CODE_03FD04
	plx
	ply
	txa
	clc
	adc #$0005
	sta $0006,y
	rts
SwarmCommand02_IncHP:
	lda $0006,y
	tax
	sep #$20
	lda.l $058005,x
	sta D,$02
	lda $0024,y
	inc
	cmp D,$02
	bmi CODE_03FD3F
	lda #$00
	sta $0024,y
	rep #$20
	txa
	clc
	adc #$0006
	sta $0006,y
	rts
CODE_03FD3F:
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
	sta D,$04
	jsl CODE_02FC58
	sta D,$05
	jsl CODE_02FC58
	sta D,$0A
	jsl CODE_02FC58
	sta D,$0B
	jsl CODE_02FC58
	sta $15C2
	jsl CODE_02FC58
	sta $15C3
	rep #$20
	lda.l $058003,x
	beq CODE_03FD98
	lsr
	sta D,$02
	lda.l $058003,x
	dec
	and D,$04
	sec
	sbc D,$02
CODE_03FD98:
	clc
	adc $000C,y
	sta D,$02
	lda.l $058005,x
	beq CODE_03FDB1
	lsr
	sta D,$08
	lda.l $058005,x
	dec
	and D,$0A
	sec
	sbc D,$08
CODE_03FDB1:
	clc
	adc $000E,y
	sta D,$08
	lda.l $058007,x
	beq CODE_03FDCB
	lsr
	sta D,$90
	lda.l $058007,x
	dec
	and $15C2
	sec
	sbc D,$90
CODE_03FDCB:
	clc
	adc $0010,y
	sta D,$90
	ldx FirstObject
	txy
	ldx LastObject
	bne CODE_03FDDE
	tyx
	jmp CODE_03FE63
CODE_03FDDE:
	lda D,$00,x
	sta LastObject
	tya
	bne CODE_03FDF2
	lda FirstObject
	sta D,$00,x
	stz D,$02,x
	stx FirstObject
	bra CODE_03FDFB
CODE_03FDF2:
	lda $0000,y
	sta D,$00,x
	stx D,$00,y
	sty D,$02,x
CODE_03FDFB:
	ldy D,$00,x
	beq CODE_03FE01
	stx D,$02,y
CODE_03FE01:
	txy
	plx
	sep #$20
	jsl ClearObject
	rep #$20
	lda D,$02
	sta $000C,y
	lda D,$08
	sta $000E,y
	lda D,$90
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
