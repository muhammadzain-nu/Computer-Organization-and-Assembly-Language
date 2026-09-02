INCLUDE Irvine32.inc
.data
Unin BYTE 30 DUP(?)
.code
main PROC

call DumpRegs
exit
main ENDP
END main