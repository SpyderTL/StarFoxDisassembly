	;Script to initialize player Arwing objects
InitPlayersScriptPointer:
	DL $0D00FB
	;Offsets to the level pointer lists below
LevelScriptPointerTable:
	DW Level3Scripts-$8000,Level2Scripts-$8000,Level1Scripts-$8000
	;Level 3
Level3Scripts:
	DL $0D62F5,$0D651C,$0D6577,$0D65FE,$0D6742,$0D67DF,$0D684F
	;Level 2
Level2Scripts:
	DL $0D5C8C,$0D5E72,$0D5ECD,$0D5F50,$0D5FAB,$0D601B
	;Level 1
Level1Scripts:
	DL $0D4F8E,$0D518E,$0D51E9,$0D54AC,$0D5528,$0D55A5
	;Additional level scripts
	INCBIN "levels/titania_main.lev"
	INCBIN "levels/titania_boss_b.lev"
	INCBIN "levels/titania_boss_a.lev"
	INCBIN "levels/sectory_main.lev"
	INCBIN "levels/venom2atmosphere_main.lev"
	INCBIN "levels/highway_main.lev"
	INCBIN "levels/unknown_059948.lev"
	INCBIN "levels/fortuna_main.lev"
	INCBIN "levels/unknown_059FA4.lev"
	INCBIN "levels/sectorz_main.lev"
	INCBIN "levels/unknown_05B473.lev"
	INCBIN "levels/macbeth_main.lev"
	INCBIN "levels/venom3atmosphere_main.lev"
	INCBIN "levels/unknown_05C2F2.lev"
	INCBIN "levels/venom3_main.lev"
	;Swarm data
	INCBIN "levels/swarms.sw"
	;Additional level scripts
	INCBIN "levels/asteroid1_end.lev"
	INCBIN "levels/sectorz_end.lev"
	INCBIN "levels/spacearmada_end.lev"
	INCBIN "levels/sectorx_end.lev"
	INCBIN "levels/asteroid3_end.lev"
	INCBIN "levels/macbeth_end.lev"
	INCBIN "levels/venomatmosphere_end.lev"
	INCBIN "levels/venom1atmosphere_main.lev"
	INCBIN "levels/corneria3_main.lev"
	INCBIN "levels/asteroid3_main.lev"
	;Compressed tiles
	INCBIN "graphics/compressed/unk05FECD.binz"		;char (00FF96)
