UnusedBank06SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/

CODE_068004:
	rep #$20
	stz $18C5
	stz $18C7
	stz $18C9
	stz $1956
	lda #$0000
	sta $70019A
	sep #$20
	stz $14D0
	lda #$08
	sta $14D1
	stz $14D3
	stz $14D2






















	ARCH SUPERFX
CODE_06FB5D:
	alt1
	lms r7,($00C6)
	with r7
	asr
	from r7
	asr
	asr
	iwt r7,#$0080
	add r7
	alt1
	lms r6,($D8)
	












CODE_06FBE6:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	alt1
	stb r7
	loop
	nop
	stop
	nop
	
	
	
	
	
	ARCH 65816