Include Irvine32.inc
.data
num1 sdword ?
num2 sdword ?
num3 sdword ?
msg BYTE "Enter a NUmber ", 0
msg1 BYTE "Result ", 0
.code
main PROC

call firstcall
mov edx, offset msg1
call WriteString
call WriteInt
call crlf
exit
main endp
firstcall PROC
call addthreenumbers
ret
firstcall endp
addthreenumbers PROC
mov edx, offset msg
call WriteString
call readInt
mov ebx, eax
mov num1, eax
call WriteString
call readInt
mov num2, eax
call WriteString
call readInt
mov num3, eax
add eax, num2
add eax, num1

ret
addthreenumbers ENDP
End main