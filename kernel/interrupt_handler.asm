bits 32

cmp eax, 0
je int_handler1

cmp eax, 1
je int_handler1

%include "stdio32.inc"

InterruptMsg  db "Interrupting", 0ah, 0h

int_handler1:
  pusha
  ; mov		ax, 0x10		; set data segments to data selector (0x10)
  ; mov		ds, ax

  ; mov bl, 5
  ; mov bh, 5
  ; call MovCur

  ; mov eax, InterruptMsg
  ; call Puts32

  ; ; restore back the stack for userspace afterward
  ; mov ax, 0x23
  ; mov ds, ax
  popa

  ; only use lower 16 bits, since we use segment in protected mode.
  ; This is necessary because int instruction stores absolute address, while iret instruction use
  ; segmented address.
  mov eax, [esp]
  and eax, 0xFFFF
  mov [esp], eax

  iret