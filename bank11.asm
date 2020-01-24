

b11s7VtxData_Square:		;11F06A
	DB $38,$02		;Two X-mirrored vertex pairs (8-bit)
	DB $64,$64,$00
	DB $9C,$9C,$00
	DB $04,$04		;Four 8-bit vertices
	DB $20,$08,$00
	DB $E0,$08,$00
	DB $E0,$F8,$00
	DB $20,$F8,$00
	DB $0C			;End
b11s8FaceData_AndrossSquare:	;11F082
	DB $30,$02		;Two BSP/normal triangles
	DB $02,$03,$00
	DB $00,$03,$02
	DB $14			;Start actual faces
	DB $04,$00,$00,$00,$00,$7F,$02,$03,$00,$01
	DB $04,$01,$01,$00,$00,$81,$03,$02,$01,$00
	DB $FE,$00		;End?
b11s8FaceData_BlackHoleBBS:	;11F0A1
	DB $30,$02		;Two BSP/normal triangles
	DB $02,$03,$00
	DB $00,$03,$02
	DB $14			;Start actual faces
	DB $04,$00,$00,$00,$00,$7F,$02,$03,$00,$01
	DB $04,$01,$01,$00,$00,$81,$01,$00,$03,$02
	DB $FE,$00		;End?
