CODE SEGMENT
    ASSUME CS:CODE
    START: MOV AX, 2000H
           MOV DS, AX
           MOV SI, 5000H ;25000H
           
           ;MOV AX, 3000H
           ;MOV ES, AX
           ;MOV DI, 6000H
           
           MOV AX, 0000H 
           MOV BX, 0FFFFH
           
           MOV DX, 0200H
           MOV CX, DX
           
           ;FIRST BLOCK
     BACK: MOV [SI], AX
           ADD SI, 02H
           INC AX
           DEC DX
           JNZ BACK
           
           ;SECOND BLOCK           
           MOV DX, CX
           MOV AX, 3000H
           MOV DS, AX
           MOV SI, 6000H ;36000H
           
     BACK1: MOV [SI], BX
            ADD SI, 02H
            DEC BX
            DEC DX
            JNZ BACK1
            
            ;FIRST TRANSFER
            MOV AX, 2000H
            MOV DS, AX
            MOV SI, 5000H
            
            MOV AX, 4000H
            MOV ES, AX
            MOV DI, 8000H
            CLD
            REP MOVSW 
            
            ;SECOND TRANSFER
            MOV AX, 3000H
            MOV DS, AX
            MOV SI, 6000H
            
            MOV AX, 2000H
            MOV ES, AX
            MOV DI, 5000H
            MOV CX, 0200H
            CLD
            REP MOVSW
            
            ;THIRD TRANSFER
            MOV AX, 4000H
            MOV DS, AX
            MOV SI, 8000H
            
            MOV AX, 3000H
            MOV ES, AX
            MOV DI, 6000H
            MOV CX, 0200H
            CLD
            REP MOVSW            
            
CODE ENDS
     END START 
     
AUTHOR : KARTHIKEYA SHARMA M