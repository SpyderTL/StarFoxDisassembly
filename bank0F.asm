	;Models
	INCBIN "graphics/models/buildingshort.mdl"
	INCBIN "graphics/models/buildingtall.mdl"
	INCBIN "graphics/models/galacticriderbossdoor.mdl"
	INCBIN "graphics/models/galacticriderbossbody.mdl"
	INCBIN "graphics/models/baseshootingrings.mdl"
	INCBIN "graphics/models/metalsmasherbossbody.mdl"
	INCBIN "graphics/models/truck.mdl"
	INCBIN "graphics/models/bladebarrierbossfan.mdl"
	INCBIN "graphics/models/bladebarrierbossbody.mdl"
	INCBIN "graphics/models/bladebarrierbosstail.mdl"
	INCBIN "graphics/models/unknown_0F9D15.mdl"
	INCBIN "graphics/models/unknown_0F9D3F.mdl"
	INCBIN "graphics/models/unknown_0F9D6F.mdl"
	INCBIN "graphics/models/titaniamountainentry.mdl"
	INCBIN "graphics/models/titaniamountainentrylod.mdl"
	INCBIN "graphics/models/unknown_0FA2DC.mdl"
	INCBIN "graphics/models/titaniamountaintunnelpiece.mdl"
	INCBIN "graphics/models/professorhangerboss.mdl"
	INCBIN "graphics/models/titaniamountaindoor.mdl"
	INCBIN "graphics/models/mountainthinleft.mdl"
	INCBIN "graphics/models/mountainthinright.mdl"
	INCBIN "graphics/models/mountainleft.mdl"
	INCBIN "graphics/models/mountainright.mdl"
	INCBIN "graphics/models/mountainwideleft.mdl"
	INCBIN "graphics/models/mountainwideright.mdl"
	INCBIN "graphics/models/helicopter.mdl"
	INCBIN "graphics/models/mountain.mdl"
	INCBIN "graphics/models/fish.mdl"
	INCBIN "graphics/models/growingleaf.mdl"
	INCBIN "graphics/models/growingflower.mdl"
	INCBIN "graphics/models/unknown_0FBC5B.mdl"
	INCBIN "graphics/models/unknown_0FBE31.mdl"
	INCBIN "graphics/models/unknown_0FC242.mdl"
	INCBIN "graphics/models/unknown_0FC3FE.mdl"
	INCBIN "graphics/models/unknown_0FC439.mdl"
	INCBIN "graphics/models/unknown_0FC474.mdl"
	INCBIN "graphics/models/smallflower.mdl"
	INCBIN "graphics/models/bigflower.mdl"
	INCBIN "graphics/models/unknown_0FCB8A.mdl"
	INCBIN "graphics/models/unknown_0FCD09.mdl"
	INCBIN "graphics/models/crabhead.mdl"
	INCBIN "graphics/models/crablegleft.mdl"
	INCBIN "graphics/models/crablegright.mdl"
	INCBIN "graphics/models/venomentry.mdl"
	INCBIN "graphics/models/unknown_0FD9E5.mdl"
	INCBIN "graphics/models/venomentrydoor.mdl"
	INCBIN "graphics/models/venomentrydoor2.mdl"
	INCBIN "graphics/models/unknown_0FE03C.mdl"
	INCBIN "graphics/models/unknown_0FE0B0.mdl"
	INCBIN "graphics/models/androssbosssquare.mdl"
	INCBIN "graphics/models/androssbosssquare2.mdl"
	INCBIN "graphics/models/androssbosssquare3.mdl"
	INCBIN "graphics/models/androssbossface.mdl"
	INCBIN "graphics/models/androssbossface2.mdl"
	INCBIN "graphics/models/unknown_0FF32A.mdl"
	INCBIN "graphics/models/verticaltunneldoor.mdl"
	INCBIN "graphics/models/armadatunnelupwardpiece.mdl"
	INCBIN "graphics/models/armadatunnelupwardpiece2.mdl"
	INCBIN "graphics/models/armadatunnelupwardpiece2.mdl"
	INCBIN "graphics/models/armadatunneldownwardpiece.mdl"
	INCBIN "graphics/models/armadatunnelpiece.mdl"
	INCBIN "graphics/models/armadatunnelpiece2.mdl"
	INCBIN "graphics/models/armadatunneltwistpiece.mdl"
	
	;Transfer $00F0 bytes to SPC address $3D00
	DW $00F0,$3D00
	;Data to transfer
	DB $00,$FF,$E0,$B8,$03,$40,$01,$FF,$E0,$B8,$03,$10,$02,$FF,$E0,$B8
	DB $02,$B0,$03,$FF,$E0,$B8,$02,$F0,$04,$FF,$E0,$B8,$06,$40,$05,$FF
	DB $E0,$B8,$06,$B0,$06,$FF,$E0,$B8,$03,$B0,$07,$FF,$E0,$B8,$02,$00
	DB $08,$FF,$E0,$B8,$02,$00,$09,$FF,$E0,$B8,$04,$70,$0A,$FF,$E0,$B8
	DB $00,$80,$0B,$FF,$E0,$B8,$03,$C0,$0C,$FF,$E0,$B8,$07,$A0,$0D,$FF
	DB $E0,$B8,$03,$D0,$0E,$FF,$E0,$B8,$05,$B0,$0F,$FF,$E0,$B8,$07,$A0
	DB $10,$FF,$E0,$B8,$07,$A0,$11,$FF,$EC,$B8,$02,$A0,$12,$FF,$E0,$B8
	DB $07,$A0,$13,$FF,$E0,$B8,$03,$C0,$14,$DF,$34,$B8,$02,$00,$15,$F6
	DB $F1,$B8,$02,$00,$16,$FF,$EE,$B8,$02,$00,$17,$FF,$E0,$B8,$05,$B0
	DB $18,$FF,$E0,$B8,$03,$00,$19,$FF,$E0,$B8,$03,$00,$1A,$FF,$E0,$B8
	DB $04,$90,$1B,$FF,$E0,$B8,$07,$A0,$1C,$FF,$ED,$B8,$03,$00,$1D,$FF
	DB $F0,$B8,$03,$00,$1E,$FF,$F6,$B8,$03,$00,$1F,$FF,$E0,$B8,$03,$00
	DB $20,$FE,$E0,$B8,$03,$A0,$21,$FF,$ED,$B8,$03,$C0,$22,$FF,$F3,$B8
	DB $03,$C0,$23,$FF,$F6,$B8,$03,$C0,$24,$FF,$E0,$B8,$03,$C0,$25,$FF
	DB $E0,$B8,$03,$C0,$26,$FF,$E0,$B8,$03,$00,$27,$FF,$E0,$B8,$01,$00
	;Transfer $031A bytes to SPC address $F000
	DW $031A,$F000
	;Data to transfer
	;Music data
	INCBIN "audio/songs/controls.mus"
	;Transfer $0004 bytes to SPC address $FDE2
	DW $0004,$FDE2
	;Data to transfer
	;Music pointers
	DW $F000,$F000
	;End of transfer
	DW $0000,$0400
