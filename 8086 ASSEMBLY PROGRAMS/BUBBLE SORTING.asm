CODE SEGMENT
    ASSUME CS:CODE
    START: MOV AX, 2000H
           MOV DS, AX
           
           MOV CH, 09H
       L2: MOV CL, 09H
           MOV SI, 1000H
           
       L1: MOV AL, DS:[SI]
           MOV AH, DS:[SI+01H]
           CMP AL, AH
           JC SKIP
           JZ SKIP
           MOV DS:[SI+01H], AL
           MOV DS:[SI], AH
     SKIP: INC SI
           DEC CL
           JNZ L1
           
           DEC CH
           JNZ L2 
CODE ENDS
     END START