Include Irvine32.inc
.data
x DWORD 10
y DWORD 5
.code
main PROC
mov eax, x
add eax, y
call WriteDec
exit
main ENDP
END main

