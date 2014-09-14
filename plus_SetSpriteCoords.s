.module _plus_SetSpriteCoords
.globl _plus_SetSpriteCoords

.area _CODE

;; sprite index, x, y
_plus_SetSpriteCoords:
	ld	hl,#2
	add	hl,sp
	;; sprite index
	ld a,(hl)
	inc hl
	inc hl
	;; x
	ld c,(hl)
	inc hl
	ld b,(hl)
	inc hl
	;; y
	ld	e,(hl)
	inc hl
	ld d,(hl)
	;; A = sprite index
	;; BC = x 
	;; DE = y
	add a,a
	add a,a
	add a,a
	ld l,a
	ld h,#0x60
	ld (hl),c
	inc hl
	ld (hl),b
	inc hl
	ld (hl),e
	inc hl
	ld (hl),d
	ret
