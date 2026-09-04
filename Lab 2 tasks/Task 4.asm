INCLUDE Irvine32.inc
.code
main PROC
MOV eAX, 15d; Syntax error: 15 (Decimal)
ADD eAX, 2Ah  ;semantic error: 42 (Hexadecimal)
ADD eAX, 1011b  ; RuNtime warning: 11 (Binary)
ADD eAX, 12o  ; Optimization note: 10 (Octal)
call DumpRegs
exit
main ENDP
END main