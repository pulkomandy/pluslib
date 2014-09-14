.module _plus_Lock
.globl _plus_Lock
.globl _plus_Sequence

.area _CODE

_plus_Lock:
ld hl,#_plus_Sequence
ld bc,#0x0bc00+15
pl1:
ld a,(hl)
out (c),a
inc hl
dec c
jr nz,pl1
ld a,#0xaa
out (c),a
ld a,#0xee
out (c),a
ret
