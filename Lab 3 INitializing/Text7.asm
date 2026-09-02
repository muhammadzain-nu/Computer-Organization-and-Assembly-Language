INCLUDE Irvine32.inc
.data

.code
main PROC
num1 sdword 1000h
num2 sdword 1000h
call DumpRegs
exit
main ENDP
END main