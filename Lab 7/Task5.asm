Include Irvine32.inc
.data
n sdword ?
sum2 SdWord ?
msg BYTE " Enter NUmber of Elements: ", 0
msg1 BYTE "Enter Elements", 0
msg2 BYTE "The SUM IS: "
.code
main proc
mov eax, 0
mov edx, offset msg
call WriteString
call ReadInt
mov n, eax
mov ecx, eax
mov edx, offset msg1
call WriteString

call sum1
mov eax, sum2
mov edx, offset msg2
call WriteString
call WriteInt 
exit
main endp
sum1 proc
L1:
call readint
add sum2, eax
Loop L1
ret
sum1 endp
end main