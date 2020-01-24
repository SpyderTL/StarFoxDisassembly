<<<<<<< HEAD
	;Additional level scripts
	INCBIN "levels/scramble.bin"
	INCBIN "levels/init_players.bin"
	INCBIN "levels/corneria2_main.bin"
	INCBIN "levels/corneria1_main.bin"
	INCBIN "levels/sectorx_main.bin"
	INCBIN "levels/asteroid1_main.bin"
	INCBIN "levels/spacearmada_main_b.bin"
	INCBIN "levels/spacearmada_main_c.bin"
	INCBIN "levels/spacearmada_main_d.bin"
	INCBIN "levels/spacearmada_main_e.bin"
	INCBIN "levels/spacearmada_main_f.bin"
	INCBIN "levels/spacearmada_main_g.bin"
	INCBIN "levels/spacearmada_boss.bin"
	INCBIN "levels/meteor_main.bin"
	INCBIN "levels/unknown_0DBB77.bin"
	INCBIN "levels/venom1_main.bin"
	;Main level scripts
	INCBIN "levels/blackhole.bin"
	INCBIN "levels/outofthisdimension.bin"
	;Additional level scripts
	INCBIN "levels/outofthisdimension_main.bin"
	INCBIN "levels/unknown_0DCB4D.bin"
	INCBIN "levels/venom_end.bin"
	INCBIN "levels/corneria_end.bin"
	;Main level scripts
	INCBIN "levels/corneria1.bin"
	INCBIN "levels/asteroid1.bin"
	INCBIN "levels/spacearmada.bin"
	INCBIN "levels/meteor.bin"
	INCBIN "levels/venom1atmosphere.bin"
	INCBIN "levels/venom1.bin"
	;Additional level script
	INCBIN "levels/venom_boss.bin"
	;Main level scripts
	INCBIN "levels/corneria2.bin"
	INCBIN "levels/sectorx.bin"
	INCBIN "levels/titania.bin"
	INCBIN "levels/sectory.bin"
	INCBIN "levels/venom2atmosphere.bin"
	INCBIN "levels/highway.bin"
	INCBIN "levels/corneria3.bin"
	INCBIN "levels/asteroid3.bin"
	INCBIN "levels/fortuna.bin"
	INCBIN "levels/sectorz.bin"
	INCBIN "levels/macbeth.bin"
	INCBIN "levels/venom3atmosphere.bin"
	INCBIN "levels/venom3.bin"
	INCBIN "levels/unknown_0DE889.bin"
	INCBIN "levels/sectory_end.bin"
	INCBIN "levels/unknown_0DEA31.bin"
	INCBIN "levels/titania_end.bin"
	INCBIN "levels/spacearmada_main_a.bin"
	INCBIN "levels/blackhole_main.bin"
	INCBIN "levels/training.bin"
	INCBIN "levels/ending.bin"
	INCBIN "levels/ending_main_a.bin"
	INCBIN "levels/ending_main_b.bin"
	INCBIN "levels/intro.bin"
	INCBIN "levels/title.bin"
	INCBIN "levels/controls.bin"
	;(0DF99D)
=======
b0Ds9LevScript_ScrambleLevelScript:	;0D8000
	;Add tunnel and arch wireframe objects
	DB $86,$00,$00,$00,$00,$00,$00,$FA,$00,$48,$BB,$5D,$F1,$08
	DB $3C,$DF,$FC,$01
	DB $86,$00,$00,$00,$00,$00,$00,$FA,$00,$64,$BB,$3F,$87,$06
	DB $3C,$DF,$FC,$01
	DB $86,$00,$00,$00,$00,$00,$00,$1A,$04,$48,$BB,$5D,$F1,$08
	DB $3C,$DF,$FC,$01
	DB $86,$00,$00,$00,$00,$00,$00,$1A,$04,$64,$BB,$3F,$87,$06
	DB $3C,$DF,$FC,$01
	DB $86,$00,$00,$00,$00,$00,$00,$3A,$07,$48,$BB,$5D,$F1,$08
	DB $3C,$DF,$FC,$01
	DB $86,$00,$00,$00,$00,$00,$00,$3A,$07,$64,$BB,$3F,$87,$06
	DB $3C,$DF,$FC,$01
	;Add three arwing objects
	DB $86,$00,$00,$D8,$FF,$00,$00,$38,$FF,$04,$D3,$73,$86,$07
	DB $38,$26,$00,$BA,$FF
	DB $36,$22,$00,$3C
	DB $86,$00,$00,$28,$00,$00,$00,$38,$FF,$04,$D3,$73,$86,$07
	DB $38,$26,$00,$BA,$FF
	DB $36,$22,$00,$32
	DB $86,$00,$00,$00,$00,$00,$00,$D4,$FE,$04,$D3,$73,$86,$07
	DB $38,$26,$00,$9C,$FF
	DB $36,$22,$00,$FF
	;Add more tunnel and arch objects
	DB $8A,$2D
	DB $86,$00,$00,$00,$00,$00,$00,$3A,$07,$48,$BB,$5D,$F1,$08
	DB $3C,$DF,$FC,$01
	DB $86,$00,$00,$00,$00,$00,$00,$3A,$07,$64,$BB,$3F,$87,$06
	DB $3C,$DF,$FC,$01
	DB $04,$B1,$00,$07,$00
	;Add a solid tunnel object, and check if the cutscene has finished
	DB $8A,$2D
	DB $86,$00,$00,$00,$00,$00,$00,$3A,$07,$80,$BB,$5D,$F1,$08
	DB $3C,$DF,$FC,$01
	DB $2C,$B9,$8B,$06,$FA,$00
	DB $2E,$DC,$00,$0D		;$D00DC is a pointer here
	;Return to whatever script sent us here
	DB $2A

b0Ds9LevScript_UnkLevScript0D80FB:	;0D80FB
	DB $76,$00,$00,$F8,$00,$00
	DB $38,$10,$00,$00,$00
	DB $76,$00,$00,$00,$00,$01
	DB $38,$10,$00,$00,$00
	DB $76,$00,$00,$00,$00,$02
	DB $38,$10,$00,$00,$00
	DB $76,$00,$00,$00,$00,$03
	DB $38,$10,$00,$00,$00
	DB $5C,$01,$D2,$1F,$00
	DB $02
	DB $78
	;BEGINNING OF ASM BLOCK
	sep #$20
	rep #$10
	lda #$0D
	ldx #$13F
	jsl $99382
	ldx #$13F
	rtl
	;END OF ASM BLOCK
	
	
>>>>>>> 388c70ca21b4585449116f4be970d935f40c333b
