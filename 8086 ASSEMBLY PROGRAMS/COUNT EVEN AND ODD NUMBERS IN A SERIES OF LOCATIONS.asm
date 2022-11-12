CODE SEGMENT
     ASSUME CS:CODE
     START: MOV AX, 4000H
            MOV DS, AX ;INITIALIZING THE DATA SEGMENT
            MOV SI, 2000H ;INITIALIZING THE SOURCE INDEX
            
            MOV CX, 0004H ;COUNT
            MOV DH, 00H ;ODD COUNT
            MOV DL, 00H ;EVEN COUNT
            
      BACK: MOV AL, DS:[SI]
            ROR AL,1
            JC ODD
            INC DL
            JMP NEXT
            
      ODD:  INC DH
            JMP NEXT
               
      NEXT: INC SI
            LOOP BACK
            
CODE ENDS
     END START