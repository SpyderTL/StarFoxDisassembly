UnusedBank04SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/

;BEHAVIOR FUNCTION ID $F2
BehF2:
	lda.b #$0A					;\Set enemy HP to 10
	sta.b $2A,x					;/
	lda.b #$0A					;\Set enemy power to 10
	sta.b $2B,x					;/
	bra Beh9C
;BEHAVIOR FUNCTION ID $E4
BehE4:
	lda.b $1E,x
	ora.b #$01
	sta.b $1E,x
	lda.b $1D,x
	ora.b #$40
	sta.b $1D,x
	lda.b #$0A					;\Set enemy HP to 10
	sta.b $2A,x					;/
	lda.b #$08					;\Set enemy power to 8
	sta.b $2B,x					;/
;BEHAVIOR FUNCTION ID $9C
Beh9C:
	rep #$20
	lda.w #Beh9C_E4_F2_Loop
	sta.b $16,x
	sep #$20
	lda.b #BANKOF(Beh9C_E4_F2_Loop)
	sta.b $18,x
	lda.b #$04
	sta.w Object2ListRel+$0B,x
	lda.b #$06
	sta.w Object2ListRel+$08,x
	rep #$20
	lda.w #$A2DE
	sta.w Object2ListRel+$09,x
	lda.w #$F45F
	sta.w Object2ListRel+$06,x
	sep #$20
	lda.b $2E,x
	ora.b #$10
	sta.b $2E,x
	lda.b $1D,x					;\Enable shadow for this object
	ora.b #FLAGS1D_HASSHADOW			;|
	sta.b $1D,x					;/
	lda.b #$00
	sta.b $25,x
	stz.w $F0B0
	stz.w $F0B1
Beh9C_E4_F2_Loop:
	ldy.b $28,x
	phx
	tyx
	lda.l DATA_04A413,x
	plx
	sta.w Object2ListRel+$12,x
	rep #$20
	lda.w #BehCommandJumpTable
	sta.b $53
	sep #$20
	lda.b #BANKOF(BehCommandJumpTable)
	sta.b $55
	jml DoJumpTable
BehCommandJumpTable:
	JUMPTABLE(BehCommand00)
	JUMPTABLE(BehCommand01)
	JUMPTABLE(BehCommand02)
	JUMPTABLE(BehCommand03)
	JUMPTABLE(BehCommand04)
	JUMPTABLE(BehCommand05)
	JUMPTABLE(BehCommand06)
	JUMPTABLE(BehCommand07)
	JUMPTABLE(BehCommand08)
	JUMPTABLE(BehCommand09)
	JUMPTABLE(BehCommand0A)
	JUMPTABLE(BehCommand0B)
	JUMPTABLE(BehCommand0C)
	JUMPTABLE(BehCommand0D)
	JUMPTABLE(BehCommand0E)
	JUMPTABLE(BehCommand0F)
	JUMPTABLE(BehCommand10)
	JUMPTABLE(BehCommand11)
	JUMPTABLE(BehCommand12)
	JUMPTABLE(BehCommand13)
	JUMPTABLE(BehCommand14)
	JUMPTABLE(BehCommand15)
	JUMPTABLE(BehCommand16)
	JUMPTABLE(BehCommand17)
	JUMPTABLE(BehCommand18)
	JUMPTABLE(BehCommand19)
	JUMPTABLE(BehCommand1A)
	JUMPTABLE(BehCommand1B)
	JUMPTABLE(BehCommand1C)
	JUMPTABLE(BehCommand1D)
	JUMPTABLE(BehCommand1E)
	JUMPTABLE(BehCommand1F)
	JUMPTABLE(BehCommand20)
	JUMPTABLE(BehCommand21_Jump)
	JUMPTABLE(BehCommand22)
	JUMPTABLE(BehCommand23)
	JUMPTABLE(BehCommand24)
	JUMPTABLE(BehCommand25)
	JUMPTABLE(BehCommand26)
	JUMPTABLE(BehCommand27)
	JUMPTABLE(BehCommand28)
	JUMPTABLE(BehCommand29)
	JUMPTABLE(BehCommand2A)
	JUMPTABLE(BehCommand2B)
	JUMPTABLE(BehCommand2C_BranchIfRightOfPlayer)
	JUMPTABLE(BehCommand2D_BranchIfLeftOfPlayer)
	JUMPTABLE(BehCommand2E_BranchIfBelowPlayer)
	JUMPTABLE(BehCommand2F_BranchIfAbovePlayer)
	JUMPTABLE(BehCommand30)
	JUMPTABLE(BehCommand31)
	JUMPTABLE(BehCommand32)
	JUMPTABLE(BehCommand33)
	JUMPTABLE(BehCommand34)
	JUMPTABLE(BehCommand35)
	JUMPTABLE(BehCommand36)
	JUMPTABLE(BehCommand37)
	JUMPTABLE(BehCommand38)
	JUMPTABLE(BehCommand39)
	JUMPTABLE(BehCommand3A)
	JUMPTABLE(BehCommand3B)
	JUMPTABLE(BehCommand3C)
	JUMPTABLE(BehCommand3D)
	JUMPTABLE(BehCommand3E)
	JUMPTABLE(BehCommand3F)
	JUMPTABLE(BehCommand40)
	JUMPTABLE(BehCommand41)
	JUMPTABLE(BehCommand42)
	JUMPTABLE(BehCommand43)
	JUMPTABLE(BehCommand44)
	JUMPTABLE(BehCommand45_ShootProjectile)
	JUMPTABLE(BehCommand46)
	JUMPTABLE(BehCommand47_ShootProjectileAtPlayer)
	JUMPTABLE(BehCommand48)
	JUMPTABLE(BehCommand49_ShootProjectileAtTarget)
	JUMPTABLE(BehCommand4A_SetProjectileType)
	JUMPTABLE(BehCommand4B)
	JUMPTABLE(BehCommand4C)
	JUMPTABLE(BehCommand4D)
	JUMPTABLE(BehCommand4E)
	JUMPTABLE(BehCommand4F)
	JUMPTABLE(BehCommand50)
	JUMPTABLE(BehCommand51)
	JUMPTABLE(BehCommand52)
	JUMPTABLE(BehCommand53)
	JUMPTABLE(BehCommand54)
	JUMPTABLE(BehCommand55)
	JUMPTABLE(BehCommand56)
	JUMPTABLE(BehCommand57)
	JUMPTABLE(BehCommand58)
	JUMPTABLE(BehCommand59)
	JUMPTABLE(BehCommand5A)
	JUMPTABLE(BehCommand5B)
	JUMPTABLE(BehCommand5C)
	JUMPTABLE(BehCommand5D)
	JUMPTABLE(BehCommand5E)
	JUMPTABLE(BehCommand5F)
	JUMPTABLE(BehCommand60)
	JUMPTABLE(BehCommand61)
	JUMPTABLE(BehCommand62)
	JUMPTABLE(BehCommand63)
	JUMPTABLE(BehCommand64)
	JUMPTABLE(BehCommand65)
	JUMPTABLE(BehCommand66)
	JUMPTABLE(BehCommand67)
	JUMPTABLE(BehCommand68)
	JUMPTABLE(BehCommand69)
	JUMPTABLE(BehCommand6A)
	JUMPTABLE(BehCommand6B)
	JUMPTABLE(BehCommand6C)
	JUMPTABLE(BehCommand6D)
	JUMPTABLE(BehCommand6E)
	JUMPTABLE(BehCommand6F)
	JUMPTABLE(BehCommand70_RunASMBlock)
	JUMPTABLE(BehCommand71)
	JUMPTABLE(BehCommand72)
	JUMPTABLE(BehCommand73_EnableShadow)
	JUMPTABLE(BehCommand74_DisableShadow)
	JUMPTABLE(BehCommand75_PlaySoundEffect)
	JUMPTABLE(BehCommand76)
	JUMPTABLE(BehCommand77)
	JUMPTABLE(BehCommand78)
	JUMPTABLE(BehCommand79)
	JUMPTABLE(BehCommand7A)
	JUMPTABLE(BehCommand7B)
	JUMPTABLE(BehCommand7C)
	JUMPTABLE(BehCommand7D)
	JUMPTABLE(BehCommand7E)
	JUMPTABLE(BehCommand7F)
	JUMPTABLE(BehCommand80)
	JUMPTABLE(BehCommand81)
	JUMPTABLE(BehCommand82)
	JUMPTABLE(BehCommand83)
	JUMPTABLE(BehCommand84)
	JUMPTABLE(BehCommand85)
	JUMPTABLE(BehCommand86)
	JUMPTABLE(BehCommand87)
	JUMPTABLE(BehCommand88)
	JUMPTABLE(BehCommand89)
	JUMPTABLE(BehCommand8A)
	JUMPTABLE(BehCommand8B)
	JUMPTABLE(BehCommand8C)
	JUMPTABLE(BehCommand8D)
	JUMPTABLE(BehCommand8E)
	JUMPTABLE(BehCommand8F)
	JUMPTABLE(BehCommand90)
	JUMPTABLE(BehCommand91)
	JUMPTABLE(BehCommand92)
	JUMPTABLE(BehCommand93)
	JUMPTABLE(BehCommand94)
	JUMPTABLE(BehCommand95)
	JUMPTABLE(BehCommand96)
	JUMPTABLE(BehCommand97)
	JUMPTABLE(BehCommand98)
	JUMPTABLE(BehCommand99)
	JUMPTABLE(BehCommand9A)
	JUMPTABLE(BehCommand9B)
	JUMPTABLE(BehCommand9C)
	JUMPTABLE(BehCommand9D)
	JUMPTABLE(BehCommand9E_AddRotX)
	JUMPTABLE(BehCommand9F_AddRotY)
	JUMPTABLE(BehCommandA0_AddRotZ)
	JUMPTABLE(BehCommandA1_AddPosX8)
	JUMPTABLE(BehCommandA2_AddPosY8)
	JUMPTABLE(BehCommandA3_AddPosZ8)
	JUMPTABLE(BehCommandA4)
	JUMPTABLE(BehCommandA5)
	JUMPTABLE(BehCommandA6)
	
CODE_048318:
	lda.b #$00
	sta.b $24,x
BehSubMoveAhead14:
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$000E
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
CODE_04832D:
	lda.b #$00
	sta.b $24,x
BehSubMoveAhead13:
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$000D
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
CODE_048342:
	lda.b #$00
	sta.b $24,x
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$0009
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
CODE_048357:
	lda.b #$00
	sta.b $24,x
BehSubMoveAhead8:
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$0008
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
CODE_04836C:
	lda.b #$00
	sta.b $24,x
BehSubMoveAhead7:
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$0007
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
CODE_048381:
	lda.b #$00
	sta.b $24,x
BehSubMoveAhead6:
	sep #$20
	rep #$20
	lda.b $28,x
	clc
	adc.w #$0006
	sta.b $28,x
	sep #$20
	jmp CODE_04805F
	
	
