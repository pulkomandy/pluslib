.module _plus_Unlock
.globl _plus_Unlock
.globl _plus_Sequence
.area _CODE

_plus_Unlock:
ld hl,#_plus_Sequence
ld bc,#0x0bc00+15
pu1:
ld a,(hl)
out (c),a
inc hl
dec c
jr nz,pu1
ld a,#0xcd
out (c),a
ld a,#0xee
out (c),a
ret
