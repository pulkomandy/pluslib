.module _plus_SetRasterInterruptLine
.globl _plus_SetRasterInterruptLine

.area _CODE

_plus_SetRasterInterruptLine:
	ld	hl,#2
	add	hl,sp
	ld a,(hl)
	ld (#0x6800),a
	ret
