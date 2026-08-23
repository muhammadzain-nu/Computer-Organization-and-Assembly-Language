INCLUDE Irvine32.inc
.data
message BYTE "Hello, I'm Student of Your class, MUhammad Zain, having roll number 25K-3050, Of BSE-3A", 0
message1 BYTE "Proud to be A part of FAST Campus", 0
.code
main PROC
mov edx, OFFSET message
call WriteString
call Crlf
mov edx, OFFSET message1
call WriteString
call Crlf
exit
main ENDP
END main
