.module _plus_SetColour
.globl _plus_SetColour

.area _CODE


_plus_SetColour:
	ld	hl,#2
	add	hl,sp
	;; pen
	ld a,(hl)
	inc hl
	inc hl
	;; ink
	ld	e,(hl)
	inc hl
	ld d,(hl)
	and #0xf
	add a,a
	ld l,a
	ld h,#64
	ld (hl),e
	inc hl
	ld (hl),d
	ret
