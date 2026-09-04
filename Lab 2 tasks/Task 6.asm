INCLUDE Irvine32.inc
.code
main PROC
mov eax, 57h
mov ebx , 38h
mov ecx, 50h
add eax, ebx
add eax, ecx
mov ebx, 65h
mov ecx, 84h
add eax, ebx
add eax, ecx
call DumpRegs
exit
main ENDP
END main