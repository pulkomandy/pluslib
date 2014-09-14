.module _plus_SetSpritePixel
.globl _plus_SetSpritePixel

.area _CODE


_plus_SetSpritePixel:
	ld	hl,#2
	add	hl,sp
	ld b,(hl)
	inc hl
	inc hl
	;; y
	ld a,(hl)
	and #0xf
	add a,a
	add a,a
	add a,a
	add a,a
	ld c,a
	inc hl
	inc hl
	;; x
	ld a,(hl)
	and #0xf
	add b
	ld l,a
	ld h,#0x40
	ld (hl),b
	ret
