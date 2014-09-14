.module _plus_SetBorder
.globl _plus_SetBorder

.area _CODE


_plus_SetBorder:
	ld	hl,#2
	add	hl,sp
	;; ink
	ld	e,(hl)
	inc hl
	ld d,(hl)
	ld hl,#0x6420
	ld (hl),e
	inc hl
	ld (hl),d
	ret
