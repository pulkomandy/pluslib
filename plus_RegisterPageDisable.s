.module _plus_RegisterPageDisable
.globl _plus_RegisterPageDisable

.area _CODE


_plus_RegisterPageDisable:
ld bc,#0x07fa0
out (c),c
ret
