;FIBONACCI SERIES FOR FIRST 10 NUMBERS
;GOTO LOCATION 1000:1200 AND VIEW THE RESULT

CODE SEGMENT
    ASSUME CS:CODE
    START: MOV BX, 1000H
           MOV DS, BX
           MOV SI, 1200H
           MOV AL, 00H
           MOV DS:[SI], AL
           INC SI
           MOV CL, 01H
           MOV DS:[SI], CL
           MOV DX, 120AH
           
     FIBO: MOV AH, DS:[SI-1]
           MOV AL, DS:[SI]
           ADD AL, AH
           INC SI
           MOV DS:[SI], AL
           CMP DX, SI
           JNZ FIBO
CODE ENDS
     END START
     
AUTHOR: KARTHIKEYA SHARMA