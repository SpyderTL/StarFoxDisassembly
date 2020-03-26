UnusedBank09SetBRegWRAM:
	lda.b #$7E					;\Set data bank to $7E
	pha						;|(not called, probably was for Nintendo's assembler)
	plb						;/
CallCopyPositionTo:
	jsl CopyPositionTo
CODE_098009:
	








DoJumpTable:
	
