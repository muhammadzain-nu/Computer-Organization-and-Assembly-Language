INCLUDE Irvine32.inc
.code
main PROC
mov ax, 45     
add ax, 69      
add ax, 50     
add ax, 75     
add ax, 54     
add ax, 44o     
sub ax, 0Ah
call DumpRegs
exit
main ENDP
END main