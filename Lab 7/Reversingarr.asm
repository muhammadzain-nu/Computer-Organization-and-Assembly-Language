Include Irvine32.inc
.data
arr1 WORD 101, 102, 103, 104, 105
rollback Word 5 DUP(?)
msg BYTE "OLD ARRAY: ", 0
gap byte " ", 0
msg2 BYTE "NEW ARRAY: ", 0

.code
main proc
mov eax, 0
call crlf
mov edx, offset msg
call WriteString
call crlf
mov ecx, lengthof arr1
mov edi, offset arr1
mov edx,  offset gap
Display:
mov ax, [edi]
call WriteDec
call WriteString
push ax
add edi, 2
loop Display
mov ecx, 5
mov edi, offset rollback
Reverse: 
pop ax
mov [edi], ax
add edi, 2
loop Reverse
mov esi, offset rollback
mov edx, offset msg2
call crlf
call WriteString
mov edx, offset gap
call crlf
mov ecx, 5
Display1:
mov ax, [esi]
add esi, 2
call WriteDec
call WriteString
loop Display1

exit
main endp
end main