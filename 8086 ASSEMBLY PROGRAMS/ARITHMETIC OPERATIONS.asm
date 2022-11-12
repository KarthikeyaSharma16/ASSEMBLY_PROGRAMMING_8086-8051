DATA SEGMENT
     MSG1 DB 0DH, 0AH, "WELCOME! SELECT ANY ONE OF THE FOUR OPERATIONS: $"
     MSG2 DB 0DH, 0AH, "01-ADDITION$"                          
     MSG3 DB 0DH, 0AH, "02-SUBTRACTION$"                           
     MSG4 DB 0DH, 0AH, "03-MULTIPLICATION$"                                                                                      
     MSG5 DB 0DH, 0AH, "04-DIVISION$"  
     MSG6 DB 0DH, 0AH, "INVALID INPUT!"                                         
     MSG7 DB 0DH, 0AH, "$"  
     MSG8 DB 0DH, 0AH, "DO YOU WISH TO PERFORM ANOTHER OPERATION? 00-YES 01-NO$"   
     MSG9 DB 0DH, 0AH, "ENTER AN 8-BIT NUMBER: $"
     MSG10 DB 0DH, 0AH, "ENTER ANOTHER 8-BIT NUMBER (SUBTRAHEND OR DIVISOR): $" 
     SUM DB ?
     CARRY DB 00H 
     MSG11 DB 0DH, 0AH, "SUM: $"
     MSG12 DB 0DH, 0AH, "CARRY: $"
     MSG13 DB 0DH, 0AH, "DIFFERENCE: $"
     MSG14 DB 0DH, 0AH, "BORROW: $" 
     DIFFERENCE DB ?
     BORROW DB 00H  
     PRODUCT DW ? 
     MSG15 DB 0DH,0AH,"PRODUCT: $"
     MSG16 DB 0DH, 0AH, "QUOTIENT: $"
     MSG17 DB 0DH, 0AH, "REMAINDER: $" 
     QUOTIENT DB ?
     REMAINDER DB ?
     MSG18 DB 0DH, 0AH, "AUTHOR: KARTHIKEYA SHARMA, A PERSON IN LOVE WITH MICROPROCESSORS AND MICROCONTROLLERS$"
DATA ENDS                                                                       

CODE SEGMENT
     ASSUME CS:CODE, DS:DATA
     START: MOV AX, DATA
            MOV DS, AX
            
            MOV AH, 09H
            LEA DX, MSG1
            INT 21H
            
            MOV AH, 09H
            LEA DX, MSG2
            INT 21H
            
            MOV AH, 09H
            LEA DX, MSG3
            INT 21H
            
            MOV AH, 09H
            LEA DX, MSG4
            INT 21H
            
            MOV AH, 09H
            LEA DX, MSG5
            INT 21H
            
            MOV AH, 09H
            LEA DX, MSG7
            INT 21H
            
            CALL KSGET8
            MOV BL, AL
            CMP BL, 01H
            JNZ SUB_CHECK
            
        ADDITION: CALL KSADD8 
                  
                  MOV AH, 09H
                  LEA DX, MSG11
                  INT 21H 
                  MOV BH, SUM        
                  CALL KSDISP8
                          
                  MOV AH, 09H
                  LEA DX, MSG12
                  INT 21H 
                  MOV BH, CARRY
                  CALL KSDISP8
                                   
                  JMP ENP                  
                  
       SUB_CHECK: CMP BL, 02H
                  JNZ MUL_CHECK
                              
     SUBTRACTION: CALL KSSUB8 
                  
                  MOV AH, 09H
                  LEA DX, MSG13
                  INT 21H 
                  MOV BH, DIFFERENCE        
                  CALL KSDISP8
                          
                  MOV AH, 09H
                  LEA DX, MSG14
                  INT 21H 
                  MOV BH, BORROW
                  CALL KSDISP8
                       
                  JMP ENP
                  
      MUL_CHECK:  CMP BL, 03H
                  JNZ DIV_CHECK         
                  
 MULTIPLICATION:  CALL KSMUL8 
                  
                  MOV AH, 09H
                  LEA DX, MSG15
                  INT 21H 
                  MOV BX, PRODUCT        
                  CALL KSDISP8   
                  MOV BH, BL
                  CALL KSDISP8
                       
                  JMP ENP
     
       DIV_CHECK: CMP BL, 04H
                  JNZ INVALID_INPUT
     
        DIVISION: CALL KSDIV8  
                  
                  MOV AH, 09H
                  LEA DX, MSG16
                  INT 21H 
                  MOV BH, QUOTIENT        
                  CALL KSDISP8
                          
                  MOV AH, 09H
                  LEA DX, MSG17
                  INT 21H 
                  MOV BH, REMAINDER
                  CALL KSDISP8
                       
                  JMP ENP            

     INVALID_INPUT:  MOV AH, 09H
                     LEA DX, MSG6
                     INT 21H 
                     JMP START        
                       
            PROC KSGET8
                PUSH CX
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                CMP AL, 09H
                JC SKIP
                JZ SKIP
                SUB AL, 07H
          SKIP: MOV CH, AL     
                
                MOV AH, 01H
                INT 21H
                SUB AL, 30H
                CMP AL, 09H
                JC SKIP2
                JZ SKIP2
                SUB AL, 07H
         SKIP2: MOV CL, 04H
                ROR CH, CL
                ADD AL, CH     
                POP CX
                RET    
            ENDP KSGET8
            
            PROC KSDISP8
                PUSH CX
                MOV AH, BH
                AND AH, 0F0H
                MOV CL, 04H
                ROR AH, CL
                ADD AH, 30H
                CMP AH, 39H
                JC SKIP4
                JZ SKIP4
                ADD AH, 07H
         SKIP4: MOV AL, AH
                MOV AH, 02H
                MOV DL, AL
                INT 21H
                
                MOV AH, BH
                AND AH, 0FH
                ADD AH, 30H
                CMP AH, 39H
                JC SKIP5
                JZ SKIP5
                ADD AH, 07H
         SKIP5: MOV AL, AH
                MOV AH, 02H
                MOV DL, AL
                INT 21H
                
                POP CX
                RET
            ENDP KSDISP8
            
            PROC KSADD8
                PUSH CX
                MOV AH, 09H
                LEA DX, MSG9
                INT 21H    
                
                CALL KSGET8     
                MOV BH, AL
                
                MOV AH, 09H
                LEA DX, MSG10
                INT 21H
                
                CALL KSGET8     
                MOV BL, AL
                
                ADD BL, BH
                JNC SKIP3
                INC CARRY
         SKIP3: MOV SUM, BL      
                POP CX
                RET    
            ENDP KSADD8            
            
            PROC KSSUB8
                PUSH CX
                MOV AH, 09H
                LEA DX, MSG9
                INT 21H    
                
                CALL KSGET8     
                MOV BH, AL
                
                MOV AH, 09H
                LEA DX, MSG10
                INT 21H
                
                CALL KSGET8     
                MOV BL, AL
                
                SUB BH, BL
                JNC SKIP6
                INC BORROW
         SKIP6: MOV DIFFERENCE, BH      
                POP CX
                RET    
            ENDP KSSUB8 
            
            PROC KSMUL8
                PUSH CX
                MOV AH, 09H
                LEA DX, MSG9
                INT 21H    
                
                CALL KSGET8     
                MOV BH, AL
                
                MOV AH, 09H
                LEA DX, MSG10
                INT 21H
                
                CALL KSGET8     
                
                MUL BH
                MOV PRODUCT, AX      
                POP CX
                RET    
            ENDP KSMUL8
            
            PROC KSDIV8
                PUSH CX
                MOV AH, 09H
                LEA DX, MSG9
                INT 21H    
                
                CALL KSGET8     
                MOV BH, AL
                
                MOV AH, 09H
                LEA DX, MSG10
                INT 21H      
                                
                CALL KSGET8     
                MOV AH, AL
                MOV AL, BH
                MOV BH, AH
                AND AX, 00FFH
               
                DIV BH       
                MOV QUOTIENT, AL
                MOV REMAINDER, AH      
                POP CX
                RET    
            ENDP KSDIV8            
            
         ENP: AND AX, 0000H   ;RESET ALL VARIABLES
              MOV SUM, AL
              MOV CARRY, AL
              MOV DIFFERENCE, AL
              MOV BORROW, AL
              MOV PRODUCT, AX
              MOV QUOTIENT, AL
              MOV REMAINDER, AL
          
              MOV AH, 09H
              LEA DX, MSG8
              INT 21H
              
              MOV AH, 09H
              LEA DX, MSG7
              INT 21H
              
              CALL KSGET8 
              CMP AL, 00H
              JNZ END_OF_PROGRAM
              JMP START

END_OF_PROGRAM: MOV AH, 09H
                LEA DX, MSG18
                INT 21H
              
                MOV AH, 09H
                LEA DX, MSG7
                INT 21H

CODE ENDS
     END START


AUTHOR: KARTHIKEYA SHARMA