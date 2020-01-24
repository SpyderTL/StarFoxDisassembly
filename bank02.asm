<<<<<<< HEAD
	ARCH 65816
	
	BASE $7E3193
RunNMITask:
	ldx D,$00
	jmp (NMITaskJumpTable,x)
NMITaskJumpTable:
	DW CODE_7E3AF4
	DW CODE_7E3AFD
	DW CODE_7E3B46
	DW CODE_7E3BAA
	DW CODE_7E3510
	DW CODE_7E3831
	DW CODE_7E383A
	DW CODE_7E3843
	DW CODE_7E32B2	;
	DW CODE_7E3308	;
	DW CODE_7E33BA	;
	DW CODE_7E335F	;
	DW CODE_7E38DF
	DW CODE_7E39EA
	DW CODE_7E3A39
	DW CODE_7E3A98
	DW CODE_7E39DB
	DW CODE_7E33EA	;
	DW InitializeMode1
	DW InitializeMode2
InitializeMode1:
	rep #$10
	lda.b #$0A
	sta $120E
	sta HDMAEN
	lda.b #$01
	sta BGMODE
	stz $18C2
	lda.b #$13
	sta TM
	lda.b #$74
	sta BG3SC
	lda.b #$07
	sta BG34NBA
	stz BG2VOFS
	stz BG2VOFS
	stz $18B8
	stz $1F0E
	stz $1F0B
	stz $16A2
	lda.b #$01
	sta $1897
	jsl CODE_02F492
	rep #$20
	lda.w #$8FAA
	sta $004F
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0080
	stz $01B0
	stz $1EEB
	stz $1F09
	stz $169E
	lda.w #$0000
	sta $A05C
	sep #$20
	stz $1FC6
	stz $1EF1
	stz $1FE4
	stz D,$00
	rtl
InitializeMode2:
	rep #$10
	lda.b #$0A
	sta $120E
	sta HDMAEN
	lda.b #$02
	sta BGMODE
	stz $18C2
	lda.b #$13
	sta TM
	stz BG3SC
	stz BG3HOFS
	stz BG3HOFS
	stz BG3VOFS
	stz BG3VOFS
	lda.b #$2F
	sta BG3SC
	lda #$E0
	sta BG3HOFS
	stz BG3VOFS
	stz BG2VOFS
	stz BG2VOFS
	stz $18B8
	stz $1F0E
	stz $1F0B
	stz $16A2
	lda.b #$01
	sta $1897
	jsl CODE_02F492
	rep #$20
	lda.w #$8FAA
	sta $700050
	sep #$20
	rep #$10
	rep #$20
	lda.w #$0080
	sta $7001B0
	stz $1EEB
	stz $1F09
	stz $169E
	lda.w #$0000
	sta $7EA05C
	sep #$20
	stz $7FE4
	stz $1FC6
	stz $1EF1
	stz D,$00
	rtl
CODE_7E32B2:
	
CODE_7E3308:
	
CODE_7E335F:
	
CODE_7E33BA:
	
CODE_7E33EA:
	

	
	END BASE
	
=======
	ARCH 65816
>>>>>>> 388c70ca21b4585449116f4be970d935f40c333b
