INCLUDE Irvine32.inc
.data
sales sword 30, 50, 60, 70, 80, -40, -800
.code
main PROC

call DumpRegs
exit
main ENDP
END main