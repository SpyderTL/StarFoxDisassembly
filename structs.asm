;;;;;;;;
;MACROS;
;;;;;;;;
macro BehFuncPtr(Func,Unk03)
	DL Func
	DB ModelID
endmacro

;;;;;;;;;
;STRUCTS;
;;;;;;;;;

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
