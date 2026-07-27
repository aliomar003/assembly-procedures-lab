; Procedures Lab
; Generates uppercase English letters A through Z.
; Each letter is displayed on a separate line.
; Uses a loop and a procedure.

section .data
    output db 'A', 10       ; Character followed by line feed

section .text
    global _start

_start:
    mov esi, 'A'            ; Start with uppercase A

letter_loop:
    mov eax, esi
    mov byte [output], al   ; Store current character in output
    call print_character    ; Call procedure to display it

    inc esi                 ; Move to the next ASCII character
    cmp esi, 'Z'            ; Has Z been passed?
    jle letter_loop         ; Continue through Z

exit_program:
    mov eax, 1              ; sys_exit
    mov ebx, 0              ; Exit status 0
    int 0x80

; ---------------------------------------------------------
; Procedure: print_character
; Purpose: Prints the character stored in output followed
;          by a line feed.
; ---------------------------------------------------------
print_character:
    push eax
    push ebx
    push ecx
    push edx

    mov eax, 4              ; sys_write
    mov ebx, 1              ; Standard output
    mov ecx, output         ; Address of output
    mov edx, 2              ; Character and line feed
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret