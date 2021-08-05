%include "io.mac"

section .data
;index1 e pentru parcurgerea textului
    index1 dd 0
;index2 e pentru parcurgerea cheii
    index2 dd 0
;lungimea textului
    ltext dd 0
;lungimea cheii
    lkey dd 0

section .text
    global vigenere
    extern printf

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY


    ;; TODO: Implement the Vigenere cipher  

    mov dword[lkey], ebx
    mov dword[ltext], ecx
;cazul in care lungimea cheii a fost depasita
restart:
     mov dword[index2], 0
;incep parcurgerea textului si a cheii
for:
;curat registri
    xor eax, eax
    xor ecx, ecx
    xor ebx, ebx
;mut in al litera corespunzatoare index1 din text
    mov ebx, dword[index1]
    mov al, [esi + ebx]
;mut in acll litera corespunzatoare index2 din cheie
    mov ebx, dword[index2]
    mov cl, [edi + ebx]
;cautam pozita literei in alfabet
    sub cl, 65
;Verific ce fel de litera avem din text
    
    cmp eax, 65
	jl exit1

	cmp eax, 91
	jl lmari

	cmp eax, 97
	jl exit1

	cmp eax, 122
	jg exit1

	jmp lmici

lmari:
;incrementam indexul cheii
    inc dword[index2]
;adunam cheia la litera din text
    add al, cl
;verific daca se depaseste pragul literelor mari
v2:
    cmp eax, 90
    jg pm1
    jmp exit1
;cazul in care depaseste pragul literelor mari
pm1:
	sub al, 26
    jmp v2

lmici:
;incrementam indexul cheii
    inc dword[index2]
;adunam cheia la litera din text
    add al, cl
;verific daca se depaseste pragul literelor mici
v1:
    cmp eax, 122
    jg pm2

    jmp exit1
;cazul in care depaseste pragul literelor mici
pm2:
	sub al, 26
    jmp v1

exit1:
;pun rezultatul obtinut in edx 
    mov ebx, dword[index1]
    mov byte[edx +ebx], al
;cresc index1 pentru noua iteratie
    inc dword[index1] 
    mov ebx, dword[ltext]
;verific daca s-a terminat textul
    cmp ebx, dword[index1]
    je end
;verific daca s-a terminat cheia
    mov ebx, dword[lkey]
    cmp ebx, dword[index2]
    je restart
    jmp for;
    
end:
;reinitializez index1 si index2
    mov dword[index1], 0
    mov dword[index2], 0




    ;; DO NOT MODIFYS
    popa
    leave
    ret
    ;; DO NOT MODIFY