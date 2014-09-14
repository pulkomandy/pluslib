.module _plus_DownloadSpritePixels
.globl _plus_DownloadSpritePixels

.area _CODE

;; sprite number, address
_plus_DownloadSpritePixels:
	ld	hl,#2
	add	hl,sp
	;; sprite number
	ld a,(hl)
	inc hl
	inc hl
	;; pixel data
	ld e,(hl)
	inc hl
	ld d,(hl)
	;; A = sprite index
	;; DE = pixel data
	;; sprite index
	and #0x0f
	or #0x040
	ld h,a
	ld l,#0
	;; address of sprite data

	;; 16x16 = 256. Data packed into nibbles, so half this.
	ld b,#256/2
pds1:
	;; first pixel in upper nibble
	ld a,(de)
	ld c,a
	rrca
	rrca
	rrca
	rrca
	ld (hl),a
	inc l
	ld (hl),c
	inc l
	inc de
	djnz pds1
	ret
