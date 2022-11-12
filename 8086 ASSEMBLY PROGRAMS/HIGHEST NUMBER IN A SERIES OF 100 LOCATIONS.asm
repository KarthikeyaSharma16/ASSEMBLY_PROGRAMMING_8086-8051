;KARTHIKEYA SHARMA

;GOTO LOCATION 4000:2000
;ENTER THE STRING OF NUMBERS
;THE HIGHEST NUMBER IN THE STRING IS STORED IN THE LOCATION 4000:2064H

CODE SEGMENT
     ASSUME CS:CODE
     START: MOV AX, 4000H ;SEGMENT ADDRESS
            MOV DS, AX
            MOV SI, 2000H ;OFFSET ADDRESS
            
            MOV CX, 0064H ;COUNT
            AND AX, 0000H
            
      BACK: MOV BL, [SI]
            CMP AL, BL
            JNC SKIP
            MOV AL, BL
      SKIP: INC SI
            LOOP BACK
            
            MOV [SI], AL
CODE ENDS
     END START