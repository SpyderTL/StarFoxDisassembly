	;Transfer $0018 bytes to SPC address $3EE8
	DW $0018,$3EE8
	;Data to transfer
	;Note length and volume table data
	BASE $3EE8
SPCNoteDurRtTable:
	DB $32,$65,$7F,$98,$B2,$CB,$E5,$FC
SPCNoteVelRtTable:
	DB $19,$32,$4C,$65,$72,$7F,$8C,$98,$A5,$B2,$BF,$CB,$D8,$E5,$F2,$FC
	END BASE
	;Transfer $27FF bytes (of code) to SPC address $0400
	DW $27FF,$0400
	;Data to transfer
	;SPC700 code starts here
	ARCH SPC700
	BASE $0400
SPCStart:
	clrp						; Reset processor flags
	mov x,#$CF					;\Reset stack
	mov sp,x					;/
	mov a,#$00
	mov x,a						;\Clear zero page ($00-$DF)
SPCClearZeroPage:					;|
	mov (x)+,a					;|
	cmp x,#$E0					;|
	bne SPCClearZeroPage				;/
	mov x,#$00					;\Clear page 2 ($0200-$02FF)
SPCClearPage2:						;|
	mov $0200+x,a					;|
	inc x						;|
	bne SPCClearPage2				;/
SPCClearPage3:						;\Clear page 3 ($0300-$03FF)
	mov $0300+x,a					;|
	inc x						;|
	bne SPCClearPage3				;/
	inc a
	call SPC_0B14
	set5 $48
	mov a,#$96
	mov $03C6,a
	mov a,#$BB
	mov $03CB,a
	call SPC_0648
	mov a,#$60
	mov y,#$0C
	call SPCWriteDSPReg
	mov y,#$1C
	call SPCWriteDSPReg
	mov a,#$F0
	mov $00F1,a
	mov a,#$10
	mov $00FA,a
	mov $53,a
	mov a,#$01
	mov $00F1,a
SPCWrTempRegsLoop:
	mov y,#$0A
SPCWrTempRegsLoop2:
	cmp y,#$05
	beq SPCSkipFlg
	bcs SPCWrTempReg
	cmp ($4C),($4D)
	bne SPCNextReg
SPCSkipFlg:
	bbs7 $4C,SPCNextReg
SPCWrTempReg:
	mov a,(SPCRegs-1)+y				;\Write DSP register
	mov $00F2,a					;/
	mov a,(SPCValPtrs-1)+y				;\Write DSP register value
	mov x,a						;|
	mov a,(x)					;|
	mov $00F3,a					;/
SPCNextReg:
	dbnz y,SPCWrTempRegsLoop2			; Decrement Y, loop back if not 0
	mov SPCTempKON,y				;\Reset key on/off events
	mov SPCTempKOF,y				;/
	mov a,$18
	eor a,$19
	lsr a
	lsr a
	notc
	ror $18
	ror $19
SPC_0480:
	mov y,$00FD
	beq SPC_0480
	push y
	mov a,#$38
	mul ya
	clrc
	adc a,$43
	mov $43,a
	bcc SPC_04B6
	call SPC_257C
	mov x,#$01
	call SPC_04ED
	call SPC_2749
	mov x,#$02
	call SPC_04ED
	call SPC_2A1A
	cmp ($4C),($4D)
	beq SPC_04B6
	inc $03C7
	mov a,$03C7
	lsr a
	bcs SPC_04B6
	inc $4C
SPC_04B6:
	mov a,$53
	pop y
	mul ya
	clrc
	adc a,$51
	mov $51,a
	bcc SPC_04D1
	mov a,$03F8
	bne SPC_04CE
	call SPCChkMusID
	mov x,#$00
	call SPC_04FE
SPC_04CE:
	jmp SPCWrTempRegsLoop
SPC_04D1:
	mov a,$04
	beq SPC_04E7
	mov x,#$00
	mov SPCCurChan,#$01
SPC_04DA:
	mov a,$31+x
	beq SPC_04E1
	call SPC_0DC4
SPC_04E1:
	inc x
	inc x
	asl SPCCurChan
	bne SPC_04DA
SPC_04E7:
	call SPC_0614
	jmp SPCWrTempRegsLoop
	
SPC_04ED:
	mov a,$04+x
	mov $00F4+x,a
SPC_04F2:
	mov a,$00F4+x
	cmp a,$00F4+x
	bne SPC_04F2
	mov y,a
	mov $00+x,y
SPC_04FD:
	ret
SPC_04FE:
	mov a,$04+x
	mov $00F4+x,a
SPC_0503:
	mov a,$00F4+x
	cmp a,$00F4+x
	bne SPC_0503
	mov y,a
	mov a,$08+x
	mov $08+x,y
	cbne $08+x,SPC_0515
	mov y,#$00
SPC_0515:
	mov $00+x,y
	ret
	
SPC_0518:
	cmp y,#$CA
	bcc SPC_0521
	call SPC_0932
	mov y,#$A4
	cmp y,#$C8
	bcs SPC_04FD
	mov a,$1A
	and a,$47
	bne SPC_04FD
	mov a,y
	and a,#$7F
	clrc
	adc a,$50
	clrc
	adc a,$02F0+x
	mov $0361+x,a
	mov a,$0381+x
	mov $0360+x,a
	mov a,$02B1+x
	lsr a
	mov a,#$00
	ror a
	mov $02A0+x,a
	mov a,#$00
	mov $B0+x,a
	mov $0100+x,a
	mov $02D0+x,a
	mov $C0+x,a
	or ($5E),(SPCCurChan)
	or (SPCTempKON),(SPCCurChan)
	mov a,$0280+x
	mov $A0+x,a
	beq SPC_057F
	mov a,$0281+x
	mov $A1+x,a
	mov a,$0290+x
	bne SPC_0575
	mov a,$0361+x
	setc
	sbc a,$0291+x
	mov $0361+x,a
SPC_0575:
	mov a,$0291+x
	clrc
	adc a,$0361+x
	call SPC_0B9B
SPC_057F:
	call SPC_0BB3
	mov y,#$00
	mov a,$11
	setc
	sbc a,#$34
	bcs SPC_0594
	mov a,$11
	setc
	sbc a,#$13
	bcs SPC_0598
	dec y
	asl a
SPC_0594:
	addw ya,$10
	movw $10,ya
SPC_0598:
	push x
	mov a,$11
	asl a
	mov y,#$00
	mov x,#$18
	div ya,x
	mov x,a
	mov a,$0EB1+y
	mov $15,a
	mov a,$0EB0+y
	mov $14,a
	mov a,$0EB3+y
	push a
	mov a,$0EB2+y
	pop y
	subw ya,$14
	mov y,$10
	mul ya
	mov a,y
	mov y,#$00
	addw ya,$14
	mov $15,y
	asl a
	rol $15
	mov $14,a
	bra SPC_05CB
SPC_05C7:
	lsr $15
	ror a
	inc x
SPC_05CB:
	cmp x,#$06
	bne SPC_05C7
	mov $14,a
	pop x
	mov a,$0220+x
	mov y,$15
	mul ya
	movw SPCPitch,ya
	mov a,$0220+x
	mov y,$14
	mul ya
	push y
	mov a,$0221+x
	mov y,$14
	mul ya
	addw ya,SPCPitch
	movw SPCPitch,ya
	mov a,$0221+x
	mov y,$15
	mul ya
	mov y,a
	pop a
	addw ya,SPCPitch
	movw SPCPitch,ya
	mov a,x
	xcn a
	lsr a
	or a,#$02
	mov y,a
	mov a,SPCPitch
	call SPCWritePitch
	inc y
	mov a,SPCPitch+1
SPCWritePitch:
	push a						;\Check if channel is muted....
	mov a,SPCCurChan				;|
	and a,SPCMuteChan				;|
	pop a						;|
	bne SPCSkipWrP					;/...if so, branch to skip
SPCWriteDSPReg:
	mov $00F2,y					;\Set DSP register in Y to value in A
	mov $00F3,a					;/
SPCSkipWrP:
	ret
	
SPC_0614:
	dec $D0
	mov a,$D0
	and a,#$03
	mov y,#$3F
	mul ya
	mov y,a
	mov $12,#$07
SPC_0621:
	inc y
	mov x,#$04
SPC_0624:
	movl c,$0019,6
	eorl c,$0019,5
	rol $18
	rol $19
	mov a,$19
	and a,$03CB
	or a,#$11
	mov $FE00+y,a
	inc y
	mov a,$18
	or a,#$11
	mov $FE00+y,a
	inc y
	dec x
	bne SPC_0624
	dbnz $12,SPC_0621
	ret
	
SPC_0648:
	mov y,#$00
	mov x,#$1B
	mov a,$03C6
SPC_064F:
	mov $FE00+y,a
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	inc y
	dec x
	bne SPC_064F
	inc a
	mov $FE00+y,a
	mov y,#$FE
	mov a,#$00
	mov $3C80,a
	mov $3C81,y
	mov $3C82,a
	mov $3C83,y
	mov a,$18
	or a,$19
	bne SPC_067A
	inc $18
SPC_067A:
	ret
SPCPlaySpecialFFStopAll:
	mov a,#$00					;\Set DSP EVOL register to 0 (left)
	mov y,#$2C					;|
	call SPCWriteDSPReg				;/
	mov y,#$3C					;\Set DSP EVOL register to 0 (right)
	call SPCWriteDSPReg				;/
	mov a,#$FF					;\Set DSP KOF register to $FF
	mov y,#$5C					;|(disables all keys)
	call SPCWriteDSPReg				;/
	call SPCLoadNewPacket				; Get more data
	mov a,#$00
	mov $03CA,a
	mov $04,a
	mov $0005,a
	mov $0006,a
	mov $0007,a
	mov $1A,a
	mov y,#$10
SPC_06A5
	mov $039F+y,a
	dbnz y,SPC_06A5
	mov a,#$96
	mov $03C6,a
	mov a,#$BB
	mov $03CB,a
	call SPC_0648
SPCPlaySpecialF1FadeOut:
	cmp $04,#$11
	beq SPC_06CF
	mov x,#$A0
	mov $5A,x
	mov $03CA,x
	mov a,#$00
	mov $5B,a
	setc
	sbc a,$59
	call SPC_0BBE
	movw $5C,ya
SPC_06CF:
	jmp SPCNullMusID
SPCPlaySpecialF2Quieter:
	mov a,$03F1
	bne SPCPlaySpecialChgVolNA
	mov a,$59
	mov $03F1,a
	mov a,#$70
	mov $59,a
	jmp SPCNullMusID
SPCPlaySpecialF3Louder:
	mov a,$03F1
	beq SPCPlaySpecialChgVolNA
	mov a,$03F1
	mov $59,a
	mov a,#$00
	mov $03F1,a
	jmp SPCNullMusID
SPCPlaySpecialChgVolNA:
	ret
SPCChkSpecialMusID:
	cmp a,#$FF					;\Check for special music IDs
	beq SPCPlaySpecialFFStopAll			;|
	cmp a,#$F1					;|
	beq SPCPlaySpecialF1FadeOut			;|
	cmp a,#$F2					;|
	beq SPCPlaySpecialF2Quieter			;|
	cmp a,#$F3					;|
	beq SPCPlaySpecialF3Louder			;|
	cmp a,#$F4					;|
	beq SPCPlaySpecialF4Slower			;|
	cmp a,#$F5					;|
	beq SPCPlaySpecialF5Faster			;|
	cmp a,#$F0					;|
	beq SPCPlaySpecialF0Stop			;/
	cmp a,#$14					;\Check if music ID is less than max...
	bcc SPCPlayNormMusID				;|...if so, branch to play normal music...
	ret						;/...otherwise, return
SPCPlaySpecialF5Faster:
	mov x,#$03
	mov a,#$30
	bne SPCPlaySpecialChgRate
SPCPlaySpecialF4Slower:
	mov x,#$FE
	mov a,#$09
SPCPlaySpecialChgRate:
	mov SPCTempoLen,#$8F
	mov $02F0,x
	mov $02F2,x
	mov $02F4,x
	mov SPCTempoDest,a
	setc
	sbc a,$53
	mov x,$54
	call SPC_0BBE
	movw $56,ya
	jmp SPCNullMusID
SPC_073C:
	dec $03CA
	beq SPCPlaySpecialF0Stop
	jmp SPC_07E8
SPCPlaySpecialF0Stop:
	mov a,$1A
	eor a,#$FF
	tset1 $0046
	mov $04,#$00
	mov $47,#$00
	mov $59,#$C0
	mov $53,#$20
	ret
SPC_0758:
	mov y,#$00
	mov a,($40)+y
	incw $40
	push a
	mov a,($40)+y
	incw $40
	mov y,a
	pop a
	ret
SPCPlayNormMusID:
	clrc
	mov x,#$00
	mov $03CA,x
	mov $03F1,x
	mov $04,a
	asl a
	mov x,a
	mov a,(SPCMusPtrBase-1)+x
	mov y,a
	bne SPC_077C
	mov $04,a
	ret
SPC_077C:
	mov a,(SPCMusPtrBase-2)+x
	movw $40,ya
	mov $0C,#$02
	mov a,SPCMuteChan
	eor a,#$FF
	tset1 $0046
	ret
SPC_078C:
	mov x,#$0E
	mov SPCCurChan,#$80
SPC_0791:
	mov a,SPCCurChan
	and a,SPCMuteChan
	and a,#$C0
	bne SPC_07BC
	mov a,#$FF
	mov $0301+x,a
	mov a,#$0A
	call SPCVCMDSetPan
	mov SPCInst+x,a
	mov $0381+x,a
	mov $02F0+x,a
	mov $0280+x,a
	mov $03E1+x,a
	mov $03E0+x,a
	mov $03D0+x,a
	mov $B1+x,a
	mov $C1+x,a
SPC_07BC:
	dec x
	dec x
	lsr SPCCurChan
	bne SPC_0791
	mov $5A,a
	mov $68,a
	mov $54,a
	mov $50,a
	mov $42,a
	mov $5F,a
	mov $59,#$C0
	mov $53,#$20
SPC_07D4:
	ret
SPCChkMusID:
	mov a,$00
	beq SPCNullMusID
	jmp SPCChkSpecialMusID
SPCNullMusID:
	mov a,$04
	beq SPC_07D4
	mov a,$03CA
	beq SPC_07E8
	jmp SPC_073C
SPC_07E8:
	mov a,$0C
	beq SPC_0845
	dbnz $0C,SPC_078C
SPCEndCall:
	call SPC_0758
	bne SPC_080B
	mov y,a
	bne SPC_07FA
	jmp SPCPlaySpecialF0Stop
SPC_07FA:
	dec $42
	bpl SPC_0800
	mov $42,a
SPC_0800:
	call SPC_0758
	mov x,$42
	beq SPCEndCall
	movw $42,ya
	bra SPCEndCall
SPC_080B:
	movw $16,ya
	mov y,#$0F
SPC_080F:
	mov a,($16)+y
	mov $0030+y,a
	dec y
	bpl SPC_080F
	mov x,#$00
	mov SPCCurChan,#$01
SPC_081C:
	mov a,(SPCCurChanPtrs+1)+x
	beq SPC_082A
	mov a,$0211+x
	bne SPC_082A
	mov a,#$00
	call SPC_0932
SPC_082A:
	mov a,#$00
	mov SPCCallCnt+x,a
	push a
	mov a,SPCCurChan
	and a,$1A
	and a,#$C0
	pop a
	bne SPC_083C
	mov SPCPanFadeLen+x,a
	mov $90+x,a
SPC_083C:
	inc a
	mov $70+x,a
	inc x						;\Increment X twice to point to next channel data
	inc x						;/
	asl SPCCurChan					;\Shift channel bit...
	bne SPC_081C
	mov x,#$00
	mov $5E,x
	mov SPCCurChan,#$01
SPC_084C:
	mov $44,x
	mov a,(SPCCurChanPtrs+1)+x
	beq SPC_08C0
	dec $70+x
	bne SPC_08BA

SPCGetCmdByte:
	call SPCGetMusByte				;\Get command byte...
	bne SPCSkEndRet					;/...if not 0, branch to skip end/return
	mov a,SPCCallCnt+x				;\Get call count...
	beq SPCEndCall					;|...if zero, end call...
	call SPCDoCall					;|...otherwise reload pointer...
	dec SPCCallCnt+x				;|...and decrement call count...
	bne SPCGetCmdByte				;/...if still not 0, get next command byte
	mov a,$0230+x
	mov $30+x,a
	mov a,$0231+x
	mov $31+x,a
	bra SPCGetCmdByte
SPCSkEndRet:
	bmi SPCChkForVCMD				; Branch if not note length/volume byte
	mov SPCNoteLen+x,a				; Set note length
	call SPCGetMusByte				;\Get next command byte...
	bmi SPCChkForVCMD				;/...if MSB set, branch to check for VCMD
	push a						;\Set note duration rate
	xcn a						;|
	and a,#$07					;|
	mov y,a						;|
	mov a,SPCNoteDurRtTable+y			;|
	mov SPCDurRt+x,a				;/
	pop a						;\Set note velocity rate
	and a,#$0F					;|
	mov y,a						;|
	mov a,SPCNoteVelRtTable+y			;|
	mov SPCVelRt+x,a				;/
	call SPCGetMusByte				; Get next command byte
SPCChkForVCMD:
	cmp a,#$E0					;\Check for VCMD...
	bcc SPCProcNoteOn				;|...if less than smallest VCMD, branch to do note on...
	call SPCRunVCMD					;/...otherwise, process VCMD
	bra SPCGetCmdByte				; Get next command byte
SPCProcNoteOn:
	push a						;\Check if channel is muted....
	mov a,SPCCurChan				;|
	and a,SPCMuteChan				;|
	pop a						;|
	bne SPCNoteMute					;/...if so, branch to skip
	call SPC_0518
SPCNoteMute:
	mov a,SPCNoteLen+x
	mov $70+x,a
	mov y,a
	mov a,SPCDurRt+x
	mul ya
	mov a,y
	bne SPC_08B6
	inc a
SPC_08B6:
	mov $71+x,a
	bra SPC_08BD
SPC_08BA:
	call SPC_0CE5
SPC_08BD:
	call SPC_0B6A
SPC_08C0:
	inc x						;\Increment X twice to point to next channel data
	inc x						;/
	asl SPCCurChan					;\Shift channel bit...
	beq SPCProcTempoFade
	jmp SPC_084C
SPCProcTempoFade:
	mov a,SPCTempoLen
	beq SPCProcEchoFade
	movw ya,$56
	addw ya,SPCTempo
	dbnz SPCTempoLen,SPCSetTempo
	movw ya,SPCTempoLen
SPCSetTempo:
	movw SPCTempo,ya
SPCProcEchoFade:
	mov a,$68
	beq SPCProcVolFade
	movw ya,$64
	addw ya,SPCEchoLeft
	movw SPCEchoLeft,ya
	movw ya,$66
	addw ya,SPCEchoRight
	dbnz $68,SPC_08EF
	movw ya,$68
	movw SPCEchoLeft,ya
	mov y,$6A
SPC_08EF:
	movw SPCEchoRight,ya
SPCProcVolFade:
	mov a,SPCMstVolLen
	beq SPCChkInit
	movw ya,$5C
	addw ya,$58
	dbnz $5A,SPC_08FE
	movw ya,SPCMstVolLen
SPC_08FE:
	movw SPCMstVol,ya
	mov $5E,#$FF
SPCChkInit:
	mov x,#$00					;\Init array pointer...
	mov SPCCurChan,#$01				;/...and current channel flag value
SPCChkChan:
	mov a,(SPCCurChanPtrs+1)+x			;\If MSB of channel pointer is 0, branch to skip
	beq SPCNextChan					;/
	call SPCProcChan				; Process this channel
SPCNextChan:
	inc x						;\Increment X twice to point to next channel data
	inc x						;/
	asl SPCCurChan					;\Shift channel bit...
	bne SPCChkChan					;|...if there's still another channel to process, branch back to do so...
	ret						;/...otherwise, return
SPCRunVCMD:
	asl a						;\Form VCMD pointer table offset
	mov y,a						;/
	mov a,(SPCCommandPtrTable-($E0*2)+1)+y		;\Push routine pointer to stack
	push a						;|
	mov a,(SPCCommandPtrTable-($E0*2))+y		;|
	push a						;/
	mov a,y						;\Get VCMD size...
	lsr a						;|
	mov y,a						;|
	mov a,(SPCCommandLenTable-$E0)+y		;|
	beq SPCSkMusPtrCarry				;/...if only one byte long, branch to go to VCMD routine
SPCGetMusByte:
	mov a,(SPCCurChanPtrs+x)			; Get byte from channel data
	inc SPCCurChanPtrs+x				;\Increment pointer...
	bne SPCSkMusPtrCarry				;|...if not 0, branch to skip carry over
	inc (SPCCurChanPtrs+1)+x			;/
SPCSkMusPtrCarry:
	mov y,a						;\Set Y register to byte read...
	ret						;/...and return
SPCVCMDSetInst:
	mov SPCInst+x,a
	mov y,a
	bpl SPCSkInstNoise
	setc
	sbc a,#$CA
	clrc
	adc a,SPCPercBase
SPCSkInstNoise:
	mov y,#$06
	mul ya
	movw SPCTempAddr,ya
	clrc
	adc SPCTempAddr,#$00
	adc SPCTempAddr+1,#$3D
	mov a,SPCMuteChan
	and a,SPCCurChan
	bne SPCInstExit
	push x
	mov a,x
	xcn a
	lsr a
	or a,#$04
	mov x,a
	mov y,#$00
	mov a,(SPCTempAddr)+y
	bpl SPC_096B
	and a,#$1F
	and SPCTempFLG,#$20
	tset1 SPCTempFLG
	or ($49),($47)
	mov a,y
	bra SPC_0972
SPC_096B:
	mov a,$47
	tclr1 SPCTempNON
SPC_0970:
	mov a,(SPCTempAddr)+y
SPC_0972:
	mov $00F2,x
	mov $00F3,a
	inc x
	inc y
	cmp y,#$04
	bne SPC_0970
	pop x
	mov a,(SPCTempAddr)+y
	mov $0221+x,a
	inc y
	mov a,(SPCTempAddr)+y
	mov $0220+x,a
SPCInstExit:
	ret
SPCVCMDSetPan:
	mov SPCPanEx+x,a				;\Set pan
	and a,#$1F					;|
	mov SPCPan+x,a					;/
	mov a,#$00
	mov $0330+x,a
	ret
SPCVCMDPanFade:
	mov SPCPanFadeLen+x,a				; Set pan fade length
	push a
	call SPCGetMusByte
	mov $0350+x,a
	setc
	sbc a,$0331+x
	pop x
	call SPC_0BBE
	mov $0340+x,a
	mov a,y
	mov $0341+x,a
	ret
SPCVCMDVibOn:
	mov SPCVibDelay+x,a				;\Set vibrato delay...
	call SPCGetMusByte				;|...and rate
	mov SPCVibRate+x,a				;/
	call SPCGetMusByte
SPCVCMDVibOff:
	mov $B1+x,a
	mov $02C1+x,a
	mov a,#$00
	mov $02B1+x,a
	ret
SPCVCMDVibFade:
	mov $02B1+x,a
	push a
	mov a,$B1+x
	pop x
	div ya,x
	mov x,$44
	mov $02C0+x,a
	ret
SPCVCMDMstVol:
	mov a,$03CA
	bne SPCSkMstVol
	mov a,$03F1
	bne SPCSkMstVol
	mov a,#$00					;\Set master volume and ? simultaneously
	movw SPCMstVol,ya				;/
SPCSkMstVol:
	ret
SPCVCMDMstVolFade:
	mov SPCMstVolLen,a				;\Set master volume length...
	call SPCGetMusByte				;|
	mov SPCMstVolDest,a				;/...and destination
	setc
	sbc a,$59
	mov x,$5A
	call SPC_0BBE
	movw $5C,ya
	ret
SPCVCMDTempo:
	mov a,#$00					;\Set tempo and ? simultaneously
	movw SPCTempo,ya				;|
	ret						;/
SPCVCMDTempoFade:
	mov SPCTempoLen,a				;\Set tempo fade length...
	call SPCGetMusByte				;|
	mov SPCTempoDest,a				;/...and destination
	setc
	sbc a,$53
	mov x,$54
	call SPC_0BBE
	movw $56,ya
	ret
SPCVCMDMstXpose:
	mov SPCMstXpose,a				; Set transpose
	ret
SPCVCMDXpose:
	mov $03D0+x,a
	mov a,$03A0+x
	bne SPCSkXpose
	mov a,$03D0+x
	mov $02F0+x,a
SPCSkXpose:
	ret
SPCVCMDTremOn:
	mov SPCTremDelay+x,a				;\Set tremolo delay...
	call SPCGetMusByte				;|
	mov SPCTremRate+x,a				;|...and rate
	call SPCGetMusByte				;/
SPCVCMDTremOff:
	mov SPCTremDepth+x,a				; Set tremolo depth
	ret
SPCVCMDPitchEnvTo:
	mov a,#$01
	bra SPCPitchEnv
SPCVCMDPitchEnvFrom:
	mov a,#$00
SPCPitchEnv:
	mov SPCPitchEnvDir+x,a				; Set pitch envelope direction
	mov a,y						;\Set pitch envelope delay
	mov SPCPitchEnvDelay+x,a			;/
	call SPCGetMusByte
	mov $03E1+x,a
	push a
	mov a,SPCCurChan
	and a,SPCMuteChan
	pop a
	beq SPC_0A4F
	mov a,#$00
SPC_0A4F:
	mov $0280+x,a
	call SPCGetMusByte
	mov SPCPitchEnvKey+x,a
	ret
SPCVCMDPitchEnvOff:
	mov $0280+x,a
	mov $03E1+x,a
	ret
SPCVCMDVol:
	mov SPCVol+x,a
	mov a,#$00
	mov $300+x,a
	ret
SPCVCMDVolFade:
	mov $90+x,a
	push a
	call SPCGetMusByte
	mov $0320+x,a
	setc
	sbc a,$0301+x
	pop a
	call SPC_0BBE
	mov $0310+x,a
	mov a,y
	mov $0311+x,a
	ret
SPCVCMDTune:
	mov $03E0+x,a
	mov a,$03A0+x
	bne SPCSkTune
	mov a,$03E0+x
	mov $0381+x,a
SPCSkTune:
	ret
SPCVCMDCall:
	mov SPCCallPtr+x,a				;\Set call pointer
	call SPCGetMusByte				;|
	mov (SPCCallPtr+1)+x,a				;|
	call SPCGetMusByte				;/
	mov SPCCallCnt+x,a
	mov a,$30+x
	mov $0230+x,a
	mov a,$31+x
	mov $0231+x,a
SPCDoCall:
	mov a,SPCCallPtr+x				;\Reload call pointer
	mov SPCCurChanPtrs+x,a				;|
	mov a,(SPCCallPtr+1)+x				;|
	mov (SPCCurChanPtrs+1)+x,a			;/
	ret
SPCVCMDEchoVol:
	mov $03C3,a
	mov $4A,a
	call SPCGetMusByte				;\Set left echo and ? simultaneously
	mov a,#$00					;|
	movw SPCEchoLeft,ya				;/
	call SPCGetMusByte				;\Set right echo and ? simultaneously
	mov a,#$00					;|
	movw SPCEchoRight,ya				;/
	clr5 $48
	ret
SPCVCMDEchoVolFade:
	mov SPCEchoFadeLen,a
	call SPCGetMusByte
	mov $69,a
	setc
	sbc a,$61
	mov x,$68
	call SPC_0BBE
	movw $64,ya
	call SPCGetMusByte
	mov $6A,a
	setc
	sbc a,$63
	mov x,$68
	call SPC_0BBE
	movw $66,ya
	ret
SPCVCMDEchoOff:
	movw SPCEchoLeft,ya				;\Clear left/right echo
	movw SPCEchoRight,ya				;/
	set5 $48
	ret
SPCVCMDEchoProps:
	call SPC_0B14
	call SPCGetMusByte
	mov SPCTempEFB,a
	call SPCGetMusByte
	mov y,#$08
	mul ya
	mov x,a
	mov y,#$0F
SPCEchoPropsLoop:
	mov a,SPCEchoFilters+x
	call SPCWriteDSPReg
	inc x
	mov a,y
	clrc
	adc a,#$10
	mov y,a
	bpl SPCEchoPropsLoop
	mov x,$44
	ret

SPC_0B14:
	mov $4D,a
	mov y,#$7D
	mov $00F2,y
	mov a,$00F3
	cmp a,$4D
	beq SPC_0B4D
	and a,#$0F
	eor a,#$FF
	bbc7 $4C,SPC_0B2C
	clrc
	adc a,$4C
SPC_0B2C:
	mov $4C,a
	mov y,#$04
SPC_0B30:
	mov a,$0E9B+y
	mov $00F2,a
	mov a,#$00
	mov $00F3,a
	dbnz y,SPC_0B30
	mov a,$48
	or a,#$20
	mov y,#$6C
	call SPCWriteDSPReg
	mov a,$4D
	mov y,#$7D
	call SPCWriteDSPReg
SPC_0B4D:
	asl a
	asl a
	asl a
	eor a,#$FF
	setc
	adc a,#$3C
	mov y,#$6D
	jmp SPCWriteDSPReg
SPCVCMDPercBase:
	mov SPCPercBase,a
	ret
SPCVCMDMod:
	push a
	mov a,SPCCurChan
	and a,SPCMuteChan
	pop a
	beq SPC_0B8B
	mov $10,#$02
	bra SPC_0B7D
	mov a,$A0+x
	bne SPC_0BB2
	mov a,SPCCurChan
	and a,$1A
	beq SPC_0B85
	mov $10,#$04
SPC_0B7D:
	call SPC_092A
	dbnz $10,SPC_0B7D
	bra SPC_0BB2
	call SPC_092A
	call SPCGetMusByte
SPC_0B8B:
	mov $A1+x,a
	call SPCGetMusByte
	mov $A0+x,a
	call SPCGetMusByte
	clrc
	adc a,SPCMstXpose
	adc a,$02F0+x
	and a,#$F
	mov $0380+x,a
	setc
	sbc a,$0361+x
	mov y,$A0+x
	push y
	pop x
	call SPC_0BBE
	mov $0370+x,a
	mov a,y
	mov $0371+x,a
	ret
SPC_0BB3:
	mov a,$0361+x
	mov $11,a
	mov a,$0360+x
	mov $10,a
	ret
SPC_0BBE:
	notc
	ror $12
	bpl SPC_0BC6
	eor a,#$FF
	inc a
SPC_0BC6:
	mov y,#$00
	div ya,x
	push a
	mov a,#$00
	div ya,x
	pop y
	mov x,$44
SPC_0BD0:
	bbc7 $12,SPC_0BD9
	movw SPCTempAddr,ya
	movw ya,$0E
	subw ya,SPCTempAddr
SPC_0BD9:
	ret
SPCCommandPtrTable:
	DW SPCVCMDSetInst
	DW SPCVCMDSetPan
	DW SPCVCMDPanFade
	DW SPCVCMDVibOn
	DW SPCVCMDVibOff
	DW SPCVCMDMstVol
	DW SPCVCMDMstVolFade
	DW SPCVCMDTempo
	DW SPCVCMDTempoFade
	DW SPCVCMDMstXpose
	DW SPCVCMDXpose
	DW SPCVCMDTremOn
	DW SPCVCMDTremOff
	DW SPCVCMDVol
	DW SPCVCMDVolFade
	DW SPCVCMDCall
	DW SPCVCMDVibFade
	DW SPCVCMDPitchEnvTo
	DW SPCVCMDPitchEnvFrom
	DW SPCVCMDPitchEnvOff
	DW SPCVCMDTune
	DW SPCVCMDEchoVol
	DW SPCVCMDEchoOff
	DW SPCVCMDEchoProps
	DW SPCVCMDEchoVolFade
	DW SPCVCMDMod
	DW SPCVCMDPercBase
SPCCommandLenTable:
	DB $01,$01,$02,$03,$00,$01,$02,$01,$02,$01,$01,$03,$00,$01,$02,$03
	DB $01,$03,$03,$00,$01,$03,$00,$03,$03,$03,$01
SPCProcChan:
	mov a,$90+x
	beq SPC_0C38
	mov a,#$00
	mov y,#$03
	dec $90+x
	call SPC_0CC1
SPC_0C38:
	mov y,$C1+x
	beq SPC_0C5F
	mov a,$02E0+x
	cbne $C0+x,SPC_0C5D
	or ($5E),(SPCCurChan)
	mov a,$02D0+x
	bpl SPC_0C51
	inc y
	bne SPC_0C51
	mov a,#$80
	bra SPC_0C55
SPC_0C51:
	clrc
	adc a,$02D1+x
SPC_0C55:
	mov $02D0+x,a
	call SPC_0E4A
	bra SPC_0C64
SPC_0C5D:
	inc $C0+x
SPC_0C5F:
	mov a,#$FF
	call SPC_0E55
SPC_0C64:
	mov a,$91+x
	beq SPC_0C71
	mov a,#$30
	mov y,#$03
	dec $91+x
	call SPC_0CC1
SPC_0C71:
	mov a,SPCCurChan
	and a,$5E
	beq SPC_0CC0
	mov a,$0331+x
	mov y,a
	mov a,$0330+x
	movw $10,ya
	mov a,x
	xcn a
	lsr a
	mov $12,a
SPC_0C85:
	mov y,$11
	mov a,$0E68+y
	setc
	sbc a,$0E67+y
	mov y,$10
	mul ya
	mov a,y
	mov y,$11
	clrc
	adc a,$0E67+y
	mov y,a
	mov $0250+x,a
	mov a,$0321+x
	mul ya
	mov a,SPCPanEx+x
	asl a
	bbc0 $12,SPC_0CA8
	asl a
SPC_0CA8:
	mov a,y
	bcc SPC_0CAE
	eor a,#$FF
	inc a
SPC_0CAE:
	mov y,$12
	call SPC_0605
	mov y,#$14
	mov a,#$00
	subw ya,$10
	movw $10,ya
	inc $12
	bbc1 $12,SPC_0C85
SPC_0CC0:
	ret
SPC_0CC1:
	or ($5E),(SPCCurChan)
SPC_0CC4:
	movw $14,ya
	movw $16,ya
	push x
	pop y
	clrc
	bne SPC_0CD7
	adc $16,#$1F
	mov a,#$00
	mov ($14)+y,a
	inc y
	bra SPC_0CE0
SPC_0CD7:
	adc $16,#$10
	call SPC_0CDE
	inc y
SPC_0CDE:
	mov a,($14)+y
SPC_0CE0:
	adc a,($16)+y
	mov ($14)+y,a
	ret
SPC_0CE5:
	mov a,$71+x
	beq SPC_0D4E
	dec $71+x
	beq SPC_0CF2
	mov a,#$02
	cbne $70+x,SPC_0D4E
SPC_0CF2:
	mov a,SPCCallCnt+x
	mov $17,a
	mov a,$30+x
	mov y,$31+x
SPC_0CFA:
	movw $14,ya
	mov y,#$00
SPC_0CFE:
	mov a,($14)+y
	beq SPC_0D20
	bmi SPC_0D0B
SPC_0D04:
	inc y
	bmi SPC_0D47
	mov a,($14)+y
	bpl SPC_0D04
SPC_0D0B:
	cmp a,#$C8
	beq SPC_0D4E
	cmp a,#$EF
	beq SPC_0D3C
	cmp a,#$E0
	bcc SPC_0D47
	push y
	mov y,a
	pop a
	adc a,$0B30+y
	mov y,a
	bra SPC_0CFE
SPC_0D20:
	mov a,$17
	beq SPC_0D47
	dec $17
	bne SPC_0D32
	mov a,$0231+x
	push a
	mov a,$0230+x
	pop y
	bra SPC_0CFA
SPC_0D32:
	mov a,$0241+x
	push a
	mov a,$0240+x
	pop y
	bra SPC_0CFA
SPC_0D3C:
	inc y
	mov a,($14)+y
	push a
	inc y
	mov a,($14)+y
	mov y,a
	pop a
	bra SPC_0CFA
SPC_0D47:
	mov a,$47
	mov y,#$5C
	call SPC_0605
SPC_0D4E:
	clr7 $13
	mov a,$A0+x
	beq SPC_0D6D
	mov a,$A1+x
	beq SPC_0D5C
	dec $A1+x
	bra SPC_0D6D
SPC_0D5C:
	mov a,$1A
	and a,$47
	bne SPC_0D6D
	set7 $13
	mov a,#$60
	mov y,#$03
	dec $A0+x
	call SPC_0CC4
SPC_0D6D:
	call SPC_0BB3
	mov a,$B1+x
	beq SPC_0DC0
	mov a,$02B0+x
	cbne $B0+x,SPC_0DBE
	mov a,$0100+x
	cmp a,$02B1+x
	bne SPC_0D87
	mov a,$02C1+x
	bra SPC_0D94
SPC_0D87:
	setp
	inc $00+x
	clrp
	mov y,a
	beq SPC_0D90
	mov a,$B1+x
SPC_0D90:
	clrc
	adc a,$02C0+x
SPC_0D94:
	mov $B1+x,a
	mov a,$02A0+x
	clrc
	adc a,$02A1+x
	mov $02A0+x,a
SPC_0DA0:
	mov $12,a
	asl a
	asl a
	bcc SPC_0DA8
	eor a,#$FF
SPC_0DA8:
	mov y,a
	mov a,$B1+x
	cmp a,#$F1
	bcc SPC_0DB4
	and a,#$0F
	mul ya
	bra SPC_0DB8
SPC_0DB4:
	mul ya
	mov a,y
	mov y,#$00
SPC_0DB8:
	call SPC_0E35
SPC_0DBB:
	jmp SPC_0582
SPC_0DBE:
	inc $B0+x
SPC_0DC0:
	bbs7 $13,SPC_0DBB
	ret
SPC_0DC4:
	clr7 $13
	mov a,$C1+x
	beq SPC_0DD3
	call SPC_0E3D
SPC_0DD3:
	mov a,$331+x
	mov y,a
	mov a,$330+x
	movw $10,ya
	mov a,$91+x
	beq SPC_0DEA
	mov a,$0341+x
	mov y,a
	mov a,$0340+x
	call SPC_0E1F
SPC_0DEA:
	bbc7 $13,SPC_0DF0
	call SPC_0C80
SPC_0DF0:
	clr7 $13
	call SPC_0BB3
	mov a,$A0+x
	beq SPC_0E07
	mov a,$A1+x
	bne SPC_0E07
	mov a,$0371+x
	mov y,a
	mov a,$0370+x
	call SPC_0E1F
SPC_0E07:
	mov a,$B1+x
	beq SPC_0DC0
	mov a,$02B0+x
	cbne $B0+x,SPC_0DC0
	mov y,$51
	mov a,$02A1+x
	mul ya
	mov a,y
	clrc
	adc a,$02A0+x
	jmp SPC_0DA0
SPC_0E1F:
	set7 $13
	mov $12,y
	call SPC_0BD0
	push y
	mov y,$51
	mul ya
	mov $14,y
	mov $15,#$00
	mov y,$51
	pop a
	mul ya
	addw ya,$14
SPC_0E35:
	call SPC_0BD0
	addw ya,$10
	movw $10,ya
	ret
SPC_0E3D:
	set7 $13
	mov y $51
	mov a,$02D1+x
	mul ya
	mov a,y
	clrc
	adc a,$02D0+x
	asl a
	bcc SPC_0E4F
	eor a,#$FF
SPC_0E4F:
	mov y,$C1+x
	mul ya
	mov a,y
	eor a,#$FF
	mov y,$59
	mul ya
	mov a,$0210+x
	mul ya
	mov a,$0301+x
	mul ya
	mov a,y
	mul ya
	mov a,y
	mov $0321+x,a
	ret
SPCPanVals:
	DB $00,$01,$03,$07,$0D,$15,$1E,$29,$34,$42,$51,$5E,$67,$6E,$73,$77
	DB $7A,$7C,$7D,$7E,$7F
SPCEchoFilters:
	DB $7F,$00,$00,$00,$00,$00,$00,$00




SPCRegs:
	DB $2C,$3C,$0D,$4D,$6C,$4C,$5C,$3D,$2D,$5C
SPCValPtrs:
	DB SPCTempEVOLLeft
	DB SPCTempEVOLRight
	DB SPCTempEFB
	DB SPCTempEON
	DB SPCTempFLG
	DB SPCTempKON
	DB SPCTempKOF2
	DB SPCTempNON
	DB SPCTempPMON
	DB SPCTempKOF
SPCPitchTable:
	DW $085F,$08DE,$0965,$09F4,$0A8C,$0B2C,$0BD6,$0C8B
	DW $0D4A,$0E14,$0EEA,$0FCD,$10BE
SPC_0ECA:
	DB $2A,$56,$65,$72,$20,$53,$31,$2E,$32,$30,$2A
SPCLoadNewPacket:
	mov a,#$AA					;\Send magic value to SNES
	mov $00F4,a					;|
	mov a,#$BB					;|
	mov $00F5,a					;/
SPCWaitMagic:
	mov a,$00F4					;\Wait for response...
	cmp a,#$CC					;|
	bne SPCWaitMagic				;|
	bra SPCProcData					;/...then branch to process data
SPCWaitData:
	mov y,$00F4					;\Wait for 0 to be sent
	bne SPCWaitData					;/
SPCXferData:
	cmp y,$00F4					;\Check for data
	bne SPCChkEnd					;/
	mov a,$00F5					;\Get data byte...
	mov $00F4,y					;|
	mov (SPCTempAddr)+y,a				;/...and write to memory
	inc y						;\Increment counter...
	bne SPCXferData					;/...if not 0, branch to skip carry over
	inc SPCTempAddr+1
	bra SPCXferData
SPCChkEnd:
	bpl SPCXferData					;\Check if we're at the end of the transfer
	cmp y,$00F4					;|
	bpl SPCXferData					;/
SPCProcData:
	mov a,$00F6					;\Set address to write to
	mov y,$00F7					;|
	movw SPCTempAddr,ya				;/
	mov y,$00F4
	mov a,$00F5
	mov $00F4,y
	bne SPCWaitData
	mov x,#$31					;\Init flags...
	mov $00F1,x					;|
	ret						;/...and return to execution
SPC_0F21:
	
	
	
	
	
	
	
	END BASE
	ARCH 65816
	;Transfer $009B bytes to SPC address $3E20
	DW $009B,$3E20
	;Data to transfer
	DB $CD,$00,$3A,$2C,$E7,$2C,$8D,$06,$CF,$8F,$8F,$D2,$8F,$23,$D3,$7A
	DB $D2,$DA,$D2,$8D,$00,$E5,$C2,$03,$08,$04,$5D,$8F,$04,$12,$F7,$D2
	DB $6D,$4D,$EE,$3F,$0D,$06,$6D,$CE,$EE,$3D,$FC,$6E,$12,$F0,$F7,$D2
	DB $E9,$C0,$03,$D5,$21,$02,$FC,$F7,$D2,$D5,$20,$02,$5F,$27,$2B,$E2
	DB $13,$E8,$60,$8D,$03,$9B,$A0,$3F,$C4,$0C,$F5,$61,$03,$FD,$F5,$60
	DB $03,$DA,$10,$8F,$00,$47,$5F,$82,$05,$2D,$8D,$5C,$E8,$00,$3F,$0D
	DB $06,$AE,$8D,$4C,$5F,$0D,$06,$E5,$F1,$03,$D0,$19,$E4,$59,$C5,$F1
	DB $03,$E8,$88,$C4,$59,$6F,$E5,$F1,$03,$F0,$0A,$E5,$F1,$03,$C4,$59
	DB $E8,$00,$C5,$F1,$03,$6F,$E5,$C1,$03,$24,$4A,$F0,$0D,$E4,$4A,$80
	DB $A5,$C1,$03,$C4,$4A,$8D,$4D,$3F,$0D,$06,$6F
	;End of transfer
	DW $0000,$0400
	
	;Transfer $0060 bytes to SPC address $3C00
	DW $0060,$3C00
	;Data to transfer
	DB $00,$40,$1B,$40,$F8,$41,$06,$43,$D6,$45,$FA,$45,$A4,$4D,$C8,$4D
	DB $3A,$51,$9B,$56,$9B,$56,$5F,$5C,$5F,$5C,$02,$68,$02,$68,$94,$75
	DB $94,$75,$58,$7B,$58,$7B,$73,$7B,$BB,$7B,$E8,$7B,$70,$7E,$8B,$7E
	DB $07,$84,$1D,$8C,$1D,$8C,$30,$8E,$30,$8E,$E3,$95,$E3,$95,$53,$9E
	DB $53,$9E,$F2,$A1,$F2,$A1,$16,$A2,$9F,$A6,$48,$AC,$48,$AC,$63,$AC
	DB $40,$AE,$A0,$B1,$40,$AE,$A0,$B1,$40,$AE,$A0,$B1,$A9,$B1,$59,$B3
	;Transfer $7360 bytes to SPC address $4000
	DW $7360,$4000
	;Data to transfer
	;Waves
	INCBIN "audio/waves/unk18A92A.brr"
	INCBIN "audio/waves/mechanical.brr"
	INCBIN "audio/waves/mechanical2.brr"
	INCBIN "audio/waves/unk18B6CE.brr"
	INCBIN "audio/waves/laser.brr"
	INCBIN "audio/waves/bomb.brr"
	INCBIN "audio/waves/laser2.brr"
	INCBIN "audio/waves/crash.brr"
	INCBIN "audio/waves/hit.brr"
	INCBIN "audio/waves/noise3.brr"
	INCBIN "audio/waves/noise2.brr"
	INCBIN "audio/waves/mechanical3.brr"
	INCBIN "audio/waves/narr_incomingenemy.brr"
	INCBIN "audio/waves/narr_wing.brr"
	INCBIN "audio/waves/narr_damaged.brr"
	INCBIN "audio/waves/narr_twinblaster.brr":$0000-$00F2
