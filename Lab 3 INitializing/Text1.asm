INCLUDE Irvine32.inc
.data
bArray BYTE 10,20,30,40,50,60,70,80,100
.code
main PROC

call DumpRegs
exit
main ENDP
END main