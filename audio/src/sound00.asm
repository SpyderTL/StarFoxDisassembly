
0400:
	CLRP
	MOV X, #CF
	MOV SP, X
	MOV A, #00
	MOV X, A

0407:
	MOV (X)+, A
	CMP X, #E0
	BNE 0407
	MOV X, #00

040E:
	MOV +X, A0200
	INC X
	BNE 040E

0414:
	MOV +X, A0300
	INC X
	BNE 0414
	INC A
	CALL 0B14
	SET1.5 0048
	MOV A, #96
	MOV , A03C6
	MOV A, #BB
	MOV , A03CB
	CALL 0648
	MOV A, #60
	MOV Y, #0C
	CALL 060D
	MOV Y, #1C
	CALL 060D
	MOV A, #3C
	MOV Y, #5D
	CALL 060D
	MOV A, #F0
	MOV , A00F1
	MOV A, #10
	MOV , A00FA
	MOV , A53
	MOV A, #01
	MOV , A00F1

0451:
	MOV Y, #0A

0453:
	CMP Y, #05
	BEQ 045E
	BCS 0461
	CMP 4D, 4C
	BNE 046F

045E:
	BBS.7 4C, 046F

0461:
	MOV A, +Y0E9B
	MOV , A00F2
	MOV A, +Y0EA5
	MOV X, A
	MOV A, (X)
	MOV , A00F3

046F:
	DBNZ Y, 0453
	MOV 45, Y0045
	MOV 46, Y
	MOV A, 18
	EOR A, 19
	LSR A
	LSR A
	NOTC
	ROR 18
	ROR 19

0480:
	MOV Y, 00FD
	BEQ 0480
	PUSH Y
	MOV A, #38
	MUL YA
	CLRC
	ADC A, 43
	MOV , A43
	BCC 04B6
	CALL 257C
	MOV X, #01
	CALL 04ED
	CALL 2749
	MOV X, #02
	CALL 04ED
	CALL 2A1A
	CALL 2981
	CMP 4D, 4C
	BEQ 04B6
	INC 03C7
	MOV A, 03C7
	LSR A
	BCS 04B6
	INC 4C

04B6:
	MOV A, 53
	POP Y
	MUL YA
	CLRC
	ADC A, 51
	MOV , A51
	BCC 04D1
	MOV A, 03F8
	BNE 04CE
	CALL 07D5
	MOV X, #00
	CALL 04FE

04CE:
	JMP 0451

04D1:
	MOV A, 04
	BEQ 04E7
	MOV X, #00
	MOV (swap)#01, 47

04DA:
	MOV A, 31+X
	BEQ 04E1
	CALL 0DC4

04E1:
	INC X
	INC X
	ASL 47
	BNE 04DA

04E7:
	CALL 0614
	JMP 0451

04ED:
	MOV A, 04+X
	MOV +X, A00F4

04F2:
	MOV A, +X00F4
	CMP A, +X00F4
	BNE 04F2
	MOV Y, A
	MOV 00+X, Y

04FD:
	RET

04FE:
	MOV A, 04+X
	MOV +X, A00F4

0503:
	MOV A, +X00F4
	CMP A, +X00F4
	BNE 0503
	MOV Y, A
	MOV A, 08+X
	MOV 08+X, Y
	CBNE 08+X, A
	SET1.0 8D
	NOP
	MOV 00+X, Y
	RET

0518:
	CMP Y, #CA
	BCC 0521
	CALL 0932
	MOV Y, #A4

0521:
	CMP Y, #C8
	BCS 04FD
	MOV A, 1A
	AND A, 47
	BNE 04FD
	MOV A, Y
	AND A, #7F
	CLRC
	ADC A, 50
	CLRC
	ADC A, +X02F0
	MOV +X, A0361
	MOV A, +X0381
	MOV +X, A0360
	MOV A, +X02B1
	LSR A
	MOV A, #00
	ROR A
	MOV +X, A02A0
	MOV A, #00
	MOV B0+X, A
	MOV +X, A0100
	MOV +X, A02D0
	MOV C0+X, A
	OR 5E, 47
	OR 45, 47
	MOV A, 0280+X
	MOV A0+X, A
	BEQ 057F
	MOV A, 0281+X
	MOV A1+X, A
	MOV A, +X0290
	BNE 0575
	MOV A, 0361+X
	SETC
	SBC A, 0291+X
	MOV 0361+X, A

0575:
	MOV A, 0291+X
	CLRC
	ADC A, 0361+X
	CALL 0B9B

057F:
	CALL 0BB3

0582:
	MOV Y, #00
	MOV 11, A
	SETC
	SBC A, #34
	BCS 0594
	MOV 11, A
	SETC
	SBC A, #13
	BCS 0598
	DEC Y
	ASL A

0594:
	ADDW YA, 10
	MOVW 10, YA

0598:
	PUSH X
	MOV 0011, A
	ASL A
	MOV Y, #00
	MOV X, #18
	DIV YA, X
	MOV X, A
	MOV A, 0EB1+Y
	MOV 15, A
	MOV A, 0EB0+Y
	MOV 14, A
	MOV A, 0EB3+Y
	PUSH A
	MOV A, 0EB2+Y
	POP Y
	SUBW YA, 14
	MOV Y, 10
	MUL YA
	MOV A, Y
	MOV Y, #00
	ADDW YA, 14
	MOV 15, Y
	ASL A
	ROL 15
	MOV 14, A
	BRA 05CB

0605:
	PUSH A
	MOV A, 47
	AND A, 1A
	POP A
	BNE 0613

060D:
	MOV 00F2, Y
	MOV 00F3, A

0613:
	RET

060D:
	MOV 00F2, Y
	MOV 00F3, A

0613:
	RET

0614:
	DEC D0
	MOV A, D0
	AND A, #03
	MOV Y, #3F
	MUL YA
	MOV Y, A
	MOV 12, #07
	INC Y
	MOV X, #04

0624:
	MOV1 C, C0, 19
	EOR C, A0, 19
	ROL 18
	ROL 19
	MOV A, 19
	AND A, 03CB
	OR A, #11
	MOV +Y, AFE00
	INC Y
	MOV A, 18
	OR A, #11
	MOV +Y, AFE00
	INC Y
	DEC X
	BNE 0624
	DBNZ 12, DA
	RET

0648:
	MOV Y, #00
	MOV X, #1B
	MOV A, 03C6

064F:
	MOV +Y, AFE00
	INC Y
	INC Y
	INC Y
	INC Y
	INC Y
	INC Y
	INC Y

0659:
	INC Y
	INC Y
	DEC X
	BNE 064F
	INC A
	MOV FE00+Y, A
	MOV Y, #FE
	MOV A, #00
	MOV 3C80, A
	MOV 3C81, Y
	MOV 3C82, A
	MOV 3C83, Y
	MOV A, 18
	OR A, 19
	BNE 067A
	INC 18

067A:
	RET

067B:
	MOV A, #00
	MOV Y, #2C
	CALL 060D
	MOV Y, #3C
	CALL 060D
	MOV A, #FF
	MOV Y, #5C
	CALL 060D
	CALL 0ED5
	MOV A, #00
	MOV , A03CA
	MOV , A04
	MOV 0005, A
	MOV 0006, A
	MOV 0007, A
	MOV 1A, A
	MOV Y, #10

06A5:
	MOV 039F+Y, A
	DBNZ Y, 06A5
	MOV A, #96
	MOV 03C6, A
	MOV A, #BB
	MOV 03CB, A
	CALL 0648

06B7:
	CMP #11, 04
	BEQ 06CF
	MOV X, #A0
	MOV 5A, X
	MOV 03CA, X
	MOV A, #00
	MOV 5B, A
	SETC
	SBC A, 59
	CALL 0BBE
	MOVW 5C, YA

06CF:
	JMP 07DC

06D2:
	MOV A, 03F1
	BNE 06F5
	MOV A, 59
	MOV , A03F1
	MOV A, #70
	MOV , A59
	JMP 07DC

06E3:
	MOV A, 03F1
	BEQ 06F5
	MOV A, 03F1
	MOV , A59
	MOV A, #00
	MOV , A03F1
	JMP 07DC

06F5:
	RET

06F6:
	CMP A, FF
	BEQ 067B
	CMP A, F1
	BEQ 06B7
	CMP A, F2
	BEQ 06D2
	CMP A, F3
	BEQ 06E3
	CMP A, F4
	BEQ 071D
	CMP A, F5
	BEQ 0717
	CMP A, F0
	BEQ 0744
	CMP A, 14
	BCC 0766
	RET

0717:
	MOV X, #03
	MOV A, #30
	BNE 0721

071D:
	MOV X, #FE
	MOV A, #09

0721:
	MOV 54, #8F
	MOV 02F0, X
	MOV 02F2, X
	MOV 02F4, X
	MOV 55, A
	SETC
	SBC A, 53
	MOV X, 54
	CALL 0BBE
	MOVW 56, YA
	JMP 07DC

073C:
	DEC 03CA
	BEQ 0744
	JMP 07E8

0744:
	MOV A, 1A
	EOR A, #FF
	TSET1 0046
	MOV 04, #00
	MOV 47, #00
	MOV 59, #C0
	MOV 53, #20
	RET

0758:
	MOV Y, #00
	MOV A, [40]+Y
	INC 0040
	PUSH A
	MOV A, [40]+Y
	INC 0040
	MOV Y, A
	POP A
	RET

0766:
	CLRC
	MOV X, #00
	MOV 03CA, X
	MOV 03F1, X
	MOV 04, A
	ASL A
	MOV X, A
	MOV A, FDBF+X
	MOV Y, A
	BNE 077C
	MOV 04, A
	RET

077C:
	MOV A, FDBE+X
	MOVW 40, YA
	MOV 0C, #02
	MOV A, 1A
	EOR A, #FF
	TSET1 0046
	RET

07D4:
	RET

07D5:
	MOV A, 00
	BEQ 07DC
	JMP 06F6

07DC:
	MOV A, 04
	BEQ 07D4
	MOV A, 03CA
	BEQ 07E8
	JMP 073C

07E8:
	MOV A, 0C
	BEQ 0845
	DBNZ 0C, 9D

07EF:
	CALL 0758
	BNE 080B
	MOV Y, A
	BNE 07FA
	JMP 0744

07FA:
	DEC 42
	BPL 0800
	MOV , A42

0800:
	CALL 0758
	MOV X, 42
	BEQ 07EF
	MOVW 40, YA
	BRA 07EF

080B:
	MOVW 16, YA
	MOV Y, #0F

080F:
	MOV A, [16]+Y
	MOV +Y, A0030
	DEC Y
	BPL 080F
	MOV X, #00
	MOV (swap)#01, 47

081C:
	MOV A, 31+X
	BEQ 082A
	MOV A, 0211+X
	BNE 082A
	MOV A, #00
	CALL 0932

082A:
	MOV A, #00
	MOV 80+X, A
	PUSH A
	MOV A, 47
	AND A, 1A
	AND A, #C0
	POP A
	BNE 083C
	MOV 91+X, A
	MOV 90+X, A

083C:
	INC A
	MOV 70+X, A
	INC X
	INC X
	ASL 47
	BNE 081C

0845:
	MOV X, #00
	MOV 5E, X
	MOV (swap)#01, 47

084C:
	MOV 44, X
	MOV A, 31+X
	BEQ 08C0
	DEC 0070+X
	BNE 08BA

0856:
	CALL 0928
	BNE 0872
	MOV A, 80+X
	BEQ 07EF
	CALL 0AA9
	DEC 0080+X
	BNE 0856
	MOV A, 0230+X
	MOV 30+X, A
	MOV A, 0231+X
	MOV 31+X, A
	BRA 0856

0872:
	BMI 0894
	MOV 0200+X, A
	CALL 0928
	BMI 0894
	PUSH A
	XCN A
	AND A, #07
	MOV Y, A
	MOV A, 3EE8+Y
	MOV 0201+X, A
	POP A
	AND A, #0F
	MOV Y, A
	MOV A, 3EF0+Y
	MOV 0210+X, A
	CALL 0928

0894:
	CMP A, E0
	BCC 089D
	CALL 0916
	BRA 0856

089D:
	PUSH A
	MOV A, 47
	AND A, 1A
	POP A
	BNE 08A8
	CALL 0518

08A8:
	MOV A, 0200+X
	MOV 70+X, A
	MOV Y, A
	MOV A, 0201+X
	MUL YA
	MOV A, Y
	BNE 08B6
	INC A

08B6:
	MOV 71+X, A
	BRA 08BD

08BA:
	CALL 0CE5
	CALL 0B6A

08C0:
	INC X
	INC X
	ASL 47
	BEQ 08C9
	JMP 084C

08C9:
	MOV A, 54
	BEQ 08D8
	MOVW YA, 56
	ADDW YA, 52
	DBNZ 54, 02
	MOVW YA, 54
	MOVW 52, YA

08D8:
	MOV A, 68
	BEQ 08F1
	MOVW YA, 64
	ADDW YA, 60
	MOVW 60, YA
	MOVW YA, 66
	ADDW YA, 62
	DBNZ 68, 06
	MOVW YA, 68
	MOVW 60, YA
	MOV Y, 6A
	MOVW 62, YA

08F1:
	MOV A, 5A
	BEQ 0903
	MOVW YA, 5C
	ADDW YA, 58
	DBNZ 5A, 02
	MOVW YA, 5A
	MOVW 58, YA
	MOV (swap)#FF, 5E

0903:
	MOV X, #00
	MOV (swap)#01, 47

0908:
	MOV A, 31+X
	BEQ 090F
	CALL 0C2B

090F:
	INC X
	INC X
	ASL 47
	BNE 0908
	RET

0916:
	ASL A
	MOV Y, A
	MOV A, 0B1B+Y
	PUSH A
	MOV A, 0B1A+Y
	PUSH A
	MOV A, Y
	LSR A
	MOV Y, A
	MOV A, 0BB0+Y
	BEQ 0930

0928:
	MOV A, [30+X]

092A:
	INC 30+X
	BNE 0930
	INC 31+X

0930:
	MOV Y, A
	RET

0928:
	MOV A, [30+X]

092A:
	INC 30+X
	BNE 0930
	INC 31+X

0930:
	MOV Y, A
	RET

0932:
	MOV +X, A0211
	MOV Y, A
	BPL 093E
	SETC
	SBC A, #CA
	CLRC
	ADC A, 5F

093E:
	MOV Y, #06
	MUL YA
	MOVW 14, YA
	CLRC
	ADC 14, #00
	ADC 15, #3D,
	MOV A, 1A
	AND A, 47
	BNE 098A
	PUSH X

0951:
	MOV A, X
	XCN A
	LSR A
	OR A, #04

0956:
	MOV X, A
	MOV Y, #00
	MOV A, [14]+Y
	BPL 096B
	AND A, #1F
	AND 48, #20 
	TSET1 0048
	OR 49, 47
	MOV A, Y
	BRA 0972

096B:
	MOV A, 47
	TCLR 0049

0970:
	MOV A, [14]+Y
	MOV 00F2, X
	MOV 00F3, A
	INC X
	INC Y
	CMP Y, #04
	BNE 0970
	POP X
	MOV A, [14]+Y
	MOV 0221+X, A
	INC Y
	MOV A, [14]+Y
	MOV 0220+X, A

098A:
	RET

0AA9:
	MOV A, 0240+X
	MOV 30+X, A
	MOV A, 0241+X
	MOV 31+X, A
	RET

0B14:
	MOV , A4D
	MOV Y, #7D
	MOV , Y00F2
	MOV A, 00F3
	CMP A, 4D
	BEQ 0B4D
	AND A, #0F
	EOR A, #FF
	BBC.7 4C, 03
	CLRC
	ADC A, 4C

0B2C:
	MOV , A4C
	MOV Y, #04

0B30:
	MOV A, 0E9B+Y
	MOV 00F2, A
	MOV A, #00
	MOV 00F3, A
	DBNZ Y, 0B30
	MOV A, 48
	OR A, #20
	MOV Y, #6C
	CALL 060D
	MOV A, 4D
	MOV Y, #7D
	CALL 060D

0B4D:
	ASL A
	ASL A
	ASL A
	EOR A, #FF
	SETC
	ADC #3C
	MOV Y, #00
	JMP 060D

0B6A:
	MOV A, A0+X
	BNE 0BB2
	MOV A, [30+X]
	CMP A, F9
	BNE 0BB2
	MOV A, 47
	AND A, 1A
	BEQ 0B85
	MOV (swap)#04, 10
	CALL 092A
	DBNZ 10, FA
	BRA 0BB2

0B85:
	CALL 092A
	CALL 0928
	MOV A1+X, A
	CALL 0928
	MOV A0+X, A
	CALL 0928
	CLRC
	ADC A, 50
	ADC A, 02F0+X

0B9B:
	AND A, #7F
	MOV +X, A0380
	SETC
	SBC A, +X0361
	MOV Y, A0+X
	PUSH Y
	POP X
	CALL 0BBE
	MOV 0370+X, A
	MOV A, Y
	MOV 0371+X, A

0BB2:
	RET

0B9B:
	AND A, #7F
	MOV 0380+X, A
	SETC
	SBC A, +X0361
	MOV Y, A0+X
	PUSH Y
	POP X
	CALL 0BBE
	MOV 0370+X, A
	MOV A, Y
	MOV 0371+X, A

0BB2:
	RET

0BB3:
	MOV A, 0361+X
	MOV , A11
	MOV A, 0360+X
	MOV , A10
	RET

0BBE:
	NOTC
	ROR 12
	BPL 0BC6
	EOR A, #FF
	INC A

0BC6:
	MOV Y, #00
	DIV YA, X
	PUSH A
	MOV A, #00
	DIV YA, X
	POP Y
	MOV X, 44

0BD0:
	BBC.7 12, 06
	MOVW 14, YA
	MOVW YA, 0E
	SUBW YA, 14

0BD9:
	RET

0C2B:
	MOV A, 90+X
	BEQ 0C38
	MOV A, #00
	MOV Y, #03
	DEC 0090+X
	CALL 0CC1

0C38:
	MOV Y, C1+X
	BEQ 0C5F
	MOV A, 02E0+X
	CBNE C0+X, A
	ASL 09+X
	EOR A, 5E+X
	MOV A, 02D0+X
	BPL 0C51
	INC Y
	BNE 0C51
	MOV A, #80
	BRA 0C55

0C51:
	CLRC
	ADC A, 02D1+X
	MOV 02D0+X, A
	CALL 0E4A
	BRA 0C64

0C5F:
	MOV A, #FF
	CALL 0E55
	MOV A, 91+X
	BEQ 0C71
	MOV A, #30
	MOV Y, #03
	DEC 0091+X
	CALL 0CC1

0C71:
	MOV A, 47
	AND A, 5E
	BEQ 0CC0
	MOV A, 0331+X
	MOV Y, A
	MOV A, 0330+X
	MOVW 10, YA

0C80:
	MOV A, X
	XCN A
	LSR A
	MOV 12, A

0C85:
	MOV Y, 11
	MOV A, 0E68+Y
	SETC
	SBC A, 0E67+Y
	MOV Y, 10
	MUL YA
	MOV A, Y
	MOV Y, 11
	CLRC
	ADC A, 0E67+Y
	MOV Y, A
	MOV 0250+X, A
	MOV A, 0321+X
	MUL YA
	MOV A, 0351+X
	ASL A
	BBC.0 12, 01
	ASL A

0CA8:
	MOV A, Y
	BCC 0CAE
	EOR A, #FF
	INC A

0CAE:
	MOV Y, 12
	CALL 0605
	MOV Y, #14
	MOV A, #00
	SUBW YA, 10
	MOVW 10, YA
	INC 12
	BBC.1 12, C5

0CC0:
	RET

0C80:
	MOV A, X
	XCN A
	LSR A
	MOV , A12

0C85:
	MOV Y, 11
	MOV A, 0E68+Y
	SETC
	SBC A, 0E67+Y
	MOV Y, 10
	MUL YA
	MOV A, Y
	MOV Y, 11
	CLRC
	ADC A, 0E67+Y
	MOV Y, A
	MOV 0250+X, A
	MOV A, 0321+X
	MUL YA
	MOV A, 0351+X
	ASL A
	BBC.0 12, 01
	ASL A

0CA8:
	MOV A, Y
	BCC 0CAE
	EOR A, #FF
	INC A

0CAE:
	MOV Y, 12
	CALL 0605
	MOV Y, #14
	MOV A, #00
	SUBW YA, 10
	MOVW 10, YA
	INC 12
	BBC.1 12, C5

0CC0:
	RET

0CC1:
	OR 5E, 47

0CC4:
	MOVW 14, YA
	MOVW 16, YA
	PUSH X
	POP Y
	CLRC
	BNE 0CD7
	ADC 16, #1F
	MOV A, #00
	MOV [14}+Y, A
	INC Y
	BRA 0CE0

0CC4:
	MOVW 14, YA
	MOVW 16, YA
	PUSH X
	POP Y
	CLRC
	BNE 0CD7
	ADC 16, #1F 
	MOV A, #00
	MOV [14}+Y, A
	INC Y
	BRA 0CE0

0CD7:
	ADC 16, #10
	CALL 0CDE
	INC Y

0CDE:
	MOV A, [14]+Y
	ADC A, [16]+Y
	MOV [14]+Y, A
	RET

0CE5:
	MOV A, 71+X
	BEQ 0D4E
	DEC +X0071
	BEQ 0CF2
	MOV A, #02
	CBNE 70+X, A
	LSR A

0CF2:
	MOV A, 80+X
	MOV , A17
	MOV A, 30+X
	MOV Y, 31+X
	MOVW 14, YA
	MOV Y, #00
	MOV A, [14]+Y
	BEQ 0D20
	BMI 0D0B

0D04:
	INC Y
	BMI 0D47
	MOV A, [14]+Y
	BPL 0D04

0D0B:
	CMP A, C8
	BEQ 0D4E
	CMP A, EF
	BEQ 0D3C
	CMP A, E0
	BCC 0D47
	PUSH Y
	MOV Y, A
	POP A
	ADC A, 0B30+Y
	MOV Y, A
	BRA 0CFE

0D20:
	MOV A, 17
	BEQ 0D47
	DEC 17
	BNE 0D32
	MOV A, 0231+X
	PUSH A
	MOV A, 0230+X
	POP Y
	BRA 0CFA

0D32:
	MOV A, 0241+X
	PUSH A
	MOV A, 0240+X
	POP Y
	BRA 0CFA

0D3C:
	INC Y
	MOV A, [14]+Y
	PUSH A
	INC Y
	MOV A, [14]+Y
	MOV Y, A
	POP A
	BRA 0CFA

0D47:
	MOV A, 47
	MOV Y, #5C
	CALL 0605

0D4E:
	CLR1.7 13
	MOV A, A0+X
	BEQ 0D6D
	MOV A, A1+X
	BEQ 0D5C
	DEC 00A1+X
	BRA 0D6D

0D5C:
	MOV A, 1A
	AND A, 47
	BNE 0D6D
	SET1.7 13
	MOV A, #60
	MOV Y, #03
	DEC 00A0+X
	CALL 0CC4

0D6D:
	CALL 0BB3
	MOV A, B1+X
	BEQ 0DC0
	MOV A, 02B0+X
	CBNE B0+X, A
	EOR A, F5
	NOP
	TCALL 0
	CMP A, 02B1+X
	BNE 0D87
	MOV A, 02C1+X
	BRA 0D94

0D87:
	SETP
	INC 00+X
	CLRP
	MOV Y, A
	BEQ 0D90
	MOV A, B1+X

0D90:
	CLRC
	ADC A, 02C0+X
	MOV B1+X, A
	MOV A, 02A0+X
	CLRC
	ADC A, 02A1+X
	MOV 02A0+X, A

0DA0:
	MOV 12, A
	ASL A
	ASL A
	BCC 0DA8
	EOR A, #FF

0DA8:
	MOV Y, A
	MOV A, B1+X
	CMP A, F1
	BCC 0DB4
	AND A, #0F
	MUL YA
	BRA 0DB8

0DA0:
	MOV , A12
	ASL A
	ASL A
	BCC 0DA8
	EOR A, #FF

0DA8:
	MOV Y, A
	MOV A, B1+X
	CMP A, F1
	BCC 0DB4
	AND A, #0F
	MUL YA
	BRA 0DB8

0DB4:
	MUL YA
	MOV A, Y
	MOV Y, #00
	CALL 0E35

0DBB:
	JMP 0582

0DC0:
	BBS.7 13, F8
	RET

0DC4:
	CLR1.7 13
	MOV A, C1+X
	BEQ 0DD3
	MOV A, 02E0+X

0DCD:
	CBNE C0+X, A
	BBS.0 3F, 3D
	TSET1 31F5
	BBS.0 FD, F5
	BMI 0DDD
	MOVW 10, YA
	MOV A, 91+X
	BEQ 0DEA
	MOV A, 0341+X
	MOV Y, A
	MOV A, 0340+X
	CALL 0E1F

0DEA:
	BBC.7 13, 03
	CALL 0C80

0DF0:
	CLR1.7 13
	CALL 0BB3
	MOV A, A0+X
	BEQ 0E07
	MOV A, A1+X
	BNE 0E07
	MOV A, 0371+X
	MOV Y, A
	MOV A, 0370+X
	CALL 0E1F

0E07:
	MOV A, B1+X
	BEQ 0DC0
	MOV A, 02B0+X
	CBNE B0+X, A
	MOV (X)+, A
	MOV Y, 51
	MOV A, 02A1+X
	MUL YA
	MOV A, Y
	CLRC
	ADC A, 02A0+X
	JMP 0DA0

0E1F:
	SET1.7 13
	MOV 12, Y
	CALL 0BD0
	PUSH Y
	MOV Y, 51
	MUL YA
	MOV 14, Y
	MOV (swap)#, 15
	MOV Y, 51
	POP A
	MUL YA
	ADDW YA, 14

0E35:
	CALL 0BD0
	ADDW YA, 10
	MOVW 10, YA
	RET

0E4A:
	ASL A
	BCC 0E4F
	EOR A, #FF

0E4F:
	MOV Y, C1+X
	MUL YA
	MOV A, Y
	EOR A, #FF

0E55:
	MOV Y, 59
	MUL YA
	MOV A, 0210+X
	MUL YA
	MOV A, 0301+X
	MUL YA
	MOV A, Y
	MUL YA
	MOV A, Y
	MOV 0321+X, A
	RET

0ED5:
	MOV A, #AA
	MOV 00F4, A
	MOV A, #BB
	MOV 00F5, A

0EDF:
	MOV A, 00F4
	CMP A, CC
	BNE 0EDF
	BRA 0F08

24FD:
	MOV A, #80
	MOV Y, #5C
	CALL 060D
	MOV A, 03C3
	AND A, #80
	BEQ 2512
	SET1.7 4A
	MOV Y, #4D
	CALL 060D

2512:
	MOV (swap)#00, 05
	CLR1.7 1A
	MOV X, #0E
	MOV A, 021F
	CALL 0932
	MOV A, #00
	MOV 03C9, A
	MOV D1, A
	MOV AE, A
	MOV 9E, A
	MOV A, 03EE
	MOV 038F, A
	MOV A, 03EF
	MOV 028E, A
	RET

2537:
	MOV X, #60
	MOV 9E, X
	MOV 03C9, X
	MOV A, #00
	MOV 032E, A
	MOV X, 9E
	SETC
	SBC A, 030F
	CALL 0BBE
	MOV 031E, A
	MOV A, Y
	MOV 031F, A
	MOV A, 9E
	BEQ 24FD
	CMP A, 01
	BEQ 24FD
	MOV A, #00
	MOV Y, #03
	MOV X, #0E
	DEC 9E
	CALL 0CC4
	MOV A, 030F
	MOV 032F, A
	MOV A, #0A
	MOV 035F, A
	MOV 11, A
	MOV (swap)#00, 10
	MOV X, #0E
	CALL 0C80
	RET

257C:
	MOV A, 03F8
	BEQ 2584
	MOV (swap)#, 01

2584:
	MOV Y, 09
	CMP Y, 01
	BEQ 25A1
	MOV A, 01
	MOV 05, A
	MOV 09, A
	BEQ 2537
	MOV A, Y
	BEQ 25B5
	EOR A, 01
	AND A, #C0
	BNE 25B5
	MOV A, D1
	BNE 25CC
	BRA 2618

25A0:
	CMP A, E4+Y
	TCALL 0
	BNE 25AC
	MOV X, 03C9
	BEQ 25B4
	BRA 2553

25A1:
	MOV A, 01
	BNE 25AC
	MOV X, 03C9
	BEQ 25B4
	BRA 2553

25AC:
	MOV A, D1
	BNE 25CC
	MOV A, 05
	BNE 262F

25B4:
	RET

25B5:
	MOV (swap)#02, D1
	MOV A, #80
	MOV Y, #5C
	CALL 060D
	SET1.7 1A
	MOV A, #00
	MOV 028E, A
	MOV AE, A
	MOV 038F, A
	RET

25CC:
	DBNZ D1, FC
	CALL 2671
	MOV A, #80
	CALL 3E79
	MOV A, 05
	BMI 25EE
	BBS.6 05, 08
	MOV Y, #70
	MOV X, #96
	MOV A, #A0
	BRA 25FF

25E6:
	MOV Y, #F7
	MOV X, #B2
	MOV A, #FF
	BRA 25FF

25EE:
	BBS.6 05, 08
	MOV Y, #FF
	MOV X, #B2
	MOV A, #FF
	BRA 25FF

25F9:
	MOV Y, #BB
	MOV X, #96
	MOV A, #E0
	MOV 03CB, Y
	MOV 03C6, X
	MOV 03FC, A
	CALL 0648
	CLR1.7 4A
	MOV A, 4A
	MOV Y, #4D
	CALL 060D
	MOV A, #01
	BNE 261A
	MOV A, #30

261A:
	MOV AE, A
	MOV (swap)#00, AF
	MOV A, 05
	AND A, #3F
	MOV X, A
	MOV A, 26B4+X
	MOV X, #0E
	MOV 44, X
	CALL 0B9B
	RET

262F:
	CLR1.7 13
	MOV A, AE
	BEQ 265C
	MOV X, #0E
	CALL 3E5F
	MOV A, 03FC
	MOV 032F, A
	MOV 030F, A
	MOV A, #0A
	MOV 035F, A
	MOV 033F, A
	MOV X, #0E
	MOV A, 0331+X
	MOV Y, A
	MOV A, 0330+X
	MOVW 10, YA
	MOV A, #0E
	CALL 0C80
	RET

265C:
	MOV A, #70
	MOV , AAE
	MOV (swap)#, AF
	MOV A, 18
	AND A, #03
	OR A, #A4
	MOV X, #0E
	MOV 44, X
	CALL 0B9B

2670:
	RET

2671:
	MOV A, 05
	AND A, #C0
	CLRC
	ASL A
	ASL A
	ASL A
	MOV X, A
	MOV Y, #06
	MUL YA
	MOV X, A
	MOV Y, #74
	MOV (swap)#04, 12
	MOV A, +X269C
	CALL 060D
	INC X
	INC Y
	DBNZ 12, F5
	MOV A, +X269C
	MOV , A022F
	INC X
	MOV A, +X269C
	MOV , A022E
	RET

26A0:
	OR A, 00
	CLRP
	NOP
	NOP
	SLEEP
	NOP
	CLRC
	CLRP
	NOP
	NOP
	MOV A, 8000
	CLRP
	NOP
	NOP
	MOV A, #01
	DI
	SBC A, A6
	SBC A, [A8+X]
	SBC A, (X)
	SBC A, [A8+X]
	SBC B0, B0
	BCS 2670
	ADC #98, 98
	ADC #E8, 00
	MOV , A06
	MOV , A0D
	MOV , A03F6
	MOV , AAC
	MOV , A9C
	MOV , A9D
	MOV , A032D
	MOV , A030D
	MOV A, 03EC
	MOV , A038D
	MOV A, 03ED
	MOV , A028C
	CLR1.6, 1A
	MOV X, #0C
	MOV A, 021D
	CALL 0932
	MOV A, 03C3
	AND A, #40
	BEQ 26FD
	SET1.6, 4A
	MOV Y, #4D
	CALL 060D

26FD:
	MOV A, #40
	MOV Y, #5C
	JMP 060D

2704:
	MOV X, 03F6
	MOV 9C, X
	MOV A, #00
	MOV , A032C
	MOV X, 9C
	SETC
	SBC A, 030D
	CALL 0BBE
	MOV , A031C
	MOV A, Y
	MOV , A031D

271E:
	MOV A, 9C
	BNE 2723
	RET

2723:
	CMP A, 01
	BEQ 26C4
	MOV A, #00
	MOV Y, #03
	MOV X, #0C
	DEC 9C
	CALL 0CC4
	MOV A, 030D
	MOV , A032D
	MOV A, 03FB
	MOV , A035D
	MOV , A11
	MOV (swap)#, 10
	MOV X, #0C
	CALL 0C80
	RET

2749:
	MOV A, 03F8
	BEQ 2751
	MOV (swap)#, 02

2751:
	MOV Y, 0A
	CMP Y, 02
	BEQ 277D
	MOV A, 02
	MOV , A06
	MOV , A0A
	AND A, #C0
	BEQ 2704
	MOV A, Y
	EOR A, 02
	AND A, #0F
	BNE 2779
	MOV A, 0D
	BNE 27A4
	MOV A, Y
	EOR A, 02
	AND A, #30
	BEQ 2776
	JMP 27FF

2776:
	JMP 2839

2779:
	MOV A, 02
	BNE 278D

277D:
	MOV A, 02
	BEQ 271E
	MOV A, 0D
	BNE 27A4
	MOV A, 06
	BEQ 278C
	JMP 285F

278C:
	RET

278D:
	MOV (swap)#02, 0D
	MOV A, #40
	MOV Y, #5C
	CALL 060D
	SET1.6, 1A
	MOV A, #00
	MOV , A028C
	MOV , AAC
	MOV , A038D
	RET

27A4:
	DBNZ 0D, E5
	MOV 06, A
	AND A, #0F
	SETC
	SBC A, #01
	MOV X, A
	MOV A, +X2921
	MOV , A03F6
	MOV A, +X2930
	MOV , A03F9
	MOV A, X
	CALL 289D
	MOV 06, A
	AND A, #30
	BNE 27CA
	MOV Y, 03F9
	BNE 27CC

27CA:
	MOV Y, #AD

27CC:
	MOV (swap)#0C, 44
	MOV X, #0C
	CALL 0518
	MOV A, #40
	CALL 3E79
	CLR1.6, 4A
	MOV A, 4A
	MOV Y, #4D
	CALL 060D
	MOV A, 06
	AND A, #30
	XCN A
	MOV X, A
	MOV A, +X291D
	MOV , A032D
	MOV , A030D
	MOV A, 06
	AND A, #C0
	XCN A
	LSR A
	LSR A
	MOV X, A
	MOV A, +X2919
	MOV , A033D

27FF:
	MOV X, 03F6
	MOV 9C, X
	MOV A, 06
	AND A, #30
	BNE 280F
	MOV A, 03F9
	BNE 2811

280F:
	MOV A, #AD

2811:
	MOV AC, X
	MOV (swap)#, AD
	MOV X, #0C
	MOV 44, X
	CALL 0B9B
	MOV A, 06
	AND A, #30
	XCN A
	MOV X, A
	MOV A, +X291D
	MOV , A032C
	MOV X, 9C
	SETC
	SBC A, 030D
	CALL 0BBE
	MOV , A031C
	MOV A, Y
	MOV , A031D

2839:
	MOV A, 06
	AND A, #C0
	XCN A
	LSR A
	LSR A
	MOV X, A
	MOV A, +X2919
	MOV , A03FB
	MOV , A035C
	SETC
	SBC A, 033D
	MOV X, 03F6
	MOV 9D, X
	CALL 0BBE
	MOVW 10, YA
	MOV , A034C
	MOV A, Y
	MOV , A034D

285F:
	MOV A, 9C
	BEQ 2874
	MOV A, #00
	MOV Y, #03
	MOV X, #0C
	DEC 9C
	CALL 0CC4
	MOV A, 030D
	MOV , A032D

2874:
	CLR1.7 13
	MOV A, AC
	BEQ 287F
	MOV X, #0C
	CALL 3E5F

287F:
	MOV A, 9D
	BEQ 289C
	MOV A, #30
	MOV Y, #03
	MOV X, #0C
	DEC 9D
	CALL 0CC4
	MOV A, 033D
	MOV Y, A
	MOV A, 033C
	MOVW 10, YA
	MOV X, #0C
	CALL 0C80

289C:
	RET

289D:
	MOV Y, #06
	MUL YA
	MOV X, A
	MOV Y, #64
	MOV (swap)#04, 12
	MOV A, +X28BF
	CALL 060D
	INC X
	INC Y
	DBNZ 12, F5
	MOV A, +X28BF
	MOV , A022D
	INC X
	MOV A, +X28BF
	MOV , A022C
	RET

28C3:
	SET1.0 80
	CLRP
	ASL 60E0
	OR A, [00+X]
	NOP

28CC:
	TSET1 70E0
	BBS.0 , 0A
	TSET1 70E0
	TCALL 0
	SETC
	TCALL 0
	TSET1 7FE0
	TCALL 0

28DC:
	NOP
	TCALL 0
	TSET1 28E0
	OR A, [00+X]
	PUSH A
	TSET1 70E0
	TCALL 0
	NOP
	BBS.0 0E, E0
	RETI

293F:
	MOV X, 03
	MOV 11, X
	MOV A, 0FDF+X
	MOV , A10
	XCN A
	AND A, #0F
	ASL A
	MOV Y, A
	MOV A, 03A0+Y
	BEQ 2960
	MOV X, A
	MOV A, 0FDF+X
	SETC
	CMP A, 10
	BEQ 2960
	BCC 2960
	JMP 3EBA

2960:
	MOV A, 11
	MOV 03A0+Y, A
	MOV 10, Y
	MOV A, #01
	LSR 10
	BEQ 2971
	ASL A
	DBNZ 10, FC

2971:
	MOV , A03C1
	MOV , Y03C0
	MOV A, 03C1
	OR A, 1A
	MOV , A1A
	JMP 29C5

2981:
	MOV A, 00F7
	CMP A, 00F7
	BNE 2981
	MOV , A00F7
	MOV Y, A
	MOV A, 0B
	MOV 0B, Y
	BNE A, 0B
	SET1.0 8D
	NOP
	MOV 03, Y
	MOV A, 03
	BEQ 29A0
	CMP A, B0
	BCC 29C2

29A0:
	RET

29A1:
	MOV A, 03F8
	BEQ 29BE
	MOV A, #00
	MOV , A03F8
	CALL 3E96
	BRA 29BE

29B0:
	MOV A, 1A
	AND A, #C0
	EOR A, #FF
	MOV , A03F8
	MOV Y, #5C
	CALL 060D

29BE:
	MOV A, 03
	BRA 29D5

29C2:
	JMP 293F

29C5:
	CALL 3EA6
	MOV X, 03C0
	MOV A, 03
	CMP A, 01
	BEQ 29A1
	CMP A, 02
	BEQ 29B0
	MOV +X, A03A0
	CMP A, 0B
	BCC 29EB
	CMP A, 0E
	BCC 29E8
	CMP A, 15
	BCC 29EB
	CMP A, 18
	BCS 29EB

29E8:
	CALL 3E87

29EB:
	MOV A, #03
	MOV 03A1+X, A
	MOV A, #00
	MOV 0280+X, A
	MOV A0+X, A
	MOV 0381+X, A
	MOV 02F0+X, A
	MOV A, 03C1
	OR A, 0007
	MOV , A0007
	MOV A, 03C1
	MOV Y, #5C
	CALL 060D
	MOV A, 03A0+X
	MOV X, A
	MOV A, 0F20+X
	MOV 03, A
	BNE 29C2
	RET

2A1A:
	MOV A, 0007
	MOV , A03CE
	BEQ 2A51
	MOV X, #0A
	MOV A, #20
	MOV , A03C1
	ASL 03CE
	ASL 03CE

2A2F:
	ASL 03CE
	BCC 2A4A
	MOV , X03C0
	MOV A, X
	XCN A
	LSR A
	MOV , A03C2
	MOV A, +X03A1
	BNE 2A52
	MOV A, +X03A0
	BEQ 2A4A
	JMP 2B0C

2A4A:
	LSR 03C1
	DEC X
	DEC X
	BPL 2A2F

2A51:
	RET

2A52:
	MOV , X03C0
	MOV A, +X03A1
	DEC A
	MOV +X, A03A1
	BEQ 2A61
	JMP 2A4A

2A61:
	MOV A, +X03A0
	ASL A
	MOV Y, A
	BCS 2A7B
	MOV A, +Y109E
	MOV +X, A0391
	MOV , A2D
	MOV A, +Y109D
	MOV +X, A0390
	MOV , A2C
	JMP 2B29

2A7B:
	MOV A, +Y119E
	MOV +X, A0391
	MOV , A2D
	MOV A, +Y119D
	MOV +X, A0390
	MOV , A2C
	JMP 2B29

2A8E:
	MOV X, 03C0
	MOV A, +X03A0
	CMP A, 0B
	BCC 2AAC
	CMP A, 0E
	BCC 2AA4
	CMP A, 15
	BCC 2AAC
	CMP A, 18
	BCS 2AAC

2AA4:
	MOV A, 03CA
	BNE 2AAC
	CALL 3E96

2AAC:
	MOV A, #00
	MOV +X, A03A0
	MOV A0+X, A
	MOV A, +X03D0
	MOV +X, A02F0
	MOV A, +X03E0
	MOV +X, A0381
	MOV A, +X03E1
	MOV +X, A0280
	MOV A, 1A
	SETC
	SBC A, 03C1
	MOV , A1A
	MOV A, 0007
	SETC
	SBC A, 03C1
	MOV , A0007
	MOV 44, X
	MOV A, +X0211
	CALL 0932
	MOV A, 03C1
	AND A, 03C3
	BEQ 2B02
	AND A, 4A
	BNE 2B02
	MOV A, 4A
	CLRC
	ADC A, 03C1
	MOV , A4A
	MOV Y, #4D
	CALL 060D
	MOV A, 03F3
	SETC
	SBC A, 03C1
	MOV , A03F3

2B02:
	MOV X, 03C0
	RET

2B06:
	CALL 2A8E
	JMP 2A4A

2B0C:
	CALL 3EA6
	MOV , X03C0
	MOV A, +X0391
	MOV Y, A
	MOV A, +X0390
	MOVW 2C, YA
	MOV A, +X03B0
	DEC A
	MOV +X, A03B0
	BEQ 2B27
	JMP 2B94

2B27:
	INC 002C

2B29:
	MOV A, 03C0
	XCN A
	LSR A
	MOV , A03C2
	MOV X, #00
	MOV A, [2C+X]
	BEQ 2B06
	BMI 2B6F
	MOV Y, 03C0
	MOV +Y, A03B1
	INC 002C
	MOV A, [2C+X]
	MOV , A10
	BMI 2B6F
	MOV Y, 03C2
	CALL 060D
	MOV X, #00
	INC 002C
	MOV A, [2C+X]
	BPL 2B62
	MOV X, A
	MOV A, 10
	MOV Y, 03C2
	INC Y
	CALL 060D
	MOV A, X
	BRA 2B6F

2B62:
	MOV Y, 03C2
	INC Y
	CALL 060D
	MOV X, #00
	INC 002C
	MOV A, [2C+X]

2B6F:
	CMP A, E0
	BNE 2B76
	JMP 3E20

2B76:
	CMP A, F9
	BEQ 2BC1
	CMP A, F1
	BEQ 2BD6
	MOV X, 03C0
	MOV Y, A
	CALL 0518
	MOV A, 03C1
	CALL 3E79

2B8B:
	MOV X, 03C0
	MOV A, +X03B1
	MOV +X, A03B0

2B94:
	CLR1.7 13
	MOV X, 03C0
	MOV A, A0+X
	BEQ 2BA2
	CALL 3E5F
	BRA 2BB1

2B94:
	CLR1.7 13
	MOV X, 03C0
	MOV A, A0+X
	BEQ 2BA2
	CALL 3E5F
	BRA 2BB1

2BA2:
	MOV A, #02
	CMP A, +X03B0
	BNE 2BB1
	MOV A, 03C1
	MOV Y, #5C
	CALL 060D

2BB1:
	MOV X, 03C0
	MOV A, 2D
	MOV +X, A0391
	MOV A, 2C
	MOV +X, A0390
	JMP 2A4A

2BC1:
	MOV X, #00
	INC 002C
	MOV A, [2C+X]
	MOV X, 03C0
	MOV 44, X
	MOV Y, A
	CALL 0518
	MOV A, 03C1
	CALL 3E79

2BD6:
	MOV X, #00
	INC 002C
	MOV A, [2C+X]
	MOV X, 03C0
	MOV 00A1+X, A
	MOV X, #00
	INC 002C
	MOV A, [2C+X]
	MOV X, 03C0
	MOV A0+X, A
	PUSH A
	MOV X, #00
	INC 002C
	MOV A, [2C+X]
	POP Y
	MOV X, 03C0
	MOV 44, X
	CALL 0B9B
	JMP 2B8B
