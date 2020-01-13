	ARCH SUPERFX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         COMMAND BYTE JUMP TABLE          ;
;==========================================;
;  When a command byte gets loaded to r15, ;
;it causes one of these routines to be run.;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	iwt r15,#FinishModel			;8EBC
	nop
	iwt r15,#LoadVertices8Bit		;8938
	nop
	iwt r15,#LoadVertices16Bit		;8709
	nop
	iwt r15,#EndVertexList			;8A4B
	nop
	iwt r15,#CODE_018C31
	nop
	iwt r15,#StartFaceGroup			;8D14
	nop
	iwt r15,#PopAndReturn			;86E7
	nop
	iwt r15,#LoadAnimatedVertices		;86EC
	nop
	iwt r15,#JumpToEndOfAnimatedVertices	;8700
	nop
	iwt r15,#PopAndReturn			;86E7
	nop
	iwt r15,#BSPLeafNode			;8BA4
	nop
	iwt r15,#PopAndReturn			;86E7
	nop
	iwt r15,#StartTriangleList		;919A
	nop
	iwt r15,#LoadMirroredVertices16Bit	;8790
	nop
	iwt r15,#LoadMirroredVertices8Bit	;89AF
	nop
	iwt r15,#StartBSPTree			;8B81
	nop
	iwt r15,#BSPEmptyLeaf			;8B9F
	nop
	iwt r15,#BSPLeaf			;8B91
	nop
	iwt r15,#PopAndReturn			;86E7
	nop
	iwt r15,#LoadVertices16Bit		;8709
	nop
	iwt r15,#CODE_018CA2
	nop
	iwt r15,#CODE_018C8F
	nop
	
	
	
	
	
PopAndReturn:
	dec r10				;\Pop value from stack and return
	dec r10				;|
	to r15				;|
	ldw r10				;|
	nop				;/
LoadAnimatedVertices:
	to r1				;\Get frame count in r1
	getb				;|
	inc r14				;/
	alt1				;\Get timer in r0...
	lms r0,($22)			;|
	ibt r2,#$3F			;|...and mask out the 6 LSBs
	and r2				;/(does the frame count need to be a power of 2 then?)
LoadAnimatedVertices_L1:
	alt3				;\Calculate "timer" modulo "frame count"
	cmp r1				;|
	bmi LoadAnimatedVertices_L2	;|If "timer" is smaller, we're done
	nop				;|
	bra LoadAnimatedVertices_L1	;|Otherwise, loop back, but first...
	sub r1				;/...subtract "frame count" from "timer"
LoadAnimatedVertices_L2:
	add r0				;\Double r0 to get offset in bytes...
	with r14			;|...and add this to the ROM pointer
	add r0				;/to get the offset to this frame's animation vertices
JumpToEndOfAnimatedVertices:
	getb				;\Offset ROM pointer using two bytes read
	inc r14				;|
	alt1				;|
	getbh				;|
	with r14			;|
	add r0				;/
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
LoadVertices16Bit:
	to r12				;\Get vertex count in r12 (loop register)
	getb				;|
	inc r14				;/
	alt1				;\Add r12 to total vertex count
	lms r0,($99)			;|
	add r12				;|
	sbk				;/
	alt1				;\Load r9 with current vertex pointer
	lms r9,($0F)			;/
	alt2				;\Save r10 (why though?)
	sms ($09),r10			;/
	alt1				;\Get XX matrix element in r10
	lms r10,($90)			;/
	alt1				;\Get XY matrix element in r11
	lms r11,($93)			;/
	alt1				;\Get XZ matrix element in r13
	lms r13,($96)			;/
	alt1				;\Get YX matrix element in r4
	lms r4,($91)			;/
	alt1				;\Get YY matrix element in r7
	lms r7,($94)			;/
	alt1				;\Get YZ matrix element in r8
	lms r8,($97)			;/
	cache
LoadVertices16Bit_L1:
	to r1				;\Get vertex X position in r1
	getb				;|
	inc r14				;|
	with r1				;|
	alt1				;|
	getbh				;|
	inc r14				;/
	to r2				;\Get vertex Y position in r2
	getb				;|
	inc r14				;|
	with r2				;|
	alt1				;|
	getbh				;|
	inc r14				;/
	to r3				;\Get vertex Z position in r3
	getb				;|
	inc r14				;|
	with r3				;|
	alt1				;|
	getbh				;|
	inc r14				;/
	move r6,r10			;\Multiply X position by XX matrix element...
	from r1				;|
	fmult				;|
	to r5				;|
	rol				;/...shifting in bit 15 of the product for extra precision
	move r6,r11			;\Multiply Y position by XY matrix element...
	from r2				;|
	fmult				;|
	rol				;|...shifting in bit 15 of the product for extra precision...
	with r5				;|
	add r0				;/...and accumulating to previous value
	move r6,r13			;\Multiply Z position by XZ matrix element...
	from r3				;|
	fmult				;|
	rol				;|...shifting in bit 15 of the product for extra precision...
	add r5				;|...accumulating to previous value...
	stw r9				;|...and storing the result
	inc r9				;|
	inc r9				;/
	move r6,r4			;\Multiply X position by YX matrix element...
	from r1				;|
	fmult				;|
	to r5				;|
	rol				;/...shifting in bit 15 of the product for extra precision
	move r6,r7			;\Multiply Y position by YY matrix element...
	from r2				;|
	fmult				;|
	rol				;|...shifting in bit 15 of the product for extra precision...
	with r5				;|
	add r0				;/...and accumulating to previous value
	move r6,r8			;\Multiply Z position by YZ matrix element...
	from r3				;|
	fmult				;|
	rol				;|...shifting in bit 15 of the product for extra precision...
	add r5				;|...accumulating to previous value...
	stw r9				;|...and storing the result
	inc r9				;|
	inc r9				;/
	alt1				;\Get ZX matrix element in r6
	lms r6,($92)			;/
	from r1				;\Multiply X position by ZX matrix element...
	fmult				;|
	to r5				;|
	rol				;/...shifting in bit 15 of the product for extra precision
	alt1				;\Get ZY matrix element in r6
	lms r6,($95)			;/
	from r2				;\Multiply Y position by ZY matrix element...
	fmult				;|
	rol				;|...shifting in bit 15 of the product for extra precision...
	with r5				;|
	add r0				;/...and accumulating to previous value
	alt1				;\Get ZZ matrix element in r6
	lms r6,($98)			;/
	from r3				;\Multiply Z position by ZZ matrix element...
	fmult				;|
	rol				;|...shifting in bit 15 of the product for extra precision...
	add r5				;|...accumulating to previous value...
	stw r9				;|...and storing the result
	inc r9				;/
	dec r12				;\Decrement vertex count...
	bne LoadVertices16Bit_L1	;|...and loop back if not zero
	inc r9				;/(not sure why r13 wasn't used here)
	alt2				;\Save current vertex pointer
	sms ($0F),r9			;/
	alt1				;\Restore r10
	lms r10,($09)			;/
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
LoadMirroredVertices16Bit:
	to r12				;\Get vertex count in r12 (loop register)
	getb				;|
	inc r14				;/
	alt1				;\Add r12 to total vertex count
	lms r0,($99)			;|
	add r12				;|
	add r12				;|
	sbk				;/
	alt1				;\Load r9 with current vertex pointer
	lms r9,($0F)			;/
	cache
	move r13,r15			; Set loop point
	to r1				;\Get vertex X coordinate in r1
	getb				;|
	inc r14				;|
	with r1				;|
	alt1				;|
	getbh				;|
	inc r14				;/
	to r2				;\Get vertex Y coordinate in r2
	getb				;|
	inc r14				;|
	with r2				;|
	alt1				;|
	getbh				;|
	inc r14				;/
	to r3				;\Get vertex Z coordinate in r3
	getb				;|
	inc r14				;|
	with r3				;|
	alt1				;|
	getbh				;|
	inc r14				;/
	alt1				;\Get XX matrix element in r6
	lms r6,($90)			;/
	from r1				;\Multiply X position by XX matrix element...
	fmult				;|
	to r8				;|
	rol				;/...shifting in bit 15 of the product for extra precision
	alt1				;\Get XY matrix element in r6
	lms r6,($93)			;/
	from r2				;\Multiply Y position by XY matrix element...
	fmult				;|
	to r5				;|
	rol				;/...shifting in bit 15 of the product for extra precision
	alt1				;\Get XZ matrix element in r6
	lms r6,($96)			;/
	from r3				;\Multiply Z position by XZ matrix element...
	fmult				;|
	rol				;|...shifting in bit 15 of the product for extra precision...
	add r5				;|...accumulating the previous two values...
	add r8				;|
	stw r9				;/...and storing the result
	sub r8
	sub r8
	with r9
	alt2
	add #$06
	stw r9
	with r9
	alt2
	sub #$04
	alt1				;\Get YX matrix element in r6
	lms r6,($91)			;/
	from r1
	fmult
	to r8
	rol
	alt1				;\Get YY matrix element in r6
	lms r6,($94)			;/
	from r2
	fmult
	to r5
	rol
	alt1				;\Get YZ matrix element in r6
	lms r6,($97)			;/
	from r3
	fmult
	rol
	add r5
	add r8
	stw r9
	sub r8
	sub r8
	with r9
	alt2
	add #$06
	stw r9
	with r9
	alt2
	sub #$04
	alt1				;\Get ZX matrix element in r6
	lms r6,($92)			;/
	from r1
	fmult
	to r8
	rol
	alt1				;\Get ZY matrix element in r6
	lms r6,($95)			;/
	from r2
	fmult
	to r5
	rol
	alt1				;\Get ZZ matrix element in r6
	lms r6,($98)			;/
	from r3
	fmult
	rol
	add r5
	add r8
	stw r9
	sub r8
	sub r8
	with r9
	alt2
	add #$06
	stw r9
	with r9
	alt2
	sub #$04
	with r9
	alt2
	add #$06
	loop				;\Loop back until all vertices have been processed
	nop				;/
	alt2
	sms ($0F),r9
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
LoadVertices8Bit_M1:				;881F
	to r12				;\Get vertex count in r12 (loop register)
	getb				;|
	inc r14				;/
	alt1
	lms r0,($99)
	add r12
	sbk
	alt1				;\Load r9 with current vertex pointer
	lms r9,($0F)			;/
	alt1
	lms r8,($18)
	cache
	move r13,r15			; Set loop point
	getb
	inc r14
	to r1
	mult r8
	getb
	inc r14
	to r2
	mult r8
	getb
	inc r14
	to r3
	mult r8
	alt1
	lms r6,($90)
	from r1
	alt1
	lmult
	move r7,r4
	alt1
	lms r6,($93)
	from r2
	to r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r5
	alt1
	lms r6,($96)
	from r3
	to r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r5
	
	
	
	
	
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
LoadMirroredVertices8Bit_M1:			;88AF
	
	
	
	
	
	
	
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
LoadVertices8Bit:
	alt1
	lms r0,($19)
	alt2
	sub #$03
	bmi LoadVertices8Bit_L1
	nop
	iwt r15,#LoadVertices8Bit_M1
	nop
LoadVertices8Bit_L1:
	nop
	alt1
	lms r11,($0F)
	alt1
	lms r5,($8B)
	alt1
	lms r6,($8C)
	alt1
	lms r7,($8D)
	alt1
	lms r8,($8E)
	alt1
	lms r9,($8F)
	alt1
	lms r1,($18)
	from r9
	lob
	swap
	to r9
	or r1
	to r12				;\Get vertex count in r12 (loop register)
	getb				;|
	inc r14				;/
	alt1
	lms r0,($99)
	add r12
	sbk
	cache
	move r13,r15			; Set loop point
	to r1				;\Get vertex X position in r1
	getb				;|
	inc r14				;/
	from r5
	to r4
	mult r1
	to r2				;\Get vertex Y position in r2
	getb				;|
	inc r14				;/
	from r6
	hib
	mult r2
	to r4
	add r4
	to r3				;\Get vertex Y position in r2
	getb				;|
	inc r14				;/
	from r8
	mult r3
	add r4
	add r0
	hib
	mult r9
	stw r11
	inc r11
	inc r11
	from r5
	hib
	to r4
	mult r1
	from r7
	mult r2
	to r4
	add r4
	from r8
	hib
	mult r3
	add r4
	add r0
	hib
	mult r9
	stw r11
	inc r11
	inc r11
	from r6
	to r4
	mult r1
	from r7
	hib
	mult r2
	to r4
	add r4
	from r9
	hib
	mult r3
	add r4
	add r0
	hib
	mult r9
	stw r11
	inc r11
	loop
	inc r11
	alt2
	sms ($0F),r11
	to r15
	getb
	inc r14
	
	
	
	
LoadMirroredVertices8Bit:
	alt1
	lms r0,($19)
	alt2
	sub #$03
	bmi LoadMirroredVertices8Bit_L1
	nop
	iwt r15,#LoadMirroredVertices8Bit_M1
	nop
LoadMirroredVertices8Bit_L1:
	nop
	alt1
	lms r11,($0F)
	alt1
	lms r5,($8B)
	alt1
	lms r6,($8C)
	alt1
	lms r7,($8D)
	alt1
	lms r8,($8E)
	alt1
	lms r9,($8F)
	alt1
	lms r1,($18)
	from r9
	lob
	swap
	to r9
	or r1
	to r12				;\Get vertex count in r12 (loop register)
	getb				;|
	inc r14				;/
	alt1
	lms r0,($99)
	add r12
	add r12
	sbk
	cache
	to r1
	
	
	
	
	
EndVertexList:
	alt1
	lms r3,($13)
	alt1
	lms r11,($14)
	alt1
	lms r8,($15)
	ibt r0,#$14
	alt3
	romb
	sub r0
	alt2
	sms ($9C),r0
	iwt r7,#$05C2
	iwt r8,#$07A2
	alt2
	sms ($0D),r14
	alt1
	lms r12,($99)
	cache
	with r15
	to r13
	ldw r7
	inc r7
	inc r7
	to r1
	add r3
	ldw r7
	inc r7
	inc r7
	to r2
	add r11
	ldw r7
	inc r7
	inc r7
	to r6
	add r9
	ibt r4,#$00
	iwt r0,#$3000
	sub r6
	bpl 4
	nop
	iwt r6,#$2FFF
	iwt r0,#$0100
	sub r6
	bmi 5
	nop
	iwt r15,#CODE_018AF5
	nop
CODE_018A91:
	with r6
	alt3
	bic #$01
	iwt r0,#$896C
	to r14
	add r6
	getb
	inc r14
	with r6
	alt1
	getbh
	with r4
	to r14
	from r1
	fmult
	rol
	alt1
	lms r1,($1A)
	add r1
	with r0
	to r1
	stw r8
	inc r8
	inc r8
	from r2
	fmult
	rol
	alt1
	lms r2,($1B)
	add r2
	with r0
	to r2
	stw r8
	inc r8
	inc r8
	with r14
	to r4
	with r0
	from r1
	bmi 9
	nop
	alt1
	lms r5,($1D)
	sub r5
	bmi 3
	nop
	inc r4
	inc r4
	with r4
	alt2
	mult #$04
	with r0
	from r2
	bmi 9
	nop
	alt1
	lms r5,($1F)
	sub r5
	bmi 3
	nop
	inc r4
	inc r4
	ibt r0,#$1F
	alt1
	xor r4
	swap
	or r4
	stw r8
	inc r8
	inc r8
	alt1
	lms r6,($9C)
	or r6
	loop
	sbk
	alt1
	lms r14,($0D)
	iwt r15,#CODE_018B57
	nop
CODE_018AF5:
	with r0
	from r6
	bpl 12
	nop
	ibt r4,#$04
	with r1
	not
	inc r1
	with r2
	not
	inc r2
	with r6
	not
	inc r6
	from r6
	add r6
	add r0
	add r0
	to r6
	add r0
	with r1
	from r1
	bmi 15
	nop
	iwt r0,#$0400
	alt3
	cmp r1
	bpl 18
	nop
	iwt r1,#$0400
	bra 12
	nop
	iwt r0,#$FC00
	alt3
	cmp r1
	bmi 4
	nop
	iwt r1,#$FC00
	with r2
	from r2
	bmi 15
	nop
	iwt r0,#$0400
	alt3
	cmp r2
	bpl 18
	nop
	iwt r2,#$0400
	bra 12
	nop
	iwt r0,#$FC00
	alt3
	cmp r2
	bmi 4
	nop
	iwt r2,#$FC00
	from r1
	add r1
	add r0
	add r0
	to r1
	add r0
	from r2
	add r2
	add r0
	add r0
	to r2
	add r0
	iwt r15,#CODE_018A91
	nop
CODE_018B57:
	alt1
	lms r0,($9C)
	iwt r1,#$1F00
	and r1
	alt3
	cmp r1
	beq 5
	nop
	iwt r15,#$8ECB
	nop
	alt1
	lms r1,($9C)
	ibt r0,#$1F
	and r1
	bne 9
	nop
	alt1
	lms r0,($2A)
	iwt r1,#$4000
	or r1
	sbk
	alt1
	lms r14,($0C)
	alt2
	sms ($0D),r14
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
StartBSPTree:
	iwt r1,#$0B02			;\Initialize BSP tree stack pointer
	alt2				;|
	sms ($2B),r1			;/
	iwt r0,#CODE_018C08		;\Set return value and push to stack
	stw r10				;|
	inc r10				;|
	inc r10				;/
	cache
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
BSPLeaf:
	getb				;\Offset ROM pointer to point to this leaf's face group
	inc r14				;|
	alt1				;|
	getbh				;|
	add r14				;/
	alt1
	lms r1,($2B)
	stw r1
	inc r1
	inc r1
	alt2
	sms ($2B),r1
BSPEmptyLeaf:
	dec r10				;\Pop value from stack and return
	dec r10				;|
	to r15				;|
	ldw r10				;|
	nop				;/
	
	getb
	inc r14
	iwt r1,#$0E72
	add r1
	alt1
	ldb r0
	swap
	with r0
	from r0
BSPLeafNode:
	bmi 31
	nop
	inc r14
	inc r14
	from r14
	stw r10
	inc r10
	inc r10
	getb
	lob
	beq 12
	nop
	to r14
	add r14
	from r15
	alt2
	add #$05
	stw r10
	inc r10
	inc r10
	

StartFaceGroup_M1:
	inc r0				;\If terminating byte is $FF, go back to BSP tree
	lob				;|
	beq StartFaceGroup_M2		;|
	nop				;/
	to r15				;\Otherwise finish up model processing
	getb				;|(it is implied that the byte after the terminator is a 0 in this case)
	inc r14				;/
StartFaceGroup_M2:
	dec r10				;\Pop value from stack and return
	dec r10				;|
	to r15				;|
	ldw r10				;|
	nop				;/
StartFaceGroup:
	ibt r0,#$70			;\Set default color...
	color				;|
	ibt r0,#$02			;|..and default plot mode
	alt1				;|
	cmode				;/
	getb				;\Get vertex count
	lob				;|
	bmi StartFaceGroup_M1		;|Branch back if negative
	inc r14				;/
	ibt r1,#$3F			;\r2 now has vertex count with all but 6 LSBs masked out...
	to r2				;|
	and r1				;|
	alt2				;|
	sms ($9A),r2			;/save this value for later
	dec r2				;\If vertex count is 2 (we have a line), branch here
	dec r2				;|
	beq 41				;|
	inc r14				;/
	dec r14
	getb
	with r14
	alt2
	add #$07
	iwt r1,#$0E72
	add r1
	alt1
	ldb r0
	swap
	hib
	bmi 22
	nop
	alt1
	lms r0,($24)
	with r0
	from r0
	beq 5
	nop
	iwt r15,#$8F3A
	nop
	alt1
	lms r0,($9A)
	dec r0
	dec r0
	with r14
	
	
	
	
	
CODE_018C08:
	sub r0
	alt1
	lms r1,($2B)
	stw r1
	iwt r0,#$0B02
	alt2
CODE_018C11:
	sms ($2B),r0
	alt1
	lms r1,($2B)
	to r14
	ldw r1
	inc r1
	inc r1
	alt2
	sms ($2B),r1
	moves r14,r14
	beq CODE_018C2D
	from r15
	alt2
	add #$05
	stw r10
	inc r10
	inc r10
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
	bra CODE_018C11
	nop
CODE_018C2D:
	iwt r15,#CODE_018EBC
	nop
CODE_018C31:
	to r12
	getb
	inc r14
	iwt r0,#$F4BE
	add r12
	add r14
	alt2
	sms ($9F),r0
	alt2
	sms ($9E),r12
	alt2
	sms ($9B),r12
	iwt r9,#$05C6
	iwt r5,#$0B42
	move r13,r15
	getb
	inc r14
	alt3
	umult #$06
	add r9
	ldw r0
	stw r5
	inc r5
	loop
	inc r5
CODE_018C54:
	iwt r5,#$0B42
	iwt r7,#$8000
	alt1
	lms r12,($9B)
	move r13,r15
	ldw r5
	alt3
	cmp r7
	blt CODE_018C69
	nop
	move r7,r0
	move r6,r5
CODE_018C69:
	inc r5
	loop
	inc r5
	iwt r0,#$8000
	stw r6
	alt1
	lms r0,($9F)
	to r14
	add r6
	getb
	inc r14
	alt1
	getbh
	move r14,r0
	from r15
	alt2
	add #$05
	stw r10
	inc r10
	inc r10
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
	alt1
	lms r0,($9E)
	dec r0
	bne CODE_018C54
	sbk
	iwt r15,#CODE_018EBC
	nop
CODE_018C8F:
	getb
	inc r14
	iwt r1,#$0E72
	add r1
	alt1
	ldb r0
	swap
	hib
	bmi CODE_018CA2
	nop
	inc r14
	inc r14
	inc r14
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
CODE_018CA2:
	getb
	inc r14
	to r3
	alt3
	umult #$06
	iwt r1,#$07A2
	from r3
	to r2
	add r1
	ldw r2
	inc r2
	inc r2
	alt2
	sms ($54),r0
	ldw r2
	alt2
	sms ($55),r0
	iwt r1,#$07A2
	iwt r1,#$05C6
	from r3
	add r1
	ldw r0
	alt1
	lms r1,($15)
	add r1
	alt2
	sms ($56),r0
	iwt r1,#$0020
	sub r1
	bmi 53
	nop
	link #4
	iwt r15,#CODE_01904F
	nop
	inc r14
	getb
	inc r14
	alt1
	lms r0,($61)
	lob
	inc r0
	alt2
	sms ($5B),r0
	iwt r1,#$0100
	add r0
	swap
	bpl 3
	nop
	with r1
	lsr
	alt2
	sms ($5E),r1
	alt2
	sms ($0D),r14
	sub r0
	alt2
	sms ($60),r0
	link #4
	iwt r15,#CODE_01A787
	nop
	alt1
	lms r0,($0E)
	alt3
	romb
	alt1
	lms r14,($0D)
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
	inc r14
	inc r14
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
	inc r0
	lob
	beq 4
	nop
	to r15				;\Get next command byte and jump
	getb				;|
	inc r14				;/
	dec r10
	dec r10
	to r15
	ldw r10
	nop
	ibt r0,#$70			;\Set default color...
	color				;|
	ibt r0,#$02			;|..and default plot mode
	alt1				;|
	cmode				;/
	getb
	lob
	bmi -24
	inc r14
	ibt r1,#$3F
	to r2
	and r1
	alt2
	sms ($9A),r2
	dec r2
	dec r2
	beq 41
	inc r14
	dec r14
	getb
	with r14
	alt2
	add #$07
	iwt r1,#$0E72
	add r1
	alt1
	ldb r0
	swap
	hib
	bmi 22
	nop
	alt1
	lms r0,($24)
	moves r0,r0
	beq 5
	nop
	iwt r15,#CODE_018F3A
	nop
	alt1
	lms r0,($9A)
	dec r0
	dec r0
	with r14
	bra -60
	add r0
	with r14
	alt2
	sub #$06
	link #4
	iwt r15,#CODE_01904F
	nop
	with r14
	alt2
	add #$04
	alt1
	lms r0,($24)
	moves r0,r0
	beq 5
	nop
	iwt r15,#CODE_018ECE
	nop
	alt1
	lms r0,($2A)
	iwt r1,#$4000
	and r1
	iwt r15,#CODE_018DD7
	nop
	iwt r9,#$07A2
	iwt r6,#$0982
	alt1
	lms r12,($9A)
	move r13,r15
	to r4
	getb
	inc r14
	from r4
	alt3
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
CODE_01AC1D:
	iwt r10,#$04C2
	alt1
	lms r0,($D9)
	lob
	beq 6
	nop
	link #4
	iwt r15,#$B0BB
	nop
	alt1
	lms r0,($CF)
	moves r0,r0
	beq 17
	nop
	bmi 9
	nop
	link #4
	iwt r15,#$A789
	nop
	bra 6
	nop
	link #4
	iwt r15,#$A8A6
	nop
	iwt r10,#$04C2
	ibt r1,#$08
	alt1
	lms r0,($D0)
	and r1
	beq 11
	nop
	ibt r0,#$01
	alt2
	sms ($D1),r0
	link #4
	iwt r15,#CODE_01AC97
	nop
	sub r0
	alt2
	sms ($D1),r0
	link #4
	iwt r15,#CODE_01AC97
	nop
	iwt r10,#$04C2
	sub r0
	alt1
	cmode
	alt1
	lm r0,($021C)
	lob
	beq 16
	nop
	link #4
	iwt r15,#$AF81
	nop
	link #4
	iwt r15,#$AFB8
	nop
	link #4
	iwt r15,#$AFED
	nop
	link #4
	iwt r15,#$D76B
	nop
	alt1
	lm r0,($1A28)
	moves r0,r0
	beq 6
	nop
	link #4
	iwt r15,#$D624
	nop
	alt1
	rpix
	stop
	nop
CODE_01AC97:
	alt1
	lm r1,($021E)
	moves r1,r1
	bne 3
	nop
	jmp r11
	nop
	from r11
	stw r10
	inc r10
	inc r10
	sub r0
	alt3
	romb
	alt2
	sms ($99),r0
	from r1
	stw r10
	inc r10
	inc r10
	inc r1
	inc r1
	inc r1
	inc r1
	alt1
	ldb r1
	alt2
	sms ($10),r0
	inc r1
	alt1
	ldb r1
	alt2
	sms ($11),r0
	inc r1
	alt1
	ldb r1
	alt2
	sms ($12),r0
	inc r1
	to r4
	alt1
	ldb r1
	inc r1
	to r3
	ldw r1
	inc r1
	inc r1
	alt1
	lms r0,($D1)
	lob
	beq 63
	nop
	ibt r0,#$00
	ibt r5,#$04
	from r4
	and r5
	beq 4
	nop
	iwt r0,#$1000
	alt2
	sms ($2A),r0
	ibt r5,#$0C
	from r4
	and r5
	bne 5
	nop
	iwt r15,#$AF6C
	nop
	
	
	
	
	
	
DATA_01BFF6:
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01
	DB $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
	DB $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$02,$01
	
	DB $02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01
	DB $02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01
	DB $02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01
	DB $02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01
	DB $02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01
	DB $02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01
	DB $02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$02,$01,$03,$01
	DB $03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
	DB $03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
	DB $03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
	DB $03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
	DB $03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01
	DB $03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$03,$01,$04,$01,$04,$01
	DB $04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01
	DB $04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01
	DB $04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01
	
	DB $04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01
	DB $04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$04,$01,$05,$01
	DB $05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01
	DB $05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01
	DB $05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01
	DB $05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01,$05,$01
	DB $05,$01,$05,$01,$05,$01,$05,$01,$06,$01,$06,$01,$06,$01,$06,$01
	DB $06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01
	DB $06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01
	DB $06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01
	DB $06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$06,$01,$07,$01,$07,$01
	DB $07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01
	DB $07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01
	DB $07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$07,$01
	DB $07,$01,$07,$01,$07,$01,$07,$01,$07,$01,$08,$01,$08,$01,$08,$01
	DB $08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01
	
	DB $08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01
	DB $08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01,$08,$01
	DB $08,$01,$08,$01,$09,$01,$09,$01,$09,$01,$09,$01,$09,$01,$09,$01
	DB $09,$01,$09,$01,$09,$01,$09,$01,$09,$01,$09,$01,$09,$01,$09,$01
	DB $09,$01,$09,$01,$09,$01,$09,$01,$09,$01,$09,$01,$09,$01,$09,$01
	DB $09,$01,$09,$01,$09,$01,$09,$01,$09,$01,$0A,$01,$0A,$01,$0A,$01
	DB $0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01
	DB $0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01
	DB $0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01,$0A,$01,$0B,$01,$0B,$01
	DB $0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01
	DB $0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01
	DB $0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01,$0B,$01,$0C,$01,$0C,$01
	DB $0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01
	DB $0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01
	DB $0C,$01,$0C,$01,$0C,$01,$0C,$01,$0C,$01,$0D,$01,$0D,$01,$0D,$01
	DB $0D,$01,$0D,$01,$0D,$01,$0D,$01,$0D,$01,$0D,$01,$0D,$01,$0D,$01
	
	DB $0D,$01,$0D,$01,$0D,$01,$0D,$01,$0D,$01,$0D,$01,$0D,$01,$0D,$01
	DB $0D,$01,$0D,$01,$0D,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01
	DB $0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01
	DB $0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E,$01
	DB $0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01
	DB $0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01
	DB $0F,$01,$0F,$01,$0F,$01,$0F,$01,$0F,$01,$10,$01,$10,$01,$10,$01
	DB $10,$01,$10,$01,$10,$01,$10,$01,$10,$01,$10,$01,$10,$01,$10,$01
	DB $10,$01,$10,$01,$10,$01,$10,$01,$10,$01,$10,$01,$10,$01,$10,$01
	DB $11,$01,$11,$01,$11,$01,$11,$01,$11,$01,$11,$01,$11,$01,$11,$01
	DB $11,$01,$11,$01,$11,$01,$11,$01,$11,$01,$11,$01,$11,$01,$11,$01
	DB $11,$01,$11,$01,$11,$01,$12,$01,$12,$01,$12,$01,$12,$01,$12,$01
	DB $12,$01,$12,$01,$12,$01,$12,$01,$12,$01,$12,$01,$12,$01,$12,$01
	DB $12,$01,$12,$01,$12,$01,$12,$01,$12,$01,$13,$01,$13,$01,$13,$01
	DB $13,$01,$13,$01,$13,$01,$13,$01,$13,$01,$13,$01,$13,$01,$13,$01
	DB $13,$01,$13,$01,$13,$01,$13,$01,$13,$01,$13,$01,$14,$01,$14,$01
	
	DB $14,$01,$14,$01,$14,$01,$14,$01,$14,$01,$14,$01,$14,$01,$14,$01
	DB $14,$01,$14,$01,$14,$01,$14,$01,$14,$01,$14,$01,$14,$01,$15,$01
	DB $15,$01,$15,$01,$15,$01,$15,$01,$15,$01,$15,$01,$15,$01,$15,$01
	DB $15,$01,$15,$01,$15,$01,$15,$01,$15,$01,$15,$01,$15,$01,$16,$01
	DB $16,$01,$16,$01,$16,$01,$16,$01,$16,$01,$16,$01,$16,$01,$16,$01
	DB $16,$01,$16,$01,$16,$01,$16,$01,$16,$01,$16,$01,$16,$01,$17,$01
	DB $17,$01,$17,$01,$17,$01,$17,$01,$17,$01,$17,$01,$17,$01,$17,$01
	DB $17,$01,$17,$01,$17,$01,$17,$01,$17,$01,$17,$01,$18,$01,$18,$01
	DB $18,$01,$18,$01,$18,$01,$18,$01,$18,$01,$18,$01,$18,$01,$18,$01
	DB $18,$01,$18,$01,$18,$01,$18,$01,$18,$01,$19,$01,$19,$01,$19,$01
	DB $19,$01,$19,$01,$19,$01,$19,$01,$19,$01,$19,$01,$19,$01,$19,$01
	DB $19,$01,$19,$01,$19,$01,$1A,$01,$1A,$01,$1A,$01,$1A,$01,$1A,$01
	DB $1A,$01,$1A,$01,$1A,$01,$1A,$01,$1A,$01,$1A,$01,$1A,$01,$1A,$01
	DB $1A,$01,$1A,$01,$1B,$01,$1B,$01,$1B,$01,$1B,$01,$1B,$01,$1B,$01
	DB $1B,$01,$1B,$01,$1B,$01,$1B,$01,$1B,$01,$1B,$01,$1B,$01,$1C,$01
	DB $1C,$01,$1C,$01,$1C,$01,$1C,$01,$1C,$01,$1C,$01,$1C,$01,$1C,$01
	
	DB $1C,$01,$1C,$01,$1C,$01,$1C,$01,$1C,$01,$1D,$01,$1D,$01,$1D,$01
	DB $1D,$01,$1D,$01,$1D,$01,$1D,$01,$1D,$01,$1D,$01,$1D,$01,$1D,$01
	DB $1D,$01,$1D,$01,$1E,$01,$1E,$01,$1E,$01,$1E,$01,$1E,$01,$1E,$01
	DB $1E,$01,$1E,$01,$1E,$01,$1E,$01,$1E,$01,$1E,$01,$1F,$01,$1F,$01
	DB $1F,$01,$1F,$01,$1F,$01,$1F,$01,$1F,$01,$1F,$01,$1F,$01,$1F,$01
	DB $1F,$01,$1F,$01,$1F,$01,$20,$01,$20,$01,$20,$01,$20,$01,$20,$01
	DB $20,$01,$20,$01,$20,$01,$20,$01,$20,$01,$20,$01,$20,$01,$21,$01
	DB $21,$01,$21,$01,$21,$01,$21,$01,$21,$01,$21,$01,$21,$01,$21,$01
	DB $21,$01,$21,$01,$21,$01,$22,$01,$22,$01,$22,$01,$22,$01,$22,$01
	DB $22,$01,$22,$01,$22,$01,$22,$01,$22,$01,$22,$01,$23,$01,$23,$01
	DB $23,$01,$23,$01,$23,$01,$23,$01,$23,$01,$23,$01,$23,$01,$23,$01
	DB $23,$01,$23,$01,$24,$01,$24,$01,$24,$01,$24,$01,$24,$01,$24,$01
	DB $24,$01,$24,$01,$24,$01,$24,$01,$24,$01,$25,$01,$25,$01,$25,$01
	DB $25,$01,$25,$01,$25,$01,$25,$01,$25,$01,$25,$01,$25,$01,$25,$01
	DB $26,$01,$26,$01,$26,$01,$26,$01,$26,$01,$26,$01,$26,$01,$26,$01
	DB $26,$01,$26,$01,$27,$01,$27,$01,$27,$01,$27,$01,$27,$01,$27,$01
	
	DB $27,$01,$27,$01,$27,$01,$27,$01,$27,$01,$28,$01,$28,$01,$28,$01
	DB $28,$01,$28,$01,$28,$01,$28,$01,$28,$01,$28,$01,$28,$01,$29,$01
	DB $29,$01,$29,$01,$29,$01,$29,$01,$29,$01,$29,$01,$29,$01,$29,$01
	DB $29,$01,$2A,$01,$2A,$01,$2A,$01,$2A,$01,$2A,$01,$2A,$01,$2A,$01
	DB $2A,$01,$2A,$01,$2A,$01,$2B,$01,$2B,$01,$2B,$01,$2B,$01,$2B,$01
	DB $2B,$01,$2B,$01,$2B,$01,$2B,$01,$2C,$01,$2C,$01,$2C,$01,$2C,$01
	DB $2C,$01,$2C,$01,$2C,$01,$2C,$01,$2C,$01,$2C,$01,$2D,$01,$2D,$01
	DB $2D,$01,$2D,$01,$2D,$01,$2D,$01,$2D,$01,$2D,$01,$2D,$01,$2E,$01
	DB $2E,$01,$2E,$01,$2E,$01,$2E,$01,$2E,$01,$2E,$01,$2E,$01,$2E,$01
	DB $2F,$01,$2F,$01,$2F,$01,$2F,$01,$2F,$01,$2F,$01,$2F,$01,$2F,$01
	DB $2F,$01,$30,$01,$30,$01,$30,$01,$30,$01,$30,$01,$30,$01,$30,$01
	DB $30,$01,$30,$01,$31,$01,$31,$01,$31,$01,$31,$01,$31,$01,$31,$01
	DB $31,$01,$31,$01,$32,$01,$32,$01,$32,$01,$32,$01,$32,$01,$32,$01
	DB $32,$01,$32,$01,$32,$01,$33,$01,$33,$01,$33,$01,$33,$01,$33,$01
	DB $33,$01,$33,$01,$33,$01,$34,$01,$34,$01,$34,$01,$34,$01,$34,$01
	DB $34,$01,$34,$01,$34,$01,$35,$01,$35,$01,$35,$01,$35,$01,$35,$01
	
	DB $35,$01,$35,$01,$35,$01,$36,$01,$36,$01,$36,$01,$36,$01,$36,$01
	DB $36,$01,$36,$01,$36,$01,$37,$01,$37,$01,$37,$01,$37,$01,$37,$01
	DB $37,$01,$37,$01,$37,$01,$38,$01,$38,$01,$38,$01,$38,$01,$38,$01
	DB $38,$01,$38,$01,$38,$01,$39,$01,$39,$01,$39,$01,$39,$01,$39,$01
	DB $39,$01,$39,$01,$3A,$01,$3A,$01,$3A,$01,$3A,$01,$3A,$01,$3A,$01
	DB $3A,$01,$3A,$01,$3B,$01,$3B,$01,$3B,$01,$3B,$01,$3B,$01,$3B,$01
	DB $3B,$01,$3C,$01,$3C,$01,$3C,$01,$3C,$01,$3C,$01,$3C,$01,$3C,$01
	DB $3D,$01,$3D,$01,$3D,$01,$3D,$01,$3D,$01,$3D,$01,$3D,$01,$3E,$01
	DB $3E,$01,$3E,$01,$3E,$01,$3E,$01,$3E,$01,$3E,$01,$3F,$01,$3F,$01
	DB $3F,$01,$3F,$01,$3F,$01,$3F,$01,$3F,$01,$40,$01,$40,$01,$40,$01
	DB $40,$01,$40,$01,$40,$01,$40,$01,$41,$01,$41,$01,$41,$01,$41,$01
	DB $41,$01,$41,$01,$41,$01,$42,$01,$42,$01,$42,$01,$42,$01,$42,$01
	DB $42,$01,$43,$01,$43,$01,$43,$01,$43,$01,$43,$01,$43,$01,$43,$01
	DB $44,$01,$44,$01,$44,$01,$44,$01,$44,$01,$44,$01,$45,$01,$45,$01
	DB $45,$01,$45,$01,$45,$01,$45,$01,$45,$01,$46,$01,$46,$01,$46,$01
	DB $46,$01,$46,$01,$46,$01,$47,$01,$47,$01,$47,$01,$47,$01,$47,$01
	
	DB $47,$01,$48,$01,$48,$01,$48,$01,$48,$01,$48,$01,$48,$01,$49,$01
	DB $49,$01,$49,$01,$49,$01,$49,$01,$49,$01,$4A,$01,$4A,$01,$4A,$01
	DB $4A,$01,$4A,$01,$4A,$01,$4B,$01,$4B,$01,$4B,$01,$4B,$01,$4B,$01
	DB $4B,$01,$4C,$01,$4C,$01,$4C,$01,$4C,$01,$4C,$01,$4D,$01,$4D,$01
	DB $4D,$01,$4D,$01,$4D,$01,$4D,$01,$4E,$01,$4E,$01,$4E,$01,$4E,$01
	DB $4E,$01,$4F,$01,$4F,$01,$4F,$01,$4F,$01,$4F,$01,$4F,$01,$50,$01
	DB $50,$01,$50,$01,$50,$01,$50,$01,$51,$01,$51,$01,$51,$01,$51,$01
	DB $51,$01,$51,$01,$52,$01,$52,$01,$52,$01,$52,$01,$52,$01,$53,$01
	DB $53,$01,$53,$01,$53,$01,$53,$01,$54,$01,$54,$01,$54,$01,$54,$01
	DB $54,$01,$55,$01,$55,$01,$55,$01,$55,$01,$55,$01,$55,$01,$56,$01
	DB $56,$01,$56,$01,$56,$01,$56,$01,$57,$01,$57,$01,$57,$01,$57,$01
	DB $57,$01,$58,$01,$58,$01,$58,$01,$58,$01,$59,$01,$59,$01,$59,$01
	DB $59,$01,$59,$01,$5A,$01,$5A,$01,$5A,$01,$5A,$01,$5A,$01,$5B,$01
	DB $5B,$01,$5B,$01,$5B,$01,$5B,$01,$5C,$01,$5C,$01,$5C,$01,$5C,$01
	DB $5D,$01,$5D,$01,$5D,$01,$5D,$01,$5D,$01,$5E,$01,$5E,$01,$5E,$01
	DB $5E,$01,$5E,$01,$5F,$01,$5F,$01,$5F,$01,$5F,$01,$60,$01,$60,$01
	
	DB $60,$01,$60,$01,$60,$01,$61,$01,$61,$01,$61,$01,$61,$01,$62,$01
	DB $62,$01,$62,$01,$62,$01,$63,$01,$63,$01,$63,$01,$63,$01,$63,$01
	DB $64,$01,$64,$01,$64,$01,$64,$01,$65,$01,$65,$01,$65,$01,$65,$01
	DB $66,$01,$66,$01,$66,$01,$66,$01,$67,$01,$67,$01,$67,$01,$67,$01
	DB $68,$01,$68,$01,$68,$01,$68,$01,$69,$01,$69,$01,$69,$01,$69,$01
	DB $6A,$01,$6A,$01,$6A,$01,$6A,$01,$6B,$01,$6B,$01,$6B,$01,$6B,$01
	DB $6C,$01,$6C,$01,$6C,$01,$6C,$01,$6D,$01,$6D,$01,$6D,$01,$6D,$01
	DB $6E,$01,$6E,$01,$6E,$01,$6E,$01,$6F,$01,$6F,$01,$6F,$01,$6F,$01
	DB $70,$01,$70,$01,$70,$01,$71,$01,$71,$01,$71,$01,$71,$01,$72,$01
	DB $72,$01,$72,$01,$72,$01,$73,$01,$73,$01,$73,$01,$74,$01,$74,$01
	DB $74,$01,$74,$01,$75,$01,$75,$01,$75,$01,$75,$01,$76,$01,$76,$01
	DB $76,$01,$77,$01,$77,$01,$77,$01,$77,$01,$78,$01,$78,$01,$78,$01
	DB $79,$01,$79,$01,$79,$01,$7A,$01,$7A,$01,$7A,$01,$7A,$01,$7B,$01
	DB $7B,$01,$7B,$01,$7C,$01,$7C,$01,$7C,$01,$7D,$01,$7D,$01,$7D,$01
	DB $7D,$01,$7E,$01,$7E,$01,$7E,$01,$7F,$01,$7F,$01,$7F,$01,$80,$01
	DB $80,$01,$80,$01,$81,$01,$81,$01,$81,$01,$82,$01,$82,$01,$82,$01
	
	DB $83,$01,$83,$01,$83,$01,$84,$01,$84,$01,$84,$01,$84,$01,$85,$01
	DB $85,$01,$85,$01,$86,$01,$86,$01,$86,$01,$87,$01,$87,$01,$88,$01
	DB $88,$01,$88,$01,$89,$01,$89,$01,$89,$01,$8A,$01,$8A,$01,$8A,$01
	DB $8B,$01,$8B,$01,$8B,$01,$8C,$01,$8C,$01,$8C,$01,$8D,$01,$8D,$01
	DB $8D,$01,$8E,$01,$8E,$01,$8F,$01,$8F,$01,$8F,$01,$90,$01,$90,$01
	DB $90,$01,$91,$01,$91,$01,$91,$01,$92,$01,$92,$01,$93,$01,$93,$01
	DB $93,$01,$94,$01,$94,$01,$95,$01,$95,$01,$95,$01,$96,$01,$96,$01
	DB $96,$01,$97,$01,$97,$01,$98,$01,$98,$01,$98,$01,$99,$01,$99,$01
	DB $9A,$01,$9A,$01,$9A,$01,$9B,$01,$9B,$01,$9C,$01,$9C,$01,$9C,$01
	DB $9D,$01,$9D,$01,$9E,$01,$9E,$01,$9F,$01,$9F,$01,$9F,$01,$A0,$01
	DB $A0,$01,$A1,$01,$A1,$01,$A2,$01,$A2,$01,$A2,$01,$A3,$01,$A3,$01
	DB $A4,$01,$A4,$01,$A5,$01,$A5,$01,$A5,$01,$A6,$01,$A6,$01,$A7,$01
	DB $A7,$01,$A8,$01,$A8,$01,$A9,$01,$A9,$01,$AA,$01,$AA,$01,$AA,$01
	DB $AB,$01,$AB,$01,$AC,$01,$AC,$01,$AD,$01,$AD,$01,$AE,$01,$AE,$01
	DB $AF,$01,$AF,$01,$B0,$01,$B0,$01,$B1,$01,$B1,$01,$B2,$01,$B2,$01
	DB $B3,$01,$B3,$01,$B4,$01,$B4,$01,$B5,$01,$B5,$01,$B6,$01,$B6,$01
	
	DB $B7,$01,$B7,$01,$B8,$01,$B8,$01,$B9,$01,$B9,$01,$BA,$01,$BA,$01
	DB $BB,$01,$BB,$01,$BC,$01,$BC,$01,$BD,$01,$BD,$01,$BE,$01,$BF,$01
	DB $BF,$01,$C0,$01,$C0,$01,$C1,$01,$C1,$01,$C2,$01,$C2,$01,$C3,$01
	DB $C4,$01,$C4,$01,$C5,$01,$C5,$01,$C6,$01,$C6,$01,$C7,$01,$C8,$01
	DB $C8,$01,$C9,$01,$C9,$01,$CA,$01,$CB,$01,$CB,$01,$CC,$01,$CC,$01
	DB $CD,$01,$CE,$01,$CE,$01,$CF,$01,$CF,$01,$D0,$01,$D1,$01,$D1,$01
	DB $D2,$01,$D3,$01,$D3,$01,$D4,$01,$D5,$01,$D5,$01,$D6,$01,$D6,$01
	DB $D7,$01,$D8,$01,$D8,$01,$D9,$01,$DA,$01,$DA,$01,$DB,$01,$DC,$01
	DB $DC,$01,$DD,$01,$DE,$01,$DF,$01,$DF,$01,$E0,$01,$E1,$01,$E1,$01
	DB $E2,$01,$E3,$01,$E3,$01,$E4,$01,$E5,$01,$E6,$01,$E6,$01,$E7,$01
	DB $E8,$01,$E9,$01,$E9,$01,$EA,$01,$EB,$01,$EC,$01,$EC,$01,$ED,$01
	DB $EE,$01,$EF,$01,$EF,$01,$F0,$01,$F1,$01,$F2,$01,$F3,$01,$F3,$01
	DB $F4,$01,$F5,$01,$F6,$01,$F7,$01,$F7,$01,$F8,$01,$F9,$01,$FA,$01
	DB $FB,$01,$FC,$01,$FC,$01,$FD,$01,$FE,$01,$FF,$01,$00,$02,$01,$02
	DB $02,$02,$02,$02,$03,$02,$04,$02,$05,$02,$06,$02,$07,$02,$08,$02
	DB $09,$02,$0A,$02,$0B,$02,$0C,$02,$0C,$02,$0D,$02,$0E,$02,$0F,$02
	
	DB $10,$02,$11,$02,$12,$02,$13,$02,$14,$02,$15,$02,$16,$02,$17,$02
	DB $18,$02,$19,$02,$1A,$02,$1B,$02,$1C,$02,$1D,$02,$1E,$02,$1F,$02
	DB $20,$02,$22,$02,$23,$02,$24,$02,$25,$02,$26,$02,$27,$02,$28,$02
	DB $29,$02,$2A,$02,$2C,$02,$2D,$02,$2E,$02,$2F,$02,$30,$02,$31,$02
	DB $32,$02,$34,$02,$35,$02,$36,$02,$37,$02,$38,$02,$3A,$02,$3B,$02
	DB $3C,$02,$3D,$02,$3F,$02,$40,$02,$41,$02,$43,$02,$44,$02,$45,$02
	DB $47,$02,$48,$02,$49,$02,$4B,$02,$4C,$02,$4D,$02,$4F,$02,$50,$02
	DB $51,$02,$53,$02,$54,$02,$56,$02,$57,$02,$59,$02,$5A,$02,$5C,$02
	DB $5D,$02,$5F,$02,$60,$02,$62,$02,$63,$02,$65,$02,$66,$02,$68,$02
	DB $69,$02,$6B,$02,$6D,$02,$6E,$02,$70,$02,$72,$02,$73,$02,$75,$02
	DB $77,$02,$78,$02,$7A,$02,$7C,$02,$7E,$02,$7F,$02,$81,$02,$83,$02
	DB $85,$02,$87,$02,$89,$02,$8A,$02,$8C,$02,$8E,$02,$90,$02,$92,$02
	DB $94,$02,$96,$02,$98,$02,$9A,$02,$9C,$02,$9E,$02,$A0,$02,$A3,$02
	DB $A5,$02,$A7,$02,$A9,$02,$AB,$02,$AD,$02,$B0,$02,$B2,$02,$B4,$02
	DB $B6,$02,$B9,$02,$BB,$02,$BE,$02,$C0,$02,$C2,$02,$C5,$02,$C7,$02
	DB $CA,$02,$CC,$02,$CF,$02,$D2,$02,$D4,$02,$D7,$02,$DA,$02,$DC,$02
	
	DB $DF,$02,$E2,$02,$E5,$02,$E8,$02,$EB,$02,$ED,$02,$F0,$02,$F3,$02
	DB $F7,$02,$FA,$02,$FD,$02,$00,$03,$03,$03,$06,$03,$0A,$03,$0D,$03
	DB $10,$03,$14,$03,$17,$03,$1B,$03,$1E,$03,$22,$03,$26,$03,$29,$03
	DB $2D,$03,$31,$03,$35,$03,$39,$03,$3D,$03,$41,$03,$45,$03,$49,$03
	DB $4E,$03,$52,$03,$56,$03,$5B,$03,$5F,$03,$64,$03,$69,$03,$6D,$03
	DB $72,$03,$77,$03,$7C,$03,$81,$03,$87,$03,$8C,$03,$91,$03,$97,$03
	DB $9C,$03,$A2,$03,$A8,$03,$AE,$03,$B4,$03,$BA,$03,$C1,$03,$C7,$03
	DB $CE,$03,$D4,$03,$DB,$03,$E2,$03,$E9,$03,$F1,$03,$F8,$03,$00,$04
	DB $08,$04,$10,$04,$18,$04,$20,$04,$29,$04,$32,$04,$3B,$04,$44,$04
	DB $4E,$04,$58,$04,$62,$04,$6C,$04,$77,$04,$82,$04,$8D,$04,$99,$04
	DB $A5,$04,$B1,$04,$BE,$04,$CB,$04,$D9,$04,$E7,$04,$F6,$04,$05,$05
	DB $15,$05,$26,$05,$37,$05,$48,$05,$5B,$05,$6E,$05,$82,$05,$97,$05
	DB $AD,$05,$C4,$05,$DD,$05,$F6,$05,$11,$06,$2D,$06,$4B,$06,$6B,$06
	DB $8D,$06,$B0,$06,$D7,$06,$00,$07,$2C,$07,$5B,$07,$8F,$07,$C6,$07
	DB $04,$08,$47,$08,$91,$08,$E3,$08,$40,$09,$A9,$09,$21,$0A,$AD,$0A
	DB $53,$0B,$1A,$0C,$12,$0D,$51,$0E,$02,$10,$7B,$12,$A2,$16,$01,$20
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
b01a_Paused:
	DB $0E,"PAUSED",$00
b01aTotalScore:
	DB $0E,"TOTAL SCORE",$00
b01aScore:
	DB $0E,"SCORE",$00
b01a_2F:
	DB $0E,"/",$00
b01a_Percentage:
	DB $0E,"PERCENTAGE",$00
b01a_Bonus1Credit:
	DB $0E,"BONUS 1 CREDIT",$00
b01a_25:
	DB $0E,"%",$00
b01a_Perfect:
	DB $0E,"PERFECT//",$00
b01a_ShieldOfTeammates:
	DB $0E,"SHIELD OF TEAMMATES",$00
b01a_Slippy:
	DB $0E,"SLIPPY",$00
b01a_Peppy:
	DB $0E,"PEPPY",$00
b01a_Falco:
	DB $0E,"FALCO",$00
b01a_IsDown:
	DB $0E,"IS DOWN",$00
b01a_Stage:
	DB $0E,"STAGE",$00
b01a_M:
	DB $02,"m",$00
b01a_S:
	DB $02,"s",$00
b01a_Score:
	DB $02,"score",$00
b01a_ShieldBonus:
	DB $0E,"SHIELD BONUS",$00
b01a_BombBonus:
	DB $0E,"BOMB BONUS",$00
b01a_CheckInFox:
	DB $00,$02,$0E,"all ships check in!",$00
b01a_WeDidIt:
	DB $00,$02,$0E,"we did it!",$00
b01a_SlippySlippy:
	DB $00,$02,$0E,"slippy slippy##",$00
b01a_GoBackToTheBase:
	DB $00,$02,$0E,"go back to the base!",$00
b01a_ReadyFox:
	DB $02,$02,$0E,"ready, fox!",$00
b01a_ImWithYouFox:
	DB $02,$02,$0E,"i'm with you, fox!",$00
b01a_BogeyOnMySix:
	DB $02,$00,$0E,"bogey on my six!",$00
b01a_MindYourOwnBusinessFox:
	DB $02,$02,$0E,"mind your own business, fox!",$00
b01a_TheyGotMeImGone:
	DB $02,$01,$0E,"they got me! i'm gone!!",$00
b01a_IllBlastEmAll:
	DB $02,$02,$0E,"i'll blast 'em all!",$00
b01a_TheresMoreOnTheWay:
	DB $02,$02,$0E,"there's more on the way!",$00
b01a_YouCanRunButYouCantHide:
	DB $02,$02,$0E,"you can run, but you can't hide!",$00
b01a_ThisOnesMine:
	DB $02,$02,$0E,"this one's mine!",$00
b01a_WatchItFox:
	DB $02,$00,$0E,"watch it, fox!",$00
b01a_ImHit:
	DB $02,$02,$0E,"i'm hit!!",$00
b01a_HereTheyCome:
	DB $02,$02,$0E,"here they come! ",$00
b01a_MakeTheNeckAndTailShorterFox:
	DB $82,$02,$0E,"make the neck and tail shorter, fox!!",$00
b01a_ShootDownItsArmsToHitItsBody:
	DB $82,$02,$0E,"shoot down its arms to hit its body!",$00
b01a_SlowItDownFox:
	DB $02,$02,$0E,"slow it down, fox!",$00
b01a_RollBabyRockNRoll:
	DB $02,$02,$0E,"roll, baby! rock 'n roll!",$00
b01a_MyShipsMessedUp:
	DB $02,$02,$0E,"my ship's messed up###",$00
b01a_HeyThatOneWasMine:
	DB $02,$02,$0E,"hey! that one was mine!",$00
b01a_BogiesImCominThrough:
	DB $02,$02,$0E,"bogies, i'm comin' through!",$00
b01a_IllCoverYourTail:












b01a_DescriptionCorneria:
	DB $00,$02,$0E,"star fox team, our last resort is to counter attack venom!  good luck!",$00
b01a_DescriptionStage2:
	DB $00,$02,$0E,"andross's forces intend to build a base in this area!  destroy their rock crusher!",$00
b01a_DescriptionSpaceArmada:
	DB $00,$02,$0E,"the space armada consists of powerful battleships! destroy their energy cores!",$00
b01a_DescriptionMeteor:
	DB $00,$02,$0E,"be sure to use your retros if you're going too fast!  be careful with my arwings!",$00
b01a_DescriptionVenom1:
	DB $00,$02,$0E,"andross is hiding on venom!  fox, you must find his core brain and destroy it!",$00
b01a_Corneria:
	DB $00,$02,$0E,"        CORNERIA - THE BASE",$00
b01a_AsteroidBelt:
	DB $00,$02,$0E,"           ASTEROID BELT",$00
b01a_SectorX:
	DB $00,$02,$0E,"              SECTOR  X",$00
b01a_Fortuna:
	DB $00,$02,$0E,"       THE PLANET FORTUNA",$00
b01a_SpaceArmada:
	DB $00,$02,$0E,"     THE ANDROSS SPACE ARMADA",$00
b01a_Titania:
	DB $00,$02,$0E,"        THE PLANET TITANIA",$00
b01a_BlackHole:
	DB $00,$02,$0E,"      THE AWESOME BLACK HOLE",$00
b01a_SectorY:
	DB $00,$02,$0E,"              SECTOR  Y",$00
b01a_Meteor:
	DB $00,$02,$0E,"      THE BATTLE BASE METEOR",$00
b01a_SectorZ:
	DB $00,$02,$0E,"              SECTOR  Z",$00
b01a_Macbeth:
	DB $00,$02,$0E,"        THE PLANET MACBETH",$00
b01a_Venom:
	DB $00,$02,$0E,"      VENOM - THE FINAL GOAL",$00
b01a_OutOfThisDimension:
	DB $00,$02,$0E,"      OUT OF THIS DIMENSION",$00
b01a_DescriptionTitania:
	DB $00,$02,$0E,"corneria's resource world has been overrun!  you must re-take the weather control unit!",$00
b01a_DescriptionSectorY:
	DB $00,$02,$0E,"how are the arwings handling?  if an amoeba clings to your ship, use l or r to get rid of it#",$00
b01a_DescriptionCorneria3:
	DB $00,$02,$0E,"you've chosen course three###  a good choice to take venom by surprise!",$00
b01a_DescriptionAsteroidBelt3:
	DB $00,$02,$0E,"use the l or r button to escape the tractor beam of the enemy battleship! you can do it, fox!",$00
b01a_DescriptionFortuna:
	DB $00,$02,$0E,"andross has taken control of the huge creatures who live on fortuna!  take care, fox!",$00
b01a_DescriptionSectorZ:
	DB $00,$02,$0E,"your team is doing well, fox!  i hope you're taking good care of my arwings!  go for macbeth!",$00
b01a_DescriptionMacbeth:
	DB $00,$02,$0E,"the hollow interior of macbeth is ideal for a base!  prevent andross from building here!",$00
b01a_DescriptionBlackHole:
	DB $00,$02,$0E,"this space grave yard, created by andross's experiments, is where your father vanished, fox!",$00
b01a_DescriptionVenom2:
	DB $00,$02,$0E,"is everyone all right, fox?!  you're on course to sneak into venom's back door!",$00
b01a_DescriptionOutOfThisDimension:
	DB $00,$02,$0E,"come in, arwings!  fox, where are you?!  we need you to protect corneria!",$00
b01a_DescriptionVenom3:
	DB $00,$02,$0E,"you've made it this far### it's your fate to destroy andross!  we're counting on you, fox!",$00










	DW b01a_CheckInFox,b01a_WeDidIt,b01a_SlippySlippy,b01a_GoBackToTheBase
	DW b01a_ReadyFox,b01a_ImWithYouFox,b01a_BogeyOnMySix,b01a_MindYourOwnBusinessFox
	DW b01a_TheyGotMeImGone,b01a_IllBlastEmAll,b01a_TheresMoreOnTheWay,b01a_YouCanRunButYouCantHide
	DW b01a_ThisOnesMine,b01a_WatchItFox,b01a_ImHit,b01a_HereTheyCome
	DW b01a_MakeTheNeckAndTailShorterFox,b01a_ShootDownItsArmsToHitItsBody,b01a_SlowItDownFox,b01a_RollBabyRockNRoll
	DW b01a_MyShipsMessedUp,b01a_HeyThatOneWasMine,b01a_BogiesImCominThrough,b01a_IllCoverYourTail
	DW 
	