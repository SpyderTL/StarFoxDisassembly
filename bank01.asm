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
	iwt r15,#UnkFuncGSU_018C31
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
	iwt r15,#UnkFuncGSU_018CA2
	nop
	iwt r15,#UnkFuncGSU_018C8F
	nop
;;;;;;;;;;;;;;;;;;;
;UTILITY FUNCTIONS;
;;;;;;;;;;;;;;;;;;;
UnkFuncGSU_018058:
	ibt r6,#$00
	ibt r4,#$00
	ibt r12,#$08
	iwt r13,#UnkFuncGSU_018058_L1
	with r3
UnkFuncGSU_018058_L1:
	add r3
	with r4
	rol
	with r3
	add r3
	with r4
	rol
	with r6
	add r6
	from r6
	add r6
	alt3
	cmp r4
	bcs UnkFuncGSU_018058_L2
	with r4
	alt1
	sbc r0
	inc r6
UnkFuncGSU_018058_L2:
	loop
	with r3
	jmp r11						;\Return from link
	nop						;/
UnkFuncGSU_018079:
	iwt r5,#$FFFF
	iwt r4,#$7FFF
	link #4
	iwt r15,#UnkFuncGSU_018086
	nop
	stop						;\End SuperFX task
	nop						;/
UnkFuncGSU_018086:
	ibt r6,#$00
	ibt r8,#$00
	ibt r12,#$10
	iwt r13,#UnkFuncGSU_018086_L1
	with r5
UnkFuncGSU_018086_L1:
	add r5
	with r4
	rol
	with r8
	rol
	with r5
	add r5
	with r4
	rol
	with r8
	rol
	with r6
	add r6
	from r6
	to r7
	add r6
	from r7
	sub r8
	bcs UnkFuncGSU_018086_L2
	with r8
	alt1
	sbc r7
	inc r6
UnkFuncGSU_018086_L2:
	loop
	with r5
	jmp r11						;\Return from link
	nop						;/
UnkFuncGSU_0180AC:
	iwt r1,#$0100
	iwt r2,#$0100
	iwt r3,#$7D00
	link #4
	iwt r15,#UnkFunc_0180C5
	nop
	stop						;\End SuperFX task
	nop						;/
UnkFuncGSU_0180BC:
	from r4
	to r1
	sub r1
	from r5
	to r2
	sub r2
	from r6
	to r3
	sub r3
UnkFuncGSU_0180C5:
	from r11					;\Push r11 (link) to stack
	stw r10						;|
	inc r10						;|
	inc r10						;/
	move r6,r1
	from r1
	alt1
	lmult
	move r5,r4
	move r6,r2
	from r2
	to r6
	alt1
	lmult
	with r5
	add r4
	alt1
	adc r6
	move r6,r3
	from r3
	to r6
	alt1
	lmult
	with r5
	add r4
	alt1
	adc r6
	moves r0,r0
	bne UnkFuncGSU_0180C5_L1
	nop
	moves r5,r5
	bne UnkFuncGSU_0180C5_L1
	ibt r1,#$00
	ibt r2,#$00
	ibt r3,#$00
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
UnkFuncGSU_0180C5_L1:
	move r4,r0
	link #4
	iwt r15,#UnkFuncGSU_018086
	nop
	with r6
	to r0
	ibt r9,#$00
UnkFuncGSU_0180C5_L2:
	lsr
	beq UnkFuncGSU_0180C5_L3
	nop
	bra UnkFuncGSU_0180C5_L2
	inc r9
UnkFuncGSU_0180C5_L3:
	sub r0
	iwt r4,#$7FFF
	moves r12,r9
	beq UnkFuncGSU_0180C5_L4
	nop
	move r13,r15					; Set loop point
	with r4
	add r4
	loop
	rol
UnkFuncGSU_0180C5_L4:
	move r6,r6
	link #4
	iwt r15,#UnkFuncGSU_018183
	nop
	move r6,r4
	from r1
	to r7
	alt1
	lmult
	move r1,r4
	from r2
	to r8
	alt1
	lmult
	move r2,r4
	from r3
	alt1
	lmult
	move r3,r4
	moves r12,r9
	beq UnkFuncGSU_0180C5_L5
	nop
	move r13,r15					; Set loop point
	with r7
	asr
	with r1
	ror
	with r8
	asr
	with r2
	ror
	asr
	with r3
	ror
	loop
	nop
UnkFuncGSU_0180C5_L5:
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
UnkFuncGSU_01814D:
	cache
	from r5
	to r7
	alt1
	xor r6
	sub r0
	moves r6,r6
	bpl UnkFuncGSU_01814D_L1
	to r6
	sub r6
UnkFuncGSU_01814D_L1:
	moves r5,r5
	bpl UnkFuncGSU_01814D_L2
	to r4
	sub r4
	to r5
	alt1
	sbc r5
UnkFuncGSU_01814D_L2:
	with r4
	add r4
	from r5
	rol
	ibt r12,#$10
	move r13,r15					; Set loop point
	sub r6
	bcc UnkFuncGSU_01814D_L3
	nop
	with r4
	rol
	loop
	rol
	bra UnkFuncGSU_01814D_L4
	nop
UnkFuncGSU_01814D_L3:
	add r6
	with r4
	add r4
	loop
	rol
UnkFuncGSU_01814D_L4:
	moves r7,r7
	bpl UnkFuncGSU_01814D_L5
	with r4
	not
	inc r4
UnkFuncGSU_01814D_L5:
	jmp r11						;\Return from link
	nop						;/
UnkFuncGSU_018183:
	moves r0,r0
	bmi UnkFuncGSU_018183_L1
	nop
	moves r6,r6
	bpl Divide
	nop
UnkFuncGSU_018183_L1:
	with r6
	lsr
	lsr
	with r4
	ror
Divide:
	ibt r12,#$10
	with r4
	add r4
	rol
	move r13,r15					; Set loop point
	sub r6
	bcc Divide_L1
	nop
	with r4
	rol
	loop
	rol
	jmp r11						;\Return from link
	lsr						;/
Divide_L1:
	add r6
	with r4
	add r4
	loop
	rol
	jmp r11						;\Return from link
	lsr						;/
CalculateAtan2:
	iwt r10,#SuperFXStack				; Init SuperFX stack
	alt1						;\Get X in r1
	lms r1,(InputVecX)				;/
	alt1						;\Get Y in r2
	lms r2,(InputVecY)				;/
	link #4
	iwt r15,#DoCalculateAtan2
	nop
	alt2						;\Store result
	sms (UnknownGSU_040),r0				;|
	nop						;/
	stop						;\End SuperFX task
	nop						;/
DoCalculateAtan2:
	from r11					;\Push r11 (link) to stack
	stw r10						;|
	inc r10						;|
	inc r10						;/
	from r14					;\Push r14 to stack
	stw r10						;|
	inc r10						;|
	inc r10						;/
	moves r6,r1					;\Get |X| in r6
	bpl DoCalculateAtan2_SkipNegX			;|
	nop						;|
	with r6						;|
	not						;|
	inc r6						;/
DoCalculateAtan2_SkipNegX:
	moves r0,r2					;\Get |Y| in r0
	bpl DoCalculateAtan2_SkipNegY			;|
	nop						;|
	not						;|
	inc r0						;/
DoCalculateAtan2_SkipNegY:
	bne DoCalculateAtan2_SkipY0			;\If |Y| is 0, return 90 degrees
	nop						;|
	iwt r0,#$4000					;|
	iwt r15,#DoCalculateAtan2_ChkRes		;|
	nop						;/
DoCalculateAtan2_SkipY0:
	ibt r5,#$00					;\If |X|=|Y|, return 45 degrees
	alt3						;|
	cmp r6						;|
	bne DoCalculateAtan2_SkipXEquY			;|
	nop						;|
	iwt r0,#$2000					;|
	iwt r15,#DoCalculateAtan2_ChkRes		;|
	nop						;/
DoCalculateAtan2_SkipXEquY:
	blt DoCalculateAtan2_SkipSwapXY			;\If |X|<|Y|, swap r0/r6 (|X|/|Y|)
	nop						;|
	move r4,r6					;|
	move r6,r0					;|
	move r0,r4					;|
	dec r5						;/
DoCalculateAtan2_SkipSwapXY:
	ibt r4,#$00					;\Divide |Y| by |X|
	lsr						;|
	with r4						;|
	ror						;|
	link #4						;|
	iwt r15,#Divide					;|
	nop						;/
	sub r0						;\Get value in table
	alt3						;|
	romb						;|
	from r4						;|
	lsr						;|
	lsr						;|
	lsr						;|
	lsr						;|
	lsr						;|
	alt3						;|
	bic #$01					;|
	iwt r4,#Atan2Table				;|
	to r14						;|
	add r4						;|
	getb						;|
	inc r14						;|
	alt1						;|
	getbh						;/
	moves r5,r5					;\If X and Y were swapped, use other octant in quadrant
	bmi DoCalculateAtan2_ChkRes			;|
	nop						;|
	not						;|
	inc r0						;|
	iwt r4,#$4000					;|
	add r4						;/
DoCalculateAtan2_ChkRes:
	from r1						;\If either X or Y is negative (but not both), negate result
	to r4						;|
	alt1						;|
	xor r2						;|
	bpl DoCalculateAtan2_SkNegRes			;|
	nop						;|
	not						;|
	inc r0						;/
DoCalculateAtan2_SkNegRes:
	moves r2,r2					;\If Y is negative, negate result again
	bpl DoCalculateAtan2_Return			;|
	nop						;|
	iwt r4,#$8000					;|
	add r4						;/
DoCalculateAtan2_Return:
	dec r10						;\Pop r14 from stack
	dec r10						;|
	to r14						;|
	ldw r10						;/
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
MultiplyPointByMatrix:
	cache
	alt1						;\Get X position in r1
	lms r1,(InputVecX)				;/
	alt1						;\Get Y position in r2
	lms r2,(InputVecY)				;/
	alt1						;\Get Z position in r3
	lms r3,(InputVecZ)				;/
	alt1						;\Get XX matrix element in r6
	lms r6,(ObjectMatrix.XX)			;/
	from r1						;\Multiply X position by XX matrix element...
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get XY matrix element in r6
	lms r6,(ObjectMatrix.XY)			;/
	from r2						;\Multiply Y position by XY matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	with r5						;|
	add r0						;/...and accumulating to previous value
	alt1						;\Get XZ matrix element in r6
	lms r6,(ObjectMatrix.XZ)			;/
	from r3						;\Multiply Z position by XZ matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating to previous value...
	alt2						;|...and storing the result
	lms r6,(ObjectMatrix.YX)			;/
	alt1						;\Get YX matrix element in r6
	lms r6,($00D4)					;/
	from r1						;\Multiply Y position by YX matrix element...
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get YY matrix element in r6
	lms r6,(ObjectMatrix.YY)			;/
	from r2						;\Multiply Y position by YY matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	with r5						;|
	add r0						;/...and accumulating to previous value
	alt1						;\Get YZ matrix element in r6
	lms r6,(ObjectMatrix.YZ)			;/
	from r3						;\Multiply Z position by YZ matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating to previous value...
	alt2						;|...and storing the result
	sms (OutputVecY),r0				;/
	alt1						;\Get ZX matrix element in r6
	lms r6,(ObjectMatrix.ZX)			;/
	from r1						;\Multiply Z position by ZX matrix element...
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get ZY matrix element in r6
	lms r6,(ObjectMatrix.XY)			;/
	from r2						;\Multiply Y position by ZY matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	with r5						;|
	add r0						;/...and accumulating to previous value
	alt1						;\Get ZZ matrix element in r6
	lms r6,(ObjectMatrix.ZZ)			;/
	from r3						;\Multiply Z position by ZZ matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating to previous value...
	alt2						;|...and storing the result
	sms (OutputVecZ),r0				;/
	stop						;\End SuperFX task
	nop						;/
CalculateMatrix:
	iwt r9,#ObjectMatrix
	link #4
	iwt r15,#DoCalculateMatrix
	nop
	stop						;\End SuperFX task
	nop						;/
DoCalculateMatrix:
	sub r0
	alt2
	ramb
	alt3
	romb
	alt1
	lms r1,(DesiredXRot)				; r1 = X rotation
	iwt r6,#SineTable8p8
	from r1						;\r2 = sin(hib(r1))
	hib						;|
	add r0						;|
	to r14						;|
	add r6						;|
	to r2						;|
	getb						;|
	inc r14						;|
	with r2						;|
	alt1						;|
	getbh						;/
	inc r14						;\r0 = sin(hib(r1)+$100)
	getb						;|
	inc r14						;|
	alt1						;|
	getbh						;/
	to r6						;\Lerp r0 and r2 using lob(r1)...
	sub r2						;|
	from r1						;|
	lob						;|
	swap						;|
	lsr						;|
	fmult						;|
	rol						;|
	to r12						;|...and store in r12 (sin(xrot))
	add r12						;/
	iwt r14,#$4000					;\Offset for cosine
	with r1						;|
	add r14						;/
	iwt r6,#SineTable8p8
	from r1						;\r2 = cos(hib(r1))
	hib						;|
	add r0						;|
	to r14						;|
	add r6						;|
	to r2						;|
	getb						;|
	inc r14						;|
	with r2						;|
	alt1						;|
	getbh						;/
	inc r14						;\r0 = cos(hib(r1)+$100)
	getb						;|
	inc r14						;|
	alt1						;|
	getbh						;/
	to r6						;\Lerp r0 and r2 using lob(r1)...
	sub r2						;|
	from r1						;|
	lob						;|
	swap						;|
	lsr						;|
	fmult						;|
	rol						;|
	to r8						;|...and store in r8 (cos(xrot))
	add r2						;/
	alt1
	lms r1,(DesiredYRot)				; r1 = Y rotation
	iwt r6,#SineTable8p8
	from r1						;\r2 = sin(hib(r1))
	hib						;|
	add r0						;|
	to r14						;|
	add r6						;|
	to r2						;|
	getb						;|
	inc r14						;|
	with r2						;|
	alt1						;|
	getbh						;/
	inc r14						;\r0 = cos(hib(r1)+$100)
	getb						;|
	inc r14						;|
	alt1						;|
	getbh						;/
	to r6						;\Lerp r0 and r2 using lob(r1)...
	sub r2						;|
	from r1						;|
	lob						;|
	swap						;|
	lsr						;|
	fmult						;|
	rol						;|
	to r4						;|...and store in r4 (sin(yrot))
	add r2						;/
	iwt r14,#$4000					;\Offset for cosine
	with r1						;|
	add r14						;/
	iwt r6,#SineTable8p8
	from r1						;\r2 = cos(hib(r1))
	hib						;|
	add r0						;|
	to r14						;|
	add r6						;|
	to r2						;|
	getb						;|
	inc r14						;|
	with r2						;|
	alt1						;|
	getbh						;/
	inc r14						;\r0 = cos(hib(r1)+$100)
	getb						;|
	inc r14						;|
	alt1						;|
	getbh						;/
	to r6						;\Lerp r0 and r2 using lob(r1)...
	sub r2						;|
	from r1						;|
	lob						;|
	swap						;|
	lsr						;|
	fmult						;|
	rol						;|
	to r3						;|...and store in r3 (cos(yrot))
	add r2						;/
	alt1
	lms r1,(DesiredZRot)				; r1 = Z rotation
	iwt r6,#SineTable8p8
	from r1						;\r2 = sin(hib(r1))
	hib						;|
	add r0						;|
	to r14						;|
	add r6						;|
	to r2						;|
	getb						;|
	inc r14						;|
	with r2						;|
	alt1						;|
	getbh						;/
	inc r14						;\r0 = cos(hib(r1)+$100)
	getb						;|
	inc r14						;|
	alt1						;|
	getbh						;/
	to r6						;\Lerp r0 and r2 using lob(r1)...
	sub r2						;|
	from r1						;|
	lob						;|
	swap						;|
	lsr						;|
	fmult						;|
	rol						;|
	to r7						;|...and store in r4 (sin(zrot))
	add r2						;/
	iwt r14,#$4000					;\Offset for cosine
	with r1						;|
	add r14						;/
	iwt r6,#SineTable8p8
	from r1						;\r2 = cos(hib(r1))
	hib						;|
	add r0						;|
	to r14						;|
	add r6						;|
	to r2						;|
	getb						;|
	inc r14						;|
	with r2						;|
	alt1						;|
	getbh						;/
	inc r14						;\r0 = cos(hib(r1)+$100)
	getb						;|
	inc r14						;|
	alt1						;|
	getbh						;/
	to r6						;\Lerp r0 and r2 using lob(r1)...
	sub r2						;|
	from r1						;|
	lob						;|
	swap						;|
	lsr						;|
	fmult						;|
	rol						;|
	to r5						;|...and store in r4 (cos(zrot))
	add r2						;/
	move r6,r5					;\r1 = sinycosz
	from r4						;|
	fmult						;|
	to r1						;|
	rol						;/
	from r3						;\r2 = cosycosz
	fmult						;|
	to r2						;|
	rol						;/
	move r6,r7					;\r13 = sinysinz
	from r4						;|
	fmult						;|
	to r13						;|
	rol						;/
	from r3						;\r14 = cosysinz
	fmult						;|
	to r14						;|
	rol						;/
	move r6,r12					;\XX = sinxsinysinz+cosycosz
	from r13					;|
	fmult						;|
	rol						;|
	add r2						;|
	stw r9						;|
	inc r9						;|
	inc r9						;/
	from r1						;\YX = sinxsinycosz
	fmult						;|
	rol						;|
	sub r14						;|
	stw r9						;|
	inc r9						;|
	inc r9						;/
	move r6,r8					;\ZX = cosxsiny
	from r4						;|
	fmult						;|
	rol						;|
	stw r9						;|
	inc r9						;|
	inc r9						;/
	from r7						;\XY = cosxsinz
	fmult						;|
	rol						;|
	stw r9						;|
	inc r9						;|
	inc r9						;/
	from r5						;\YY = cosxcosz
	fmult						;|
	rol						;|
	stw r9						;|
	inc r9						;|
	inc r9						;/
	from r12					;\ZY = -sinx
	not						;|
	inc r0						;|
	stw r9						;|
	inc r9						;|
	inc r9						;/
	move r6,r12					;\XZ = sinxcosysinz
	from r14					;|
	fmult						;|
	rol						;|
	sub r1						;|
	stw r9						;|
	inc r9						;|
	inc r9						;/
	from r2						;\YZ = sinxcosycosz+sinysinz
	fmult						;|
	rol						;|
	add r13						;|
	stw r9						;|
	inc r9						;|
	inc r9						;/
	move r6,r8					;\ZZ = cosxcosy
	from r3						;|
	fmult						;|
	rol						;|
	stw r9						;/
	jmp r11						;\Return from link
	nop						;/
Unknown_DrawHorizLine32GreenPixels:
	ibt r0,#$FF					;\Set color to $FF (green)
	color						;/
	ibt r1,#$00					;\Set initial X/Y coords of line
	ibt r2,#$40					;/
	ibt r12,#$20					; Draw 32 pixels
	move r13,r15					; Set loop point
	loop						;\Plot horizontal line
	plot						;/
	stop						;\End SuperFX task
	nop						;/
UnkFuncGSU_0183CF:
	sub r0
	alt2
	ramb
	alt3
	romb
	iwt r10,#SuperFXStack
	alt1
	lms r0,(OutputVecY)
	stw r10
	inc r10
	inc r10
	iwt r1,#$0080
	add r1
	sub r0
	sbk
	link #4
	iwt r15,#CODE_01846B
	nop
	alt1
	lms r0,(DesiredXRot)
	swap
	not
	inc r0
	sbk
	alt1
	lms r0,(DesiredYRot)
	swap
	not
	inc r0
	sbk
	alt1
	lms r0,(DesiredZRot)
	swap
	not
	inc r0
	sbk
	dec r10
	dec r10
	ldw r10
	alt2
	sms (OutputVecY),r0
	link #4
	iwt r15,#CODE_018479
	nop
	stop						;\End SuperFX task
	nop						;/
CODE_01840A:
	sub r0
	alt2
	ramb
	alt3
	romb
	iwt r10,#SuperFXStack
	alt1
	lm r4,(UnknownGSU_01A)
	ibt r14,#$12
	from r4
	to r14
	add r14
	getb
	inc r14
	alt1
	getbh
	alt2
	sms (UnknownGSU_04A),r0
	ibt r14,#$07
	from r4
	to r14
	add r14
	getb
	alt2
	sms (UnknownGSU_032),r0
	ibt r14,#$00
	from r4
	to r14
	add r14
	getb
	inc r14
	alt1
	getbh
	alt2
	sms (UnknownGSU_016),r0
	ibt r14,#$02
	from r4
	to r14
	add r14
	getb
	alt2
	sms (UnknownGSU_01C),r0
	ibt r14,#$03
	from r4
	to r14
	add r14
	getb
	inc r14
	alt1
	getbh
	alt2
	sms (UnknownGSU_018),r0
	iwt r0,#$8000
	link #4
	iwt r15,#CODE_018484
	nop
	stop						;\End SuperFX task
	nop						;/
CODE_018456:
	alt1
	lms r0,(UnknownGSU_1A2)
	lob
	beq CODE_018479
	nop
	from r11
	stw r10
	inc r10
	inc r10
	link #4
	iwt r15,#CODE_01846B
	nop
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_01846B:
	iwt r2,#$1000
	iwt r1,#$2000
	alt1
	lms r0,(UnknownGSU_054)
	and r2
	or r1
	bra CODE_018484
	nop
CODE_018479:
	from r11
	stw r10
	inc r10
	inc r10
	dec r10
	dec r10
	to r11
	ldw r10
	iwt r0,#$8000
CODE_018484:
	alt2
	sms (UnknownGSU_054),r0
	from r11
	stw r10
	inc r10
	inc r10
	ibt r0,#$03
	alt3
	romb
	ibt r0,#$03
	alt3
	romb
	alt1
	lms r14,(UnknownGSU_050)
	alt1
	lms r0,(UnknownGSU_1A4)
	lob
	beq CODE_0184A5
	nop
	dec r0
	add r0
	add r0
	iwt r0,#DATA_038F9A
	to r14
	add r2
CODE_0184A5:
	alt1
	lms r1,(OutputVecZ)
	sub r0
	alt1
	getbh
	inc r14
	add r1
	bpl CODE_0184BA
	nop
	iwt r0,#LitColorPointerTable
	iwt r2,#$0000
	iwt r15,#CODE_0184E4
	nop
CODE_0184BA:
	sub r0
	alt1
	getbh
	inc r14
	add r1
	bpl CODE_0184CC
	nop
	iwt r0,#LitColorPointerTable+$18
	iwt r2,#$0020
	iwt r15,#CODE_0184E4
	nop
CODE_0184CC:
	sub r0
	alt1
	getbh
	inc r14
	add r1
	bpl CODE_0184DE
	nop
	iwt r0,#LitColorPointerTable+$30
	iwt r2,#$0040
	iwt r15,#CODE_0184E4
	nop
CODE_0184DE:
	iwt r0,#LitColorPointerTable+$48
	iwt r2,#$0060
CODE_0184E4:
	alt2
	sms (UnknownGSU_04C),r0
	alt1
	lms r0,(UnknownGSU_04E)
	add r2
	alt2
	sms (UnknownGSU_032),r0
	cache
	ibt r0,#$01
	alt1
	lms r12,(UnknownGSU_032)
	moves r12,r12
	beq CODE_0184FD
	nop
	move r13,r15					; Set loop point
	loop
	add r0
CODE_0184FD:
	alt2
	sms (UnknownGSU_030),r0
	alt1
	lms r1,(DesiredXRot)
	from r1
	lob
	swap
	not
	inc r0
	sbk
	alt1
	lms r2,(DesiredYRot)
	from r2
	lob
	swap
	not
	inc r0
	sbk
	alt1
	lms r3,(DesiredZRot)
	from r3
	lob
	swap
	not
	inc r0
	sbk
	from r1
	or r3
	beq CODE_018524
	nop
	iwt r15,#CODE_0185DE
	nop
CODE_018524:
	or r2
	bne CODE_018575
	nop
	alt1						;\Copy XX matrix element
	lms r0,(ObjectMatrix.XX)			;|
	alt2						;|
	sms (TransformMatrix.XX),r0			;/
	alt1						;\Copy YX matrix element
	lms r0,(ObjectMatrix.YX)			;|
	alt2						;|
	sms (TransformMatrix.YX),r0			;/
	alt1						;\Copy ZX matrix element
	lms r0,(ObjectMatrix.ZX)			;|
	alt2						;|
	sms (TransformMatrix.ZX),r0			;/
	alt1						;\Copy XY matrix element
	lms r0,(ObjectMatrix.XY)			;|
	alt2						;|
	sms (TransformMatrix.XY),r0			;/
	alt1						;\Copy YY matrix element
	lms r0,(ObjectMatrix.YY)			;|
	alt2						;|
	sms (TransformMatrix.YY),r0			;/
	alt1						;\Copy ZY matrix element
	lms r0,(ObjectMatrix.ZY)			;|
	alt2						;|
	sms (TransformMatrix.ZY),r0			;/
	alt1						;\Copy XZ matrix element
	lms r0,(ObjectMatrix.XZ)			;|
	alt2						;|
	sms (TransformMatrix.XZ),r0			;/
	alt1						;\Copy YZ matrix element
	lms r0,(ObjectMatrix.YZ)			;|
	alt2						;|
	sms (TransformMatrix.YZ),r0			;/
	alt1						;\Copy ZZ matrix element
	lms r0,(ObjectMatrix.ZZ)			;|
	alt2						;|
	sms (TransformMatrix.ZZ),r0			;/
	alt1
	lms r0,(UnknownGSU_054)
	iwt r1,#$2000
	and r1
	beq CODE_018571
	sub r0
	alt2						;\Zero XY matrix element
	sms (TransformMatrix.XY),r0			;/
	alt2						;\Zero YY matrix element
	sms (TransformMatrix.YY),r0			;/
	alt2						;\Zero ZY matrix element
	sms (TransformMatrix.ZY),r0			;/
CODE_018571:
	iwt r15,#CODE_018615
	nop
CODE_018575:
	iwt r4,#$0040
	from r2
	sub r4
	bne CODE_018581
	nop
	iwt r15,#CODE_0185DE
	nop
CODE_018581:
	bne CODE_0185DE
	nop
	alt1						;\Negate XX matrix element
	lms r0,(ObjectMatrix.XX)			;|
	not						;|
	inc r0						;|
	alt2						;|
	sms (TransformMatrix.XX),r0			;/
	alt1						;\Negate YX matrix element
	lms r0,(ObjectMatrix.YX)			;|
	not						;|
	inc r0						;|
	alt2						;|
	sms (TransformMatrix.YX),r0			;/
	alt1						;\Negate ZX matrix element
	lms r0,(ObjectMatrix.ZX)			;|
	not						;|
	inc r0						;|
	alt2						;|
	sms (TransformMatrix.ZX),r0			;/
	alt1						;\Copy XY matrix element
	lms r0,(ObjectMatrix.XY)			;|
	alt2						;|
	sms (TransformMatrix.XY),r0			;/
	alt1						;\Copy YY matrix element
	lms r0,(ObjectMatrix.YY)			;|
	alt2						;|
	sms (TransformMatrix.YY),r0			;/
	alt1						;\Copy ZY matrix element
	lms r0,(ObjectMatrix.ZY)			;|
	alt2						;|
	sms (TransformMatrix.ZY),r0			;/
	alt1						;\Negate XZ matrix element
	lms r0,(ObjectMatrix.XZ)			;|
	not						;|
	inc r0						;|
	alt2						;|
	sms (TransformMatrix.XZ),r0			;/
	alt1						;\Negate YZ matrix element
	lms r0,(ObjectMatrix.YZ)			;|
	not						;|
	inc r0						;|
	alt2						;|
	sms (TransformMatrix.YZ),r0			;/
	alt1						;\Negate ZZ matrix element
	lms r0,(ObjectMatrix.ZZ)			;|
	not						;|
	inc r0						;|
	alt2						;|
	sms (TransformMatrix.ZZ),r0			;/
	alt1
	lms r0,(UnknownGSU_054)
	iwt r1,#$2000
	and r1
	beq CODE_0185DA
	sub r0
	alt2						;\Zero XY matrix element
	sms (TransformMatrix.XY),r0			;/
	alt2						;\Zero YY matrix element
	sms (TransformMatrix.YY),r0			;/
	alt2						;\Zero ZY matrix element
	sms (TransformMatrix.ZY),r0			;/
CODE_0185DA:
	iwt r15,#CODE_018615
	nop
CODE_0185DE:
	iwt r9,#$0104
	link #4
	iwt r15,#CODE_01829F
	nop
	iwt r9,#$0104
	link #4
	iwt r15,#CODE_0194FE
	nop
	alt1
	lms r0,(UnknownGSU_054)
	iwt r1,#$2000
	and r1
	beq CODE_01860D
	sub r0
	alt2
	sms (UnknownGSU_106),r0
	alt2
	sms (UnknownGSU_10C),r0
	alt2
	sms (UnknownGSU_112),r0
	iwt r9,#$0120
	link #4
	iwt r15,#CODE_01952E
	nop
	iwt r15,#CODE_018615
	nop
CODE_01860D:
	iwt r9,#$0120
	link #4
	iwt r15,#CODE_01952E
	nop
	iwt r0,#$49E5
	alt2
	sms (UnknownGSU_0EE),r0
	iwt r0,#$49E5
	alt2
	sms (UnknownGSU_0F0),r0
	iwt r0,#$49E5
	alt2
	sms (UnknownGSU_0F2),r0
	alt1
	lms r1,(UnknownGSU_0EE)
	alt1
	lms r2,(UnknownGSU_0F0)
	alt1
	lms r3,(UnknownGSU_0F2)
	alt1
	lms r6,(TransformMatrix.XX)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,(TransformMatrix.YX)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,(TransformMatrix.ZX)
	from r3
	fmult
	rol
	add r5
	hib
	sex
	alt2
	sms (UnknownGSU_0F4),r0
	alt1
	lms r6,(TransformMatrix.XY)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,(TransformMatrix.YY)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,(TransformMatrix.ZY)
	from r3
	fmult
	rol
	add r5
	hib
	sex
	alt2
	sms (UnknownGSU_0F6),r0
	alt1
	lms r6,(TransformMatrix.XZ)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,(TransformMatrix.YZ)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,(TransformMatrix.ZZ)
	from r3
	fmult
	rol
	add r5
	hib
	sex
	alt2
	sms (UnknownGSU_0F8),r0
	lt1
	lms r0,(UnknownGSU_032)
	alt2
	sub #$03
	bpl CODE_0186C9
	nop
	iwt r2,#$0121
	to r1
	alt1
	ldb r2
	inc r2
	inc r2
	alt1
	ldb r2
	swap
	or r1
	alt2
	sms (UnknownGSU_116),r0
	inc r2
	inc r2
	to r1
	alt1
	ldb r2
	inc r2
	inc r2
	alt1
	ldb r2
	swap
	or r1
	alt2
	sms (UnknownGSU_118),r0
	inc r2
	inc r2
	to r1
	alt1
	ldb r2
	inc r2
	inc r2
	alt1
	ldb r2
	swap
	or r1
	alt2
	sms (UnknownGSU_11A),r0
	inc r2
	inc r2
	to r1
	alt1
	ldb r2
	inc r2
	inc r2
	alt1
	ldb r2
	swap
	or r1
	alt2
	sms (UnknownGSU_11C),r0
	inc r2
	inc r2
	alt1
	ldb r2
	sms (UnknownGSU_11E),r0
CODE_0186C9:
	sub r0
	alt2
	sms (TotalVtxCnt),r0
	iwt r0,#$05C2
	alt2
	sms (CurVtxPtr),r0
	alt1
	lms r0,(UnknownGSU_01C)
	alt3
	romb
	alt1
	lms r14,(UnknownGSU_016)
	alt2
	sms (UnknownGSU_01A),r14
	iwt r0,#FinishModel				;\Push `FinishModel` function pointer to stack
	stw r10						;|
	inc r10						;|
	inc r10						;/
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
	
;;;;;;;;;;;;;;;;;;;;;;;;
;MODEL COMMAND ROUTINES;
;;;;;;;;;;;;;;;;;;;;;;;;
PopAndReturn:
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
LoadAnimatedVertices:
	to r1						;\Get frame count in r1
	getb						;|
	inc r14						;/
	alt1						;\Get timer in r0...
	lms r0,(VertexAnimFrame)			;|
	ibt r2,#$3F					;|...and mask out the 6 LSBs
	and r2						;/
LoadAnimatedVertices_L1:
	alt3						;\Calculate "timer" modulo "frame count"
	cmp r1						;|
	bmi LoadAnimatedVertices_L2			;|If "timer" is smaller, we're done
	nop						;|
	bra LoadAnimatedVertices_L1			;|Otherwise, loop back, but first...
	sub r1						;/...subtract "frame count" from "timer"
LoadAnimatedVertices_L2:
	add r0						;\Double r0 to get offset in bytes...
	with r14					;|...and add this to the ROM pointer...
	add r0						;/...to get the offset to this frame's animation vertices
JumpToEndOfAnimatedVertices:
	getb						;\Offset ROM pointer using two bytes read
	inc r14						;|
	alt1						;|
	getbh						;|
	with r14					;|
	add r0						;/
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
LoadVertices16Bit:
	to r12						;\Get vertex count in r12 (loop register)
	getb						;|
	inc r14						;/
	alt1						;\Add r12 to total vertex count
	lms r0,(TotalVtxCnt)				;|
	add r12						;|
	sbk						;/
	alt1						;\Load r9 with current vertex pointer
	lms r9,(CurVtxPtr)				;/
	alt2						;\Save r10
	sms (UnknownGSU_012),r10			;/
	alt1						;\Get XX matrix element in r10
	lms r10,(TransformMatrix.XX)			;/
	alt1						;\Get XY matrix element in r11
	lms r11,(TransformMatrix.XY)			;/
	alt1						;\Get XZ matrix element in r13
	lms r13,(TransformMatrix.XZ)			;/
	alt1						;\Get YX matrix element in r4
	lms r4,(TransformMatrix.YX)			;/
	alt1						;\Get YY matrix element in r7
	lms r7,(TransformMatrix.YY)			;/
	alt1						;\Get YZ matrix element in r8
	lms r8,(TransformMatrix.YZ)			;/
	cache
LoadVertices16Bit_Loop:
	to r1						;\Get vertex X position in r1
	getb						;|
	inc r14						;|
	with r1						;|
	alt1						;|
	getbh						;|
	inc r14						;/
	to r2						;\Get vertex Y position in r2
	getb						;|
	inc r14						;|
	with r2						;|
	alt1						;|
	getbh						;|
	inc r14						;/
	to r3						;\Get vertex Z position in r3
	getb						;|
	inc r14						;|
	with r3						;|
	alt1						;|
	getbh						;|
	inc r14						;/
	move r6,r10					;\Multiply X position by XX matrix element...
	from r1						;|
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	move r6,r11					;\Multiply Y position by XY matrix element...
	from r2						;|
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	with r5						;|
	add r0						;/...and accumulating to previous value
	move r6,r13					;\Multiply Z position by XZ matrix element...
	from r3						;|
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating to previous value...
	stw r9						;|...and storing the result
	inc r9						;|
	inc r9						;/
	move r6,r4					;\Multiply X position by YX matrix element...
	from r1						;|
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	move r6,r7					;\Multiply Y position by YY matrix element...
	from r2						;|
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	with r5						;|
	add r0						;/...and accumulating to previous value
	move r6,r8					;\Multiply Z position by YZ matrix element...
	from r3						;|
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating to previous value...
	stw r9						;|...and storing the result
	inc r9						;|
	inc r9						;/
	alt1						;\Get ZX matrix element in r6
	lms r6,(TransformMatrix.ZX)			;/
	from r1						;\Multiply X position by ZX matrix element...
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get ZY matrix element in r6
	lms r6,(TransformMatrix.ZY)			;/
	from r2						;\Multiply Y position by ZY matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	with r5						;|
	add r0						;/...and accumulating to previous value
	alt1						;\Get ZZ matrix element in r6
	lms r6,(TransformMatrix.ZZ)			;/
	from r3						;\Multiply Z position by ZZ matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating to previous value...
	stw r9						;|...and storing the result
	inc r9						;/
	dec r12						;\Decrement vertex count...
	bne LoadVertices16Bit_Loop			;|...and loop back if not zero
	inc r9						;/(not sure why r13 wasn't used here)
	alt2						;\Save current vertex pointer
	sms (CurVtxPtr),r9				;/
	alt1						;\Restore r10
	lms r10,(UnknownGSU_012)			;/
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
LoadMirroredVertices16Bit:
	to r12						;\Get vertex count in r12 (loop register)
	getb						;|
	inc r14						;/
	alt1						;\Add r12 to total vertex count
	lms r0,(TotalVtxCnt)				;|
	add r12						;|
	add r12						;|
	sbk						;/
	alt1						;\Load r9 with current vertex pointer
	lms r9,(CurVtxPtr)				;/
	cache
	move r13,r15					; Set loop point
LoadMirroredVertices16Bit_Loop:
	to r1						;\Get vertex X coordinate in r1
	getb						;|
	inc r14						;|
	with r1						;|
	alt1						;|
	getbh						;|
	inc r14						;/
	to r2						;\Get vertex Y coordinate in r2
	getb						;|
	inc r14						;|
	with r2						;|
	alt1						;|
	getbh						;|
	inc r14						;/
	to r3						;\Get vertex Z coordinate in r3
	getb						;|
	inc r14						;|
	with r3						;|
	alt1						;|
	getbh						;|
	inc r14						;/
	alt1						;\Get XX matrix element in r6
	lms r6,(TransformMatrix.XX)			;/
	from r1						;\Multiply X position by XX matrix element...
	fmult						;|
	to r8						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get XY matrix element in r6
	lms r6,(TransformMatrix.XY)			;/
	from r2						;\Multiply Y position by XY matrix element...
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get XZ matrix element in r6
	lms r6,(TransformMatrix.XZ)			;/
	from r3						;\Multiply Z position by XZ matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating the previous two values...
	add r8						;|
	stw r9						;/...and storing the result
	sub r8						;\Flip along local X axis...
	sub r8						;|
	with r9						;|
	alt2						;|
	add #$06					;|
	stw r9						;|...and store the mirrored vertex
	with r9						;|
	alt2						;|
	sub #$04					;/
	alt1						;\Get YX matrix element in r6
	lms r6,(TransformMatrix.YX)			;/
	from r1						;\Multiply X position by YX matrix element...
	fmult						;|
	to r8						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get YY matrix element in r6
	lms r6,(TransformMatrix.YY)			;/
	from r2						;\Multiply Y position by YY matrix element...
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get YZ matrix element in r6
	lms r6,(TransformMatrix.YZ)			;/
	from r3						;\Multiply Z position by YZ matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating the previous two values...
	add r8						;|
	stw r9						;/...and storing the result
	sub r8						;\Flip along local X axis...
	sub r8						;|
	with r9						;|
	alt2						;|
	add #$06					;|
	stw r9						;|...and store the mirrored vertex
	with r9						;|
	alt2						;|
	sub #$04					;/
	alt1						;\Get ZX matrix element in r6
	lms r6,(TransformMatrix.ZX)			;/
	from r1						;\Multiply X position by ZX matrix element...
	fmult						;|
	to r8						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get ZY matrix element in r6
	lms r6,(TransformMatrix.ZY)			;/
	from r2						;\Multiply Y position by ZY matrix element...
	fmult						;|
	to r5						;|
	rol						;/...shifting in bit 15 of the product for extra precision
	alt1						;\Get ZZ matrix element in r6
	lms r6,(TransformMatrix.ZZ)			;/
	from r3						;\Multiply Z position by ZZ matrix element...
	fmult						;|
	rol						;|...shifting in bit 15 of the product for extra precision...
	add r5						;|...accumulating the previous two values...
	add r8						;|
	stw r9						;/...and storing the result
	sub r8						;\Flip along local X axis...
	sub r8						;|
	with r9						;|
	alt2						;|
	add #$06					;|
	stw r9						;|...and store the mirrored vertex
	with r9						;|
	alt2						;|
	sub #$04					;/
	with r9						;\Move vertex pointer for next mirrored vertex pair
	alt2						;|
	add #$06					;/
	loop						;\Loop back until all vertices have been processed
	nop						;/
	alt2						;\Save current vertex pointer
	sms (TotalVtxCnt),r9				;/
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
LoadVertices8Bit_M1:
	to r12						;\Get vertex count in r12 (loop register)
	getb						;|
	inc r14						;/
	alt1						;\Add r12 to total vertex count
	lms r0,(TotalVtxCnt)				;|
	add r12						;|
	sbk						;/
	alt1						;\Load r9 with current vertex pointer
	lms r9,(CurVtxPtr)				;/
	alt1
	lms r8,(UnknownGSU_030)
	cache
	move r13,r15					; Set loop point
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
	lms r6,(TransformMatrix.XX)
	from r1
	alt1
	lmult
	move r7,r4
	alt1
	lms r6,(TransformMatrix.XY)
	from r2
	to r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r5
	alt1
	lms r6,(TransformMatrix.XZ)
	from r3
	to r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r5
	with r7
	add r7
	rol
	stw r9
	inc r9
	inc r9
	alt1
	lms r6,(TransformMatrix.YX)
	from r1
	alt1
	lmult
	move r7,r4
	alt1
	lms r6,(TransformMatrix.YY)
	from r2
	to r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r5
	alt1
	lms r6,(TransformMatrix.YZ)
	from r3
	to r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r5
	with r7
	add r7
	rol
	stw r9
	inc r9
	inc r9
	alt1
	lms r6,(TransformMatrix.ZX)
	from r1
	alt1
	lmult
	move r7,r4
	alt1
	lms r6,(TransformMatrix.ZY)
	from r2
	to r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r5
	alt1
	lms r6,(TransformMatrix.ZZ)
	from r3
	to r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r5
	with r7
	add r7
	rol
	stw r9
	inc r9
	loop
	inc r9
	alt2
	sms (CurVtxPtr),r9
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
LoadMirroredVertices8Bit_M1:
	to r12						;\Get vertex count in r12 (loop register)
	getb						;|
	inc r14						;/
	alt1						;\Add r12 to total vertex count
	lms r0,(TotalVtxCnt)				;|
	add r12						;|
	add r12						;|
	sbk						;/
	alt1						;\Load r9 with current vertex pointer
	lms r9,(CurVtxPtr)				;/
	cache
	move r13,r15					; Set loop point
	alt1
	lms r8,(UnknownGSU_030)
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
	lms r6,(TransformMatrix.XX)
	from r1
	fmult
	to r8
	rol
	alt1
	lms r6,(TransformMatrix.XY)
	from r2
	fmult
	to r5
	rol
	alt1
	lms r6,(TransformMatrix.XZ)
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
	alt1
	lms r6,(TransformMatrix.YX)
	from r1
	fmult
	to r8
	rol
	alt1
	lms r6,(TransformMatrix.YY)
	from r2
	fmult
	to r5
	rol
	alt1
	lms r6,(TransformMatrix.YZ)
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
	alt1
	lms r6,(TransformMatrix.ZX)
	from r1
	fmult
	to r8
	rol
	alt1
	lms r6,(TransformMatrix.ZY)
	from r2
	fmult
	to r5
	rol
	alt1
	lms r6,(TransformMatrix.ZZ)
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
	loop
	nop
	alt2
	sms (CurVtxPtr),r9
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
LoadVertices8Bit:
	alt1
	lms r0,(UnknownGSU_032)
	alt2
	sub #$03
	bmi LoadVertices8Bit_L1
	nop
	iwt r15,#LoadVertices8Bit_M1
	nop
LoadVertices8Bit_L1:
	nop
	alt1
	lms r11,(CurVtxPtr)
	alt1
	lms r5,(UnknownGSU_116)
	alt1
	lms r6,(UnknownGSU_118)
	alt1
	lms r7,(UnknownGSU_11A)
	alt1
	lms r8,(UnknownGSU_11C)
	alt1
	lms r9,(UnknownGSU_11E)
	alt1
	lms r1,(UnknownGSU_030)
	from r9
	lob
	swap
	to r9
	or r1
	to r12						;\Get vertex count in r12 (loop register)
	getb						;|
	inc r14						;/
	alt1
	lms r0,(TotalVtxCnt)
	add r12
	sbk
	cache
	move r13,r15					; Set loop point
	to r1						;\Get vertex X position in r1
	getb						;|
	inc r14						;/
	from r5
	to r4
	mult r1
	to r2						;\Get vertex Y position in r2
	getb						;|
	inc r14						;/
	from r6
	hib
	mult r2
	to r4
	add r4
	to r3						;\Get vertex Y position in r2
	getb						;|
	inc r14						;/
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
	alt2						;\Save current vertex pointer
	sms (CurVtxPtr),r9				;/
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
LoadMirroredVertices8Bit:
	alt1
	lms r0,(UnknownGSU_032)
	alt2
	sub #$03
	bmi LoadMirroredVertices8Bit_L1
	nop
	iwt r15,#LoadMirroredVertices8Bit_M1
	nop
LoadMirroredVertices8Bit_L1:
	nop
	alt1
	lms r11,(CurVtxPtr)
	alt1
	lms r5,($0116)
	alt1
	lms r6,($0118)
	alt1
	lms r7,($011A)
	alt1
	lms r8,($011C)
	alt1
	lms r9,($011E)
	alt1
	lms r1,(UnknownGSU_030)
	from r9
	lob
	swap
	to r9
	or r1
	to r12						;\Get vertex count in r12 (loop register)
	getb						;|
	inc r14						;/
	alt1
	lms r0,(TotalVtxCnt)
	add r12
	add r12
	sbk
	cache
LoadMirroredVertices8Bit_L2:
	to r1
	getb
	inc r14
	from r5
	to r13
	mult r1
	to r2
	getb
	inc r14
	from r6
	hib
	to r4
	mult r2
	to r3
	getb
	inc r14
	from r8
	mult r3
	to r4
	add r4
	from r4
	add r13
	add r0
	hib
	mult r9
	stw r11
	with r11
	alt2
	add #$06
	from r4
	sub r13
	add r0
	hib
	mult r9
	stw r11
	with r11
	alt2
	sub #$04
	from r5
	hib
	to r13
	mult r1
	from r7
	to r4
	mult r2
	from r8
	hib
	mult r3
	to r4
	add r4
	from r4
	add r0
	hib
	mult r9
	stw r11
	with r11
	alt2
	add #$06
	from r4
	sub r13
	add r0
	hib
	mult r9
	stw r11
	with r11
	alt2
	add #$06
	from r4
	sub r13
	add r0
	hib
	mult r9
	stw r11
	inc r11
	inc r11
	dec r12
	bne LoadMirroredVertices8Bit_L2
	nop
	alt2
	sms (CurVtxPtr),r11
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
EndVertexList:
	alt1
	lms r3,(OutputVecX)
	alt1
	lms r11,(OutputVecY)
	alt1
	lms r8,(OutputVecZ)
	ibt r0,#$14
	alt3
	romb
	sub r0
	alt2
	sms (UnknownGSU_138),r0
	iwt r7,#$05C2
	iwt r8,#$07A2
	alt2
	sms (UnknownGSU_01A),r14
	alt1
	lms r12,(TotalVtxCnt)
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
	bpl CODE_018A86
	nop
	iwt r6,#$2FFF
CODE_018A86:
	iwt r0,#$0100
	sub r6
	bmi CODE_018A91
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
	lms r1,(UnknownGSU_034)
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
	lms r2,(UnknownGSU_036)
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
	bmi CODE_018AC8
	nop
	alt1
	lms r5,(UnknownGSU_03A)
	sub r5
	bmi CODE_018AC9
	nop
	inc r4
CODE_018AC8:
	inc r4
CODE_018AC9:
	with r4
	alt2
	mult #$04
	with r0
	from r2
	bmi CODE_018AD9
	nop
	alt1
	lms r5,(UnknownGSU_03E)
	sub r5
	bmi CODE_018ADA
	nop
	inc r4
CODE_018AD9:
	inc r4
CODE_018ADA:
	ibt r0,#$1F
	alt1
	xor r4
	swap
	or r4
	stw r8
	inc r8
	inc r8
	alt1
	lms r6,(UnknownGSU_138)
	or r6
	loop
	sbk
	alt1
	lms r14,($001A)
	iwt r15,#CODE_018B57
	nop
CODE_018AF5:
	with r0
	from r6
	bpl CODE_018B05
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
CODE_018B05:
	from r6
	add r6
	add r0
	add r0
	to r6
	add r0
	moves r1,r1
	bmi CODE_018B1E
	nop
	iwt r0,#$0400
	alt3
	cmp r1
	bpl CODE_018B29
	nop
	iwt r1,#$0400
	bra CODE_018B29
	nop
CODE_018B1E:
	iwt r0,#$FC00
	alt3
	cmp r1
	bmi CODE_018B29
	nop
	iwt r1,#$FC00
CODE_018B29:
	moves r2,r2
	bmi CODE_018B3C
	nop
	iwt r0,#$0400
	alt3
	cmp r2
	bpl CODE_018B47
	nop
	iwt r2,#$0400
	bra CODE_018B47
	nop
CODE_018B3C:
	iwt r0,#$FC00
	alt3
	cmp r2
	bmi CODE_018B47
	nop
	iwt r2,#$FC00
CODE_018B47:
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
	lms r0,(UnknownGSU_138)
	iwt r1,#$1F00
	and r1
	alt3
	cmp r1
	beq CODE_018B67
	nop
	iwt r15,#$8ECB
	nop
CODE_018B67:
	alt1
	lms r1,(UnknownGSU_138)
	ibt r0,#$1F
	and r1
	bne CODE_018B78
	nop
	alt1
	lms r0,($0054)
	iwt r1,#$4000
	or r1
	sbk
CODE_018B78:
	alt1
	lms r14,($0018)
	alt2
	sms ($001A),r14
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
StartBSPTree:
	iwt r1,#BSPTreeStack				;\Initialize BSP tree stack pointer
	alt2						;|
	sms (BSPTreePtr),r1				;/
	iwt r0,#CODE_018C08				;\Set return value and push to stack
	stw r10						;|
	inc r10						;|
	inc r10						;/
	cache
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
BSPLeaf:
	getb						;\Offset ROM pointer to point to this leaf's face group
	inc r14						;|
	alt1						;|
	getbh						;|
	add r14						;/
	alt1
	lms r1,(BSPTreePtr)
	stw r1
	inc r1
	inc r1
	alt2
	sms (BSPTreePtr),r1
BSPEmptyLeaf:
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
BSPLeafNode:
	getb
	inc r14
	iwt r1,#$0E72
	add r1
	alt1
	ldb r0
	swap
	moves r0,r0
	bmi CODE_018BD0
	nop
	inc r14
	inc r14
	from r14
	stw r10
	inc r10
	inc r10
	getb
	lob
	beq CODE_018BC8
	nop
	to r14
	add r14
	from r15
	alt2
	add #$05
	stw r10
	inc r10
	inc r10
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
CODE_018BC8:
	dec r10
	dec r10
	to r14
	ldw r10
	inc r14
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
CODE_018BD0:
	getb
	inc r14
	alt1
	getbh
	to r12
	add r14
	inc r14
	from r14
	stw r10
	inc r10
	inc r10
	inc r14
	from r12
	stw r10
	inc r10
	inc r10
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
	dec r10
	dec r10
	ldw r10
	alt1
	lms r1,(BSPTreePtr)
	stw r1
	inc r1
	inc r1
	alt2
	sms (BSPTreePtr),r1
	dec r10
	dec r10
	to r14
	ldw r10
	getb
	lob
	beq CODE_018C03
	nop
	to r14
	add r14
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
CODE_018C03:
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_018C08:
	sub r0
	alt1
	lms r1,(BSPTreePtr)
	stw r1
	iwt r0,#BSPTreeStack
	alt2
	sms (BSPTreePtr),r0
CODE_018C13:
	alt1
	lms r1,(BSPTreePtr)
	to r14
	ldw r1
	inc r1
	inc r1
	alt2
	sms (BSPTreePtr),r1
	moves r14,r14
	beq CODE_018C2D
	from r15
	alt2
	add #$05
	stw r10
	inc r10
	inc r10
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
	bra CODE_018C13
	nop
CODE_018C2D:
	iwt r15,#FinishModel
	nop
	to r12
	getb
	inc r14
	iwt r0,#$F4BE
	add r12
	add r14
	alt2
	sms ($013E),r0
	alt2
	sms ($013C),r12
	alt2
	sms ($0136),r12
	iwt r9,#$05C6
	iwt r5,#$0B42
	move r13,r15					; Set loop point
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
	lms r12,($0136)
	move r13,r15					; Set loop point
	ldw r5
	alt3
	cmp r7
	blt CODE_018C69
	nop
	move r7,r0
	move r6,r5
	inc r5
	loop
CODE_018C69:
	inc r5
	iwt r0,#$8000
	stw r6
	alt1
	lms r0,($013E)
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
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
	alt1
	lms r0,($013C)
	dec r0
	bne CODE_018C54
	sbk
	iwt r15,#FinishModel
	nop
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
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
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
	sms ($00A8),r0
	ldw r2
	alt2
	sms ($00AA),r0
	iwt r1,#$07A2
	iwt r1,#$05C6
	from r3
	add r1
	ldw r0
	alt1
	lms r1,($002A)
	add r1
	alt2
	sms ($00AC),r0
	iwt r1,#$0020
	sub r1
	bmi CODE_018D02
	nop
	link #4
	iwt r15,#CODE_01904F
	nop
	inc r14
	getb
	inc r14
	alt1
	lms r0,($00C2)
	lob
	inc r0
	alt2
	sms ($00B6),r0
	iwt r1,#$0100
	add r0
	swap
	bpl CODE_018CE8
	nop
	with r1
	lsr
CODE_018CE8:
	alt2
	sms ($00BC),r1
	alt2
	sms ($001A),r14
	sub r0
	alt2
	sms ($00C0),r0
	link #4
	iwt r15,#CODE_A787
	nop
	alt1
	lms r0,($001C)
	alt3
	romb
	alt1
	lms r14,($001A)
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
CODE_018D02:
	inc r14
	inc r14
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
StartFaceGroup_End:
	inc r0						;\If terminating byte is $FF, go back to BSP tree
	lob						;|
	beq StartFaceGroup_EndLeaf			;|
	nop						;/
	to r15						;\Otherwise finish up model processing
	getb						;|(it is implied that the byte after the terminator is a 0 in this case)
	inc r14						;/
StartFaceGroup_EndLeaf:
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
StartFaceGroup:
	ibt r0,#$70					;\Set default color...
	color						;|
	ibt r0,#$02					;|..and default plot mode
	alt1						;|
	cmode						;/
	getb						;\Get vertex count
	lob						;|
	bmi StartFaceGroup_End				;|Branch back if negative
	inc r14						;/
	ibt r1,#$3F					;\r2 now has vertex count with all but 6 LSBs masked out...
	to r2						;|
	and r1						;|
	alt2						;|
	sms ($0134),r2					;/save this value for later
	dec r2						;\If vertex count is 2 (we have a line), branch here
	dec r2						;|
	beq StartFaceGroup_Line				;|
	inc r14						;/
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
	bmi CODE_018D51
	nop
	alt1
	lms r0,($0048)
	moves r0,r0
	beq CODE_018D48
	nop
	iwt r15,#CODE_018F3A
	nop
CODE_018D48:
	alt1
	lms r0,($0134)
	dec r0
	dec r0
	with r14
	bra StartFaceGroup
	add r0
CODE_018D51:
	with r14
	alt2
	sub #$06
StartFaceGroup_Line:
	link #4
	iwt r15,#CODE_01904F
	nop
	with r14
	alt2
	add #$04
	alt1
	lms r0,($0048)
	moves r0,r0
	beq CODE_018D68
	nop
	iwt r15,#CODE_018ECE
	nop
CODE_018D68:
	alt1
	lms r0,($0054)
	iwt r1,#$4000
	and r1
	iwt r15,#CODE_018DD7
	nop
	iwt r9,#$07A2
	iwt r6,#$0982
	alt1
	lms r12,($0134)
	move r13,r15					; Set loop point
	to r4
	getb
	inc r14
	from r4
	alt3
	umult #$06
	to r8
	add r9
	ldw r8
	stw r6
	inc r6
	inc r6
	inc r8
	inc r8
	ldw r8
	stw r8
	inc r6
	inc r6
	alt1
	lms r0,($0042)
	moves r0,r0
	beq CODE_018DCB
	nop
	inc r0
	beq CODE_018DAC
	nop
	iwt r0,#$0E22
	add r4
	alt1
	ldb r0
	stw r6
	inc r6
	inc r6
	stw r6
	inc r6
	inc r6
	iwt r15,#CODE_018DCB
	nop
CODE_018DAC:
	alt2
	sms ($001A),r14
	ibt r0,#$03
	alt3
	romb
	alt1
	lms r14,($0082)
	getb
	inc r14
	stw r6
	inc r6
	inc r6
	getb
	inc r14
	stw r6
	inc r6
	inc r6
	alt2
	sms ($0082),r14
	alt1
	lms r0,($001C)
	alt3
	romb
	alt1
	lms r14,($001A)
CODE_018DCB:
	loop
	nop
	alt2
	sms ($001A),r14
	alt1
	lms r0,($0134)
	iwt r15,#CODE_018EA1
	nop
	iwt r9,#$07A2
	iwt r6,#$0982
	ibt r5,#$00
	alt1
	lms r12,($0134)
	move r13,r15					; Set loop point
	to r4
	getb
	inc r14
	from r4
	alt3
	umult #$06
	to r8
	to r8
	add r9
	ldw r8
	stw r6
	inc r6
	inc r6
	inc r8
	inc r8
	ldw r8
	stw r6
	inc r6
	inc r6
	inc r8
	inc r8
	ldw r8
	to r5
	or r5
	alt1
	lms r0,($0042)
	moves r0,r0
	beq CODE_018E36
	nop
	inc r0
	beq CODE_018E17
	nop
	iwt r0,#$0E22
	add r4
	alt1
	ldb r0
	stw r6
	inc r6
	inc r6
	stw r6
	inc r6
	inc r6
	iwt r15,#CODE_018E36
	nop
CODE_018E17:
	alt2
	sms ($001A),r14
	ibt r0,#$03
	alt3
	romb
	alt1
	lms r14,($0082)
	getb
	inc r14
	stw r6
	inc r6
	inc r6
	getb
	inc r14
	stw r6
	inc r6
	inc r6
	alt2
	sms ($0082),r14
	alt1
	lms r0,($001C)
	alt3
	romb
	alt1
	lms r14,($001A)
CODE_018E36:
	loop
	nop
CODE_018E38:
	alt2
	sms ($001A),r14
	from r5
	lob
	bne CODE_018E47
	nop
	alt1
	lms r0,($0134)
	iwt r15,#CODE_018EA1
	nop
CODE_018E47:
	ibt r0,#$10
	and r5
	beq CODE_018E73
	nop
	iwt r1,#$1000
	from r1
	and r5
	sub r1
	bne CODE_018EB8
	nop
	alt1
	lms r0,($0042)
	hib
	beq CODE_018E61
	nop
	iwt r15,#CODE_018EB8
	nop
CODE_018E61:
	alt1
	lms r0,($0134)
	with r14
	sub r0
	link #4
	iwt r15,#CODE_019728
	nop
	moves r0,r0
	beq CODE_018EB5
	nop
	bra CODE_018E86
	nop
CODE_018E73:
	iwt r1,#$0F00
	from r1
	and r5
	sub r1
	bne CODE_018EB8
	nop
	alt1
	lms r0,($0042)
	hib
	bne CODE_018E94
	nop
	alt1
	lms r0,($0134)
CODE_018E86:
	link #4
	iwt r15,#CODE_01A010
	nop
	moves r0,r0
	beq CODE_018EB5
	nop
	iwt r15,#CODE_018EA1
	nop
CODE_018E94:
	alt1
	lms r0,($0134)
	link #4
	iwt r15,#CODE_01988B
	nop
	moves r0,r0
	beq CODE_018EB5
	nop
CODE_018EA1:
	alt2
	sms ($008E),r10
	ibt r1,#$00
	from r1
	alt3
	romb
	iwt r15,#CODE_01A66B
	nop
CODE_018EAD:
	alt1
	lms r0,($001C)
	alt3
	romb
	alt1
	lms r10,($008E)
CODE_018EB5:
	alt1
	lms r14,($001A)
CODE_018EB8:
	iwt r15,#StartFaceGroup
	nop
CODE_018EBC:
	ibt r1,#$00
	ibt r2,#$00
	alt1
	rpix
	nop
	nop
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_018EC9:
	stop
	nop
	bra CODE_018EBC
	nop
	link #4
	iwt r15,#CODE_018FBD
	nop
CODE_018ED3:
	getb
	inc r14
	alt3
	umult #$06
	iwt r6,#$05C2
	to r7
	add r6
	ldw r7
	inc r7
	inc r7
	alt1
	lms r6,($0062)
	to r1
	add r6
	ldw r7
	inc r7
	inc r7
	alt1
	lms r6,($002C)
	to r2
	add r6
	ldw r7
	inc r7
	inc r7
	alt1
	lms r6,($002E)
	to r3
	add r6
	link #4
	iwt r15,#CvtPoint3DTo2D
	nop
	from r1
	stw r8
	inc r8
	inc r8
	from r2
	stw r8
	inc r8
	inc r8
	alt1
	lms r3,($0138)
	or r3
	sbk
	alt1
	lms r0,($0042)
	hib
	beq CODE_018F2C
	nop
	ibt r0,#$03
	alt3
	romb
	alt2
	sms ($001A),r14
	alt1
	lms r14,($0082)
	getb
	inc r14
	stw r8
	inc r8
	inc r8
	getb
	inc r14
	stw r8
	inc r8
	inc r8
	alt2
	sms ($0082),r14
	alt1
	lms r0,($001C)
	alt3
	romb
	alt1
	lms r14,($001A)
	alt1
	lms r0,($0040)
	dec r0
	bne CODE_018ED3
	sbk
	alt1
	lms r5,($0138)
	iwt r15,#CODE_018E38
	nop
CODE_018F3A:
	with r14
	alt2
	sub #$06
	link #4
	iwt r15,#CODE_01904F
	nop
	with r14
	alt2
	add #$04
	link #4
	iwt r15,#CODE_018FBD
	nop
	alt1
	lms r0,($0134)
	with r14
	add r0
	dec r14
CODE_018F50:
	getb
	dec r14
	alt3
	umult #$06
	iwt r6,#$05C2
	to r7
	add r7
	ldw r7
	inc r7
	inc r7
	alt1
	lms r6,($0062)
	to r1
	add r6
	ldw r7
	inc r7
	inc r7
	alt1
	lms r6,($002C)
	to r2
	add r6
	ldw r7
	inc r7
	inc r7
	alt1
	lms r6,($002E)
	to r3
	add r6
	link #4
	iwt r15,#CvtPoint3DTo2D
	nop
	from r1
	stw r8
	inc r8
	inc r8
	from r2
	stw r8
	inc r8
	inc r8
	alt1
	lms r3,($0138)
	or r3
	sbk
	alt1
	lms r0,($0042)
	hib
	beq CODE_018FA9
	nop
	ibt r0,#$03
	alt3
	romb
	alt2
	sms ($001A),r14
	alt1
	lms r14,($0082)
	getb
	inc r14
	stw r8
	inc r8
	inc r8
	getb
	inc r14
	stw r8
	inc r8
	inc r8
	alt2
	sms ($0082),r14
	alt1
	lms r0,($001C)
	alt3
	romb
	alt1
	lms r14,($001A)
	alt1
	lms r0,($0040)
	dec r0
	bne CODE_018F50
	sbk
	alt1
	lms r0,($0134)
	with r14
	add r0
	inc r14
	alt1
	lms r5,($0138)
	iwt r15,#CODE_018E38
	nop
	sub r0
	alt2
	sms ($0042),r0
	with r14
	alt2
	sub #$03
	alt1
	lms r9,($0048)
	to r1
	alt3
	getbs
	inc r14
	to r2
	alt3
	getbs
	inc r14
	to r3
	alt3
	getbs
	inc r14
	with r1
	not
	inc r1
	with r3
	not
	inc r3
	alt1
	lms r6,($0120)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($0126)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($012C)
	from r3
	fmult
	rol
	add r5
	mult r9
	asr
	asr
	alt1
	lms r6,($0026)
	add r6
	alt2
	sms ($0062),r0
	alt1
	lms r6,($0122)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($0128)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($012E)
	from r3
	fmult
	rol
	add r5
	with r0
	from r0
	bmi CODE_019016
	nop
	not
	inc r0
CODE_019016:
	mult r9
	asr
	asr
	alt1
	lms r6,($0028)
	add r6
	alt2
	sms ($002C),r0
	alt1
	lms r6,($0124)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($012A)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($0130)
	from r3
	fmult
	rol
	add r5
	mult r9
	asr
	asr
	alt1
	lms r6,($002A)
	add r6
	alt2
	sms ($002E),r0
	sub r0
	alt2
	sms ($0138),r0
	iwt r8,#$0982
	alt1
	lms r0,($0134)
	alt2
	sms ($0040),r0
	jmp r11						;\Return from link
	nop						;/
CODE_01904F:
	move r2,r14
	alt1
	lms r0,($0054)
	iwt r1,#$2000
	to r1
	and r1
	beq CODE_019075
	nop
	iwt r1,#$1000
	and r1
	bne CODE_019075
	nop
	ibt r0,#$02
	alt1
	cmode
	ibt r0,#$09
	color
	sub r0
	alt2
	sms ($0058),r0
	alt2
	sms ($0042),r0
	iwt r15,#CODE_019191
	nop
CODE_019075:
	getb
	add r0
	ibt r1,#$03
	from r1
	alt3
	romb
	alt1
	lms r1,($004A)
	to r14
	add r1
CODE_019081:
	to r3
	getb
	inc r14
	with r3
	alt1
	getbh
	moves r3,r3
	bpl CODE_0190BC
	nop
	from r3
	add r3
	bpl CODE_0190AA
	nop
	iwt r0,#$FFFE
	alt2
	sms ($0042),r0
	from r3
	hib
	alt2
	and #$0F
	add r0
	add r0
	add r0
	add r0
	swap
	alt2
	or #$08
	swap
	alt2
	sms ($0058),r0
	iwt r15,#CODE_019191
	nop
CODE_0190AA:
	iwt r0,#$3FFF
	to r14
	and r3
	alt1
	lms r0,($0046)
	to r3
	getb
	dec r3
	and r3
	add r0
	inc r0
	to r14
	bra CODE_019081
	add r14
CODE_0190BC:
	sub r0
	alt2
	sms ($0058),r0
	from r3
	add r3
	bpl CODE_0190C6
	sub r0
	dec r0
CODE_0190C6:
	alt2
	sms ($0042),r0
	beq CODE_019111
	nop
	from r3
	lob
	bpl CODE_0190D7
	nop
	iwt r0,#$0400
	alt2
	sms ($0058),r0
CODE_0190D7:
	from r3
	add r3
	lob
	lsr
	alt3
	umult #$03
	iwt r1,#CODE_8918
	to r14
	add r1
	getb
	inc r14
	alt1
	getbh
	inc r14
	alt2
	sms ($0096),r0
	getb
	alt2
	sms ($0098),r0
	from r3
	hib
	ibt r1,#$3F
	and r1
	add r0
	iwt r1,#$8A3E
	to r14
	add r1
	getb
	inc r14
	alt1
	getbh
	move r14,r0
	to r1
	getb
	inc r14
	with r1
	alt1
	getbh
	alt2
	sms ($00C2),r1
	inc r0
	inc r0
	alt2
	sms ($0082),r0
	iwt r15,#CODE_019191
	nop
CODE_019111:
	from r3
	hib
	inc r0
	and r1
	bne CODE_01911E
	nop
	iwt r15,#CODE_01918E
	nop
CODE_01911E:
	inc r0
	and r1
	beq CODE_019127
	nop
	iwt r15,#CODE_019133
	nop
CODE_019127:
	from r3
	lob
	alt1
	lms r3,($0052)
	to r14
	add r3
	getc
	iwt r5,#CODE_019191
	nop
CODE_019133:
	dec r0
	dec r0
	and r1
	move r3,r0
	alt1
	lms r0,($0054)
	hib
	bpl CODE_01918E
	nop
	alt1
	lms r0,($004C)
	add r3
	to r14
	add r3
	to r6
	getb
	inc r14
	with r6
	alt1
	getbh
	alt1
	lms r0,($001C)
	alt3
	romb
	move r14,r2
	inc r14
	getb
	inc r14
	alt1
	lms r4,($00F4)
	to r5
	mult r4
	getb
	inc r14
	alt1
	lms r4,($00F6)
	mult r4
	to r5
	add r5
	getb
	alt1
	lms r4,($00F8)
	mult r4
	add r5
	asr
	asr
	hib
	sex
	ibt r4,#$06
	alt3
	cmp r4
	bge CODE_019178
	nop
	ibt r0,#$06
	bra CODE_019181
	nop
CODE_019178:
	ibt r4,#$10
	alt3
	cmp r4
	blt CODE_019181
	nop
	ibt r0,#$0F
CODE_019181:
	to r1
	alt2
	sub #$06
	ibt r0,#$03
	alt3
	romb
	from r6
	to r14
	add r1
	bra CODE_019191
	getc
CODE_01918E:
	from r3
	lob
	color
CODE_019191:
	alt1
	lms r0,($001C)
	alt3
	romb
	with r2
	to r14
	jmp r11						;\Return from link
	nop						;/
StartTriangleList:
	alt1
	lms r0,($0054)
	iwt r1,#$4000
	and r1
	beq CODE_0191A8
	nop
	iwt r15,#CODE_01920B
	nop
CODE_0191A8:
	to r12
	getb
	inc r14
	iwt r9,#$07A2
	iwt r11,#$0E72
	cache
	move r13,r15					; Set loop point
	getb
	inc r14
	alt2
	mult #$06
	add r9
	to r1
	ldw r0
	inc r0
	inc r0
	to r2
	ldw r0
	inc r0
	inc r0
	to r5
	ldw r0
	getb
	inc r14
	alt2
	mult #$06
	to r8
	add r9
	ldw r8
	inc r8
	inc r8
	to r3
	sub r1
	ldw r8
	inc r8
	inc r8
	to r7
	sub r2
	ldw r8
	to r5
	alt1
	xor r5
	getb
	inc r14
	alt2
	mult #$06
	to r8
	add r9
	ldw r8
	inc r8
	inc r8
	to r3
	sub r1
	ldw r8
	inc r8
	inc r8
	to r2
	sub r2
	ldw r8
	to r5
	alt1
	xor r5
	move r6,r1
	with r7
	alt1
	lmult
	move r1,r4
	move r6,r3
	with r2
	alt1
	lmult
	with r4
	sub r1
	with r2
	alt1
	sbc r7
	from r5
	add r5
	add r0
	add r0
	swap
	alt1
	xor r2
	hib
	alt1
	stb r11
	loop
	inc r11
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
CODE_01920B:
	to r12
	getb
	inc r14
	iwt r9,#$07A2
	iwt r11,#$0E72
	cache
	move r13,r15					; Set loop point
	getb
	inc r14
	alt3
	umult #$06
	add r9
	to r1
	alt1
	ldb r0
	inc r0
	inc r0
	to r2
	alt1
	ldb r0
	getb
	inc r14
	alt3
	umult #$06
	to r8
	add r9
	alt1
	ldb r8
	inc r8
	inc r8
	sub r1
	to r3
	asr
	alt1
	ldb r8
	sub r2
	to r7
	asr
	getb
	inc r14
	alt3
	umult #$06
	to r8
	add r9
	alt1
	ldb r8
	inc r8
	inc r8
	sub r1
	to r1
	asr
	alt1
	ldb r8
	sub r2
	to r2
	asr
	from r1
	to r1
	mult r7
	from r3
	mult r2
	sub r1
	hib
	alt1
	stb r11
	loop
	inc r11
	to r15						;\Get next command byte and jump
	getb						;|
	inc r14						;/
	dec r14
	getb
	with r14
	alt2
	add #$07
	iwt r1,#$0E72
	add r1
	alt1
	ldb r0
	jmp r11						;\Return from link
	nop						;/
CvtPoint3DTo2D:
	from r11
	stw r10
	inc r10
	inc r10
	moves r3,r3
	bpl CODE_019270
	nop
	iwt r15,#CODE_019333
	nop
CODE_019270:
	nop
	bne CODE_019275
	nop
	inc r3
CODE_019275:
	ibt r5,#$00
	moves r1,r1
	bmi CODE_0192D0
	nop
	moves r2,r2
	bmi CODE_0192A4
	nop
	from r1
	sub r2
	bcc CODE_01928F
	nop
	link #4
	iwt r15,#CODE_01942F
	nop
	iwt r15,#CODE_0193F0
	nop
CODE_01928F:
	move r0,r1
	move r1,r2
	move r2,r0
	link #4
	iwt r15,#CODE_01942F
	nop
	move r0,r1
	move r1,r2
	move r2,r0
	iwt r15,#CODE_0193F0
	nop
CODE_0192A4:
	with r2
	not
	inc r2
	from r1
	sub r2
	bcc CODE_0192B8
	nop
	link #4
	iwt r15,#CODE_01942F
	nop
	with r2
	not
	inc r2
	iwt r15,#CODE_0193F0
	nop
CODE_0192B8:
	move r0,r1
	move r1,r2
	move r2,r0
	link #4
	iwt r15,#CODE_01942F
	nop
	move r0,r1
	move r1,r2
	move r2,r0
	with r2
	not
	inc r2
	iwt r15,#CODE_0193F0
	nop
CODE_0192D0:
	with r1
	not
	inc r1
	moves r2,r2
	bmi CODE_019301
	nop
	from r1
	sub r2
	bcc CODE_0192E9
	nop
	link #4
	iwt r15,#CODE_01942F
	nop
	with r1
	not
	inc r1
	iwt r15,#CODE_0193F0
	nop
CODE_0192E9:
	move r0,r1
	move r1,r2
	move r2,r0
	link #4
	iwt r15,#CODE_01942F
	nop
	move r0,r1
	move r1,r2
	move r2,r0
	with r1
	not
	inc r1
	iwt r15,#CODE_0193F0
	nop
	with r2
	not
	inc r2
	from r1
	sub r2
	bcc CODE_019318
	nop
	link #4
	iwt r15,#CODE_01942F
	nop
CODE_019301:
	with r2
	not
	inc r2
	with r1
	not
	inc r1
	iwt r15,#CODE_0193F0
	nop
CODE_019318:
	move r0,r1
	move r1,r2
	move r2,r0
	link #4
	iwt r15,#CODE_01942F
	nop
	move r0,r1
	move r1,r2
	move r2,r0
	with r2
	not
	inc r2
	with r1
	not
	inc r1
	iwt r15,#CODE_0193F0
	nop
	with r3
	not
	inc r3
	ibt r5,#$04
	moves r1,r1
	bmi CODE_01939D
	nop
	moves r2,r2
	bmi CODE_019371
	nop
	from r1
	sub r2
	bcc CODE_019356
	nop
	link #4
	iwt r15,#CODE_01942F
	nop
	with r1
	not
	inc r1
	with r2
	not
	inc r2
	iwt r15,#CODE_0193F0
	nop
CODE_019356:
	move r0,r1
	move r1,r2
	move r2,r0
	with r1
	not
	inc r1
	with r2
	not
	inc r2
	iwt r15,#CODE_0193F0
	nop
CODE_019371:
	with r2
	not
	inc r2
	from r1
	sub r2
	bcc CODE_019385
	nop
	link #4
	iwt r15,#CODE_01942F
	nop
	with r1
	not
	inc r1
	iwt r15,#CODE_0193F0
	nop
CODE_019385:
	move r0,r1
	move r1,r2
	move r2,r0
	link #4
	iwt r15,#CODE_01942F
	nop
	move r0,r1
	move r1,r2
	move r2,r0
	with r1
	not
	inc r1
	iwt r15,#CODE_0193F0
	nop
CODE_01939D:
	with r1
	not
	inc r1
	moves r2,r2
	bmi CODE_0193CE
	nop
	from r1
	sub r2
	bcc CODE_0193B6
	nop
	link #4
	iwt r15,#CODE_01942F
	nop
	with r2
	not
	inc r2
	iwt r15,#CODE_0193F0
	nop
CODE_0193B6:
	move r0,r1
	move r1,r2
	move r2,r0
	link #4
	iwt r15,#CODE_01942F
	nop
	move r0,r1
	move r1,r2
	move r2,r0
	with r2
	not
	inc r2
	iwt r15,#CODE_0193F0
	nop
CODE_0193CE:
	with r2
	not
	inc r2
	from r1
	sub r2
	bcc CODE_0193DF
	nop
	link #4
	iwt r15,#CODE_01942F
	nop
	iwt r15,#CODE_0193F0
	nop
CODE_0193DF:
	move r0,r1
	move r1,r2
	move r2,r0
	link #4
	iwt r15,#CODE_0142F
	nop
	move r0,r1
	move r1,r2
	move r2,r0
CODE_0193F0:
	cache
	alt1
	lms r0,($0034)
	with r1
	add r0
	alt1
	lms r0,($0036)
	with r2
	add r0
	alt1
	lms r0,($0038)
	sub r1
	bge CODE_01940A
	nop
	alt1
	lms r0,($003A)
	sub r1
	bge CODE_01940B
	nop
	inc r5
CODE_01940A:
	inc r5
CODE_01940B:
	with r5
	alt2
	mult #$04
	alt1
	lms r0,($003C)
	sub r2
	bge CODE_01941D
	nop
	alt1
	lms r0,($003E)
	sub r2
	bge CODE_01941E
	inc r5
CODE_01941D:
	inc r5
CODE_01941E:
	ibt r0,#$1F
	alt1
	xor r5
	swap
	or r5
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
	move r0,r1
	move r1,r2
	move r2,r0
CODE_01942F:
	from r11
	stw r10
	inc r10
	inc r10
	from r1
	lob
	to r4
	swap
	from r1
	hib
	alt3
	cmp r3
	bcs CODE_019473
	nop
	move r6,r3
	link #4
	iwt r15,#CODE_019493
	nop
	iwt r0,#$3FFF
	sub r4
	bcc CODE_019462
	nop
	move r4,r1
	from r2
	lob
	to r4
	swap
	from r2
	hib
	move r6,r3
	link #4
	iwt r15,#CODE_019493
	nop
	with r4
	to r2
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_019462:
	move r1,r4
	from r2
	lob
	to r4
	swap
	from r2
	hib
	move r6,r3
	link #4
	iwt r15,#CODE_019493
	nop
	move r2,r4
CODE_019473:
	ibt r4,#$00
	from r2
	lsr
	with r4
	ror
	lsr
	with r4
	ror
	with r4
	sub r2
	ibt r6,#$00
	alt1
	sbc r6
	move r6,r1
	link #4
	iwt r15,#CODE_019493
	nop
	move r2,r4
	iwt r1,#$3FFF
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_019493:
	moves r0,r0
	bmi CODE_01949D
	nop
	moves r6,r6
	bpl CODE_0194A2
CODE_01949D:
	with r6
	lsr
	lsr
	with r4
	ror
CODE_0194A2:
	ibt r12,#$10
	with r4
	add r4
	rol
	move r13,r15					; Set loop point
	sub r6
	bcc CODE_0194B3
	nop
	with r4
	rol
	loop
	rol
	jmp r11						;\Return from link
	nop						;/
CODE_0194B3:
	add r6
	with r4
	add r4
	loop
	rol
	jmp r11						;\Return from link
	nop						;/
CODE_0194BA:
	from r11
	stw r10
	inc r10
	inc r10
	alt2
	sms ($0040),r0
	sub r0
	alt2
	sms ($0138),r0
CODE_0194C5:
	ldw r7
	inc r7
	inc r7
	alt1
	lms r9,($0026)
	to r1
	add r9
	ldw r7
	inc r7
	inc r7
	alt1
	lms r9,($0028)
	to r2
	add r9
	ldw r7
	inc r7
	inc r7
	alt1
	lms r9,($002A)
	to r3
	add r9
	link #4
	iwt r15,#CvtPoint3DTo2D
	nop
	from r1
	stw r8
	inc r8
	inc r8
	from r2
	stw r8
	inc r8
	inc r8
	stw r8
	inc r8
	inc r8
	alt1
	lms r3,($0138)
	or r3
	sbk
	alt1
	lms r0,($0040)
	dec r0
	bne CODE_0194C5
	sbk
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_0194FE:
	inc r9
	inc r9
	to r1
	ldw r9
	inc r9
	inc r9
	to r2
	ldw r9
	inc r9
	inc r9
	to r3
	ldw r9
	from r1
	stw r9
	with r9
	alt2
	sub #$04
	from r3
	stw r9
	with r9
	alt2
	add #$08
	to r1
	ldw r9
	inc r9
	inc r9
	to r3
	ldw r9
	from r2
	stw r9
	inc r9
	inc r9
	to r2
	ldw r9
	from r1
	stw r9
	with r9
	alt2
	sub #$04
	from r2
	stw r9
	with r9
	alt2
	sub #$06
	from r3
	stw r9
	jmp r11						;\Return from link
	nop						;/
CODE_01952E:
	alt1
	lms r1,($0104)
	alt1
	lms r2,($0106)
	alt1
	lms r3,($0108)
	alt1
	lms r6,($00D2)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00D8)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00DE)
	from r3
	fmult
	rol
	add r5
	stw r9
	inc r9
	inc r9
	alt1
	lms r6,($00D4)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00DA)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00E0)
	from r3
	fmult
	rol
	add r5
	stw r9
	inc r9
	inc r9
	alt1
	lms r6,($00D6)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00DC)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00E2)
	from r3
	fmult
	rol
	add r5
	stw r9
	inc r9
	inc r9
	alt1
	lms r1,($010A)
	alt1
	lms r2,($010C)
	alt1
	lms r3,($010E)
	alt1
	lms r6,($00D2)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00D8)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00DE)
	from r3
	fmult
	rol
	add r5
	stw r9
	inc r9
	inc r9
	alt1
	lms r6,($00D4)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00DA)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00E0)
	from r3
	fmult
	rol
	add r5
	stw r9
	inc r9
	inc r9
	alt1
	lms r6,($00D6)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00DC)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00E2)
	from r3
	fmult
	rol
	add r5
	stw r9
	inc r9
	inc r9
	alt1
	lms r1,($0110)
	alt1
	lms r2,($0112)
	alt1
	lms r3,($0114)
	alt1
	lms r6,($00D2)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00D8)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00DE)
	from r3
	fmult
	rol
	add r5
	stw r9
	inc r9
	inc r9
	alt1
	lms r6,($00D4)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00DA)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00E0)
	from r3
	fmult
	rol
	add r5
	stw r9
	inc r9
	inc r9
	alt1
	lms r6,($00D6)
	from r1
	fmult
	to r5
	rol
	alt1
	lms r6,($00DC)
	from r2
	fmult
	rol
	with r5
	add r0
	alt1
	lms r6,($00E2)
	from r3
	fmult
	rol
	add r5
	stw r9
	jmp r11						;\Return from link
	nop						;/
CODE_01962A:
	from r11
	stw r10
	inc r10
	inc r10
	iwt r0,#SineTable8+$40
	to r14
	add r2
	getb
	to r5
	swap
	iwt r0,#SineTable8
	to r14
	add r2
	getb
	to r9
	swap
	move r6,r1
	from r9
	to r8
	alt1
	lmult
	move r7,r4
	move r6,r3
	from r5
	alt1
	lmult
	with r7
	add r4
	alt1
	adc r8
	to r2
	asr
	move r6,r3
	from r9
	to r8
	alt1
	lmult
	move r7,r4
	move r6,r1
	from r5
	alt1
	lmult
	with r7
	sub r4
	alt1
	sbc r8
	to r3
	asr
	move r1,r2
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_01966B:
	cache
	moves r3,r3
	bmi CODE_019679
	nop
	moves r6,r6
	bmi CODE_019682
	sub r0
	jmp r11						;\Return from link
	nop						;/
CODE_019679:
	moves r6,r6
	bpl CODE_0196DE
	nop
	ibt r0,#$FF
	jmp r11						;\Return from link
	nop						;/
CODE_019682:
	alt2
	sms ($0088),r1
	alt2
	sms ($008A),r2
	alt2
	sms ($008C),r3
	move r0,r1
	move r1,r4
	move r4,r0
	move r0,r2
	move r2,r5
	move r5,r0
	move r0,r3
	move r3,r6
	move r6,r0
CODE_01969D:
	from r3
	add r6
	alt1
	div2
	beq CODE_0196C5
	nop
	bmi CODE_0196B6
	nop
	move r6,r0
	from r1
	add r4
	to r4
	alt1
	div2
	from r2
	add r5
	to r5
	alt1
	div2
	bra CODE_01969D
	nop
CODE_0196B6:
	move r3,r0
	from r1
	add r4
	to r1
	alt1
	div2
	from r2
	add r5
	to r2
	alt1
	div2
	bra CODE_01969D
	nop
CODE_0196C5:
	move r6,r0
	from r1
	add r4
	to r4
	alt1
	div2
	from r2
	add r5
	alt1
	div2
	alt1
	lms r1,($0088)
	alt1
	lms r2,($008A)
	alt1
	lms r3,($008C)
	ibt r0,#$01
	jmp r11						;\Return from link
	nop						;/
CODE_0196DE:
	alt2
	sms ($0088),r4
	alt2
	sms ($008A),r5
	alt2
	sms ($008C),r6
CODE_0196E7:
	from r3
	add r6
	alt1
	div2
	beq CODE_01970F
	nop
	bmi CODE_019700
	nop
	move r6,r0
	from r1
	add r4
	to r4
	alt1
	div2
	from r2
	add r5
	to r5
	alt1
	div2
	bra CODE_0196E7
	nop
CODE_019700:
	move r3,r0
	from r1
	add r4
	to r1
	alt1
	div2
	from r2
	add r5
	to r2
	alt1
	div2
	bra CODE_0196E7
	nop
CODE_01970F:
	move r3,r0
	from r1
	add r4
	to r1
	alt1
	div2
	from r2
	add r5
	to r2
	alt1
	div2
	alt1
	lms r4,($0088)
	alt1
	lms r5,($008A)
	alt1
	lms r6,($008C)
	ibt r0,#$01
	jmp r11						;\Return from link
	nop						;/
CODE_019728:
	from r11
	stw r10
	inc r10
	inc r10
	with r0
	to r9
	alt1
	lms r5,($0026)
	alt1
	lms r6,($0028)
	alt1
	lms r7,($002A)
	iwt r2,#CurPolyVerts2D
	move r12,r9
	move r13,r15					; Set loop point
	getb
	inc r14
	alt3
	umult #$06
	iwt r1,#$05C2
	with r1
	add r0
	ldw r1
	inc r1
	inc r1
	add r5
	stw r2
	inc r2
	inc r2
	ldw r1
	inc r1
	inc r1
	add r6
	stw r2
	inc r2
	inc r2
	ldw r1
	add r7
	stw r2
	inc r2
	loop
	inc r2
	move r9,r9
	sub r0
	alt2
	sms ($0040),r0
	iwt r7,#CurPolyVerts2D
	iwt r8,#CurPolyVerts3D
	from r9
	alt2
	sub #$02
	bne CODE_0197A9
	nop
	to r1
	ldw r7
	inc r7
	inc r7
	to r2
	ldw r7
	inc r7
	inc r7
	to r3
	ldw r7
	inc r7
	inc r7
	to r4
	ldw r7
	inc r7
	inc r7
	to r5
	ldw r7
	inc r7
	inc r7
	to r6
	ldw r7
	link #4
	iwt r15,#CODE_01966B
	nop
	from r1
	stw r8
	inc r8
	inc r8
	from r2
	stw r8
	inc r8
	inc r8
	from r3
	stw r8
	inc r8
	inc r8
	from r4
	stw r8
	inc r8
	inc r8
	from r5
	stw r8
	inc r8
	inc r8
	from r6
	stw r8
	inc r8
	inc r8
	ibt r0,#$02
	alt2
	sms ($0040),r0
	iwt r15,#CODE_01983B
	nop
CODE_0197A9:
	to r1
	ldw r7
	inc r7
	inc r7
	to r2
	ldw r7
	inc r7
	inc r7
	to r3
	ldw r7
	inc r7
	inc r7
	with r9
	to r0
	dec r0
	bne CODE_0197BE
	nop
	iwt r7,#CurPolyVerts2D
CODE_0197BE:
	to r4
	ldw r7
	inc r7
	inc r7
	to r5
	ldw r7
	inc r7
	inc r7
	to r6
	ldw r7
	with r7
	alt2
	sub #$04
	from r6
	and r3
	bpl CODE_0197D4
	nop
	iwt r15,#CODE_019827
	nop
CODE_0197D4:
	moves r3,r3
	bpl CODE_0197DD
	nop
	iwt r15,#CODE_019811
	nop
CODE_0197DD:
	from r1
	stw r8
	inc r8
	inc r8
	from r2
	stw r8
	inc r8
	inc r8
	from r3
	stw r8
	inc r8
	inc r8
	alt1
	lms r0,($0040)
	inc r0
	sbk
	moves r6,r6
	bmi CODE_0197F7
	nop
	iwt r15,#CODE_019827
	nop
CODE_0197F7:
	link #4
	iwt r15,#CODE_01966B
	nop
	from r4
	stw r8
	inc r8
	inc r8
	from r5
	stw r8
	inc r8
	inc r8
	from r6
	stw r8
	inc r8
	inc r8
	alt1
	lms r0,($0040)
	inc r0
	sbk
	iwt r15,#CODE_019827
	nop
CODE_019811:
	link #4
	iwt r15,#CODE_01966B
	nop
	from r1
	stw r8
	inc r8
	inc r8
	from r2
	stw r8
	inc r8
	inc r8
	from r3
	stw r8
	inc r8
	inc r8
	alt1
	lms r0,($0040)
	inc r0
	sbk
CODE_019827:
	dec r9
	beq CODE_01982F
	nop
	iwt r15,#CODE_0197A9
	nop
CODE_01982F:
	alt1
	lms r0,($0040)
	alt2
	sub #$03
	bpl CODE_01983B
	iwt r15,#CODE_019885
	nop
CODE_01983B:
	alt1
	lms r0,($0040)
	move r9,r0
	sub r0
	alt2
	sms ($0138),r0
	iwt r7,#CurPolyVerts3D
	iwt r8,#CurPolyVerts2D
CODE_01984A:
	to r1
	ldw r7
	inc r7
	inc r7
	to r2
	ldw r7
	inc r7
	inc r7
	to r3
	ldw r7
	inc r7
	inc r7
	link #4
	iwt r15,#CvtPoint3DTo2D
	nop
	from r1
	stw r8
	inc r8
	inc r8
	from r2
	stw r8
	inc r8
	inc r8
	alt1
	lms r3,($0138)
	or r3
	sbk
	dec r9
	bne CODE_01984A
	nop
	alt1
	lms r0,($0138)
	iwt r1,#$0F00
	and r1
	alt3
	cmp r1
	beq CODE_01987C
	nop
	iwt r15,#CODE_019885
	nop
	nop
CODE_01987C:
	alt1
	lms r0,($0040)
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_019885:
	sub r0
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_01988B:
	from r11
	stw r10
	inc r10
	inc r10
	ibt r1,#$03
	alt3
	cmp r1
	bpl CODE_01989A
	nop
	iwt r15,#CODE_019D34
	nop
CODE_01989A:
	alt2
	sms ($0086),r0
	alt2
	sms ($0040),r0
	iwt r8,#CurPolyVerts2D
	iwt r9,#CurPolyVerts3D
	to r1
	ldw r8
	inc r8
	inc r8
	to r2
	ldw r8
	inc r8
	inc r8
	to r3
	ldw r8
	inc r8
	inc r8
	to r6
	ldw r8
	with r8
	alt2
	sub #$06
	alt1
	lms r0,($0040)
	alt2
	mult #$08
	add r8
	from r1
	stw r0
	inc r0
	inc r0
	from r2
	stw r0
	inc r0
	inc r0
	from r3
	stw r0
	inc r0
	inc r0
	from r6
	stw r0
	to r1
	ldw r8
	inc r8
	inc r8
	to r2
	ldw r8
	inc r8
	inc r8
	with r8
	alt2
	add #$04
	to r3
	ldw r8
	inc r8
	inc r8
	to r6
	ldw r8
	with r8
	alt2
	sub #$02
	alt1
	lms r0,($0038)
	from r1
	sub r0
	blt CODE_0198EB
	nop
	iwt r15,#CODE_019900
	nop
CODE_0198EB:
	alt1
	lms r0,($0038)
	from r3
	sub r0
	blt CODE_0198F7
	nop
	iwt r15,#CODE_019928
	nop
CODE_0198F7:
	alt1
	lms r0,($0086)
	dec r0
	sbk
	iwt r15,#CODE_0199A1
	nop
CODE_019900:
	alt1
	lms r0,($0038)
	from r3
	sub r0
	blt CODE_01990C
	nop
	iwt r15,#CODE_01998A
	nop
CODE_01990C:
	alt1
	lms r0,($0086)
	inc r0
	sbk
	from r1
	stw r9
	inc r9
	inc r9
	from r2
	stw r9
	inc r9
	inc r9
	with r8
	alt2
	sub #$04
	ldw r8
	inc r8
	inc r8
	stw r9
	inc r9
	inc r9
	ldw r8
	inc r8
	inc r8
	stw r9
	inc r9
	inc r9
CODE_019928:
	with r3
	sub r1
	with r6
	sub r2
	alt1
	lms r0,($0038)
	sub r1
	to r5
	alt1
	lmult
	move r6,r3
	link #4
	iwt r15,#CODE_01814D
	nop
	from r4
	add r2
	alt1
	lms r6,($0038)
	from r6
	stw r9
	inc r9
	inc r9
	stw r9
	inc r9
	inc r9
	with r8
	alt2
	add #$04
	to r6
	ldw r8
	with r8
	alt2
	sub #$08
	to r2
	ldw r8
	inc r8
	inc r8
	with r6
	sub r2
	alt1
	lms r0,($0038)
	sub r1
	to r5
	alt1
	lmult
	move r6,r3
	link #4
	iwt r15,#CODE_01814D
	nop
	from r4
	add r2
	stw r9
	inc r9
	inc r9
	to r2
	ldw r8
	with r8
	alt2
	add #$08
	to r6
	ldw r8
	with r8
	alt2
	sub #$06
	with r6
	sub r2
	alt1
	lms r0,($0038)
	sub r1
	to r5
	alt1
	lmult
	move r6,r3
	link #4
	iwt r15,#CODE_01814D
	nop
	from r4
	add r2
	stw r9
	inc r9
	inc r9
	iwt r15,#CODE_0199A1
	nop
CODE_01998A:
	from r1
	stw r9
	inc r9
	inc r9
	from r2
	stw r9
	inc r9
	inc r9
	with r8
	alt2
	sub #$04
	ldw r8
	inc r8
	inc r8
	stw r9
	inc r9
	inc r9
	ldw r8
	inc r8
	inc r8
	stw r9
	inc r9
	inc r9
CODE_0199A1:
	alt1
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
CODE_01A34F:
	sub r0
	dec r10						;\Pop r15 (pc) from stack and return
	dec r10						;|
	to r15						;|
	ldw r10						;|
	nop						;/
DrawLine:
	cache
	iwt r7,#CurPolyVerts2D
	to r1
	ldw r7
	inc r7
	inc r7
	to r2
	ldw r7
	inc r7
	inc r7
	to r3
	ldw r7
	inc r7
	inc r7
	to r4
	ldw r7
	ibt r5,#$01
	with r3
	sub r1
	bpl DrawLineSkipNegDx
	nop
	ibt r5,#$FF
	with r3
	not
	inc r3
DrawLineSkipNegDx:
	ibt r6,#$01
	with r4
	sub r2
	bpl DrawLineSkipNegDy
	nop
	ibt r6,#$FF
	with r4
	not
	inc r4
DrawLineSkipNegDy:
	from r3
	sub r4
	bmi DrawLineVertOctant
	nop
	move r12,r3
	inc r12
	lsr
	sub r4
	move r13,r15					; Set loop point
	bcs DrawLineSkipOffsY
	plot
	add r3
	with r2
	add r6
DrawLineSkipOffsY:
	dec r1
	with r1
	add r5
	loop
	sub r4
	iwt r15,#CODE_018EAD
	nop
DrawLineVertOctant:
	move r12,r4
	inc r12
	not
	inc r0
	lsr
	sub r3
	move r13,r15					; Set loop point
	bcs DrawLineSkipOffsX
	plot
	add r4
	with r1
	add r5
DrawLineSkipOffsX:
	dec r1
	with r2
	add r6
	loop
	sub r3
	iwt r15,#CODE_018EAD
	nop
DrawNgon:
	dec r0						;\If vertex count is not 2...
	dec r0						;|
	bne DrawNgonSkipLine				;/...branch to skip drawing line
	iwt r15,#DrawLine				;\Branch to draw line
	nop						;/
DrawNgonSkipLine:
	inc r0
	inc r0
	with r0
	to r12
	add r0
	add r0
	add r0
	with r0
	to r3
	iwt r4,#CurPolyVerts2D
	from r4
	to r5
	add r0
	iwt r2,#$03FF
	ibt r8,#$00
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
CODE_01A752:
	from r7
	to r1
	hib
	from r9
	hib
	to r12
	sub r1
	bmi CODE_01A75E
	inc r12
	loop
	plot
CODE_01A75E:
	with r7
	add r8
	bpl CODE_01A76C
	dec r11
	iwt r0,#$0800
	add r7
	bmi CODE_01A76C
	nop
	ibt r7,#$00
CODE_01A76C:
	with r9
	add r10
	bpl CODE_01A77A
	dec r3
	iwt r0,#$0800
	add r9
	bmi CODE_01A77A
	nop
	ibt r9,#$00
CODE_01A77A:
	from r11
	and r3
	bne CODE_01A752
	inc r2
	iwt r15,#CODE_01A6D2
	nop
	iwt r15,#CODE_018EAD
	nop
	jmp r11						;\Return from link
	nop						;/
CODE_01A789:
	alt2
	sms ($019E),r11
	sub r0
	alt2
	ramb
	alt1
	cmode
	ibt r0,#$14
	alt3
	romb
	alt1
	lms r7,($0062)
	alt1
	lms r8,($002C)
	alt1
	lms r9,($002E)
	alt1
	lms r1,($0142)
	alt1
	lms r2,($0144)
	alt1
	lms r3,($0146)
	alt1
	lms r11,($0152)
	iwt r0,#$000F
	alt2
	sms ($014E),r0
	cache
	alt1
	lms r10,($0150)
	with r9
	sub r3
	iwt r12,#$000F
	move r13,r15					; Set loop point
	with r9
	add r3
	bpl 59
	
	
	
	
	
	
	
	
	
	
	
	
RenderCircularWipe:
	iwt r10,#WipeWindowBuffer
	iwt r12,#$00E0
	sub r0
	move r13,r15
	cache
	stw r10
	inc r10
	loop
	inc r10
	alt1
	lms r13,($0020)
	alt1
	lms r5,($0026)
	alt1
	lms r6,($0028)
	iwt r12,#WipeWindowBuffer
	ibt r3,#$00
	move r4,r13
	ibt r9,#$01
	with r9
	sub r4
	ibt r7,#$01
	with r7
	add r3
	with r7
	add r3
	from r9
	to r8
	sub r4
	cache
CODE_01AAFF:
	from r3
CODE_01AB00:
	sub r4
	bmi CODE_01AB08
	nop
	iwt r15,#CODE_01AB6C
	nop
CODE_01AB08:
	from r5
	to r1
	add r3
	from r6
	to r2
	add r4
	iwt r0,#$00F0
	alt3
	cmp r2
	bcc CODE_01AB1B
	nop
	from r12
	add r2
	add r2
	from r1
	stw r0
CODE_01AB1B:
	from r5
	to r1
	add r3
	from r6
	to r2
	sub r4
	iwt r0,#$00F0
	alt3
	cmp r2
	bcc CODE_01AB2E
	nop
	from r12
	add r2
	add r2
CODE_01AB2E:
	from r1
	stw r0
	from r5
	to r1
	add r4
	from r6
	to r2
	add r3
	iwt r0,#$00F0
	alt3
	cmp r2
	bcc CODE_01AB41
	nop
	from r12
	add r2
	add r2
	from r1
	stw r0
CODE_01AB41:
	from r5
	to r1
	add r4
	from r6
	to r2
	sub r3
	iwt r0,#$00F0
	alt3
	cmp r2
	bcc CODE_01AB54
	nop
	from r12
	add r2
	add r2
	from r1
	stw r0
CODE_01AB54:
	inc r3
	inc r7
	inc r7
	inc r8
	inc r8
	moves r9,r9
	bpl CODE_01AB64
	nop
	with r9
	add r7
	iwt r15,#CODE_01AB00
	from r3
CODE_01AB64:
	inc r8
	inc r8
	with r9
	add r8
	iwt r15,#CODE_01AAFF
	dec r4
CODE_01AB6C:
	from r5
	to r1
	add r3
	from r6
	to r2
	add r4
	iwt r0,#$00F0
	alt3
	cmp r2
	bcc CODE_01AB7F
	nop
	from r12
	add r2
	add r2
	from r1
	stw r0
CODE_01AB7F:
	from r5
	to r1
	add r3
	from r6
	to r2
	sub r4
	iwt r0,#$00F0
	alt3
	cmp r2
	bcc CODE_01AB92
	nop
	from r12
	add r2
	add r2
	from r1
	stw r0
CODE_01AB92:
	from r5
	to r1
	add r4
	from r6
	to r2
	add r3
	iwt r0,#$00F0
	alt3
	cmp r2
	bcc CODE_01ABA5
	nop
	from r12
	add r2
	add r2
	from r1
	stw r0
CODE_01ABA5:
	from r5
	to r1
	add r4
	from r6
	to r2
	sub r3
	iwt r0,#$00F0
	alt3
	cmp r2
	bcc CODE_01ABB8
	nop
	from r12
	add r2
	add r2
	from r1
	stw r0
CODE_01ABB8:
	iwt r1,#WipeWindowBuffer
	iwt r2,#WipeWindowBuffer
	iwt r5,#WipeWindowBuffer2
	iwt r12,#$00E0
	move r13,r15
	to r6
	ldw r1
	inc r1
	inc r1
	alt1
	lms r3,($0026)
	from r3
	to r4
	sub r6
	from r4
	to r7
	add r3
	iwt r4,#$00F0
	with r7
	alt3
	cmp r4
	bpl CODE_01AC0B
	nop
	iwt r4,#$0010
	with r6
	alt3
	cmp r4
	bmi CODE_01AC0B
	nop
	iwt r4,#$0010
	with r7
	alt3
	cmp r4
	bpl CODE_01ABF1
	nop
	iwt r7,#$0010
CODE_01ABF1:
	iwt r4,#$00F0
	with r6
	alt3
	cmp r4
	bmi CODE_01ABFD
	nop
	iwt r5,#$00F0
CODE_01ABFD:
	from r6
	alt1
	stb r2
	inc r2
	inc r2
	from r7
	alt1
	stb r5
	inc r5
	inc r5
	loop
	nop
	stop
	nop
CODE_01AC0B:
	iwt r0,#$0064
	alt1
	stb r2
	inc r2
	inc r2
	iwt r0,#$00C8
	alt1
	stb r5
	inc r5
	inc r5
	loop
	nop
	stop
	nop
RenderObjects:
	iwt r10,#SuperFXStack
	alt1
	lms r0,($01BE)
	lob
	beq CODE_01AC2C
	nop
	link #4
	iwt r15,#CODE_01B0BB
	nop
CODE_01AC2C:
	alt1
	lms r0,($019E)
	moves r0,r0
	beq CODE_01AC44
	nop
	bmi CODE_01AC3F
	nop
	link #4
	iwt r15,#CODE_01A789
	nop
	bra CODE_01AC44
	nop
CODE_01AC3F:
	link #4
	iwt r15,#CODE_01A8A6
	nop
CODE_01AC44:
	iwt r10,#SuperFXStack
	ibt r1,#$08
	alt1
	lms r0,($01A0)
	and r1
	beq CODE_01AC5A
	nop
	ibt r0,#$01
	alt2
	sms ($01A2),r0
	link #4
	iwt r15,#CODE_01AC97
	nop
CODE_01AC5A:
	sub r0
	alt2
	sms ($01A2),r0
	link #4
	iwt r15,#CODE_01AC97
	nop
	iwt r10,#SuperFXStack
	sub r0
	alt1
	cmode
	alt1
	lm r0,($021C)
	lob
	beq CODE_01AC80
	nop
	link #4
	iwt r15,#CODE_01AF81
	nop
	link #4
	iwt r15,#CODE_01AFB8
	nop
	link #4
	iwt r15,#CODE_01AFED
	nop
CODE_01AC80:
	link #4
	iwt r15,#CODE_01D76B
	nop
	alt1
	lm r0,($1A28)
	moves r0,r0
	beq CODE_01AC93
	nop
	link #4
	iwt r15,#CODE_01D624
	nop
CODE_01AC93:
	alt1						;\Flush pixel buffer
	rpix						;/
	stop						;\End SuperFX task
	nop						;/
CODE_01AC97:
	alt1
	lm r1,($021E)
	moves r1,r1
	bne CODE_01ACA2
	nop
	jmp r11						;\Return from link
	nop						;/
CODE_01ACA2:
	from r11
	stw r10
	inc r10
	inc r10
	sub r0
	alt3
	romb
	alt2
	sms ($0132),r0
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
	sms ($0020),r0
	inc r1
	alt1
	ldb r1
	alt2
	sms ($0022),r0
	inc r1
	alt1
	ldb r1
	alt2
	sms ($0024),r0
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
	lms r0,($01A2)
	lob
	beq CODE_01AD13
	nop
	ibt r0,#$00
	ibt r5,#$04
	from r4
	and r5
	beq CODE_01ACE1
	nop
	iwt r0,#$1000
CODE_01ACE1:
	alt2
	sms ($0054),r0
	ibt r5,#$0C
	from r4
	and r5
	bne CODE_01ACEF
	nop
	iwt r15,#CODE_01AF6C
	nop
CODE_01ACEF:
	from r3
	to r14
	add r14
	to r3
	getb
	inc r14
	with r3
	alt1
	getbh
	ldw r1
	alt2
	sms ($0028),r0
	inc r1
	inc r1
	ldw r1
	alt2
	sms ($0026),r0
	inc r1
	inc r1
	ldw r1
	alt2
	sms ($002A),r0
	inc r1
	inc r1
	inc r1
	inc r1
	inc r1
	inc r1
	bra CODE_01AD34
	nop
CODE_01AD13:
	ibt r5,#$04
	from r4
	and r5
	beq CODE_01AD1E
	iwt r15,#CODE_01AF6C
	nop
CODE_01AD1E:
	inc r1
	inc r1
	inc r1
	inc r1
	inc r1
	inc r1
	ldw r1
	alt2
	sms ($0028),r0
	inc r1
	inc r1
	ldw r1
	alt2
	sms ($0026),r0
	inc r1
	inc r1
	ldw r1
	alt2
	sms ($002A),r0
CODE_01AD34:
	move r6,r0
	inc r1
	inc r1
	iwt r5,#$0010
	from r4
	and r5
	beq CODE_01AD94
	nop
	ibt r0,#$F4
	to r1
	add r1
	ldw r1
	alt2
	sms ($0136),r0
	inc r1
	inc r1
	alt1
	ldb r1
	lob
	alt2
	sms ($013C),r0
	inc r1
	alt1
	ldb r1
	lob
	alt2
	sms ($013E),r0
	inc r1
	alt1
	ldb r1
	lob
	ibt r5,#$07
	and r5
	bne CODE_01AD63
	nop
	ibt r0,#$FF
CODE_01AD63:
	alt2
	sms ($0132),r0
	alt1
	lm r0,($1A28)
	moves r0,r0
	beq CODE_01AD90
	nop
	alt1
	lms r0,($0132)
	moves r0,r0
	beq CODE_01AD90
	nop
	bmi CODE_01AD88
	nop
	alt1
	lms r1,($013E)
	alt1
	lms r2,($0136)
	alt1
	lms r3,($013C)
	link #4
	iwt r15,#CODE_01D198
	nop
CODE_01AD88:
	alt1
	lms r2,($0136)
	link #4
	iwt r15,#CODE_01D471
	nop
CODE_01AD90:
	iwt r15,#CODE_01AF6C
	nop
CODE_01AD94:
	ibt r5,#$40
	from r4
	and r5
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
DecompressGraphics:
	alt1
	lms r0,($0062)
	alt3
	romb
	sub r0
	alt2
	ramb
	alt1
	lms r14,($0062)
	dec r14
	to r1
	getb
	dec r14
	with r1
	alt1
	getbh
	dec r14
	dec r14
	dec r14
	to r3
	getb
	dec r14
	with r3
	alt1
	getbh
	dec r14
	to r2
	getb
	dec r14
	with r2
	alt1
	getbh
	alt1
	lms r9,($002C)
	with r1
	add r9
	alt2
	sms ($005A),r1
	ibt r4,#$00
	ibt r6,#$00
	ibt r5,#$00
	iwt r7,#$B4B6
	cache
	move r8,r15
	ibt r12,#$03
	link #4
	iwt r14,#CODE_01B4B2
	with r4
	ibt r0,#$FF
	and r4
	bne CODE_01B348
	nop
	iwt r15,#CODE_01B3C1
	nop
CODE_01B348:
	ibt r0,#$07
	alt3
	cmp r4
	bne CODE_01B380
	nop
	with r2
	lsr
	with r3
	ror
	from r2
	or r3
	bne CODE_01B35D
	nop
	iwt r15,#CODE_01B49A
	dec r14
CODE_01B35D:
	bcc CODE_01B376
	bio
	ibt r12,#$0A
	link #4
	iwt r15,#CODE_01B4B2
	with r4
	moves r4,r4
	bne CODE_01B380
	nop
	ibt r12,#$12
	link #4
	iwt r15,#CODE_01B4B2
	with r4
	bra CODE_01B380
	nop
CODE_01B376:
	ibt r12,#$04
	link #4
	iwt r15,#CODE_01B4B2
	with r4
	with r4
	alt2
	add #$07
CODE_01B380:
	ibt r12,#$08
	with r15
	to r13
	with r2
	lsr
	with r3
	ror
	from r2
	or r3
	beq CODE_01B39E
	with r6
	rol
	with r5
	rol
	loop
	nop
	dec r1
	from r6
	alt1
	stb r1
	dec r4
	bne CODE_01B380
	nop
	bra CODE_01B3C1
	nop
	dec r14
	to r3
	getb
	dec r14
	with r3
	alt1
	getbh
	dec r14
	to r2
	getb
	dec r14
	with r2
	alt1
	getbh
	ibt r0,#$01
	ror
	with r2
	ror
	with r3
	ror
	with r6
	ror
	with r5
	rol
	loop
	nop
	dec r1
	from r6
	alt1
	stb r1
	dec r4
	bne CODE_01B380
	nop
CODE_01B3C1:
	with r9
	alt3
	cmp r1
	bne CODE_01B3E6
	ibt r12,#$02
	alt2
	sms ($0062),r14
	alt1
	lms r3,($0090)
	moves r3,r3
	beq CODE_01B3E4
	nop
	alt1
	lms r1,($002C)
	alt1
	lms r2,($005A)
	to r12
	from r2
	sub r1
	move r13,r15					; Set loop point
	ldw r1
	add r3
	stw r1
	inc r1
	loop
	inc r1
CODE_01B3E4:
	stop
	nop
CODE_01B3E6:
	cache
	link #4
	iwt r15,#CODE_01B4B2
	with r4
	ibt r6,#$02
	ibt r5,#$00
	ibt r12,#$08
	moves r4,r4
	bne CODE_01B3FB
	nop
	iwt r15,#CODE_01B486
	nop
CODE_01B3FB:
	ibt r6,#$04
	ibt r0,#$02
	alt3
	cmp r4
	beq CODE_01B45E
	nop
	ibt r6,#$03
	ibt r0,#$01
	alt3
	cmp r4
	beq CODE_01B445
	nop
	ibt r12,#$02
	link #4
	iwt r15,#CODE_01B4B2
	with r4
	ibt r0,#$03
	alt3
	cmp r4
	beq CODE_01B439
	nop
	ibt r0,#$02
	alt3
	cmp r4
	beq CODE_01B42A
	nop
	with r4
	alt2
	add #$05
	move r6,r4
	bra CODE_01B45E
	nop
CODE_01B42A:
	ibt r12,#$02
	link #4
	iwt r15,#CODE_01B4B2
	with r4
	with r4
	alt2
	add #$07
	move r6,r4
	bra CODE_01B45E
	nop
CODE_01B439:
	ibt r12,#$08
	link #4
	iwt r15,#CODE_01B4B2
	with r4
	with r4
	to r6
	bra CODE_01B45E
	nop
CODE_01B445:
	ibt r12,#$08
	with r2
	lsr
	with r3
	ror
	from r2
	or r3
	bne CODE_01B456
	nop
	link #4
	iwt r15,#CODE_01B49A
	dec r14
	nop
CODE_01B456:
	bcs CODE_01B486
	nop
	ibt r12,#$0E
	bra CODE_01B486
	nop
CODE_01B45E:
	ibt r12,#$10
	with r2
	lsr
	with r3
	ror
	from r2
	or r3
	bne CODE_01B46E
	nop
	link #4
	iwt r15,#CODE_01B49A
	dec r14
CODE_01B46E:
	bcc CODE_01B486
	nop
	ibt r12,#$08
	with r2
	lsr
	with r3
	ror
	from r2
	or r3
	bne CODE_01B481
	nop
	link #4
	iwt r15,#CODE_01B49A
	dec r14
CODE_01B481:
	bcs CODE_01B486
	nop
	ibt r12,#$0C
CODE_01B486:
	link #4
	iwt r15,#CODE_01B4B2
	with r4
	dec r6
CODE_01B48C:
	from r1
	add r4
	dec r0
	alt1
	ldb r0
	dec r1
	alt1
	ldb r0
	dec r1
	alt1
	stb r1
	dec r6
	bpl CODE_01B48C
	nop
	jmp r8
	nop
CODE_01B49A:
	to r3
	getb
	dec r14
	with r3
	alt1
	getbh
	dec r14
	to r2
	getb
	dec r14
	with r2
	alt1
	getbh
	ibt r0,#$01
	ror
	with r2
	ror
	with r3
	ror
	from r2
	or r3
	jmp r11						;\Return from link
	nop						;/
CODE_01B4B2:
	sub r4
	move r13,r7
	with r2
	lsr
	with r3
	ror
	from r2
	or r3
	beq CODE_01B4C4
	nop
	with r4
	rol
	loop
	with r2
	jmp r11						;\Return from link
	nop						;/
CODE_01B4C4:
	dec r14
	to r3
	getb
	dec r14
	with r3
	alt1
	getbh
	dec r14
	to r2
	getb
	dec r14
	with r2
	alt1
	getbh
	ibt r0,#$01
	ror
	with r2
	ror
	with r3
	ror
	with r4
	rol
	loop
	with r2
	jmp r11						;\Return from link
	nop						;/
	
CODE_01B4DF:
	iwt r1,#$0200
	iwt r12,#$3F00
	move r13,r15					; Set loop point
	
	
	
	
	
	
	
;01B54B
DrawDialogText:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
DATA_01BBF6:
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	;01D996
	;Main dialog font
DialogFont:
	INCBIN "graphics/font.2bpp.chr"
DialogCharMap:
	DB $27,$46,$00,$43,$00,$25,$00,$44,$85,$86,$47,$88,$83,$42,$26,$24
	DB $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$89,$84,$00,$8A,$00,$45
	DB $8B,$0A,$0B,$0C,$0D,$0E,$0F,$10,$11,$12,$13,$14,$15,$16,$17,$18
	DB $19,$1A,$1B,$1C,$1D,$1E,$1F,$20,$21,$22,$23,$00,$00,$00,$00,$00
	DB $00,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,$30,$31,$32,$33,$34,$35,$36
	DB $37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,$40,$41,$00,$00,$00,$00,$4F
	DB $48,$49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$55,$56,$57
	DB $58,$59,$5A,$5B,$5C,$5D,$5E,$5F,$60,$61,$62,$63,$64,$65,$66,$67
	DB $68,$69,$6A,$6B,$6C,$6D,$6E,$6F,$70,$71,$72,$73,$74,$75,$76,$77
	DB $78,$79,$7A,$7B,$7C,$7D,$7E,$7F,$80,$81,$82,$83,$84,$85,$86,$87
	DB $88,$89,$8A,$8B,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
TextPaused:
	DB $0E,"PAUSED",$00
TextTotalScore:
	DB $0E,"TOTAL SCORE",$00
TextScore:
	DB $0E,"SCORE",$00
TextSlash:
	DB $0E,"/",$00
TextPercentage:
	DB $0E,"PERCENTAGE",$00
TextBonus1Credit:
	DB $0E,"BONUS 1 CREDIT",$00
TextPercent:
	DB $0E,"%",$00
TextPerfect:
	DB $0E,"PERFECT//",$00
TextShieldOfTeammates:
	DB $0E,"SHIELD OF TEAMMATES",$00
TextSlippy:
	DB $0E,"SLIPPY",$00
TextPeppy:
	DB $0E,"PEPPY",$00
TextFalco:
	DB $0E,"FALCO",$00
TextIsDown:
	DB $0E,"IS DOWN",$00
TextStage:
	DB $0E,"STAGE",$00
TextM:
	DB $02,"m",$00
TextS:
	DB $02,"s",$00
TextScore:
	DB $02,"score",$00
TextShieldBonus:
	DB $0E,"SHIELD BONUS",$00
TextBombBonus:
	DB $0E,"BOMB BONUS",$00
DialogCheckInFox:
	DB $00,$02,$0E,"all ships check in!",$00
DialogWeDidIt:
	DB $00,$02,$0E,"we did it!",$00
DialogSlippySlippy:
	DB $00,$02,$0E,"slippy slippy##",$00
DialogGoBackToTheBase:
	DB $00,$02,$0E,"go back to the base!",$00
DialogIntroFalco:
	DB $02,$02,$0E,"ready, fox!",$00
DialogEndingFalco:
	DB $02,$02,$0E,"i'm with you, fox!",$00
DialogChasedFalco:
	DB $02,$00,$0E,"bogey on my six!",$00
DialogSavedFalco:
	DB $02,$02,$0E,"mind your own business, fox!",$00
DialogKilledFalco:
	DB $02,$01,$0E,"they got me! i'm gone!!",$00
DialogPhraseAFalco:
	DB $02,$02,$0E,"i'll blast 'em all!",$00
DialogPhraseBFalco:
	DB $02,$02,$0E,"there's more on the way!",$00
DialogPhraseCFalco:
	DB $02,$02,$0E,"you can run, but you can't hide!",$00
DialogTargetingFalco:
	DB $02,$02,$0E,"this one's mine!",$00
DialogPlayerHitFalco:
	DB $02,$00,$0E,"watch it, fox!",$00
DialogChasedHit2Falco:
	DB $02,$02,$0E,"i'm hit!!",$00
DialogSpaceFalco:
	DB $02,$02,$0E,"here they come! ",$00
DialogMonarchDodoraFalco:
	DB $82,$02,$0E,"make the neck and tail shorter, fox!!",$00
DialogPlasmaHydraFalco:
	DB $82,$02,$0E,"shoot down its arms to hit its body!",$00
DialogTunnelFalco:
	DB $02,$02,$0E,"slow it down, fox!",$00
DialogAmoebaFalco:
	DB $02,$02,$0E,"roll, baby! rock 'n roll!",$00
DialogUnusedAFalco:
	DB $02,$02,$0E,"my ship's messed up###",$00
DialogSpoilFalco:
	DB $02,$02,$0E,"hey! that one was mine!",$00
DialogPhraseDFalco:
	DB $02,$02,$0E,"bogies, i'm comin' through!",$00
DialogUnusedBFalco:
	DB $02,$02,$0E,"i'll cover your tail!",$00
DialogIntroPeppy:
	DB $01,$02,$0E,"yeah - let's go!",$00
DialogEndingPeppy:
	DB $01,$02,$0E,"i'm behind you, fox!",$00
DialogChasedPeppy:
	DB $01,$00,$0E,"get lost, you fiend!",$00
DialogSavedPeppy:
	DB $01,$02,$0E,"yeah! thanks!",$00
DialogKilledPeppy:
	DB $01,$01,$0E,"aargh!! i'm a goner!",$00
DialogPhraseAPeppy:
	DB $01,$02,$0E,"let's smash 'em!",$00
DialogPhraseBPeppy:
	DB $01,$02,$0E,"i got one! i got one!!",$00
DialogPhraseCPeppy:
	DB $01,$02,$0E,"take this, enemy brute!",$00
DialogTargetingPeppy:
	DB $01,$02,$0E,"you're not getting away!",$00
DialogPlayerHitPeppy:
	DB $01,$00,$0E,"watch your aim, fox!",$00
DialogChasedHit2Peppy:
	DB $01,$02,$0E,"ouch! ouch!",$00
DialogSpacePeppy:
	DB $01,$02,$0E,"incoming enemy craft! ",$00
DialogMonarchDodoraPeppy:
	DB $81,$02,$0E,"please make the neck and tail shorter, fox!",$00
DialogPlasmaHydraPeppy:
	DB $81,$02,$0E,"shoot down its arms to hit its body!",$00
DialogTunnelPeppy:
	DB $01,$02,$0E,"retros!  fire retros!",$00
DialogAmoebaPeppy:
	DB $01,$02,$0E,"roll over! shake it off!",$00
DialogUnusedAPeppy:
	DB $01,$02,$0E,"pick me up on your way back!",$00
DialogSpoilPeppy:
	DB $01,$02,$0E,"hey! he was mine!",$00
DialogPhraseDPeppy:
	DB $01,$02,$0E,"out of my way!",$00
DialogUnusedBPeppy:
	DB $01,$02,$0E,"i'm off your starboard!",$00
DialogIntroSlippy:
	DB $03,$02,$0E,"ok!!",$00
DialogEndingSlippy:
	DB $03,$02,$0E,"ribbit! i'll bring up the rear,fox!",$00
DialogChasedSlippy:
	DB $03,$00,$0E,"croak!  help me!",$00
DialogSavedSlippy:
	DB $03,$02,$0E,"ribbit!  thanks fer the save!",$00
DialogKilledSlippy:
	DB $03,$01,$0E,"no! no! crrooakk!",$00
DialogPhraseASlippy:
	DB $03,$02,$0E,"i'll get him -- ribbit!",$00
DialogPhraseBSlippy:
	DB $03,$02,$0E,"piece of c-c-cake!",$00
DialogPhraseCSlippy:
	DB $03,$02,$0E,"take this, j-j-junk heap!",$00
DialogTargetingSlippy:
	DB $03,$02,$0E,"i'll get this one! ribbit!",$00
DialogPlayerHitSlippy:
	DB $03,$00,$0E,"hey! it's me, slippy!",$00
DialogChasedHit2Slippy:
	DB $03,$02,$0E,"ribbit!  i'm hit!!",$00
DialogSpaceSlippy:
	DB $03,$02,$0E,"there's too many of them!",$00
DialogTunnelSlippy:
	DB $03,$02,$0E,"let's turn back, okay?!",$00
DialogBossSlippy:
	DB $03,$02,$0E,"let's be careful!",$00
DialogAmoebaSlippy:
	DB $03,$02,$0E,"something's sticking to me!",$00
DialogUnusedASlippy:
	DB $03,$02,$0E,"i c-c-couldn't go, fox!",$00
DialogSpoilSlippy:
	DB $03,$02,$0E,"hey! don't be so g-g-greedy!",$00
DialogPhraseDSlippy:
	DB $03,$02,$0E,"c-c-clear out, astro-geeks!",$00
DialogUnusedBSlippy:
	DB $03,$02,$0E,"hope there's no more!",$00
DialogStage1Part2Slippy:
	DB $03,$02,$0E,"did you see me?",$00
DialogUnknownPeppy:
	DB $01,$02,$0E,"i can't tell which is real!!",$00
DialogArmadaFalco:
	DB $02,$02,$0E,"let's head in!",$00
DialogArmadaPeppy:
	DB $01,$02,$0E,"i'll follow you in!",$00
DialogArmadaSlippy:
	DB $03,$02,$0E,"should we go in?!",$00
DialogChasedHit1Falco:
	DB $02,$00,$0E,"###this one could be trouble###",$00
DialogChasedHit1Peppy:
	DB $01,$00,$0E,"hurry!",$00
DialogChasedHit1Slippy:
	DB $03,$00,$0E,"hurry up, fox!  croak!",$00
DialogPlayerRescuedFalco:
	DB $02,$02,$0E,"eyes forward, fox!",$00
DialogPlayerRescuedPeppy:
	DB $01,$02,$0E,"be careful, fox!",$00
DialogPlayerRescuedSlippy:
	DB $03,$02,$0E,"this time, i saved you!",$00
DialogClear100Falco:
	DB $02,$02,$0E,"no sweat, fox!",$00
DialogClear100Peppy:
	DB $01,$02,$0E,"ok, ok! what's next?!",$00
DialogClear100Slippy:
	DB $03,$02,$0E,"so far, so g-g-good!",$00
DialogStage1Part1Slippy:
	DB $03,$02,$0E,"look, look!",$00
DialogClear75Falco:
	DB $02,$02,$0E,"it's looking good, fox!",$00
DialogClear75Peppy:
	DB $01,$02,$0E,"we did it, let's go!",$00
DialogClear75Slippy:
	DB $03,$02,$0E,"g-g-great!",$00
DialogClear50Falco:
	DB $02,$02,$0E,"be a bit more careful fox!",$00
DialogClear50Peppy:
	DB $01,$02,$0E,"please tread carefully, fox!",$00
DialogClear50Slippy:
	DB $03,$00,$0E,"remember not to shoot m-m-me!",$00
DialogClear25Falco:
	DB $02,$00,$0E,"it's going pretty badly!",$00
DialogClear25Peppy:
	DB $01,$00,$0E,"i don't think i'm going to make it!",$00
DialogClear25Slippy:
	DB $03,$00,$0E,"my ship's falling apart### ribbit!",$00
DescriptionCorneria:
	DB $00,$02,$0E,"star fox team, our last resort is to counter attack venom!  good luck!",$00
DescriptionStage2:
	DB $00,$02,$0E,"andross's forces intend to build a base in this area!  destroy their rock crusher!",$00
DescriptionSpaceArmada:
	DB $00,$02,$0E,"the space armada consists of powerful battleships! destroy their energy cores!",$00
DescriptionMeteor:
	DB $00,$02,$0E,"be sure to use your retros if you're going too fast!  be careful with my arwings!",$00
DescriptionVenom1:
	DB $00,$02,$0E,"andross is hiding on venom!  fox, you must find his core brain and destroy it!",$00
LevelNameCorneria:
	DB $00,$02,$0E,"        CORNERIA - THE BASE",$00
LevelNameAsteroidBelt:
	DB $00,$02,$0E,"           ASTEROID BELT",$00
LevelNameSectorX:
	DB $00,$02,$0E,"              SECTOR  X",$00
LevelNameFortuna:
	DB $00,$02,$0E,"       THE PLANET FORTUNA",$00
LevelNameSpaceArmada:
	DB $00,$02,$0E,"     THE ANDROSS SPACE ARMADA",$00
LevelNameTitania:
	DB $00,$02,$0E,"        THE PLANET TITANIA",$00
LevelNameBlackHole:
	DB $00,$02,$0E,"      THE AWESOME BLACK HOLE",$00
LevelNameSectorY:
	DB $00,$02,$0E,"              SECTOR  Y",$00
LevelNameMeteor:
	DB $00,$02,$0E,"      THE BATTLE BASE METEOR",$00
LevelNameSectorZ:
	DB $00,$02,$0E,"              SECTOR  Z",$00
LevelNameMacbeth:
	DB $00,$02,$0E,"        THE PLANET MACBETH",$00
LevelNameVenom:
	DB $00,$02,$0E,"      VENOM - THE FINAL GOAL",$00
LevelNameOutOfThisDimension:
	DB $00,$02,$0E,"      OUT OF THIS DIMENSION",$00
DescriptionTitania:
	DB $00,$02,$0E,"corneria's resource world has been overrun!  you must re-take the weather control unit!",$00
DescriptionSectorY:
	DB $00,$02,$0E,"how are the arwings handling?  if an amoeba clings to your ship, use l or r to get rid of it#",$00
DescriptionCorneria3:
	DB $00,$02,$0E,"you've chosen course three###  a good choice to take venom by surprise!",$00
DescriptionAsteroidBelt3:
	DB $00,$02,$0E,"use the l or r button to escape the tractor beam of the enemy battleship! you can do it, fox!",$00
DescriptionFortuna:
	DB $00,$02,$0E,"andross has taken control of the huge creatures who live on fortuna!  take care, fox!",$00
DescriptionSectorZ:
	DB $00,$02,$0E,"your team is doing well, fox!  i hope you're taking good care of my arwings!  go for macbeth!",$00
DescriptionMacbeth:
	DB $00,$02,$0E,"the hollow interior of macbeth is ideal for a base!  prevent andross from building here!",$00
DescriptionBlackHole:
	DB $00,$02,$0E,"this space grave yard, created by andross's experiments, is where your father vanished, fox!",$00
DescriptionVenom2:
	DB $00,$02,$0E,"is everyone all right, fox?!  you're on course to sneak into venom's back door!",$00
DescriptionOutOfThisDimension:
	DB $00,$02,$0E,"come in, arwings!  fox, where are you?!  we need you to protect corneria!",$00
DescriptionVenom3:
	DB $00,$02,$0E,"you've made it this far### it's your fate to destroy andross!  we're counting on you, fox!",$00
DialogStage3Falco:
	DB $82,$02,$0E,"the attack- carrier will be mine!",$00
DialogTrainingAPepper:
	DB $84,$02,$0E,"ok, fox! let's see your real ability!",$00
DialogTrainingPeppy:
	DB $81,$02,$0E,"we've got to fly through all the rings!",$00
DialogTrainingBPepper:
	DB $84,$02,$0E,"i recommend you use control type a or b!",$00
Dialog5RingsPepper:
	DB $84,$02,$0E,"ahhh### you are quite skillful,   fox!",$00
Dialog10RingsPepper:
	DB $84,$02,$0E,"ok, you passed! go fight the real enemy!",$00
DialogTrainingSlippy:
	DB $83,$02,$0E,"hit start to   go back to the game, ribbit!",$00
DialogTrainingFalco:
	DB $82,$02,$0E,"i can't believe pepper has to test us!",$00
Dialog15RingsPepper:
	DB $84,$02,$0E,"i'm sorry         i doubted you! press start!",$00
DialogVenom1Part1Andross:
	DB $85,$02,$0E,"fox,           you are indeed a worthy foe###",$00
DialogVenom1Part2Andross:
	DB $85,$02,$0E,"but, your foolish efforts are futile!",$00
DialogVenom1Part3Andross:
	DB $85,$02,$0E,"your arwings have no chance against me!",$00
DialogVenom2Part1Andross:
	DB $85,$02,$0E,"i thought you might make it eventually###",$00
DialogVenom2Part2Andross:
	DB $85,$02,$0E,"general pepper has guided you well!",$00
DialogVenom2Part3Andross:
	DB $85,$02,$0E,"however, you will not escape here alive!",$00
DialogVenom3Part1Andross:
	DB $85,$02,$0E,"ah## your choice of routes took me by surprise!",$00
DialogVenom3Part2Andross:
	DB $85,$02,$0E,"your father was a reckless fighter too###",$00
DialogVenom3Part3Andross:
	DB $85,$02,$0E,"but this will be the mccloud's last battle!",$00
DialogUnknownAFalco:
	DB $02,$02,$0E,"follow me, fox!",$00
DialogUnknownBFalco:
	DB $02,$02,$0E,"roll, fox! rock'n roll!",$00
DialogUnknownAPeppy:
	DB $01,$02,$0E,"stay in formation!",$00
DialogUnknownCFalco:
	DB $82,$02,$0E,"what's wrong with you today, fox?!",$00
DialogUnknownASlippy:
	DB $03,$02,$0E,"yer g-g-great, fox! ribbit!",$00
DialogStingrayFalco:
	DB $02,$02,$0E,"beware of the big stingray!",$00
DialogStingrayPeppy:
	DB $01,$02,$0E,"beware of the big stingray!",$00
DialogStingraySlippy:
	DB $03,$02,$0E,"beware of the big stingray!",$00
DialogPtrs:
	;Check in lines
	DW DialogCheckInFox,DialogWeDidIt,DialogSlippySlippy,DialogGoBackToTheBase
	;Falco lines
	DW DialogIntroFalco,DialogEndingFalco,DialogChasedFalco,DialogSavedFalco
	DW DialogKilledFalco,DialogPhraseAFalco,DialogPhraseBFalco,DialogPhraseCFalco
	DW DialogTargetingFalco,DialogPlayerHitFalco,DialogChasedHit2Falco,DialogSpaceFalco
	DW DialogMonarchDodoraFalco,DialogPlasmaHydraFalco,DialogTunnelFalco,DialogAmoebaFalco
	DW DialogUnusedAFalco,DialogSpoilFalco,DialogPhraseDFalco,DialogUnusedBFalco
	;Peppy lines
	DW DialogIntroPeppy,DialogEndingPeppy,DialogChasedPeppy,DialogSavedPeppy
	DW DialogKilledPeppy,DialogPhraseAPeppy,DialogPhraseBPeppy,DialogPhraseCPeppy
	DW DialogTargetingPeppy,DialogPlayerHitPeppy,DialogChasedHit2Peppy,DialogSpacePeppy
	DW DialogMonarchDodoraPeppy,DialogPlasmaHydraPeppy,DialogTunnelPeppy,DialogAmoebaPeppy
	DW DialogUnusedAPeppy,DialogSpoilPeppy,DialogPhraseDPeppy,DialogUnusedBPeppy
	;Slippy lines
	DW DialogIntroSlippy,DialogEndingSlippy,DialogChasedSlippy,DialogSavedSlippy
	DW DialogKilledSlippy,DialogPhraseASlippy,DialogPhraseBSlippy,DialogPhraseCSlippy
	DW DialogTargetingSlippy,DialogPlayerHitSlippy,DialogChasedHit2Slippy,DialogSpaceSlippy
	DW DialogTunnelSlippy,DialogBossSlippy,DialogAmoebaSlippy,DialogUnusedASlippy
	DW DialogSpoilSlippy,DialogPhraseDSlippy,DialogUnusedBSlippy
	;Misc. lines
	DW DialogStage1Part2Slippy,DialogUnknownPeppy
	;More player lines
	DW DialogArmadaFalco,DialogArmadaPeppy,DialogArmadaSlippy
	DW DialogChasedHit1Falco,DialogChasedHit1Peppy,DialogChasedHit1Slippy
	DW DialogPlayerRescuedFalco,DialogPlayerRescuedPeppy,DialogPlayerRescuedSlippy
	;Misc. line
	DW DialogStage1Part1Slippy
	;Stage clear lines
	DW DialogClear75Falco,DialogClear75Peppy,DialogClear75Slippy
	DW DialogClear50Falco,DialogClear50Peppy,DialogClear50Slippy
	DW DialogClear25Falco,DialogClear25Peppy,DialogClear25Slippy
	;Descriptions
	DW DescriptionCorneria,DescriptionStage2,DescriptionSpaceArmada,DescriptionMeteor
	DW DescriptionVenom1
	;Stage names
	DW LevelNameCorneria,LevelNameAsteroidBelt,LevelNameSectorX,LevelNameFortuna
	DW LevelNameSpaceArmada,LevelNameTitania,LevelNameBlackHole,LevelNameSectorY
	DW LevelNameMeteor,LevelNameSectorZ,LevelNameMacbeth,LevelNameVenom
	DW LevelNameOutOfThisDimension
	;More descriptions
	DW DescriptionTitania,DescriptionSectorY,DescriptionCorneria3,DescriptionAsteroidBelt3
	DW DescriptionFortuna,DescriptionSectorZ,DescriptionMacbeth,DescriptionBlackHole
	DW DescriptionVenom2,DescriptionOutOfThisDimension,DescriptionVenom3
	;Misc. line
	DW DialogStage3Falco
	;Training lines
	DW DialogTrainingAPepper,DialogTrainingPeppy,DialogTrainingBPepper,Dialog5RingsPepper
	DW Dialog10RingsPepper,DialogTrainingSlippy,DialogTrainingFalco,Dialog15RingsPepper
	;Andross lines
	DW DialogVenom1Part1Andross,DialogVenom1Part2Andross,DialogVenom1Part3Andross
	DW DialogVenom2Part1Andross,DialogVenom2Part2Andross,DialogVenom2Part3Andross
	DW DialogVenom3Part1Andross,DialogVenom3Part2Andross,DialogVenom3Part3Andross
	;Misc. lines
	DW DialogUnknownAFalco,DialogUnknownBFalco,DialogUnknownAPeppy,DialogUnknownCFalco
	DW DialogUnknownASlippy
	;Stingray lines
	DW DialogStingrayFalco,DialogStingrayPeppy,DialogStingraySlippy
UnusedDMADataPtr:
	ARCH 65816
