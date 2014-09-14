.module _plus_VerifyUnlockStack
.globl _plus_VerifyUnlockStack

.area _CODE

;; enabling/disabling the asic page to test it exists will not work on the CPC.
;; 0x07fb8 -> mode 0, lower rom enable, *upper rom disable*,  reset 52 divider.
;; 0x07fa0 -> mode 0, lower rom enable, upper rom enable, do not reset 52 divider.
;; 

;; stack looks like this:
;; address to execute code
;; ..code...
;; existing stack stuff

_plus_VerifyUnlockStack:

;; get current stack location
ld hl,#0
add hl,sp
ld e,l
ld d,h
;; DE = current stack location

;; reserve some space on the stack; BC = length of data..
or a
ld bc,#(_EndUnlockCode-_UnlockCode)
sbc hl,bc

;; now set stack pointer
ld sp,hl				;; new stack loc
;; old address of stack
push de
;; address from which the function will return
ld de,#_VerifyUnlock2
push de
;; hl = address of function to call on the stack
push hl

;; copy data to the stack...
ld de,#_UnlockCode
ex de,hl
;; HL = stack, DE = code to copy to stack, BC = length
ldir

;; setup for code.
ld hl,#0x4000
ld de,#0xb8a0
ld b,#0x07f
;; jump to code on the stack
ret

;; code calls back here
_VerifyUnlock2:
;; get back old stack
pop hl
;; HL = old stack value
ld sp,hl

cp #0x0a
ld hl,#1
ret z
ld hl,#0
ret


;; this code goes onto the stack. It needs to be small!
_UnlockCode:
out (c),d
ld (hl),#0x0aa			;; write data
ld a,(hl)				;; read data
out (c),e
ret
_EndUnlockCode: