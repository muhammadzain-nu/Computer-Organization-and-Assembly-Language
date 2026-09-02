INCLUDE Irvine32.inc
.data
Unin Word 3 DUP(0)
.code
main PROC

call DumpRegs
exit
main ENDP
END main