
	
	;Object font (used in credits for example)
	INCBIN "graphics/objfont.1bpp.chr"
	;Credits text data
	table "graphics/objfont.txt",ltr
	DB "STAR_FOX",$00
	DB "nintendo",$00
	DB "presented",$00
	DB "presents",$00
	DB "assisted",$00
	DB "and",$00
	DB "programmed",$00
	DB "by",$00
	DB "argonaut software",$00
	DB "executive producer",$00
	DB "hiroshi yamauchi",$00
	DB "producer",$00
	DB "shigeru miyamoto",$00
	DB "director",$00
	DB "katsuya eguchi",$00
	DB "assistant director",$00
	DB "yoichi yamada",$00
	DB "dylan cuthbert",$00
	DB "giles goddard",$00
	DB "krister wombell",$00
	DB "3d system",$00
	DB "pete warnes",$00
	DB "carl graham",$00
	DB "graphic designer",$00
	DB "takaya imamura",$00
	DB "shape designer",$00
	DB "tsuyoshi watanabe",$00
	DB "koji kondo",$00
	DB "hajime hirasawa",$00
	DB "super fx staff",$00
	DB "ben cheese",$00
	DB "satoshi nishiumi",$00
	DB "hironobu kakui",$00
	DB "shigeki yamashiro",$00
	DB "yasuhiro kawaguchi",$00
	DB "thanks to",$00
	DB "jez san",$00
	DB "keizo kato",$00
	DB "sound effects",$00
	DB "music composer",$00
	DB "yasunari nishida",$00
	DB "ian crowther",$00
	DB "dan owsen",$00
	DB "tony harman",$00
	DB "masato kimura",$00
	DB "takao shimizu",$00
	DB "hajime yajima",$00
	DB "kenji yamamoto",$00
	DB "the end",$00
	DB "english support",$00
	DB "japanese support",$00
	DB "software support",$00
	DB "richard clucas",$00
	DB "jon dean",$00
	DB "ces demo",$00
	DB "version",$00
	DB "german text",$00
	DB "claude moyse",$00
	DB "0",$00
	DB "1",$00
	DB "2",$00
	DB "3",$00
	DB "4",$00
	DB "5",$00
	DB "6",$00
	DB "7",$00
	DB "8",$00
	DB "9",$00
	DB "%",$00
	DB "  0%",$00
	DB "  1%",$00
	DB "  2%",$00
	DB "  3%",$00
	DB "  4%",$00
	DB "  5%",$00
	DB "  6%",$00
	DB "  7%",$00
	DB "  8%",$00
	DB "  9%",$00
	DB " 10%",$00
	DB " 11%",$00
	DB " 12%",$00
	DB " 13%",$00
	DB " 14%",$00
	DB " 15%",$00
	DB " 16%",$00
	DB " 17%",$00
	DB " 18%",$00
	DB " 19%",$00
	DB " 20%",$00
	DB " 21%",$00
	DB " 22%",$00
	DB " 23%",$00
	DB " 24%",$00
	DB " 25%",$00
	DB " 26%",$00
	DB " 27%",$00
	DB " 28%",$00
	DB " 29%",$00
	DB " 30%",$00
	DB " 31%",$00
	DB " 32%",$00
	DB " 33%",$00
	DB " 34%",$00
	DB " 35%",$00
	DB " 36%",$00
	DB " 37%",$00
	DB " 38%",$00
	DB " 39%",$00
	DB " 40%",$00
	DB " 41%",$00
	DB " 42%",$00
	DB " 43%",$00
	DB " 44%",$00
	DB " 45%",$00
	DB " 46%",$00
	DB " 47%",$00
	DB " 48%",$00
	DB " 49%",$00
	DB " 50%",$00
	DB " 51%",$00
	DB " 52%",$00
	DB " 53%",$00
	DB " 54%",$00
	DB " 55%",$00
	DB " 56%",$00
	DB " 57%",$00
	DB " 58%",$00
	DB " 59%",$00
	DB " 60%",$00
	DB " 61%",$00
	DB " 62%",$00
	DB " 63%",$00
	DB " 64%",$00
	DB " 65%",$00
	DB " 66%",$00
	DB " 67%",$00
	DB " 68%",$00
	DB " 69%",$00
	DB " 70%",$00
	DB " 71%",$00
	DB " 72%",$00
	DB " 73%",$00
	DB " 74%",$00
	DB " 75%",$00
	DB " 76%",$00
	DB " 77%",$00
	DB " 78%",$00
	DB " 79%",$00
	DB " 80%",$00
	DB " 81%",$00
	DB " 82%",$00
	DB " 83%",$00
	DB " 84%",$00
	DB " 85%",$00
	DB " 86%",$00
	DB " 87%",$00
	DB " 88%",$00
	DB " 89%",$00
	DB " 90%",$00
	DB " 91%",$00
	DB " 92%",$00
	DB " 93%",$00
	DB " 94%",$00
	DB " 95%",$00
	DB " 96%",$00
	DB " 97%",$00
	DB " 98%",$00
	DB " 99%",$00
	DB "100%",$00
	DB " ???",$00
	DB "total score",$00
	DB "average score",$00
	DB "100",$00
	DB "500",$00
	DB "1000",$00
	DB "2000",$00
	DB "3000",$00
	DB "5000",$00
	DB "10000",$00
	cleartable
	;Compressed graphics assets
	INCBIN "graphics/compressed/intro.4bpp.chrz"
	;14D5AA
	INCBIN "graphics/compressed/intro.mapz"
	;14D896	
	INCBIN "graphics/compressed/macbeth.4bpp.chrz"
	;14DB5E
	INCBIN "graphics/compressed/scramble.4bpp.chrz"
	;14DB6E		5C00		1800
	INCBIN "graphics/compressed/scramble.mapz"
	;14DC03
	INCBIN "graphics/compressed/common.4bpp.chrz"
	;14E0FE
	INCBIN "graphics/compressed/tinyfont.2bpp.chrz"
	;14E2C2
	INCBIN "graphics/compressed/unk14E2C2.binz"
	;14E362
	INCBIN "graphics/compressed/unk14E362.binz"
	;14E43E
	INCBIN "graphics/compressed/unk14E43E.binz"
	;14xxxx
	INCBIN "graphics/compressed/continue.4bpp.chrz"
	;14xxxx
	INCBIN "graphics/compressed/continue.mapz"
	;14xxxx
	INCBIN "graphics/compressed/titaniaboss.4bpp.chrz"
	;14xxxx
	INCBIN "graphics/compressed/corneria.4bpp.chrz"
	;14xxxx
	INCBIN "graphics/compressed/titaniabossbg.mapz"


	; 14FECE	5C00		1800
