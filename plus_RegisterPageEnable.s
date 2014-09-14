.module _plus_RegisterPageEnable
.globl _plus_RegisterPageEnable

.area _CODE


_plus_RegisterPageEnable:
ld bc,#0x07fb8
out (c),c
ret
