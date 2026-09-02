INCLUDE Irvine32.inc

.data
buffer BYTE 100 DUP(?)                                
msg    BYTE "COMPUTER ORGANIZATION & ASSEMBLY LANGUAGE LAB", 0 

.code
main PROC
    call DumpRegs                                      
    exit                                              
main ENDP
END main