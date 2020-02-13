;;;;;;;;
;MACROS;
;;;;;;;;
;General macros
macro HI8(Label)
	(Label>>16)
endmacro
macro LO16(Label)
	(Label&0xFFFF)
endmacro
macro STACKIFY(Label)
	(Label-1)
endmacro

;For BehaviorFunctionTable
macro BEHFUNCPTR(Func,ModelID)
	DL Func
	DB ModelID
endmacro

;;;;;;;;;;;;;;;;;;
;VARS AND STRUCTS;
;;;;;;;;;;;;;;;;;;

;Zero Page
CurNMITask		= $00
TempX			= $02

TempY			= $08

TempZ			= $90

;Object data ($0336-????)
struct ObjectList $0336
	.Unk00: skip 2
	.Unk02: skip 2
	.ID: skip 2		;04
	.Unk06: skip 2
	.Unk08: skip 2
	.Unk0A: skip 2
	.PosX: skip 2		;0C
	.PosY: skip 2		;0E
	.PosZ: skip 2		;10
	.RotX: skip 1		;12
	.RotY: skip 1		;13
	.RotZ: skip 1		;14
	.Unk15: skip 1
	.BehFunc: skip 3	;16
	.Unk19: skip 2
	.Unk1B: skip 2
	.Unk1D: skip 2
	.Unk1F: skip 2
	.Unk21: skip 2
	.Unk23: skip 2
	.Unk25: skip 2
	.Unk27: skip 2
	.Unk29: skip 2
	.Unk2B: skip 2
	.Unk2D: skip 2
	.VelX: skip 2		;2F
	.VelY: skip 2		;31
	.VelZ: skip 2		;33
	.Unk35: skip 1
endstruct

;Page $12
Pad1HiPrev		= $1201
Pad1HiCur		= $1202
Pad1LoPrev		= $1203
Pad1LoCur		= $1204
Pad2HiPrev		= $1205
Pad2HiCur		= $1206
Pad2LoPrev		= $1207
Pad2LoCur		= $1208
Pad1Down		= $1209
Pad2Down		= $120B

			= $121D
			= $121F
			
			= $1236
			= $1238
			= $123A

SuperFXScreenMode	= $1260
OAMMirror		= $1261

;Page $15
			= $15B9


;Page $16
ScanlineToWaitFor	= $16DB
			= $16F7
ZTimer			= $16FB
LevelScriptPointer	= $16FD

;Page $17
			= $1730
			= $1732
			= $1741

;Page $18
			= $188C
			= $1890
			= $18B2
			= $18B3

;Page $19

;Page $1E

;Page $1F
			= $1F13
			= $1F3F
			= $1F41
			= $1F47
			= $1F63
			= $1F65
LevelScriptBank		= $1FF4

;Bank $7E High

