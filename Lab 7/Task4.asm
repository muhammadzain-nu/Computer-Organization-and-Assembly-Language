Include Irvine32.inc
.data
star BYTE "* ", 0
.code 
main PROC
mov edx, offset star
mov ebx, 1
mov ecx, 1
call Print
call Print
call Print
call Print
call Print
exit
main endp
Print PROC
L1:
call WriteString
Loop L1
call crlf
inc ebx
mov ecx, ebx
ret
Print endp
end main