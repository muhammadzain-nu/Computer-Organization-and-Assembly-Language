Include Irvine32.inc
.data
val1 sdword 101
val2 sdword -102
val3 sdword 11
msg1 BYTE "The Sum is: "
.code
main proc
mov eax, 0
mov eax, val1
push eax
mov eax, val2
push eax
mov eax, val3
push eax
pop ebx
pop eax
add eax, ebx
pop ebx
add eax, ebx
mov edx, offset msg1
call WriteString
call WriteInt
exit
main endp

end main