INCLUDE Irvine32.inc

.data
intArray   DWORD 5 DUP(?)     
charString BYTE 10 DUP(?)     
doubleVar  QWORD ?           
.code
main PROC
mov eax, SIZEOF intArray      
add eax, SIZEOF charString     
add eax, SIZEOF doubleVar 
call DumpRegs
exit
main ENDP
END main