INCLUDE Irvine32.inc
.data
msg1 BYTE "Before Pushed: ", 0
msg2 BYTE "After POPFD: ", 0
.code
 main PROC
 mov eax, 5
 sub eax, 5
 pushfd
 mov edx, offset msg1
 call WriteString
 mov eax, 0
  
 call WriteDec
 call Crlf

mov eax, 10
sub eax, 3

call crlf


mov edx, offset msg2
call WriteString
mov eax, 1
call WriteDec
call crlf
popfd
call dumpregs
exit
main endp
end main