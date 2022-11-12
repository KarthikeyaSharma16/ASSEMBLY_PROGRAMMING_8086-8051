CODE SEGMENT
     ASSUME CS:CODE
     START: MOV AX, 4000H
            MOV DS, AX
            MOV SI, 2000H
            
            MOV AL, [SI]
            AND AL, 0FH
            MOV [SI+01H], AL
            
            MOV AL, [SI]
            AND AL, 0F0H
            MOV CL, 04H
            ROR AL, CL
            MOV [SI+02H], AL
CODE ENDS
     END START