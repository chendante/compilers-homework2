	.486
	.model flat, stdcall
	option casemap :none

    include \masm32\macros\macros.asm
    
    include    \masm32\include\msvcrt.inc
    includelib \masm32\lib\msvcrt.lib

    main PROTO
    WaitKeyCrt PROTO

.data
    f dd 1
    n  dd ?
    newline   BYTE      13, 10, 0

	.code
start:
    invoke main
    invoke WaitKeyCrt
    invoke crt__exit, 0
    
main PROC
    invoke crt_printf,SADD("input:   ")
    invoke crt_scanf, SADD("%d",0),addr n

    mov eax,f 
    mov ecx,2
@1:
    mul ecx
    inc ecx 
    cmp ecx,n
    jle @1

    mov f,eax

    invoke crt_printf, SADD("%d",0),f
    ret
main  ENDP

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
