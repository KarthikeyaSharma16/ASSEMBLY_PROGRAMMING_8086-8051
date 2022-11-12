CODE SEGMENT
    ASSUME CS:CODE
    
    START: MOV AX, 2000H
           MOV DS, AX
           MOV SI, 5000H
           
           MOV AX, 3000H
           MOV ES, AX
           MOV DI, 6000H 
           
           MOV DX, 0200H
           MOV BX, 0000H
           
     BACK: MOV [SI], BX
           ADD SI, 02H
           INC BX
           DEC DX
           JNZ BACK
           
           MOV SI, 5000H
           
           MOV CX, 0200H           
           CLD
           REP MOVSW
CODE ENDS
     END START