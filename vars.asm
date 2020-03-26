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
	.Unk15: skip 1
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
			= $14F6	;word
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
			= $1597	;byte
			= $1598	;word
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
Unknown_15BB		= $15BB	;word
Unknown_15BF		= $15BF	;byte
TempVecZL		= $15C2	;word
TempSinP2C16		= $15C6	;byte
TempCosP2C16		= $15C7	;byte
Unknown_15CA		= $15CA	;word
struct UnkMatrix_15D7		= $15D7	;Matrix
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
struct TempIdentityMatrix	= $1609	;Matrix
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
struct UnkMatrix_161B		= $161B	;Matrix
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
Unk2DMtx_162D		= $162D	;word
Unk2DMtx_162F		= $162F	;word
Unk2DMtx_1631		= $1631	;word
Unk2DMtx_1633		= $1633	;word
Unk2DMtx_1635		= $1635	;word
Unk2DMtx_1637		= $1637	;word
struct UnkMatrix_1639		= $1639	;Matrix
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
			= $16CD	;byte
			= $16DE	;word
			= $16D0	;word
			= $16D2	;word
			= $16D4	;word
StageID			= $16D6	;word
TempLevelID		= $16D8	;word
ScanlineToWaitFor	= $16DB	;word
Unknown_16DD		= $16DD	;word
Unknown_16DF		= $16DF	;word
Unknown_16E1		= $16E1	;word
Unknown_16E4		= $16E4	;word
Unknown_16E6		= $16E6	;word
Unknown_16E8		= $16E8	;word
Unknown_16EA		= $16EA	;word
Lives			= $16EC	;byte
Unused_16ED		= $16ED	;byte
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
Unknown_1782		= $1782	;byte
PresetSettings		= $1785	;byte
TempPlayerBehPtr	= $1786	;long
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
CurLoaderTasks		= $1F13	;byte
			= $1F14	;byte
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
			= $1F35	;word
			= $1F37	;word
			= $1F39	;word
			= $1F3B	;word
			= $1F3D	;word
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
ShearScrollType		= $1FE2	;word
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
InitScriptPointer	= $1FF7	;long
Unknown_1FFA		= $1FFA	;byte
Unknown_1FFB		= $1FFB	;byte
Unknown_1FFC		= $1FFC	;byte
LevelID			= $1FFD	;byte
Pad1Prev		= $1FFE	;word

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
			
			= $700040
			= $700044
			= $700046
			
BSPTreePtr		= $700056	;word
			= $70005C
			= $70005E
InputVecX		= $700062	;word
InputPtr		= $700062	;long
			= $70006C
			= $700090
			= $700098
			= $70009A
TextPointer		= $7000A6
			= $7000A8
			
			
struct ObjectMatrix	= $7000D2	;Matrix
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
struct TransformMatrix	= $700120	;Matrix
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

ClearFramebufferFlag	= $7001B2	;word

;Bank $70 high
RenderHUDFlag		= $70021C	;word
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
			= $7E2EC4	;word
			= $7E2EC6	;word
			= $7E2EC8	;word
			= $7E2ECA	;word
			= $7E2ECC	;word
CreditsBossPrevTextBuf	= $7E9F55	;byte array of size $100?
			= $7EA058	;word
			= $7EA05A	;word
			= $7EA05C	;word
			= $7EA05E	;word
CheckpointStackPtr	= $7EA061	;long
CheckpointCallStack	= $7EA065	;long array of size 15
ChkptUnkLoopStackA	= $7EA092	;word array of size 4
ChkptUnkLoopStackB	= $7EA09A	;word array of size 4
CheckpointLoopStackPtr	= $7EA0A2	;word
			= $7EA0A4	;word
			= $7EA0A6	;word
			= $7EA0A8	;word
Unknown_7EF0C9		= $7EF0C9	;word

;Bank $7F

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
