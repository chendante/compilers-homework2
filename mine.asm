	.486
	.model flat, stdcall
	option casemap :none

    include \masm32\macros\macros.asm
    
    include    \masm32\include\msvcrt.inc
    includelib \masm32\lib\msvcrt.lib

    main_j PROTO
    main_f PROTO
    WaitKeyCrt PROTO

.data
    f dd 1
    n  db ?
    n_f db ?
    newline   BYTE      13, 10, 0

	.code
start:
    invoke main_j
    invoke main_f
    invoke WaitKeyCrt
    invoke crt__exit, 0
    
main_j PROC
    invoke crt_printf,SADD("input:   ")
    invoke crt_scanf, SADD("%d",0),addr n

    mov eax,f 
    mov ecx,2
@1:
    mul ecx
    inc ecx 
    cmp cl,n
    jle @1

    mov f,eax

    invoke crt_printf, SADD("%d",0),f
    ret
main_j  ENDP

main_f PROC
    invoke crt_printf,SADD(13,10,"input_f:   ")
    invoke crt_scanf,SADD("%d",0),addr n_f

    mov eax,0
    mov ebx,1
    mov ecx,1

    push eax
    push ebx
    push ecx

    invoke crt_printf,SADD("%d",13,10),eax
    invoke crt_printf,SADD("%d",13,10),ebx

    pop ecx
    pop ebx
    pop eax

    cmp cl,n_f
    jge @3
@2:
    push ecx
    push ebx
    add ebx ,eax
    invoke crt_printf,SADD("%d",13,10),ebx
    pop eax
    pop ecx
    inc ecx
    cmp cl,n_f
    jl @2

@3:
    invoke crt_printf,SADD("end")
    ret

main_f ENDP

WaitKeyCrt PROC 
    invoke crt_printf, SADD(13,10,"Press any key to continue...")
    invoke crt__getch
    .if (eax == 0) || (eax == 0E0h)
        invoke crt__getch
    .endif
    invoke crt_printf, OFFSET newline    
    ret
WaitKeyCrt ENDP

END start
