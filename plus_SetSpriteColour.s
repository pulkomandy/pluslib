.module _plus_SetSpriteColour
.globl _plus_SetSpriteColour

.area _CODE

;; pen, rgb ink
_plus_SetSpriteColour:
	ld	hl,#2
	add	hl,sp
	;; pen
	ld a,(hl)
	or a
	ret z
	inc hl
	inc hl
	;; ink
	ld	e,(hl)
	inc hl
	ld d,(hl)
	;; DE = rgb ink
	;; A = pen
	dec a
	and #0xf
	add a,a
	add a,#0x22
	ld l,a
	ld h,#0x64
	ld (hl),e
	inc hl
	ld (hl),d
	ret
