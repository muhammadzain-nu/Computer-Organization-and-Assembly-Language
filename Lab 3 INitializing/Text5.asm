INCLUDE Irvine32.inc
.data
marks word 10,3,5,
           20, 30, 40,
           50, 60, 70 ,
           80, 90, 100,
           10, 20, 30
.code
main PROC

call DumpRegs
exit
main ENDP
END main