.486 ;使用486处理�?
.model flat,stdcall 
include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib


.data 
result0 dd 1;存储最终结�?
inputdata dd ?;输入的阶乘的最大�?
type0 db '%d',0
data4 db '请输入阶乘最大值ddddd: ',0

data1 db 'please2:',0
data2 db '阶乘结果�? ',0
.code 
start:
invoke crt_printf,addr data1;打印字符�?
invoke crt_scanf,addr type0,addr inputdata;type0表示输入的格式，inputdata表示输入的值存在哪�?
mov eax,result0 
mov ecx,2 

@@:;win32里面跳转的东西，目前不懂是什么，但是应该和@B联系，如果往下跳转应该是@F
;mov eax,result0
mul ecx
;mov result0,eax;其实两种方法都可�?
inc ecx 
cmp ecx,inputdata
jle @B

mov result0,eax
invoke crt_printf,addr data2 
invoke crt_printf,addr type0,result0
ret
;invoke crt__exit, 0 ;使用这个语句会使得exe立马退�?
end start