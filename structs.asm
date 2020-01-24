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

struct Object
	DW Unk00
	DW Unk02
	DW ID
	
	;0C
	DW PosX
	DW PosY
	DW PosZ
	DB RotX
	DB RotY
	DB RotZ
	
	;2F
	DW VelX
	DW VelY
	DW VelZ
	DB Unk35
endstruct
