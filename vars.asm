;;;;;;;;
;MACROS;
;;;;;;;;
;General macros
macro BANKOF(Label)
	(Label>>16)
endmacro
macro STACKIFY(Label)
	(Label-1)
endmacro

;For BehaviorFunctionTable
macro BEHFUNCPTR(FuncPtr,ModelID)
	DL FuncPtr
	DB ModelID
endmacro
;For PresetFunctionTable
macro PRESETFUNCPTR(FuncPtr)
	DB $00,$00,$00
	DB BANKOF(FuncPtr)
	DW FuncPtr
endmacro
;For calls to CODE_09BADE
macro JUMPTABLE(FuncPtr)
	DB BANKOF(FuncPtr)
	DW FuncPtr
	DB $00
endmacro

;;;;;;;;;;;;;;;;;;
;VARS AND STRUCTS;
;;;;;;;;;;;;;;;;;;

;Zero Page ($00)
CurNMITask		= $00
TempPresetFuncPtr	= $02
TempVecX		= $02

TempVecY		= $08

TempSelf		= $3A

SavedIndX		= $76
SavedIndY		= $78
TempSinIndY		= $7A
TempCosIndY		= $7B

TempSin			= $82
TempCos			= $83

TempVecZ		= $90

;Object data
;This is an open doubly linked list,
;where each entry points to the previous/next one.
;Space is available for 70 objects.
struct ObjectList $0336
	.NextObj: skip 2	;00
	.PrevObj: skip 2	;02
	.ID: skip 2		;04
	.Unk06: skip 1
	.Unk07: skip 1
	.Unk08: skip 1
	.Unk09: skip 1
	.Unk0A: skip 1
	.Unk0B: skip 1
	.PosX: skip 2		;0C
	.PosY: skip 2		;0E
	.PosZ: skip 2		;10
	.RotX: skip 1		;12
	.RotY: skip 1		;13
	.RotZ: skip 1		;14
	.Unk15: skip 1
	.BehFunc: skip 3	;16
	.Unk19: skip 1
	.Unk1A: skip 1
	.Unk1B: skip 1
	.Unk1C: skip 1
	.Unk1D: skip 1
	.Unk1E: skip 1
	.Unk1F: skip 1
	.Unk20: skip 1
	.Unk21: skip 1
	.Unk22: skip 1
	.Unk23: skip 1
	.Unk24: skip 1
	.Unk25: skip 1
	.Unk26: skip 1
	.Unk27: skip 1
	.Unk28: skip 1
	.Unk29: skip 1
	.HP: skip 1		;2A
	.Unk2B: skip 1
	.Unk2C: skip 1
	.Unk2D: skip 1
	.Unk2E: skip 1
	.VelX: skip 2		;2F
	.VelY: skip 2		;31
	.VelZ: skip 2		;33
	.Unk35: skip 1
endstruct
;Flags


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

			= $120E

FirstObject		= $121D
LastObject		= $121F
			
			= $1236
			= $1238
			= $123A

SuperFXScreenMode	= $1260
;$0220 bytes long
OAMMirror		= $1261

;Page $14
FirstCandidate		= $14CA
TrueZVel		= $14EA
RailOffset		= $14F4

;Page $15
			= $15A6
			= $15A7
NovaBombs		= $15AD
			= $15B9


;Page $16
Lives			= $16AE
StageID			= $16D6
LevelID			= $16D8
ScanlineToWaitFor	= $16DB
			= $16F7
ZTimer			= $16FB
LevelScriptPointer	= $16FD

;Page $17
			= $1730
			= $1732
Preset			= $1741

;Page $18
			= $188C
			= $1890
			= $18B2
			= $18B3

;Page $19
;Page $1A
;Page $1B
;Page $1C
;Page $1D
;Page $1E

;Page $1F
			= $1F13
			= $1F35
			= $1F37
			= $1F3F
			= $1F41
			= $1F47
			= $1F63
			= $1F65
LevelScriptBank		= $1FF4

;Bank $70 (first 2 pages)


;Bank $70 high


;Bank $7E high

