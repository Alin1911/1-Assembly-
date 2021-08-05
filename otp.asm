%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY
	
    ;; TODO: Implement the One Time Pad cipher
	
	xor eax,eax
	xor ebx,ebx
    ;parcurgem textul si cheia cu un loop
start:
    ;mutam cate un caracter din text in al
	mov al, byte[esi + ecx - 1]
    ;mutam cate un caracter din cheie in bl
	mov bl, byte[edi + ecx -1]
    ;aplicam operatia xor
	xor eax, ebx
    ;punem rezultatul in registru edx
	mov byte[edx + ecx - 1], al
	loop start

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY