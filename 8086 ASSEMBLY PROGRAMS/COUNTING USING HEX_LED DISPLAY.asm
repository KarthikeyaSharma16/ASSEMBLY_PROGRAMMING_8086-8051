#start = led_display.exe#
ORG 100H
MOV AX, 00H
L3: OUT 199, AX
    CALL DELAY
    INC AX
    CMP AX, 0AH
    JNZ L3     
L4: CALL DELAY
    OUT 199, AX
    DEC AX
    CMP AX,00H
    JNZ L4
    
DELAY: MOV CL, 1FH
       MOV CH, 1FH
L1: DEC CH
    JNZ L1
L2: DEC CL
    JNZ L2
RET                       

L5: HLT