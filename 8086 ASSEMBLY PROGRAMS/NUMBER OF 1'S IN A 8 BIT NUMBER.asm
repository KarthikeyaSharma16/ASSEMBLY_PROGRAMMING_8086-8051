CODE SEGMENT
    ASSUME CS:CODE
    START: MOV AL, 0F2H
           MOV CL, 08H
           MOV DL, 00H
           MOV BL, DL
           
      BACK: ROR AL, 1
            JNC LABEL
            INC DL
      LABEL: INC BL
             CMP CL, BL
             JNZ BACK   
CODE ENDS 
     END START