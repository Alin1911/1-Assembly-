%include "io.mac"

section .data
;index1 e pentru parcurgerea textului
    index1 dd 0
;index2 e pentru parcurgerea sirului cautat
    index2 dd 0
;lungimea textului
    ltext dd 0
;lungimea sirului cautat
    lsubs dd 0


section .text
    global my_strstr
    extern printf

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    ;; TO DO: Implement my_strstr


    mov dword[lsubs], edx
    mov dword[ltext], ecx


while:
;curat registri
    xor eax, eax
    xor ecx, ecx
;mut in al litera corespunzatoare index1 din text
    mov ecx, dword[index1]
    mov al, [esi + ecx]
;mut in acll litera corespunzatoare index2 din sirul cautat
    mov ecx, dword[index2]
    mov dl, [ebx + ecx]
;verific daca litera din text corespunde cu litera din
;sirul cautat
    cmp eax, edx
    je crestei2
; daca nu reinitializez index2 si cresc index1
    mov dword[index2], 0
    inc dword[index1] 
    jmp salt1

crestei2:
;daca sunt egale cresc index1 si index2
    inc dword[index1] 
    inc dword[index2]

    mov ecx, dword[lsubs]
;verific daca sa ajuns la finalul sirului cautat
    cmp ecx, dword[index2]
    je end

salt1:
;verific daca sa terminat textul
    mov ecx, dword[ltext]
    cmp ecx, dword[index1]
    je end1

    jmp while;

end:
;cazul in care sirul a fost gasit
    xor eax, eax
    mov eax, dword[index1]
    sub eax, dword[lsubs]
    mov byte[edi], al
    jmp end2
    
    
end1:
;cazul in care sirul nu a fost gasit
    xor eax, eax
    mov eax, dword[ltext]
    inc eax
    mov byte[edi], al

end2:
;reinitializez index1 si index2
    mov dword[index1], 0
    mov dword[index2], 0

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
