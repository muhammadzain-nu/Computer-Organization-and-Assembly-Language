INCLUDE Irvine32.inc

.code
main PROC
mov eax, 10h
mov ebx, 25h
add eax, ebx
mov ecx, 20h
mov edx, 30h
add ebx, ecx
add ebx, edx
call DumpRegs
exit
main ENDP
END main