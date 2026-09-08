INCLUDE Irvine32.inc

.data

    msg BYTE 100 DUP(?)
    tempStr BYTE " COMPUTER ORGANIZATION & ASSEMBLY LANGUAGE LAB", 0
.code
main PROC
    mov esi, OFFSET tempStr  
    mov edi, OFFSET msg       
    call Str_copy             
    mov edx, OFFSET msg
    call WriteString
    call Crlf
    exit
main ENDP
END main
