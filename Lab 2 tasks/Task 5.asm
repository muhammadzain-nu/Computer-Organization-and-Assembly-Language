INCLUDE Irvine32.inc
.code
main PROC
MOV EAX, 001101010010b 
ADD EAX, 55h           
SUB EAX, 84d             
ADD EAX, EBX            
SUB EAX, ECX             
ADD EAX, 5               
MOV ECX, EAX            

; --- Part B ---
MOV EDX, EAX            
ADD EDX, 3              
ADD EDX, EBX             
SUB EDX, ECX            
ADD EDX, 0Ah             
SUB EDX, 65o             
ADD EDX, 44d
call DumpRegs
exit
main ENDP
END main