INCLUDE Irvine32.inc
.data
a dword 10h
b dword 12h
c1 dword 30h
d dword 20h
.code
main PROC
mov eax, b
add eax, b
add eax, c1
add eax, d
call DumpRegs
exit
main ENDP
END main