;PROGRAM
;SORTING A STRING IN ALPHABETICAL ORDER AND COUNTING THE NUMBER OF OCCURANCES                         

;ENTER A STRING TO BE SORTED IN THE LOCATION 2000:1000 OF THE MEMORY
;VIEW THE NUMBER OF OCCURANCES OF THE SORTED STRING IN THE STACK
;THE CODE WILL CONSTANTLY RUN UNTIL CX BECOMES 00H

CODE SEGMENT
     ASSUME CS:CODE
     START: MOV AX, 2000H
            MOV DS, AX
            MOV CH, 1CH
     BACK2: MOV CL, 1CH
            MOV SI, 1000H
            
     BACK1: MOV AL, DS:[SI]
            MOV AH, DS:[SI+01H]
            CMP AL, AH
            JC SKIP
            JZ SKIP
            MOV DS:[SI+01H], AL
            MOV DS:[SI], AH
      SKIP: INC SI
            DEC CL
            JNZ BACK1
            
            DEC CH
            JNZ BACK2
            
            MOV CH, 1DH
            MOV SI, 1000H
            MOV DL, 00H ;COUNT THE OCCURANCES
     COUNT: MOV BL, DS:[SI]
            INC SI
            MOV BH, DS:[SI]
            CMP BL, BH
            JNZ SKIP2
            INC DL
            JMP AHEAD
     SKIP2: INC DL
            PUSH DX
            AND DX, 0000H
     AHEAD: DEC CH
            JNZ COUNT       
CODE ENDS
     END START       

AUTHOR: KARTHIKEYA SHARMA