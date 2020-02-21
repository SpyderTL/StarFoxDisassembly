CODE_02D956:
	sep #$20
	rep #$10
	lda $1200
	sta $16A3
	stz $1200
CODE_02D963;
	lda D, $00
	bnz CODE_02D963
	stz $1F10
	lda #$02
	sta D, $00
	jsr CODE_02DD4F
	jsr CODE_06BB5C
	jsr CODE_02DB5A
	rep #$30
	lda $14FC
	sta $16C5
	lda $18B8
	beq CODE_02D99D
	ldx $1236
	lda D, $0C
	cmp #$8000
	ror
	cmp #$8000
	ror
	cmp #$8000
	ror
	dec
	dec
	dec
	dec
	sta $18B9
	D99D:
	lda $16A2
	and #$00FF
	beq CODE_02D9E5
	cmp #$0001
	beq CODE_02D9C7
	lda $16A0
	clc
	adc $1701
	cmp #$01F4
	ble $02D9E2
	lda $169C
	cmp #$FEDA
	beq CODE_02D9E5
	dec
	sta $169C
CODE_02D9C2:
	lda #$0000
	bra CODE_02D9E2
	lda $16A0
	clc
	adc $1701
	cmp #$07D0
	bcc CODE_02D9E2
	lda $169C
	cmp #$00D4
	beq CODE_02D9E5
	inc
	sta $169C
	lda #$0000
CODE_02D9E2:
	sta $16A0
CODE_02D9E5:
	jsr CODE_02DC3A
	jsr CODE_02DCC3
	jsl CODE_02DB27
	sep #$20
	rep #$10
	lda $1FD1
	bne CODE_02D9FB
	inc $1F10
CODE_02D9FB:
	lda $177A
	bit #$01
	beq CODE_02DA05
	brl CODE_02DA08
CODE_02DA05:
	jsr UpdateObjects
CODE_02DA08:
	sep #$20
	lda Pad1HiCur
	sta $15A4
	lda Pad1LoCur
	sta $15A5
	jsl CODE_02F934
	jsl CODE_03B269
	jsl CODE_02F6FC
	jsl CODE_02F6DA
	jsl CODE_02F4E6
	jsl CODE_02F6D5
	jsl CODE_02DB86
	jsr CODE_02DD0A
	jsl CODE_1FC03D
	sep #$20
CODE_02DA3B:
	lda $18BB
	beq CODE_02DA3B
	lda $1F13
	beq CODE_02DA48
	jsr CODE_02DAA9
CODE_02DA48:
	jsl CODE_02DC16
CODE_02DA4C:
	lda $18BB
	cmp #$02
	bne CODE_02DA4C
	stz $18BB
	rep #$20
	lda $16F9
	sta $70019E
	beq CODE_02DA65
	jsl CODE_03BAF7
CODE_02DA65:
	jsl RenderSuperFXObjects
	jsr CODE_02E20D
	sep #$20
	lda $1FD1
	beq CODE_02DA76
	inc $1F10
CODE_02DA76:
	sep #$20
	lda $1200
	sta $14E3
	lda $16A4
	clc
	adc $16A3
	sta $16A4
	inc $16A5
	lda $16A4
	cmp #$3C
	bcc CODE_02DAA4
	lda $16A5
	sta $16A6
	stz $16A5
	lda $16A4
	sec
	sbc #$3C
	sta $16A4
CODE_02DAA4:
	rtl
CODE_02DAA5:
	jsr CODE_02DAA9
	rtl
CODE_02DAA9:
	lda $18BB
	cmp #$02
	bne CODE_02DAA9
	sei
	lda D,CurNMITask
	stz D,CurNMITask
	pha
	lda TIMEUP
	cli
	sep #$20
	lda $1F13
	bit #$01
	beq CODE_02DAC8
	jsl CODE_0993C8
CODE_02DAC8:
	rep #$30
	lda $1F13
	bit #$0004
	beq CODE_02DAD6
	jsl LoadPreset
CODE_02DAD6:
	rep #$30
	lda $1F13
	bit #$0008
	beq CODE_02DAE4
	jsl CODE_03F022
CODE_02DAE4:
	sep #$20
	lda $1F13
	and #$F2
	sta $1F13
	pla
	sta D,CurNMITask
	rts
UpdateObjects:
	inc $15BB
	bne CODE_02DAFA
	inc $15BC
CODE_02DAFA:
	phb
	lda #$7E
	pha
	plb
	jsl CODE_0681D5
	jsl CODE_03ED7E
	ldx FirstObject
CODE_02DB0A:
	stz $1248
	jsl ProcObject
	lda $1248
	bne CODE_02DB1D
	ldy D,$00,x
CODE_02DB18:
	tyx
	bne CODE_02DB0A
	bra CODE_02DB25
CODE_02DB1D:
	ldy D,$00,x
	jsl CODE_1FBFDC
	bra CODE_02DB18
CODE_02DB25:
	plb
	rts
CODE_02DB27:
	php
	sep #$20
	rep #$10
	jsr CODE_02DB31
	plp
	rtl
CODE_02DB31:
	stz $14C6
	lda $14C1
	sta $14C5
	rep #$20
	beq CODE_02DB4F
	ldx #$0008
	lda #$1481
CODE_02DB44:
	ror $14C5
	bcs CODE_02DB52
	adc #$0008
	dex
	bne CODE_02DB44
CODE_02DB4F:
	lda #$0000
CODE_02DB52:
	sta $16A7
	rts
CODE_02DB56:
	jsr CODE_02DB5A
	rtl
CODE_02DB5A:
	rep #$30
	stz $1951
	lda $1954
	and #$00FF
	bnz CODE_02DB68
	rts

CODE_02DB68:
	lda $16F1
	and #$00FF
	bnz CODE_02DB75
	lda #$0000
	jmp CODE_02DB7A
CODE_02DB75:
	lda $1234
	bmi CODE_02DBAA
CODE_02DB7A:
	xba
	and #$0007
	asl
	tax
	lda $008C15, X
	cmp $194F
	bnz CODE_02DB8A
	rts
CODE_02DB8A:
	sta $194F
	tax
	ldy #$0000
CODE_02DB91:
	lda D, $00
	clc
	adc $194D
	sta 18CD$, Y
	iny
	iny
	inx
	inx
	cpy #$0040
	bnz CODE_02DB91
	lda #$0001
	sta $1951
	rts

CODE_02DBAA:
	eor #$FFFF
	inc
	xba
	and #$0007
	asl
	tax
	lda $008C15, X
	cmp $194F
	bnz CODE_02DBBE
	rts

CODE_02DBBE:
	sta $194F
	clc
	adc #$003E
	tax
	ldy #$0000
CODE_02DBC9:
	lda D, $00
	clc
	adc $194D
	sta $18CD, Y
	dex
	dex
	iny
	iny
	cpy #$0040
	bnz CODE_02DBC9
	lda #$0001
	sta $1951
	rts

CODE_02DBE2:
	php
	sep #$20
	rep #$10
	jsr CODE_02DBEC
	plp
	rtl

CODE_02DBEC:
	lda #$80
	sta $2115
	lda #$18
	sta $4301
	ldx $18CD
	stx $4302
	stz $4304
	ldx $2FA0
	stx $2116
	ldx $0040
	stx $4305
	lda #$01
	sta $4300
	lda #$01
	sta $420B
	rts

CODE_02DC16:
	php
	sep #$20
	rep #$10
	lda #$01
	ldx $B0CB
	jsr CODE_7E4EE9
	plp
	rtl

CODE_02DC26:
	php
	sep #$20
	rep #$10
	lda #$01
	ldx $B0E2
	jsr CODE_7E4EE9
	plp
	rtl

CODE_02DC36:
	jsr CODE_02DC3A
	rtl

CODE_02DC3A:
	rep #$30
	lda $1953
	and #$00FF
	bnz CODE_02DC45
	rts

CODE_02DC45:
	ldx $1FE2
	jmp CODE_02DC4B, X

CODE_02DC4B:
; Jump Table



CODE_02DCC3:
	sep #$30
CODE_02DCC5:
	lda $2137
	ldx $213C
	lda $213C
	and #$01
	bne CODE_02DCC5
	cpx #$5A
	bmi CODE_02DCC5
	cpx #$64
	bcs CODE_02DCC5
	rep #$10
	sei
	ldx $18B6
	stx $2181
	stz $2183
	lda #$80
	sta $4301
	ldx #$0222
	stx $4302
	lda #$70
	sta $4304
	ldx #$02A0
	stx $4305
	stz $4300
	lda #$01
	sta $420B
	lda $004211
	cli
	rts

CODE_02DD0A:
	sep #$20
	rep #$10
	ldx $1567
	lda D, $2A, X
	bpl CODE_02DD17
	lda #$00
CODE_02DD17:
	sta $7001B8
	lda $7001BA
	beq CODE_02DD35
	lda $7001BC
	dec
	dec
	bpl CODE_02DD2F
	lda #$00
	sta $7001BA
CODE_02DD2F:
	sta $7001BC
	jmp CODE_02DD4A

CODE_02DD35:
	lda $7001BC
	cmp #$28
	beq CODE_02DD4A
	lda $7001BC
	inc
	sta $7001BC
	and #$0F
	beq CODE_02DD4A
CODE_02DD4A:
	rts

CODE_02DD4B:
	jsr CODE_02DD4F
	rtl

CODE_02DD4F:
	sep #$20
	stz $1FD0
	rep #$30
	ldx $16AB
	bne CODE_02DD6F
	sep #$20
	sep #$20
	lda $14C1
	and #$7F
	sta $14C1
	sep #$20
	rep #$10
	stz $1FD1
	rts
CODE_02DD6F:
	rep #$20
	lda $02E0C2, X
	and #$00FF
	txy
	tax
	jmp $DD7D, X

CODE_02E082:
	sep #$20
	php
	lda #$7E
	pha
	plp
	ldx #$017E
	ldy #$0240
	lda $18A9
	beq CODE_02E0AB
CODE_02E094:
	lda $700EF2, X
	sta $416B, Y
	lda $7010B2, X
	sta $416A, Y
	dey
	dey
	dey
	dex
	dex
	bpl CODE_02E094
	plp
	rts
CODE_02E0AB:
	lda $700EF2, X
	sta $43AF, Y
	lda $7010B2, X
	sta $43AE, Y
	dey
	dey
	dey
	dex
	dex
	bpl CODE_02E0AB
	plp
	rts

CODE_02E20D:
	sep #$20
	lda $1FD0
	bne CODE_02E215
	rts
CODE_02E215:
	rep #$20
	lda $1FC9
	sta $700028
	sep #$20
	lda #$01
	ldx #$D68B
	jsr CODE_7E4EE9
	rep #$20
	rep #$10
	lda $700028
	sta $1FC9
	sep #$20
	lda #$01
	sta $1FD1
	sep #$20
	rep #$10
	lda $14C1
	or #$01
	sta $14C1
	ldx #$1481
	sep #$20
	rep #$10
	lda $700026
	sta D, $06, X
	rep #$20
	lda $1FC9
	cmp #$0001
	bne CODE_02E261
	inc $16AB
CODE_02E261:
	sep #$20
	jmp CODE_02E082

CODE_02E266:
	php
	sep #$20
	lda #$28
	sta $189F
	sta $18A2
	sta $18A0
	sta $18A1
	sta $18A3
	sta $18A4
	jsr CODE_0BD2EF
	jsr CODE_03BDAF
	rep #$30
	stz $1F69
	stz $1FBB
	stz $173C
	lda #$F0D0
	sta $700062
	lda #$1000
	sta $70002C
	lda #$0000
	sta $700090
	sep #$20
	lda #$17
	sta $700064
	lda #$01
	ldx #$B301
	jsr CODE_7E4EE9
	rep #$20
	ldx #$0000
CODE_02E2BB:
	lda $701000, X
	sta $7F0000, X
	inx
	inx
	cpx #$2000
	bne CODE_02E2BB
	plp
	rtl

CODE_02E2CC:
	php
	php
	sep #$20
	lda #$00
	pha
	plp
	sei
	sep #$20
	stz $420C
	lda #$80
	jsr CODE_02F8DF
	sta $2100
	stz $18B2
	stz $18B3
	lda #$6E
	sta $16DB
	jsr CODE_03BD8D
	sep #$20
	rep #$10
	lda #$64
	sta $16DB
	jsr CODE_03BD8D
	sep #$20
	rep #$10
	rep #$30
	stz $1FD2
	stz $16AB
	stz $16FB
	stz $16FF
	stz $1701
	stz D, $C5
	lda #$0001
	sta $70021C
	stz $1FD2
	stz $1201
	stz $1F4F
	stz $1F4D
	stz $1F51
	sep #$20
	lda #$01
	sta $15AC
	stz $1956
	stz $189D
	stz $189E
	stz $1F14
	stz $1FCD
	stz $1FCE
	stz $14C1
	stz $1FCF
	stz $1F52
	stz $1F51
	stz $1FDE
	jsr CODE_02F4C9
	jsr CODE_0AF94C
	lda $1FF4
	pha
	lda $058002
	sta $1FF4
	rep #$30
	lda $16FD
	pha
	lda $058000
	tax
	jsr CODE_03EDA1
	sep #$20
	jsr CODE_068004
	rep #$10
	plx
	pla
	sta $1FF4
	rep #$20
	stz $1FD2
	stx $16FD
	jsr CODE_03EDA1
	jsr CODE_02E39A
	jsr CODE_02DB27
	plp
	plp
	rtl

CODE_02E39A:
	php
	rep #$20
	lda #$1234
	sta $7001FE
	lda #$0001
	sta $7001B2
	jsr CODE_02F125
	sep #$20
	lda #$80
	sta D, $9C
	lda #$FF
	sta $15BF
	stz D, $00
	sep #$30
	jsr CODE_02F3FE
	jmp CODE_03B82D

CODE_02E3C5:
	sep #$30
	jsr CODE_02E2CC
CODE_02E3CB:
	sep #$20
	sep #$20
	lda $1FE7
	bne CODE_02E3F3
	lda $14D6
	bit #$20
	bne CODE_02E3F3
	lda $14D3
	and #$10
	bne CODE_02E3F3
	lda $14DD
	and #$20
	bne CODE_02E3F3
	lda $1201
	bit #$10
	beq CODE_02E3F3
	jsr CODE_02EFA5
CODE_02E3F3:
	jsr CODE_02FD84
	jsr CODE_1FBDB0
	jsr CODE_02D956
	jsr CODE_03EA26
	rep #$20
	lda $1FD2
	beq CODE_02E3CB
	cmp #$000A
	bne CODE_02E412
	jmp CODE_02E4C8
CODE_02E412:
	inc $16D6
	sep #$20
	lda #$01
	sta $15A8
	stz $15AB
	lda $1FD2
	cmp #$05
	beq CODE_02E45B
	cmp #$0B
	beq CODE_02E49B
	cmp #$0C
	beq CODE_02E4A1
	cmp #$0D
	beq CODE_02E4A7
	cmp #$0E
	beq CODE_02E4AD
	cmp #$0F
	beq CODE_02E4B1
	cmp #$10
	beq CODE_02E469
	jsr CODE_02EC26
	sep #$20
	lda $1FD2
	cmp #$07
	bne CODE_02E451
	stz $15A8
	jmp CODE_02E3C5
CODE_02E451:
	lda $1FD2
	cmp #$06
	bne CODE_02E45B
	jmp CODE_02E575
CODE_02E45B:
	sep #$20
	lda $1FCE
	bne CODE_02E492
	lda $1FD2
	cmp #$04
	bne CODE_02E47C
CODE_02E469:
	sep #$20
	lda #$28
CODE_02E46D:
	pha
	jsr CODE_02FD1D
	jsr CODE_02D956
	sep #$20
	pla
	dec
	bne CODE_02E46D
CODE_02E47C:
	sep #$20
	lda #$FF
	sta $18B2
	sep #$20
	sep #$10
CODE_02E487:
	jsr CODE_02D956
	sep #$20
	lda $18B2
	bne CODE_02E487
CODE_02E492:
	sep #$20
	stz $15A8
	jmp CODE_03BDDF
CODE_02E49B:
	jsr CODE_03D0FB
	jmp CODE_02E4B1
CODE_02E4A1:
	jsr CODE_03D106
	jmp CODE_02E4B1
CODE_02E4A7:
	jsr CODE_03D111
	jmp CODE_02E4B1
CODE_02E4AD:
	jsr CODE_03D0D6
CODE_02E4B1:
	sep #$20
	rep #$10
	ldx $1FBB
	lda #$65
	sta $1FBD, X
	inx
	stx $1FBB
	stz $15A8
	jmp CODE_03BDDF

CODE_02E4C8:
	jsr CODE_06BBDA
	sep #$20
	rep #$10
	jsr CODE_03AEC8
	stz $1FDF
	lda #$00
	sta $7EA05A
	jsr CODE_03A963
	lda #$01
	ldx #$B4DF
	jsr CODE_7E4EE9
	lda #$01
	sta $18B2
	sta $1FDD
	rep #$20
	stz $1F37
	lda #$0020
	sta $1F35
	lda #$0032
CODE_02E500:
	pha
	jsr CODE_02F0B3
	jsr CODE_02FD84
	jsr CODE_02D956
	rep #$20
	pla
	dec
	bne CODE_02E500
	sep #$20
	stz $1209
	rep #$20
	lda #$04B0
CODE_02E51C:
	pha
CODE_02E51D:
	jsr CODE_02F06F
	jsr CODE_02FD84
	jsr CODE_02D956
	sep #$20
	rep #$10
	ldx #$14A1
	lda D, $07, X
	bne CODE_02E51D
	sep #$20
	lda $1202
	bit #$10
	bne CODE_02E542
	rep #$20
	pla
	dec
	bne CODE_02E51C
CODE_02E542:
	sep #$20
	lda #$FF
	sta $18B2
CODE_02E549:
	jsr CODE_02F06F
	jsr CODE_02FD84
	jsr CODE_02D956
	sep #$20
	lda $18B2
	and #$FF
	bne CODE_02E549
	sep #$20
	stz $1FDD
	lda #$01
	sta $1FDF
	lda #$01
	sta $7EA05A
	jsr CODE_03E403
	jmp CODE_03BDDF

CODE_02E575:
	sep #$20
	rep #$10
	lda #$00
	sta $70021C
	rep #$30
	lda #$FDDA
	sta $188A
	lda #$CBD2
	sta $188C
	stz $188E
	lda #$0001
	sta $1890
	stz $1892
	sep #$20
	lda #$C8
	sta $1F0F
CODE_02E5A0:
	rep #$20
	dec $1890
	beq CODE_02E5AA
	jmp CODE_02E615
CODE_02E5AA:
	ldx $188E
	cpx $1FBB
	bne CODE_02E5B5
	jmp CODE_02E615
CODE_02E5B5:
	lda #$001E
	sta $1890
	lda #$CDFE
	ldx #$FE0C
	ldy $188A
	jsr CODE_02EA7C
	jsr CODE_02E6A3
	lda $188C
	ldx #$0000
	ldy $188A
	jsr CODE_02EA7C
	jsr CODE_02E6A3
	inc $188C
	inc $188C
	ldx $188E
	lda $1FBD, X
	inx
	stx $188E
	and #$00FF
	sta $14C5
	asl
	asl
	clc
	adc $14C5
	clc
	adc #$CBE6
	ldx #$0258
	ldy $188A
	jsr CODE_02EA7C
	jsr CODE_02E6A3
	lda $188A
	clc
	adc #$00C8
	sta $188A
	inc $1892
	inc $1892
CODE_02E615:
	sep #$20
	lda $1F0F
	cmp #$C8
	beq CODE_02E621
	dec $1F0F
CODE_02E621:
	jsr CODE_02D956
	sep #$20
	lda $1F0F
	cmp #$C9
	beq CODE_02E631
	jmp CODE_02E5A0
CODE_02E631:
	jsr CODE_02E768
	rep #$20
	lda #$0050
CODE_02E639:
	pha
	jsr CODE_02D956
	rep #$20
	pla
	dec
	bne CODE_02E639
	sep #$20
	lda #$09
	sta $1FD2
	rep #$20
	lda #$0172
CODE_02E650:
	pha
	jsr CODE_02D956
	rep #$20
	pla
	pha
	cmp #$000F
	bcs CODE_02E667
	sep #$20
	lda #$FF
	sta $18B2
	rep #$20
CODE_02E667:
	pla
	dec
	bne CODE_02E650
	jsr CODE_1FDC89
	sep #$20
	rep #$10
	jsr CODE_03AEBD
	lda #$0D
	ldx #$7114
	sta $1FF4
	stx $16FD
	jsr CODE_02E2CC
	stz $1FD2
	jsr CODE_02FD84
	jsr CODE_02D956
	sep #$20
	lda $1FD2
	cmp #$08
	bne CODE_02E689
	jsr CODE_02E8E1
CODE_02E69D:
	jsr CODE_02D956
	jmp CODE_02E69D

CODE_02E6A3:
	php
	sep #$20
	PushXIndex
	ldx $1892
	jmp $CODE_02E6AD, X

CODE_02E6AD:
; jump table

CODE_02E768:
	sep #$20
	lda #$01
	sta $1F0F
	rep #$30
	lda #$000E
	sta $1892
	jsr CODE_02E8AC
	lda $14C5
	sta $700062
	lda $1FBB
	sec
	sbc $7EA058
	sta $70002C
	sep #$20
	lda #$01
	ldx #$B6B7
	jsr CODE_7E4EE9
	rep #$20
	rep #$10
	lda $700062
	sta $1957
	asl
	asl
	clc
	adc $1957
	clc
	adc #$CBE6
	pha
	lda #$CDE4
	ldx #$0000
	ldy #$F9C0
	jsr CODE_02EA7C
	jsr CODE_02E6A3
	rep #$20
	inc $1892
	inc $1892
	lda #$0019
CODE_02E7C8:
	pha
	jsr CODE_02D956
	rep #$20
	pla
	dec
	bne CODE_02E7C8
	rep #$20
	jsr CODE_02E8AC
	lda $14C5
	sta D, $18
	lda #$FF38
	sta D, $16
	lda D, $18
	ldx #$FFFF
CODE_02E7E7:
	inx
	sec
	sbc #$0064
	bpl CODE_02E7E7
	clc
	adc #$0064
	sta D, $18
	txa
	or #$0000
	beq CODE_02E806
	ldx #$FED4
	ldy #$FA88
	jsr CODE_02EA77
	jsr CODE_02E6A3
CODE_02E806:
	lda D, $18
	ldx #$FFFF
CODE_02E80B:
	inx
	sec
	sbc #$000A
	bpl CODE_02E80B
	clc
	adc #$000A
	sta D, $18
	txa
	or #$0000
	ldx #$FF6A
	ldy #$FA88
	jsr CODE_02EA77
	jsr CODE_02E6A3
	lda D, $18
	ldx #$0000
	ldy #$FA88
	jsr CODE_02EA77
	jsr CODE_02E6A3
	lda #$0000
	ldx #$0096
	ldy #$FA88
	jsr CODE_02EA77
	jsr CODE_02E6A3
	lda #$0000
	ldx #$012C
	ldy #$FA88
	jsr CODE_02EA77
	jsr CODE_02E6A3
	rep #$20
	inc $1892
	inc $1892
	lda #$0019
CODE_02E85F:
	pha
	jsr CODE_02D956
	rep #$20
	pla
	dec
	bne CODE_02E85F
	lda #$CDF0
	ldx #$0000
	ldy #$FCAE
	jsr CODE_02EA7C
	jsr CODE_02E6A3
	inc $1892
	inc $1892
	lda #$0019
CODE_02E882:
	pha
	jsr CODE_02D956
	rep #$20
	pla
	dec
	bne CODE_02E882
	pla
	ldx #$0000
	ldy #$FD76
	jsr CODE_02EA7C
	jsr CODE_02E6A3
	inc $1892
	inc $1892
	sep #$20
	stz $1F0F
	rep #$20
	rts

CODE_02E8A8:
	jsr CODE_02E8AC
	rtl

CODE_02E8AC:
	stz $14C5
	lda #$0000
	sta $7EA058
	ldx #$0000
CODE_02E8B9:
	cpx $1FBB
	beq CODE_02E8E0
	lda $001FBD, X
	and #$00FF
	cmp #$0065
	bne CODE_02E8D6
	lda $7EA058
	inc
	sta $7EA058
	lda #$0000
CODE_02E8D6:
	clc
	adc $14C5
	sta $14C5
	inx
	jmp CODE_02E8B9
CODE_02E8E0:
	rts

CODE_02E8E1:
	rep #$30
	jsr CODE_02E8AC
	lda $14C5
	sta $700062
	lda $1FBB
	sec
	sbc $7EA058
	sta $70002C
	sep #$20
	lda #$01
	ldx #$B6B7
	jsr CODE_7E4EE9
	rep #$20
	rep #$10
	lda $700062
	sta $1957
	asl
	asl
	clc
	adc $1957
	clc
	adc #$CBE6
	pha
	lda #$CDE4
	ldx #$01F4
	ldy #$02EE
	jsr CODE_02EB15
	rep #$20
	lda #$000A
CODE_02E92B:
	pha
	jsr CODE_02D956
	rep #$20
	pla
	dec
	bne CODE_02E92B
	rep #$20
	jsr CODE_02E8AC
	lda $14C5
	sta D, $18
	lda #$FF38
	sta D, $16
	lda D, $18
	ldx #$FFFF
CODE_02E94A:
	inx
	sec
	sbc #$0064
	bpl CODE_02E94A
	clc
	adc #$0064
	sta D, $18
	txa
	or #$0000
	beq CODE_02E966
	ldx #$00C8
	ldy #$0384
	jsr CODE_02EB10
CODE_02E966:
	lda D, $18
	ldx #$FFFF
CODE_02E96B:
	inx
	sec
	sbc #$000A
	bpl CODE_02E96B
	clc
	adc #$000A
	sta D, $18
	txa
	or #$0000
	ldx #$015E
	ldy #$0384
	jsr CODE_02EB10
	lda D, $18
	ldx #$01F4
	ldy #$0384
	jsr CODE_02EB10
	lda #$0000
	ldx #$028A
	ldy #$0384
	jsr CODE_02EB10
	lda #$0000
	ldx #$0320
	ldy #$0384
	jsr CODE_02EB10
	rep #$20
	lda #$000A
CODE_02E9AD:
	pha
	jsr CODE_02D956
	rep #$20
	pla
	dec
	bne CODE_02E9AD
	lda #$CDF0
	ldx #$01F4
	ldy #$041A
	jsr CODE_02EB15
	rep #$20
	lda #$000A
CODE_02E9C9:
	pha
	jsr CODE_02D956
	rep #$20
	pla
	dec
	bne CODE_02E9C9
	pla
	ldx #$01F4
	ldy #$04B0
	jsr CODE_02EB15
	rts

CODE_02EA77:
	asl
	clc
	adc #$CBD0
CODE_02EA7C:
	sta $1957
	stx $1F3D
	sty $1F3F
	php
	sep #$20
	php
	lda #$7E
	pha
	plp
	ldx $121D
	rep #$20
	lda #$D924
	sta $14C5
	sep #$20
	jsr CODE_1FD54B
	bcs CODE_02EAA4
	jmp CODE_02EB0D
CODE_02EAA4:
	tyx
	rep #$20
	lda #$800E
	sta D, $16, X
	sep #$20
	lda #$04
	sta D, $18, X
	lda D, $1D, X
	or #$40
	sta D, $1D, X
	lda D, $1E, X
	or #$01
	sta D, $1E, X
	lda #$03
	sta $1CDF, X
	rep #$20
	lda $1957
	sta $1CEA, X
	sep #$20
	lda #$00
	sta $1CF4, X
	lda #$03
	sta $1CF5, X
	rep #$20
	lda #$4834
	sta D, $28, X
	sep #$20
	ldy $159E
	jsr CODE_1FDAED
	rep #$20
	lda D, $0C, X
	clc
	adc $1F3D
	sta D, $0C, X
	sep #$20
	rep #$20
	lda D, $0E, X
	clc
	adc $1F3F
	sta D, $0E, X
	sep #$20
	rep #$20
	lda D, $10, X
	clc
	adc #$0FA0
	sta D, $10, X
	sep #$20
	sep #$20
CODE_02EB0D:
	plp
	plp
	rts

CODE_02EB10:
	asl
	clc
	adc #$CBD0
CODE_02EB15:
	sta $1957
	stx $1F3D
	sty $1F3F
	php
	sep #$20
	php
	lda #$7E
	pha
	plp
	ldx $121D
	rep #$20
	lda #$D924
	sta $14C5
	sep #$20
	jsr CODE_1FD54B
	bcs CODE_02EB3D
	jmp CODE_02EBA4
CODE_02EB3D:
	tyx
	rep #$20
	lda #$800E
	sta D, $16, X
	sep #$20
	lda #$04
	sta D, $18, X
	lda D, $1D, X
	or #$40
	sta D, $1D, X
	lda D, $1E, X
	or #$01
	sta D, $1E, X
	lda #$05
	sta $1CDF, X
	rep #$20
	lda $1957
	sta $1CEA, X
	sep #$20
	lda #$00
	sta $1CF4, X
	lda #$03
	sta $1CF5, X
	rep #$20
	lda #$4820
	sta D, $28, X
	sep #$20
	ldy $1238
	jsr CODE_1FDAED
	rep #$20
	lda D, $0C, X
	clc
	adc $1F3D
	sta D, $0C, X
	sep #$20
	rep #$20
	lda D, $0E, X
	clc
	adc $1F3F
	sta D, $0E, X
	sep #$20
	rep #$20
	lda D, $10, X
	clc
	adc #$0E10
	sta D, $10, X
	sep #$20
CODE_02EBA4:
	sep #$20
	plp
	plp
	rts




CODE_02EBC1:
	php
	sep #$30
	lda #$00
	ldx $18A0
	beq CODE_02EBCE
	clc
	adc #$05
CODE_02EBCE:
	ldx $18A2
	beq CODE_02EBD6
	clc
	adc #$05
CODE_02EBD6:
	ldx $18A1
	beq CODE_02EBDE
	clc
	adc #$05
CODE_02EBDE:
	rep #$30
	and #$00FF
	sta $14C5
	sep #$20
	stz $15B8
	rep #$20
	lda $173C
	and #$00FF
	beq CODE_02EC16
	sta $70002C
	lda $14D9
	and #$00FF
	sta $700062
	sep #$20
	lda #$01
	ldx #$B6A2
	jsr CODE_7E4EE9
	rep #$20
	rep #$10
	lda $700062
CODE_02EC16:
	clc
	adc $14C5
	cmp #$0064
	bmi CODE_02EC22
	lda #$0064
CODE_02EC22:
	sta D, $18
	plp
	rts

