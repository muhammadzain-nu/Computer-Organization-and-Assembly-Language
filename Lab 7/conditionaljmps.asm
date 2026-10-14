Include Irvine32.inc 

.data
var1 sdword -50
var2 sdword 125
larger dword ?
msg BYTE "The Value : ", 0
msg2 BYTE " Is greater than Value:", 0
.code
main PROC
mov eax, 0
mov eax, Pvar1
mov ebx, Pvar2
cmp eax, ebx
jg Pvar1
jmp Pvar2

Pvar1:
mov edx, offset msg
call WriteString
mov eax, var1
call writeint
mov edx, offset msg2
call writeString
mov eax, var2
call writeint
jmp exitp
Pvar2:
mov edx, offset msg
call WriteString
mov eax, var2
call writeint 
mov edx, offset msg2
call writeString
mov eax, var1
call writeint 

exitp:
exit
main endp
end main