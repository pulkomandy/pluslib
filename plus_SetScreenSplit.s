.module _plus_SetScreenSplit
.globl _plus_SetScreenSplit

.area _CODE

_plus_SetScreenSplit:
	ld	hl,#2
	add	hl,sp
	ld a,(hl)
	inc hl
	inc hl
	;; addr
	ld	e,(hl)
	inc hl
	ld d,(hl)
	;; line
	ld (#0x6801),a
	;; address
	ld a,d
	ld (#0x6802),a
	ld a,e
	ld (#0x6803),a
	ret
