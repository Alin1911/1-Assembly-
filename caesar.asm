%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the caesar cipher
    
	xor eax, eax
	mov ebx, edi
	;parcurg textul cu un loop
while:
	xor eax, eax
	;mut fiecare litera in al
	mov al, byte[esi + ecx - 1]
	;verfic daca e litera mare sau mica
	cmp eax, 65
	jl end

	cmp eax, 91
	jl lmari

	cmp eax, 97
	jl end

	cmp eax, 122
	jg end

	jmp lmici

lmari:
	add al, bl
;verific daca se depaseste pragul literelor mari
v2:
	cmp eax, 90
	jg pmmare

	jmp end

lmici:
	add al, bl
;verific daca se depaseste pragul literelor mici
v1:
	cmp eax, 122
	jg pmmic

	jmp end
;cazul in care depaseste pragul literelor mari
pmmare:
	sub al, 26

	jmp v2
;cazul in care depaseste pragul literelor mici
pmmic:
	sub al, 26

	jmp v1

end:
; pun rezultatul in registrul edx
	mov byte[edx +ecx -1], al
	loop while

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY