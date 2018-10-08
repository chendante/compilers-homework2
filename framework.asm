	.586
	.model flat, stdcall
	option casemap :none

    include \masm32\macros\macros.asm
    
    include    \masm32\include\msvcrt.inc
    includelib \masm32\lib\msvcrt.lib

	.data


	.code
_start:
    invoke crt_scanf, SADD("%d",0), addr _n
    invoke crt_printf, SADD("%d",13,10), _a
    invoke crt_printf, SADD("%d",13,10), _b
@0:
	jl @1
	jmp @2
@1:
    invoke crt_printf, SADD("%d",13,10), _b
	jmp @0
@2:
    invoke crt__exit, 0
END _start
