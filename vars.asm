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
;For calls to DoJumpTable
macro JUMPTABLE(FuncPtr)
	DB BANKOF(STACKIFY(FuncPtr))
	DW STACKIFY(FuncPtr)
	DB $00
endmacro

;;;;;;;;;;;;;;;;;;
;VARS AND STRUCTS;
;;;;;;;;;;;;;;;;;;
;Zero Page ($00)
CurNMITask		= $00	;byte
TempPtr			= $02	;long
TempVecX		= $02	;word
TempVecXB		= $04	;word
TempVecY		= $08	;word
TempVecYB		= $0A	;word
			= $0C	;word
BG1HOFSMirror		= $10	;word
BG1VOFSMirror		= $12	;word
			= $14	;word
			= $16	;word
BG1HorizScrollSpeed	= $18	;word
BG1VertScrollSpeed	= $1A	;word
			= $1C	;word
			= $1E	;word
			= $20	;word
			= $22	;word
			= $24	;word
			= $2A	;word
			= $2C	;word
			= $2E	;word
			= $30	;word
			= $32	;word
			= $34	;word
			= $36	;word
			= $38	;word
TempSelf		= $3A	;word
			= $3C	;word
			= $3E	;word
			= $42	;byte
			= $43	;byte
SCBRMirror		= $44	;word
UnusedSCBRMirror	= $46	;word
BG12NBAMirror		= $4A	;word
BG12NBAMirror2		= $4C	;word
TempJptPtr		= $53	;long
			= $56	;byte
TempScrBWPtr		= $5D	;long
TempDbgFontCtr		= $60	;byte
TempMultiplicand	= $63	;word
TempMultiplier		= $65	;byte
TempProduct		= $66	;word
TempZero		= $68	;word
			= $6C	;word
			= $6E	;word
CrosshairX		= $72	;word
CrosshairY		= $74	;word
TempRegX		= $76	;word
TempRegY		= $78	;word
TempSin			= $7A	;byte
TempCos			= $7B	;byte
TempRotZ		= $7E	;byte
TempSinB		= $82	;byte
TempCosB		= $83	;byte
			= $84	;word
			= $86	;word
			= $88	;word
			= $8A	;word
TempVecZ		= $90	;word
			= $92	;word
Unused_95		= $95	;byte
Unused_98		= $98	;byte
Unused_99		= $99	;byte
Unused_9B		= $9B	;byte
			= $9C	;byte
Unused_9D		= $9D	;byte
			= $B3	;word
			= $B5	;word
			= $B7	;word
Unused_B9		= $B9	;byte
			= $C1	;word
			= $C3	;word
			= $C5	;word
			= $CA	;word
			= $CC	;word
Unused_DC		= $DC	;byte
			= $EF	;byte
			= $F0	;byte
			= $F1	;byte
			= $F2	;byte
			= $F6	;word
			= $F8	;word
TempLdAudPtr		= $FA	;long
			= $FD	;byte

;Object data
;This is an open doubly linked list,
;where each entry points to the previous/next one.
;Space is available for 70 objects.
struct ObjectList	  $0336
	.NextObj: skip 2	;00
	.PrevObj: skip 2	;02
	.ID: skip 2		;04
	.SwarmPtr: skip 2	;06
	.Flags08: skip 1	;08
	.Flags09: skip 1	;09
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
	.Unk19: skip 2
	.Unk1B: skip 2
	.Flags1D: skip 1	;1D
	.Flags1E: skip 1	;1E
	.Flags1F: skip 1	;1F
	.Flags20: skip 1
	.Unk21: skip 1
	.ChildIdx: skip 1	;22
	.Unk23: skip 1
	.Unk24: skip 1
	.Unk25: skip 1
	.WParam26: skip 2	;26
	.WParam28: skip 2	;28
	.HP: skip 1		;2A
	.Power: skip 1		;2B
	.Unk2C: skip 1
	.Unk2D: skip 1
	.Flags2E: skip 1	;2E
	.VelX: skip 2		;2F
	.VelY: skip 2		;31
	.VelZ: skip 2		;33
	.Unk35: skip 1
endstruct
;Flags
FLAGS08_UNK10		= $10
FLAGS08_UNK08		= $08
FLAGS08_UNK04		= $04
FLAGS08_UNK02		= $02
FLAGS08_UNK01		= $01

FLAGS09_HASDESTROYFUNC	= $10
FLAGS09_UNK08		= $08
FLAGS09_UNK02		= $02
FLAGS09_DISPBEHIND	= $01

FLAGS1D_ISCOLI		= $80

FLAGS1D_DISPSHADOW	= $08

FLAGS1D_SPAWNRING	= $01

FLAGS1E_UNK02		= $02
FLAGS1E_UNK01		= $01

FLAGS1F_UNK08		= $08

FLAGS20_ISPARENT	= $40

FLAGS1F_ISCHILD		= $10

FLAGS2E_UNK04		= $04


;Page $12
FrameTimer		= $1200	;byte
Pad1HiPrev		= $1201	;byte
Pad1HiCur		= $1202	;byte
Pad1LoPrev		= $1203	;byte
Pad1LoCur		= $1204	;byte
Pad2HiPrev		= $1205	;byte
Pad2HiCur		= $1206	;byte
Pad2LoPrev		= $1207	;byte
Pad2LoCur		= $1208	;byte
Pad1Down		= $1209	;word
Pad2Down		= $120B	;word
HDMAENMirror		= $120E	;byte
FirstObject		= $121D	;word
FirstFreeObject		= $121F	;word
PlayerAngX		= $1230	;word
PlayerAngY		= $1232	;word
PlayerAngZ		= $1234	;word
PlayerTempObject	= $1236	;word
PlayerObject		= $1238	;word
CurProcObject		= $123A	;word
BehFuncTemp		= $1242	;long
			= $1248	;long
			= $1250	;word
			= $1258	;word
			= $125A	;word
			= $125C	;word
SCMRMirror		= $1260	;byte
OAMBuffer		= $1261 ;byte array of size $220

;Page $14
			= $14C1	;byte
			= $14C2	;byte
			= $14C3	;byte
			= $14C4	;byte
			= $14C5	;byte
			= $14C6	;byte
			= $14C9	;byte
FirstCandidate		= $14CA	;word
			= $14CC	;byte
			= $14CD	;word
			= $14D0	;byte
			= $14D1	;byte
			= $14D2	;byte
			= $14D3	;byte
			= $14D5	;byte
			= $14D6	;byte
			= $14D7	;byte
			= $14D8	;byte
			= $14D9	;byte
			= $14DA	;byte
CurViewMode		= $14DB	;byte
MaxViewMode		= $14DC	;byte
			= $14DD	;byte
			= $14DE	;byte
			= $14DF	;byte
			= $14E0	;byte
			= $14E3	;byte
			= $14E4	;byte
			= $14E6	;word
			= $14E8	;word
			= $14EA	;word
			= $14EC	;word
			= $14EE	;word
			= $14F0	;byte
			= $14F1	;byte
			= $14F2	;byte
			= $14F3	;byte
			= $14F4	;word
MusicLoaded		= $14F6	;byte
MusicID			= $14F7	;byte
			= $14F8	;word
			= $14FA	;word
			= $14FC	;word
			= $14FE	;word

;Page $15
			= $1500	;byte
			= $1501	;byte
			= $1502	;byte
			= $1503	;word
			= $1505	;word
			= $1507	;word
			= $1509	;word
			= $150B	;byte
			= $150C	;byte
			= $150D	;word
			= $150F	;word
			= $1511	;word
TempObjX		= $1513	;word
TempObjY		= $1515	;word
TempObjZ		= $1517	;word
			= $151B	;word
			= $151D	;word
			= $151F	;word
			= $1521	;word
			= $1523	;byte
			= $1524	;byte
			= $1525	;byte
			= $1526	;byte
			= $1527	;byte
			= $1528	;byte
			= $1529	;byte
			= $152A	;byte
			= $152B	;byte
			= $152C	;byte
			= $152D	;byte
			= $152E	;byte
			= $152F	;byte
			= $1530	;byte
			= $1531	;byte
			= $1532	;word
			= $1534	;word
			= $1536	;word
			= $1538	;word
			= $153A	;word
			= $153C	;word
			= $153E	;word
			= $1540	;word
			= $1542	;word
			= $1545	;byte
			= $1547	;byte
			= $1549	;byte
			= $154B	;byte
			= $154C	;byte
			= $154D	;byte
			= $154E	;byte
			= $154F	;byte
			= $1551	;byte
			= $1552	;byte
			= $1553	;byte
			= $1554	;word
			= $1556	;word
			= $1558	;word
			= $155A	;word
			= $155C	;byte
			= $155D	;word
			= $155F	;word
			= $1561	;word
			= $1563	;word
			= $1565	;word
			= $1567	;word
			= $1569	;byte
			= $156A	;byte
			= $156B	;word
			= $156E	;byte
			= $156F	;word
			= $1571	;word
			= $1573	;word
			= $1575	;word
			= $1577	;word
			= $1579	;word
			= $157B	;word
			= $157D	;word
			= $157F	;word
			= $1581	;word
			= $1583	;word
			= $1585	;word
			= $1589	;word
			= $158B	;word
			= $158D	;word
TempXYManhattanDistance	= $158F	;word
			= $1591	;word
			= $1593	;word
			= $1595	;word
			= $1597	;word
			= $159E	;word
			= $15A0	;byte
			= $15A1	;byte
			= $15A2	;word
			= $15A4	;byte
			= $15A5	;byte
TempRotX		= $15A6	;byte
TempRotY		= $15A7	;byte
			= $15A8	;byte
			= $15AB	;byte
			= $15AC	;byte
NovaBombs		= $15AD	;word
OAMBufferPtr		= $15AF	;word
			= $15B1	;word
			= $15B3	;word
			= $15B5	;word
			= $15B8	;byte
StageNumTextTimer	= $15B9	;byte
			= $15BB	;word
			= $15BF	;byte
TempVecZB		= $15C2	;word
TempSinD		= $15C6	;byte
TempCosD		= $15C7	;byte
			= $15CA	;word
			= $15D7	;Matrix
TempSinC		= $15F3	;byte
TempCosC		= $15F4	;byte

;Page $16
			= $1609	;Matrix
			= $161B	;Matrix
			= $162D	;word
			= $162F	;word
			= $1631	;word
			= $1633	;word
			= $1635	;word
			= $1637	;word
			= $1639	;Matrix
			= $164B	;byte
			= $164C	;byte
VerticalScrollBase	= $169C	;word
VerticalScrollBase2	= $169E	;word
			= $16A0	;word
			= $16A2	;byte
			= $16A3	;byte
			= $16A4	;byte
			= $16A5	;byte
			= $16A6	;byte
			= $16A7	;word
			= $16A9	;word
			= $16AB	;word
			= $16AD	;word
			= $16AF	;word
			= $16B1	;word
			= $16B3	;word
			= $16B5	;byte
			= $16B6	;byte
			= $16B7	;byte
			= $16B8	;byte
			= $16B9	;byte
			= $16BA	;byte
			= $16BB	;byte
			= $16BC	;byte
			= $16BD	;byte
			= $16BE	;byte
			= $16BF	;byte
			= $16C0	;byte
			= $16C1	;byte
			= $16C2	;byte
			= $16C3	;byte
			= $16C5	;word
			= $16C7	;word
EngineSoundFlag		= $16C9	;byte
			= $16CD	;byte
			= $16DE	;word
			= $16D0	;word
			= $16D2	;word
			= $16D4	;word
StageID			= $16D6	;word
TempLevelID		= $16D8	;word
ScanlineToWaitFor	= $16DB	;word
			= $16DD	;word
Unknown_16DF		= $16DF	;word
Unknown_16E1		= $16E1	;word
			= $16E4	;word
			= $16E6	;word
			= $16E8	;word
			= $16EA	;word
Lives			= $16EC	;byte
			= $16ED	;byte
FGTiltFlag		= $16F1	;byte
			= $16F2	;word
			= $16F4	;word
			= $16F6	;byte
CurScriptObject		= $16F7	;word
PointEffect		= $16F9	;word
ZTimer			= $16FB	;word
LevelScriptPointer	= $16FD	;lo16 word of long
			= $16FF	;word

;Page $17
ZTimerVel		= $1701	;word
ScriptCallStack		= $1703	;long array of size 15
ScriptCallStackPtr	= $1730	;word
ScriptCallStackSz	= $1732	;word
			= $1734	;word
			= $1736	;word
Unknown_173C		= $173C	;byte
CheckpointScriptPointer	= $173D	;lo16 word of long
TempScriptPointer	= $173F	;lo16 word of long
Preset			= $1741	;word
			= $1743	;byte array of size 8
			= $174B	;byte array of size 8
			= $1753	;word
NumObjectsWithID	= $1755	;word
			= $1757	;word
			= $1759	;word
			= $175B	;word
			= $175D	;word
			= $175F	;word
			= $1761	;word
			= $1769	;word
			= $176B	;byte
			= $176D	;byte
			= $176E	;byte
			= $176F	;byte
			= $1770	;byte
CheckpointPreset	= $1772	;word
			= $1774	;word
			= $1777	;word
			= $177A	;byte
Unused_177E		= $177E	;word
Unused_1780		= $1780	;word
			= $1782	;byte
PresetSettings		= $1785	;byte
			= $1786	;long
PaletteBuffer		= $1789	;byte array of size $100

;Page $18
			= $188A	;word
			= $188C	;word
			= $188E	;word
			= $1890	;word
			= $1892	;long
			= $1895	;word
SuperFXPalette		= $1897	;byte
Continues		= $1898	;byte
			= $189A	;byte
			= $189B	;word
			= $189D	;byte
			= $189E	;byte
			= $189F	;byte
			= $18A0	;byte
			= $18A1	;byte
			= $18A2	;byte
			= $18A3	;byte
			= $18A4	;byte
			= $18A5	;word
			= $18A7	;word
			= $18A9	;byte
			= $18AC	;byte
			= $18AD	;byte
FadeMode		= $18B2	;byte
FadeTimer		= $18B3	;byte
			= $18B4	;word
			= $18B6	;word
			= $18B8	;byte
BG3HOFSMirror		= $18B9	;word
			= $18BB	;byte
			= $18C2	;byte
			= $18C5	;word
			= $18C7	;word
			= $18C9	;word
			= $18CB	;word
			= $18CD	;byte array of size $40

;Page $19
VerticalScroll		= $194D	;word
			= $194F	;word
			= $1951	;word
Unknown_1953		= $1953	;byte
BGTiltFlag		= $1954	;byte
Unknown_1955		= $1955	;byte
			= $1956	;byte
			= $1957	;word
			= $195F	;word
			= $1962	;byte

;Page $1E
			= $1EE5	;word
Unknown_1EE9		= $1EE9	;word
Unknown_1EEB		= $1EEB	;word
Unknown_1EED		= $1EED	;word
Unknown_1EEF		= $1EEF	;word
			= $1EF1	;byte
			= $1EF2	;word
			= $1EF4	;word
			= $1EF6	;word
			= $1EF8	;byte
			= $1EF9	;byte
			= $1EFA	;byte
			= $1EFB	;word
			= $1EFD	;word
			= $1EFF	;word

;Page $1F
			= $1F03	;word
Unknown_1F05		= $1F05	;byte
			= $1F07	;byte
			= $1F08	;byte
			= $1F09	;word
			= $1F0B	;byte
			= $1F0C	;byte
			= $1F0D	;byte
			= $1F0E	;byte
			= $1F0F	;byte
			= $1F10	;byte
			= $1F11	;word
Unknown_1F13		= $1F13	;word
			= $1F15	;word
			= $1F17	;word
			= $1F19	;word
			= $1F1B	;word
			= $1F1D	;word
			= $1F1F	;word
			= $1F21	;word
			= $1F23	;word
			= $1F25	;byte
			= $1F26	;byte
			= $1F27	;byte
			= $1F28	;byte
			= $1F29	;byte
			= $1F2A	;byte
			= $1F2B	;byte
			= $1F2C	;byte
			= $1F2D	;byte
			= $1F2E	;byte
			= $1F2F	;byte
			= $1F30	;byte
			= $1F31	;word
			= $1F33	;word
BG2VOFSMirror		= $1F35	;word
BG2HOFSMirror		= $1F37	;word
			= $1F39	;word
			= $1F3B	;word
			= $1F3D	;word
TempLdAudioBnkOffs	= $1F3F	;word
			= $1F41	;word
			= $1F43	;byte
			= $1F44	;word
			= $1F46	;byte
			= $1F47	;byte
			= $1F48	;byte array of size $05
SEQueuePtr		= $1F4D	;byte
SEQueuePtrOld		= $1F4F	;byte
			= $1F51	;byte
			= $1F52	;byte
SoundEffectQueue	= $1F53	;byte array of size $10
TempLdAudioPktOffs	= $1F63	;word
InitDataSentFlag	= $1F65	;byte
			= $1F66	;word
			= $1F68	;byte
			= $1F69	;word (array???)
			= $1F6B	;word (same array as above with offset???)
			= $1FBB	;word
			= $1FC6	;byte
			= $1FC7	;byte
			= $1FC8	;byte
			= $1FC9	;word
			= $1FCB	;word
			= $1FCD	;byte
			= $1FCE	;byte
			= $1FCF	;byte
			= $1FD0	;byte
			= $1FD1	;byte
			= $1FD2	;word
			= $1FD4	;word
			= $1FD6	;word
			= $1FD8	;word
			= $1FDA	;byte
			= $1FDB	;word
			= $1FDD	;byte
			= $1FDE	;byte
			= $1FDF	;byte
			= $1FE0	;byte
			= $1FE1	;byte
			= $1FE2	;byte
			= $1FE4	;byte
			= $1FE5	;byte
			= $1FE6	;byte
			= $1FE8	;word
			= $1FEA	;word
			= $1FEC	;word
			= $1FEE	;byte
			= $1FEF	;word
			= $1FF1	;byte
UnusedBGColor		= $1FF2	;word
LevelScriptBank		= $1FF4	;hi8 byte of long
CheckpointScriptBank	= $1FF5	;hi8 byte of long
TempScriptBank		= $1FF6	;hi8 byte of long
			= $1FF7	;word
			= $1FF9	;byte
			= $1FFA	;byte
			= $1FFB	;byte
			= $1FFC	;byte
LevelID			= $1FFD	;byte
			= $1FFE	;word

;Bank $70 (first 2 pages)
CurVtxPtr		= $70001E	;word
DesiredXRot		= $700020	;word
DesiredYRot		= $700022	;word
DesiredZRot		= $700024	;word
OutputVecX		= $700026	;word
OutputVecY		= $700028	;word
OutputVecZ		= $70002A	;word
InputVecY		= $70002C	;word
InputVecZ		= $70002E	;word
			= $700044
			= $700046
BSPTreePtr		= $700056	;word
			= $70005C
			= $70005E
InputVecX		= $700062	;word
InputPtr		= $700062	;long
			= $70006C
			= $700090
			
			
struct CalculatedMatrix	  $7000D2	;Matrix
	.XX: skip 2
	.YX: skip 2
	.ZX: skip 2
	.XY: skip 2
	.YY: skip 2
	.ZY: skip 2
	.XZ: skip 2
	.YZ: skip 2
	.ZZ: skip 2
endstruct
struct TransformMatrix	  $700120	;Matrix
	.XX: skip 2
	.YX: skip 2
	.ZX: skip 2
	.XY: skip 2
	.YY: skip 2
	.ZY: skip 2
	.XZ: skip 2
	.YZ: skip 2
	.ZZ: skip 2
endstruct
TotalVtxCnt		= $700132	;word
			= $700142
			= $700144
			= $700146
			= $700148
			= $70014A
			= $70014C
			= $700150
			= $700152
EnemyHPBarMax		= $70019A	;word
EnemyHPBarCur		= $70019C	;word

;Bank $70 high
RenderHUDFlag		= $70021C	;word
BSPTreeStack		= $700B02	;??? array of size ???
CopiedDebugFont		= $701A2C
DecompressedTileset	= $702800	;byte array of size ???
DecompressedTilemap	= $704000	;byte array of size ???
RenderedTiles		= $702C00	;byte array of size ???
			= $705600	;byte array of size ???

;Bank $7E high
struct Object2List $7E2000
	.Unk00: skip 2
	.Unk02: skip 2
	.Unk04: skip 2
	.OnDestroy: skip 3	;06
	.OnColi: skip 3		;09
	.Unk0C: skip 3
	.Unk0F: skip 3
	.Unk12: skip 1
	.Unk13: skip 2
	.Unk15: skip 1
	.Unk16: skip 1
	.Unk17: skip 1
	.Unk18: skip 1
	.Unk19: skip 1
	.Unk1A: skip 2
	.Unk1C: skip 1
	.Unk1D: skip 1
	.Unk1E: skip 1
	.Unk1F: skip 1
	.Unk20: skip 2
	.Unk22: skip 1
	.Unk23: skip 1
	.Unk24: skip 1
	.Unk25: skip 1
	.Unk26: skip 1
	.Unk27: skip 1
	.Unk28: skip 2
	.Unk2A: skip 1
	.Unk2B: skip 1
	.Unk2C: skip 2
	.Unk2E: skip 2
	.Unk30: skip 1
	.Unk31: skip 1
	.Unk32: skip 1
	.Unk33: skip 1
	.Unk34: skip 1
	.Unk35: skip 1
endstruct
Object2ListRel		= (Object2List-($7E0000|ObjectList))
			= $7E2EC4	;word
			= $7E2EC6	;word
			= $7E2EC8	;word
			= $7E2ECA	;word
			= $7E2ECC	;word
			= $7E9F55	;word array of size ???
			= $7EA058	;word
			= $7EA05A	;word
			= $7EA05C	;word
			= $7EA05E	;word
CheckpointStackPtr	= $7EA061	;long
CheckpointCallStack	= $7EA065	;long array of size 15
			= $7EA092	;byte array of size 8
			= $7EA09A	;byte array of size 8
			= $7EA0A2	;word
			= $7EA0A4	;word
			= $7EA0A6	;word
			= $7EA0A8	;word
Unknown_7EF0C9		= $7EF0C9	;word

;Bank $7F

;SPC700 address space

SPCTempKOF		= $0E	;byte

SPCTempAddr		= $14	;word
SPCPitch		= $16	;word

SPCMuteChan		= $1A	;byte


SPCCurChanPtrs		= $30	;word array of size 8


SPCTempKON		= $45	;byte
SPCTempKOF2		= $46	;byte
SPCCurChan		= $47	;byte
SPCTempFLG		= $48	;byte
SPCTempNON		= $49	;byte
SPCTempEON		= $4A	;byte
SPCTempPMON		= $4B	;byte


SPCTempEFB		= $4E	;byte

SPCMstXpose		= $50	;byte

;SPCMstVol		= $58	;byte?


SPCTempEVOLLeft		= $61	;byte

SPCTempEVOLRight	= $63	;byte



;SPCVolFade		= $90	;byte
SPCPanFade		= $91	;byte


			= $C0	;??? array of size ???




SPCPan			= $330	;word array of size 8


SPCMusPtrBase		= $FDC0


