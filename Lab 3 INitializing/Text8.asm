INCLUDE Irvine32.inc
.data
arra SDWORD 20 DUP(5)
.code
main PROC
call DumpRegs
exit
main ENDP
END main