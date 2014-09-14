.module _plus_SetSpriteMag
.globl _plus_SetSpriteMag

.area _CODE

;; sprite index, mag x, mag y
_plus_SetSpriteMag:
	ld	hl,#2
	add	hl,sp
	;; sprite index
	ld b,(hl)
	inc hl
	inc hl
	;; mag x
	ld	a,(hl)
	and #0x3
	add a,a
	add a,a
	ld c,a
	inc hl
	inc hl
	;; mag y
	ld a,(hl)
	and #0x3
	or c
	ld c,a
	
	ld a,b
	add a,a
	add a,a
	add a,a
	add a,#4
	ld l,a
	ld h,#0x60
	ld (hl),c
	ret
