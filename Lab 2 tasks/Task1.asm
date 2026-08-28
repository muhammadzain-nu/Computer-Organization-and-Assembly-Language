INCLUDE Irvine32.inc
.code
main PROC
mov eax, 0072H
sub eax, 0D83H
add eax, 011DH
add eax, 0014H
add eax, 008DH 
sub eax, 000EH
add eax, 000FH
call DumpRegs
exit
main ENDP
END main