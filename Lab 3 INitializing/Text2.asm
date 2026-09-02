INCLUDE Irvine32.inc
.data
tRepeat BYTE 200 DUP("NUCES")
.code
main PROC

call DumpRegs
exit
main ENDP
END main