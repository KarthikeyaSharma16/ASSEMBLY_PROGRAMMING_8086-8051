CODE SEGMENT
    ASSUME CS:CODE
    START: MOV AX, 2000H
           MOV DS, AX
           MOV SI, 5000H ;25000H
           
           MOV AX, 0000H 
           MOV BX, 0FFFFH
           
           MOV DX, 0200H
           
           ;FIRST BLOCK
     BACK: MOV DS:[SI], AX
           ADD SI, 02H
           INC AX
           DEC DX
           JNZ BACK
           
           ;SECOND BLOCK           
           MOV DX, 0200H
           MOV AX, 3000H
           MOV ES, AX
           MOV DI, 6000H ;36000H
           
     BACK1: MOV ES:[DI], BX
            ADD DI, 02H
            DEC BX
            DEC DX
            JNZ BACK1
            
            MOV DX, 0200H
            MOV SI, 5000H
            MOV DI, 6000H
            
     AGAIN: MOV AX, DS:[SI]
            MOV BX, ES:[DI]
            MOV DS:[SI], BX
            MOV ES:[DI], AX
            ADD SI, 02H
            ADD DI, 02H            
            DEC DX
            JNZ AGAIN
CODE ENDS
     END START 
     
AUTHOR : KARTHIKEYA SHARMA M