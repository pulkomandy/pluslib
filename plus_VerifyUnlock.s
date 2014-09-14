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
ld bc,_EndUnlockCode-_UnlockCode
ld hl,#0
or a
sbc hl,bc
add hl,sp
ld sp,hl
ld de,#_UnlockCode
ldir
ld a,(#0x4000)    ;; get original byte
push af
push hl

;; setup for code.
ld hl,#0x4000
ld de,#0xb8a0
ld bc,#0x7faa
;; call the code on the stack
ret

;; code calls back here
_VerifyUnlock2
pop bc          ;; get back original byte
ld (hl),b         ;; restore original byte
cp #0x0a
ld hl,1
ret z
ld hl,0
ret


;; this code goes onto the stack!
_UnlockCode:
out (c),d				;; 2 bytes
ld (hl),c				;; 1 byte
ld a,(hl)				;; 1 byte
out (c),e				;; 2 bytes
jp _VerifyUnlock2		;; 3 bytes
_EndUnlockCode: