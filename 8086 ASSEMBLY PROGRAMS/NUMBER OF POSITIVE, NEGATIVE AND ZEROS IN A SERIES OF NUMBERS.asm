CODE SEGMENT
    ASSUME CS:CODE
    START: MOV AX, 4000H
           MOV DS, AX
           MOV SI, 2000H
           MOV CX, 000AH
           MOV BH, 00H ;POSITIVE NUMBERS
           MOV BL, 00H ;NEGATIVE NUMBERS
           MOV DL, 00H ;NUMBER OF ZEROS
           
           AND AX, 0000H
           
     BACK: MOV AL, [SI]
           ADD AL, 00H
           JZ ZEROS
           
           ROL AL, 1
           JC NEGATIVE
           INC BH
           JMP SKIP
           
    ZEROS: INC DL
           JMP SKIP   
           
 NEGATIVE: INC BL
           JMP SKIP
            
     SKIP: INC SI
           LOOP BACK    
CODE ENDS 
     END START