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
;For ProjectileFunctionTable
macro PROJFUNCPTR(Unk00,FuncPtr)
	DW Unk00
	DL FuncPtr
	DB $00
endmacro

;;;;;;;;;;;;;;;;;;
;VARS AND STRUCTS;
;;;;;;;;;;;;;;;;;;
;Zero Page ($00)
CurNMITask		= $00	;byte
Unknown_01		= $00	;byte
TempPtr			= $02	;long
TempVecXG		= $02	;word
TempVecXL		= $04	;word
TempVecYG		= $08	;word
TempVecYL		= $0A	;word
Unknown_0C		= $0C	;word
MapScrollX		= $10	;word
MapScrollY		= $12	;word
ContineCursPos		= $12	;word
Unknown_14		= $14	;word
Unknown_16		= $16	;word
MapScrollXSpeed		= $18	;word
ContinueArwingXRotSpd	= $18	;word
MapScrollYSpeed		= $1A	;word
ContinueArwingYRotSpd	= $1A	;word
Unknown_1C		= $1C	;word
Unknown_1E		= $1E	;word
Unknown_20		= $20	;word
Unknown_22		= $22	;word
Unknown_24		= $24	;word
Unknown_2A		= $2A	;word
Unknown_2C		= $2C	;word
Unknown_2E		= $2E	;word
Unknown_30		= $30	;word
Unknown_32		= $32	;word
Unknown_34		= $34	;byte
Unknown_36		= $36	;word
Unknown_38		= $38	;word
TempMiscX		= $3A	;word
TempMiscY		= $3C	;word
TempMiscZ		= $3E	;word
Unknown_42		= $42	;byte
Unknown_43		= $43	;byte
SCBRMirror		= $44	;word
UnusedSCBRMirror	= $46	;word
BG12NBAMirror		= $4A	;word
BG12NBAMirror2		= $4C	;word
TempJptPtr		= $53	;long
Unknown_56		= $56	;byte
TempScrBWPtr		= $5D	;long
TempDbgFontCtr		= $60	;byte
TempMultiplicand	= $63	;word
TempMultiplier		= $65	;byte
TempProduct		= $66	;word
TempZero		= $68	;word
Unknown_6C		= $6C	;word
Unknown_6E		= $6E	;word
Unknown_72		= $72	;word
Unknown_74		= $74	;word
TempRegX		= $76	;word
TempRegY		= $78	;word
TempSin			= $7A	;byte
TempCos			= $7B	;byte
TempRotZ		= $7E	;byte
TempSinB		= $82	;byte
TempCosB		= $83	;byte
Unknown_84		= $84	;word
Unknown_86		= $86	;word
Unknown_88		= $88	;word
Unused_8A		= $8A	;byte
Unused_8B		= $8B	;byte
TempVecZG		= $90	;word
Unused_92		= $92	;byte
Unused_95		= $95	;byte
Unused_98		= $98	;byte
Unused_99		= $99	;byte
Unused_9B		= $9B	;byte
Unknown_9C		= $9C	;byte
Unused_9D		= $9D	;byte
Unknown_B3		= $B3	;word
Unknown_B5		= $B5	;word
Unknown_B7		= $B7	;word
Unused_B9		= $B9	;byte
Unknown_C1		= $C1	;word
Unknown_C3		= $C3	;word
Unknown_C5		= $C5	;word
Unknown_CA		= $CA	;word
Unknown_CC		= $CC	;word
Unused_DC		= $DC	;byte
PRNGBuffer		= $EF	;byte array of size 4
Unknown_F6		= $F6	;word
Unknown_F8		= $F8	;word
TempLdAudPtr		= $FA	;long
Unknown_FD		= $FD	;byte

;Object data
;This is an open doubly linked list,
;where each entry points to the previous/next one.
;Space is available for 70 objects.
struct ObjectList	  $0336
	.NextObj: skip 2	;00
	.PrevObj: skip 2	;02
	.ID: skip 2		;04
	.Swarm_Target: skip 2	;06
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
	.RotZ2: skip 1		;15
	.BehFunc: skip 3	;16
	.Unk19: skip 2
	.Unk1B: skip 2
	.Flags1D: skip 1	;1D
	.Flags1E: skip 1	;1E
	.Flags1F: skip 1	;1F
	.Flags20: skip 1	;20
	.Unk21: skip 1
	.ChildIdx: skip 1	;22
	.Unk23: skip 1
	.Unk24: skip 1
	.Unk25: skip 1
	.WParam26: skip 2	;26
	.BehScriptPtr: skip 2	;28
	.HP: skip 1		;2A
	.Power: skip 1		;2B
	.ProjType: skip 1	;2C
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
FLAGS1D_UNK40		= $40
FLAGS1D_UNK20		= $20
FLAGS1D_DISPSHADOW	= $08
FLAGS1D_SPAWNRING	= $01
FLAGS1E_UNK80		= $80
FLAGS1E_UNK40		= $40
FLAGS1E_UNK20		= $20
FLAGS1E_UNK10		= $10
FLAGS1E_UNK02		= $02
FLAGS1E_UNK01		= $01
FLAGS1F_UNK80		= $80
FLAGS1F_UNK20		= $20
FLAGS1F_UNK10		= $10
FLAGS1F_UNK08		= $08
FLAGS1F_UNK04		= $04
FLAGS1F_UNK02		= $02
FLAGS20_ISPARENT	= $40
FLAGS20_ISCHILD		= $10
FLAGS20_UNK08		= $08
FLAGS20_UNK01		= $01
FLAGS2E_UNK10		= $10
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
Unknown_1248		= $1248	;byte
Unused_1249		= $1249	;byte
Unused_124A		= $124A	;byte
Unknown_1250		= $1250	;word
Unknown_1258		= $1258	;word
Unknown_125A		= $125A	;word
Unknown_125C		= $125C	;word
SCMRMirror		= $1260	;byte
OAMBuffer		= $1261 ;byte array of size $220

;Page $14
UnkBuf_1489		= $1489	;byte array of size 8?
UnkBuf_1491		= $1491	;byte array of size 8?
UnkBuf_14A9		= $14A9	;byte array of size 8?
UnkBuf_14B1		= $14B1	;byte array of size 8?
Unknown_14C1		= $14C1	;byte
Unknown_14C2		= $14C2	;byte
Unknown_14C3		= $14C3	;byte
Unknown_14C4		= $14C4	;byte
TempMiscW		= $14C5	;word
Unknown_14C9		= $14C9	;byte
FirstCandidate		= $14CA	;word
Unknown_14CC		= $14CC	;byte
Unknown_14CD		= $14CD	;word
Unknown_14D0		= $14D0	;byte
Unknown_14D1		= $14D1	;byte
Unknown_14D2		= $14D2	;byte
Unknown_14D3		= $14D3	;byte
Unknown_14D5		= $14D5	;byte
Unknown_14D6		= $14D6	;byte
Unknown_14D7		= $14D7	;byte
Unknown_14D8		= $14D8	;byte
Unknown_14D9		= $14D9	;byte
Unknown_14DA		= $14DA	;byte
CurViewMode		= $14DB	;byte
MaxViewMode		= $14DC	;byte
Unknown_14DD		= $14DD	;byte
Unknown_14DE		= $14DE	;byte
Unknown_14DF		= $14DF	;byte
Unknown_14E0		= $14E0	;byte
Unknown_14E3		= $14E3	;byte
Unknown_14E4		= $14E4	;byte
Unknown_14E6		= $14E6	;word
Unknown_14E8		= $14E8	;word
Unknown_14EA		= $14EA	;word
Unknown_14EC		= $14EC	;byte
ArwingIdleTimer		= $14EE	;word
Unknown_14F0		= $14F0	;byte
Unknown_14F1		= $14F1	;byte
Unknown_14F2		= $14F2	;byte
Unknown_14F3		= $14F3	;byte
Unknown_14F4		= $14F4	;word
Unknown_14F6		= $14F6	;word
Unknown_14F8		= $14F8	;word
Unknown_14FA		= $14FA	;word
Unknown_14FC		= $14FC	;word
Unknown_14FE		= $14FE	;word

;Page $15
Unknown_1500		= $1500	;byte
Unknown_1501		= $1501	;byte
Unknown_1502		= $1502	;byte
Unknown_1503		= $1503	;word
Unknown_1505		= $1505	;word
Unknown_1507		= $1507	;byte
Unknown_1508		= $1508	;byte
Unknown_1509		= $1509	;word
Unknown_150B		= $150B	;byte
Unknown_150C		= $150C	;byte
Unknown_150D		= $150D	;word
Unknown_150F		= $150F	;word
Unknown_1511		= $1511	;word
TempObjX		= $1513	;word
TempObjY		= $1515	;word
TempObjZ		= $1517	;word
Unknown_151B		= $151B	;word
Unknown_151D		= $151D	;word
Unknown_151F		= $151F	;word
Unused_1521		= $1521	;word
Unknown_1523		= $1523	;byte
Unknown_1524		= $1524	;byte
Unknown_1525		= $1525	;byte
Unknown_1526		= $1526	;byte
Unknown_1527		= $1527	;byte
Unknown_1528		= $1528	;byte
Unknown_1529		= $1529	;byte
Unknown_152A		= $152A	;byte
Unknown_152B		= $152B	;byte
Unknown_152C		= $152C	;byte
Unknown_152D		= $152D	;byte
Unknown_152E		= $152E	;byte
Unknown_152F		= $152F	;byte
Unknown_1530		= $1530	;byte
Unknown_1531		= $1531	;byte
Unknown_1532		= $1532	;word
Unknown_1534		= $1534	;word
Unknown_1536		= $1536	;word
Unknown_1538		= $1538	;word
Unknown_153A		= $153A	;word
Unknown_153C		= $153C	;word
Unknown_153E		= $153E	;word
Unknown_1540		= $1540	;word
Unknown_1542		= $1542	;word
Unknown_1545		= $1545	;word
Unknown_1547		= $1547	;word
Unknown_1549		= $1549	;word
Unknown_154B		= $154B	;byte
Unknown_154C		= $154C	;byte
Unknown_154D		= $154D	;word
Unknown_154F		= $154F	;byte
Unknown_1551		= $1551	;byte
Unknown_1552		= $1552	;byte
Unknown_1553		= $1553	;byte
Unknown_1554		= $1554	;word
Unknown_1556		= $1556	;word
Unknown_1558		= $1558	;word
Unknown_155A		= $155A	;word
Unknown_155C		= $155C	;byte
Unknown_155D		= $155D	;word
Unknown_155F		= $155F	;word
Unknown_1561		= $1561	;word
Unknown_1563		= $1563	;word
Unknown_1565		= $1565	;word
Unknown_1567		= $1567	;word
Unknown_1569		= $1569	;byte
Unknown_156A		= $156A	;byte
Unknown_156B		= $156B	;word
Unknown_156E		= $156E	;byte
Unknown_156F		= $156F	;word
Unknown_1571		= $1571	;word
Unknown_1573		= $1573	;word
Unknown_1575		= $1575	;word
Unknown_1577		= $1577	;word
Unknown_1579		= $1579	;word
Unknown_157B		= $157B	;word
Unknown_157D		= $157D	;word
Unknown_157F		= $157F	;word
Unknown_1581		= $1581	;word
Unknown_1583		= $1583	;word
Unknown_1585		= $1585	;word
Unknown_1589		= $1589	;word
Unknown_158B		= $158B	;word
Unknown_158D		= $158D	;word
TempXYManhattanDistance	= $158F	;word
Unknown_1591		= $1591	;word
Unknown_1593		= $1593	;word
Unknown_1595		= $1595	;word
Unknown_1597		= $1597	;byte
Unknown_1598		= $1598	;word
Unknown_159E		= $159E	;word
Unknown_15A0		= $15A0	;byte
Unknown_15A1		= $15A1	;byte
Unknown_15A2		= $15A2	;word
Unknown_15A4		= $15A4	;byte
Unknown_15A5		= $15A5	;byte
TempRotX		= $15A6	;byte
TempRotY		= $15A7	;byte
Unknown_15A8		= $15A8	;byte
Unknown_15AB		= $15AB	;byte
Unknown_15AC		= $15AC	;byte
NovaBombs		= $15AD	;word
OAMBufferPtr		= $15AF	;word
Unknown_15B1		= $15B1	;word
Unknown_15B3		= $15B3	;word
Unknown_15B5		= $15B5	;byte
Unknown_15B6		= $15B6	;byte
Unknown_15B8		= $15B8	;byte
StageNumTextTimer	= $15B9	;byte
Unknown_15BB		= $15BB	;word
Unknown_15BF		= $15BF	;byte
TempVecZL		= $15C2	;word
TempSinP2C16		= $15C6	;byte
TempCosP2C16		= $15C7	;byte
Unknown_15CA		= $15CA	;word
struct UnkMatrix_15D7 $15D7	;Matrix
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
TempSinP2C8		= $15F3	;byte
TempCosP2C8		= $15F4	;byte

;Page $16
struct TempIdentityMatrix $1609	;Matrix
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
struct UnkMatrix_161B $161B	;Matrix
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
Unknown_162D		= $162D	;word
Unknown_162F		= $162F	;word
Unknown_1631		= $1631	;word
Unknown_1633		= $1633	;word
Unknown_1635		= $1635	;word
Unknown_1637		= $1637	;word
struct UnkMatrix_1639 $1639	;Matrix
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
Unknown_164B		= $164B	;byte
Unknown_164C		= $164C	;byte
VerticalScrollBase	= $169C	;word
VerticalScrollBase2	= $169E	;word
Unknown_16A0		= $16A0	;word
Unknown_16A2		= $16A2	;word
Unknown_16A4		= $16A4	;byte
Unknown_16A5		= $16A5	;byte
Unknown_16A6		= $16A6	;byte
UnkWipe_16A7		= $16A7	;word
UnkWipe_16A9		= $16A9	;word
WipePointer		= $16AB	;word
WipeTimerTarget		= $16AD	;word
WipeTimer		= $16AF	;word
WipeTimerDelta		= $16B1	;word
WipeTimerDelta2		= $16B3	;word
WipeBlueTarget		= $16B5	;byte
WipeGreenTarget		= $16B6	;byte
WipeRedTarget		= $16B7	;byte
WipeBlue		= $16B8	;byte
WipeGreen		= $16B9	;byte
WipeRed			= $16BA	;byte
WipeBlueDelta		= $16BB	;byte
WipeGreenDelta		= $16BC	;byte
WipeRedDelta		= $16BD	;byte
UnkWipe_16BE		= $16BE	;byte
UnkWipe_16BF		= $16BF	;byte
UnkWipe_16C0		= $16C0	;byte
UnkWipe_16C1		= $16C1	;byte
UnkWipe_16C2		= $16C2	;byte
UnkWipe_16C3		= $16C3	;byte
Unknown_16C5		= $16C5	;word
Unknown_16C7		= $16C7	;word
EngineSoundFlag		= $16C9	;byte
Unknown_16CD		= $16CD	;byte
Unknown_16CE		= $16DE	;word
Unknown_16D0		= $16D0	;word
Unknown_16D2		= $16D2	;word
Unknown_16D4		= $16D4	;word
StageID			= $16D6	;word
TempLevelID		= $16D8	;byte
Unknown_16D9		= $16D9	;byte
ScanlineToWaitFor	= $16DB	;word
Unknown_16DD		= $16DD	;word
Unknown_16DF		= $16DF	;word
Unknown_16E1		= $16E1	;word
Unknown_16E4		= $16E4	;word
Unknown_16E6		= $16E6	;word
Unknown_16E8		= $16E8	;word
Unknown_16EA		= $16EA	;word
Lives			= $16EC	;byte
Unknown_16ED		= $16ED	;byte
FGTiltFlag		= $16F1	;byte
CrosshairX		= $16F2	;word
CrosshairY		= $16F4	;word
PalFlag			= $16F6	;byte
CurScriptObject		= $16F7	;word
PointEffect		= $16F9	;word
ZTimer			= $16FB	;word
LevelScriptPointer	= $16FD	;lo16 word of long
PlayerPrevZPos		= $16FF	;word

;Page $17
ZTimerVel		= $1701	;word
ScriptCallStack		= $1703	;long array of size 15
ScriptCallStackPtr	= $1730	;word
ScriptCallStackSz	= $1732	;word
Unknown_1734		= $1734	;word
Unknown_1736		= $1736	;word
Unknown_173C		= $173C	;byte
CheckpointScriptPointer	= $173D	;lo16 word of long
TempScriptPointer	= $173F	;lo16 word of long
Preset			= $1741	;word
UnkLoopStackA		= $1743	;word array of size 4
UnkLoopStackB		= $174B	;word array of size 4
LoopStackPtr		= $1753	;word
NumSwarmObjects		= $1755	;word
UnkBCMDTemp_1757	= $1757	;word
UnkBCMDTemp_1759	= $1759	;word
UnkBCMDTemp_175B	= $175B	;word
UnkBCMDTemp_175D	= $175D	;word
UnkBCMDTemp_175F	= $175F	;word
UnkBCMDTemp_1761	= $1761	;word
UnkBCMDTemp_1769	= $1769	;word
Unknown_176B		= $176B	;byte
Unknown_176D		= $176D	;byte
Unknown_176E		= $176E	;byte
Unknown_176F		= $176F	;byte
JumpTableTempRegY	= $1770	;word
CheckpointPreset	= $1772	;word
Unknown_1774		= $1774	;word
Unused_1777		= $1777	;word
Unused_177A		= $177A	;byte
Unused_177E		= $177E	;word
Unused_1780		= $1780	;word
Unknown_1782		= $1782	;byte
PresetSettings		= $1785	;byte
TempPlayerBehPtr	= $1786	;long
PaletteBuffer		= $1789	;byte array of size $100

;Page $18
Unknown_188A		= $188A	;word
Unknown_188C		= $188C	;word
Unknown_188E		= $188E	;word
Unknown_1890		= $1890	;word
Unknown_1892		= $1892	;long
Unknown_1895		= $1895	;word
SuperFXPalette		= $1897	;byte
Continues		= $1898	;byte
Unknown_189A		= $189A	;byte
Unknown_189B		= $189B	;word
Unknown_189D		= $189D	;byte
Unknown_189E		= $189E	;byte
Unknown_189F		= $189F	;byte
Unknown_18A0		= $18A0	;byte
Unknown_18A1		= $18A1	;byte
Unknown_18A2		= $18A2	;byte
Unused_18A3		= $18A3	;byte
Unused_18A4		= $18A4	;byte
Unknown_18A5		= $18A5	;word
Unknown_18A7		= $18A7	;word
Unknown_18A9		= $18A9	;byte
Unknown_18AC		= $18AC	;byte
Unknown_18AD		= $18AD	;byte
FadeMode		= $18B2	;byte
FadeTimer		= $18B3	;byte
Unknown_18B4		= $18B4	;word
Unknown_18B6		= $18B6	;word
Unknown_18B8		= $18B8	;byte
BG3HOFSMirror		= $18B9	;word
Unknown_18BB		= $18BB	;byte
Unknown_18C2		= $18C2	;byte
Unknown_18C5		= $18C5	;byte
Unknown_18C6		= $18C6	;byte
Unknown_18C7		= $18C7	;byte
Unknown_18C8		= $18C8	;byte
Unknown_18C9		= $18C9	;byte
Unknown_18CA		= $18CA	;byte
Unknown_18CB		= $18CB	;word
TiltScrollBuffer	= $18CD	;byte array of size $40

;Page $19
VerticalScroll		= $194D	;word
PrevTiltScrollIndex	= $194F	;word
TiltScrollUpdated	= $1951	;word
ShearScrollFlag		= $1953	;byte
BGTiltFlag		= $1954	;byte
Unknown_1955		= $1955	;byte
Unused_1956		= $1956	;byte
Unknown_1957		= $1957	;word
Unknown_195F		= $195F	;word
Unknown_1962		= $1962	;byte

;Page $1E
Unknown_1EE5		= $1EE5	;word
Unknown_1EE9		= $1EE9	;word
Unknown_1EEB		= $1EEB	;word
Unknown_1EED		= $1EED	;word
Unknown_1EEF		= $1EEF	;word
Unknown_1EF1		= $1EF1	;byte
Unknown_1EF2		= $1EF2	;word
Unknown_1EF4		= $1EF4	;word
Unknown_1EF6		= $1EF6	;word
Unknown_1EF8		= $1EF8	;byte
Unknown_1EF9		= $1EF9	;byte
Unknown_1EFA		= $1EFA	;byte
Unknown_1EFB		= $1EFB	;word
Unknown_1EFD		= $1EFD	;word
Unknown_1EFF		= $1EFF	;word

;Page $1F
Unknown_1F03		= $1F03	;word
Unknown_1F05		= $1F05	;byte
Unknown_1F07		= $1F07	;byte
Unknown_1F08		= $1F08	;byte
Unknown_1F09		= $1F09	;word
Unknown_1F0B		= $1F0B	;byte
Unknown_1F0C		= $1F0C	;byte
Unknown_1F0D		= $1F0D	;byte
Unknown_1F0E		= $1F0E	;byte
ControlStyle		= $1F0F	;byte
Unknown_1F10		= $1F10	;byte
Unknown_1F11		= $1F11	;word
CurLoaderTasks		= $1F13	;word
Unknown_1F15		= $1F15	;word
Unknown_1F17		= $1F17	;word
Unknown_1F19		= $1F19	;word
Unknown_1F1B		= $1F1B	;word
Unknown_1F1D		= $1F1D	;word
Unknown_1F1F		= $1F1F	;word
Unknown_1F21		= $1F21	;word
Unknown_1F23		= $1F23	;word
Unknown_1F25		= $1F25	;word
Unknown_1F27		= $1F27	;word
Unknown_1F29		= $1F29	;word
Unknown_1F2B		= $1F2B	;word
Unknown_1F2D		= $1F2D	;word
Unknown_1F2F		= $1F2F	;word
Unknown_1F31		= $1F31	;word
Unknown_1F33		= $1F33	;word
Unknown_1F35		= $1F35	;word
Unknown_1F37		= $1F37	;word
Unknown_1F39		= $1F39	;word
Unknown_1F3B		= $1F3B	;word
Unknown_1F3D		= $1F3D	;word
TempLdAudioBnkOffs	= $1F3F	;word
TempLdAudioSz		= $1F41	;word
Unknown_1F43		= $1F43	;byte
Unknown_1F44		= $1F44	;word
MusicLoaded		= $1F46	;byte
MusicID			= $1F47	;byte
SESurroundTable		= $1F48	;byte array of size $05
SEQueuePtr		= $1F4D	;byte
SEQueuePtrOld		= $1F4F	;byte
UnkAudio_1F51		= $1F51	;byte
PauseSoundEffect	= $1F52	;byte
SoundEffectQueue	= $1F53	;byte array of size $10
TempLdAudioPktOffs	= $1F63	;word
InitDataSentFlag	= $1F65	;byte
UnkAudio_1F66		= $1F66	;word
Unknown_1F68		= $1F68	;byte
Unknown_1F69		= $1F69	;word (array???)
Unknown_1F6B		= $1F6B	;word (same array as above with offset???)
Unknown_1FBB		= $1FBB	;word
Unknown_1FC6		= $1FC6	;byte
Unknown_1FC7		= $1FC7	;byte
Unknown_1FC8		= $1FC8	;byte
WipeWindowShape		= $1FC9	;word
Unknown_1FCB		= $1FCB	;word
Unknown_1FCD		= $1FCD	;byte
Unknown_1FCE		= $1FCE	;byte
Unknown_1FCF		= $1FCF	;byte
UnkWipe_1FD0		= $1FD0	;byte
Unknown_1FD1		= $1FD1	;byte
Unknown_1FD2		= $1FD2	;word
Unknown_1FD4		= $1FD4	;word
Unknown_1FD6		= $1FD6	;word
Unknown_1FD8		= $1FD8	;word
Unknown_1FDA		= $1FDA	;byte
Unknown_1FDB		= $1FDB	;word
Unknown_1FDD		= $1FDD	;byte
Unknown_1FDE		= $1FDE	;byte
Unknown_1FDF		= $1FDF	;byte
Unknown_1FE0		= $1FE0	;byte
Unknown_1FE1		= $1FE1	;byte
ShearScrollType		= $1FE2	;word
Unknown_1FE4		= $1FE4	;byte
Unknown_1FE5		= $1FE5	;byte
Unknown_1FE6		= $1FE6	;byte
Unknown_1FE7		= $1FE7	;byte
Unknown_1FE8		= $1FE8	;word
Unknown_1FEA		= $1FEA	;word
Unknown_1FEC		= $1FEC	;word
Unknown_1FEE		= $1FEE	;byte
Unknown_1FEF		= $1FEF	;long
UnusedBGColor		= $1FF2	;word
LevelScriptBank		= $1FF4	;hi8 byte of long
CheckpointScriptBank	= $1FF5	;hi8 byte of long
TempScriptBank		= $1FF6	;hi8 byte of long
InitScriptPointer	= $1FF7	;long
Unknown_1FFA		= $1FFA	;byte
Unknown_1FFB		= $1FFB	;byte
Unknown_1FFC		= $1FFC	;byte
LevelID			= $1FFD	;byte
Pad1Prev		= $1FFE	;word

;Bank $70 (first 2 pages)

UnknownGSU_012		= $700012	;word

UnknownGSU_016		= $700016	;word
UnknownGSU_018		= $700018	;word
UnknownGSU_01A		= $70001A	;word
UnknownGSU_01C		= $70001C	;word
CurVtxPtr		= $70001E	;word
DesiredXRot		= $700020	;word
DesiredYRot		= $700022	;word
DesiredZRot		= $700024	;word
OutputVecX		= $700026	;word
OutputVecY		= $700028	;word
OutputVecZ		= $70002A	;word
InputVecY		= $70002C	;word
InputVecZ		= $70002E	;word
UnknownGSU_030		= $700030	;word
UnknownGSU_032		= $700032	;word
UnknownGSU_034		= $700034	;word
UnknownGSU_036		= $700036	;word
UnknownGSU_038		= $700038	;word
UnknownGSU_03A		= $70003A	;word
UnknownGSU_03C		= $70003C	;word
UnknownGSU_03E		= $70003E	;word
UnknownGSU_040		= $700040	;word
UnknownGSU_042		= $700042	;word
VertexAnimFrame		= $700044	;word
UnknownGSU_046		= $700046	;word

UnknownGSU_04A		= $70004A	;word
UnknownGSU_04C		= $70004C	;word
UnknownGSU_04E		= $70004E	;word
UnknownGSU_050		= $700050	;word

UnknownGSU_054		= $700054	;word
BSPTreePtr		= $700056	;word
UnknownGSU_05C		= $70005C	;word
UnknownGSU_05E		= $70005E	;word
			
InputVecX		= $700062	;word
InputPtr		= $700062	;long

UnknownGSU_06C		= $70006C	;word
			
UnknownGSU_082		= $700082	;word	
			
UnknownGSU_090		= $700090	;word
			
UnknownGSU_098		= $700098	;word
UnknownGSU_09A		= $70009A	;word
			
TextPointer		= $7000A6	;word
UnknownGSU_0A8		= $7000A8	;word
UnknownGSU_0AA		= $7000AA	;word

UnknownGSU_0B6		= $7000B6	;word

UnknownGSU_0BC		= $7000BC	;word
UnknownGSU_0BE		= $7000BE	;word

UnknownGSU_0C6		= $7000C6	;word
UnknownGSU_0C8		= $7000C8	;word
UnknownGSU_0CA		= $7000CA	;word
			
			
struct ObjectMatrix $7000D2	;Matrix
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

UnknownGSU_0EE		= $7000EE	;word
UnknownGSU_0F0		= $7000F0	;word
UnknownGSU_0F2		= $7000F2	;word
UnknownGSU_0F4		= $7000F4	;word
UnknownGSU_0F6		= $7000F6	;word
UnknownGSU_0F8		= $7000F8	;word

UnknownGSU_106		= $700106	;word

UnknownGSU_10C		= $70010C	;word

UnknownGSU_112		= $700112	;word

UnknownGSU_116		= $700116	;word
UnknownGSU_118		= $700118	;word
UnknownGSU_11A		= $70011A	;word
UnknownGSU_11C		= $70011C	;word
UnknownGSU_11E		= $70011E	;word
struct TransformMatrix $700120	;Matrix
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
UnknownGSU_134		= $700134	;word
UnknownGSU_136		= $700136	;word
UnknownGSU_138		= $700138	;word

UnknownGSU_13C		= $70013C	;word
UnknownGSU_13E		= $70013E	;word

UnknownGSU_142		= $700142	;word
UnknownGSU_144		= $700144	;word
UnknownGSU_146		= $700146	;word
UnknownGSU_148		= $700148	;word
UnknownGSU_14A		= $70014A	;word
UnknownGSU_14C		= $70014C	;word
UnknownGSU_14E		= $70014E	;word
UnknownGSU_150		= $700150	;byte
UnknownGSU_152		= $700152	;byte

EnemyHPBarMax		= $70019A	;word
EnemyHPBarCur		= $70019C	;word
GSUPointEffect		= $70019E	;word
UnknownGSU_1A0		= $7001A0	;byte
UnknownGSU_1A2		= $7001A2	;byte
UnknownGSU_1A4		= $7001A4	;byte

UnknownGSU_1A8		= $7001A8	;byte
UnknownGSU_1AA		= $7001AA	;byte
UnknownGSU_1AC		= $7001AC	;byte

UnknownGSU_1B0		= $7001B0	;word
ClearFramebufferFlag	= $7001B2	;word

UnknownGSU_1D6		= $7001D6	;word
UnknownGSU_1D8		= $7001D8	;word
UnknownGSU_1DA		= $7001DA	;word

UnknownGSU_1F2		= $7001F2	;word

UnknownGSU_1F8		= $7001F8	;word
UnknownGSU_1FA		= $7001FA	;word

UnknownGSU_1FE		= $7001FE	;word

;Bank $70 high

UnknownGSU_0206		= $700206	;word

RenderHUDFlag		= $70021C	;word

UnknownGSU_0220		= $700220	;word

SuperFXStack		= $7004C2	;word array of size ???

CurPolyVerts2D		= $700982	;word array of size $40
CurPolyVerts3D		= $700A02	;word array of size $80
BSPTreeStack		= $700B02	;??? array of size ???
WipeWindowBuffer	= $700EF2	;word array of size $E0
WipeWindowBuffer2	= $7010B2	;word array of size $E0
CopiedDebugFont		= $701A2C	;byte array of size $60
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
	.BehSub: skip 1		;12
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
struct ModelInfo $7E2EC4
	.ObjPtr: skip 2		;00
	.Unk02: skip 2
	.Unk04: skip 2
	.Unk06: skip 2
	.Unk08: skip 2
endstruct
ArwingModelIDBuffer	= $7E3186	;word array of size 4
CreditsBossPrevTextBuf	= $7E9F55	;byte array of size $100?
Unknown_7EA058		= $7EA058	;word
Unknown_7EA05A		= $7EA05A	;word
Unknown_7EA05C		= $7EA05C	;word
Unknown_7EA05E		= $7EA05E	;word
CheckpointStackPtr	= $7EA061	;long
CheckpointCallStack	= $7EA065	;long array of size 15
ChkptUnkLoopStackA	= $7EA092	;word array of size 4
ChkptUnkLoopStackB	= $7EA09A	;word array of size 4
CheckpointLoopStackPtr	= $7EA0A2	;word
Unknown_7EA0A4		= $7EA0A4	;word
Unknown_7EA0A6		= $7EA0A6	;word
Unknown_7EA0A8		= $7EA0A8	;word
Unknown_7EF0A4		= $7EF0A4	;word
Unknown_7EF0A6		= $7EF0A6	;word
Unused_7EF0A8		= $7EF0A8	;word
Unknown_7EF0AC		= $7EF0AC	;word
Unknown_7EF0AE		= $7EF0AE	;word
Unknown_7EF0B0		= $7EF0B0	;word
Unknown_7EF0B2		= $7EF0B2	;byte
Unknown_7EF0B3		= $7EF0B3	;byte
Unknown_7EF0C5		= $7EF0C5	;byte
Unknown_7EF0C6		= $7EF0C6	;byte
Unknown_7EF0C7		= $7EF0C7	;byte
Unknown_7EF0C8		= $7EF0C8	;byte
Unknown_7EF0C9		= $7EF0C9	;byte
Unknown_7EF0D4		= $7EF0D4	;word
Unknown_7EF0D6		= $7EF0D6	;word
Unknown_7EF0D8		= $7EF0D8	;word
Unknown_7EF0DA		= $7EF0DA	;word
Unknown_7EF0DC		= $7EF0DC	;byte
Unknown_7EF0DD		= $7EF0DD	;byte
Unknown_7EF0DE		= $7EF0DE	;byte
Unknown_7EF0DF		= $7EF0DF	;byte
Unknown_7EF0E0		= $7EF0E0	;byte
Unused_7EF0E7		= $7EF0E7	;word

;SPC700 address space
UnknownSPCRB_00		= $00	;byte array of size 4
UnknownSPCRB_04		= $04	;byte array of size 4
UnknownSPCRB_08		= $08	;byte array of size 4
UnknownSPC_0C		= $0C	;byte
SPCTempKOF2		= $0E	;byte
UnknownSPC_10		= $10	;word
UnknownSPC_12		= $12	;byte
UnknownSPC_13		= $13	;byte
SPCTempAddr		= $14	;word
SPCPitch		= $16	;word
UnknownSPC_18		= $18	;byte
UnknownSPC_19		= $19	;byte
SPCMuteChan		= $1A	;byte
SPCCurChanPtrs		= $30	;word array of size 8
UnknownSPC_40		= $40	;word
UnknownSPC_42		= $42	;byte
UnknownSPC_43		= $43	;byte
UnknownSPC_44		= $44	;byte
SPCTempKON		= $45	;byte
SPCTempKOF		= $46	;byte
SPCCurChan		= $47	;byte
SPCTempFLG		= $48	;byte
SPCTempNON		= $49	;byte
SPCTempEON		= $4A	;byte
SPCTempPMON		= $4B	;byte
UnknownSPC_4C		= $4C	;byte
UnknownSPC_4D		= $4D	;byte
SPCTempEFB		= $4E	;byte
SPCMstXpose		= $50	;byte
SPCTempo		= $52	;byte
UnknownSPC_53		= $53	;byte
SPCTempoLen		= $54	;byte
SPCTempoDest		= $55	;byte
UnknownSPC_56		= $56	;word
SPCMstVol		= $58	;byte
UnknownSPC_59		= $59	;byte
SPCMstVolLen		= $5A	;byte
SPCMstVolDest		= $5B	;byte
UnknownSPC_5C		= $5C	;word
UnknownSPC_5E		= $5E	;byte
SPCPercBase		= $5F	;byte
SPCEchoLeft		= $60	;byte
SPCTempEVOLLeft		= $61	;byte
SPCEchoRight		= $62	;byte
SPCTempEVOLRight	= $63	;byte
UnknownSPC_64		= $64	;word
UnknownSPC_66		= $66	;word
UnknownSPC_68		= $68	;byte
UnknownSPC_69		= $69	;byte
UnknownSPC_6A		= $6A	;byte
UnknownSPCBB_70		= $70	;byte array of size 8, interlaced
UnknownSPCBB_71		= $71	;byte array of size 8, interlaced
SPCCallCnt		= $80	;byte array of size 8, interlaced
UnknownSPCBB_81		= $81	;byte array of size 8, interlaced
UnknownSPCBB_90		= $90	;byte array of size 8, interlaced
SPCPanFadeLen		= $91	;byte array of size 8, interlaced
UnknownSPCBB_A0		= $A0	;byte array of size 8, interlaced
UnknownSPCBB_A1		= $A1	;byte array of size 8, interlaced
UnknownSPCBB_B0		= $B0	;byte array of size 8, interlaced
UnknownSPCBB_B1		= $B1	;byte array of size 8, interlaced
UnknownSPCBB_C0		= $C0	;byte array of size 8, interlaced
SPCTremDepth		= $C1	;byte array of size 8, interlaced
UnknownSPC_D0		= $D0	;byte
SPCNoteLen		= $0200	;byte array of size 8, interlaced
SPCDurRt		= $0201	;byte array of size 8, interlaced
SPCVelRt		= $0210	;byte array of size 8, interlaced
SPCInst			= $0211	;byte array of size 8, interlaced
UnknownSPCBB_220	= $0220	;byte array of size 8, interlaced
UnknownSPCBB_222	= $0221	;byte array of size 8, interlaced
UnknownSPCBB_230	= $0230	;word array of size 8
SPCCallPtr		= $0240	;word array of size 8
UnknownSPCBB_250	= $0250	;byte array of size 8, interlaced
SPCPitchEnvDelay	= $0281	;byte array of size 8, interlaced
SPCPitchEnvDir		= $0290	;byte array of size 8, interlaced
SPCPitchEnvKey		= $0291	;byte array of size 8, interlaced
UnknownSPCBB_2A0	= $02A0	;byte array of size 8, interlaced
SPCVibRate		= $02A1	;byte array of size 8, interlaced
SPCVibDelay		= $02B0	;byte array of size 8, interlaced
UnknownSPCBB_2B1	= $02B1	;byte array of size 8, interlaced
UnknownSPCBB_2C0	= $02C0	;byte array of size 8, interlaced
UnknownSPCBB_2C1	= $02C1	;byte array of size 8, interlaced
UnknownSPCBB_2D0	= $02D0	;byte array of size 8, interlaced
SPCTremRate		= $02D1	;byte array of size 8, interlaced
SPCTremDelay		= $02E0	;byte array of size 8, interlaced
UnknownSPCBB_2E1	= $02E1	;byte array of size 8, interlaced
UnknownSPCBB_2F0	= $02F0	;byte array of size 8, interlaced
SPCVol			= $0300	;byte array of size 8, interlaced
UnknownSPCBB_301	= $0301	;byte array of size 8, interlaced
UnknownSPCWB_310	= $0310	;word array of size 8
UnknownSPCBB_320	= $0320	;byte array of size 8, interlaced
UnknownSPCBB_321	= $0321	;byte array of size 8, interlaced
UnknownSPCBB_330	= $0330	;byte array of size 8, interlaced
SPCPan			= $0331	;byte array of size 8, interlaced
UnknownSPCBB_340	= $0340	;byte array of size 8, interlaced
UnknownSPCBB_341	= $0341	;byte array of size 8, interlaced
UnknownSPCBB_350	= $0350	;byte array of size 8, interlaced
SPCPanEx		= $0351	;byte array of size 8, interlaced
UnknownSPCBB_360	= $0360	;byte array of size 8, interlaced
UnknownSPCBB_361	= $0361	;byte array of size 8, interlaced
UnknownSPCWB_370	= $0370	;word array of size 8
UnknownSPCBB_380	= $0380	;byte array of size 8, interlaced
UnknownSPCBB_381	= $0381	;byte array of size 8, interlaced
UnknownSPCBB_3A0	= $03A0	;byte array of size 8, interlaced
UnknownSPC_3C3		= $03C3
UnknownSPC_3C6		= $03C6
UnknownSPC_3C7		= $03C7
UnknownSPC_3CA		= $03CA
UnknownSPC_3CB		= $03CB
UnknownSPCBB_3D0	= $03D0	;byte array of size 8, interlaced
UnknownSPCBB_3E0	= $03E0	;byte array of size 8, interlaced
UnknownSPCBB_3E1	= $03E1	;byte array of size 8, interlaced
UnknownSPC_3F1		= $03F1
UnknownSPC_3F8		= $03F8

SPCMusPtrBase		= $FDC0
