;;;;;;;;
;MACROS;
;;;;;;;;
macro BehFuncPtr(Func,Unk03)
	DL Func
	DB Unk03
endmacro

;;;;;;;;;
;STRUCTS;
;;;;;;;;;

struct ObjectList $7E0336
	.Unk00: skip 2
	.Unk02: skip 2
	.ID: skip 2
	
	;0C
	.PosX: skip 2
	.PosY: skip 2
	.PosZ: skip 2
	.RotX: skip 1
	.RotY: skip 1
	.RotZ: skip 1
	
	;2F
	.VelX: skip 2
	.VelY: skip 2
	.VelZ: skip 2
	.Unk35: skip 1
endstruct
