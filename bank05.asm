	;Script to initialize player Arwing objects
	DL $0D00FB
	;Offsets to the level pointer lists below
	DW $001E,$0030,$0009
	;Level 3
	DL $0D62F5,$0D651C,$0D6577,$0D65FE,$0D6742,$0D67DF,$0D684F
	;Level 2
	DL $0D5C8C,$0D5E72,$0D5ECD,$0D5F50,$0D5FAB,$0D601B
	;Level 1
	DL $0D4F8E,$0D518E,$0D51E9,$0D54AC,$0D5528,$0D55A5
	;Additional level scripts
	INCBIN "levels/titania_main.bin"
	INCBIN "levels/titania_boss_b.bin"
	INCBIN "levels/titania_boss_a.bin"
	INCBIN "levels/sectory_main.bin"
	INCBIN "levels/venom2atmosphere_main.bin"
	INCBIN "levels/highway_main.bin"
	INCBIN "levels/unknown_059948.bin"
	INCBIN "levels/fortuna_main.bin"
	INCBIN "levels/unknown_059FA4.bin"
	INCBIN "levels/sectorz_main.bin"
	INCBIN "levels/unknown_05B473.bin"
	INCBIN "levels/macbeth_main.bin"
	INCBIN "levels/venom3atmosphere_main.bin"
	INCBIN "levels/unknown_05C2F2.bin"
	INCBIN "levels/venom3_main.bin"
	INCBIN "levels/unknown_05D19B.bin"
	INCBIN "levels/asteroid1_end.bin"
	INCBIN "levels/sectorz_end.bin"
	INCBIN "levels/spacearmada_end.bin"
	INCBIN "levels/sectorx_end.bin"
	INCBIN "levels/asteroid3_end.bin"
	INCBIN "levels/macbeth_end.bin"
	INCBIN "levels/venomatmosphere_end.bin"
	INCBIN "levels/venom1atmosphere_main.bin"
	INCBIN "levels/corneria3_main.bin"
	INCBIN "levels/asteroid3_main.bin"
	;(05F691)
