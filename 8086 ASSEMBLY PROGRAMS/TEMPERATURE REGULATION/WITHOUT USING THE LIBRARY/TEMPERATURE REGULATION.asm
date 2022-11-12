DATA SEGMENT       
    START_TEMP DB 00H
    MIN_TEMP DB 3CH
    MAX_TEMP DB 50H
    MSG1 DB "THE TEMPERATURE HAS REACHED 80C. TURNING OFF THE HEATER...",013,010, "$"
    MSG2 DB "THE TEMPERATURE HAS REACHED 60C. TURNING ON THE HEATER...",013,010, "$"
DATA ENDS

CODE SEGMENT
     ASSUME CS:CODE, DS:DATA
     ;TEMPERATURE CONTROL SYSTEM
     ;THE TEMPERATURE RANGE TO BE MAINTAINED RANGES FROM 60-80C.
     START: MOV AX, DATA
            MOV DS, AX
            LEA SI, START_TEMP 
                                     
            MOV BL, START_TEMP
                                                 
 TEMP_CTRL: MOV CX, 0010H ;DELAY TIME
            INC BL    
            CALL DELAY   
            CMP BL, MAX_TEMP
            JNZ TEMP_CTRL
                       
            MOV DX, OFFSET MSG1           
            MOV AH, 09H
            INT 21H
            
            
TEMP_CTRL2: MOV CX, 0010H ;DELAY TIME
            DEC BL    
            CALL DELAY   
            CMP BL, MIN_TEMP
            JNZ TEMP_CTRL2 
            
            MOV DX, OFFSET MSG2           
            MOV AH, 09H
            INT 21H
            
TEMP_CTRL3: MOV CX, 0010H ;DELAY TIME
            INC BL    
            CALL DELAY   
            CMP BL, MAX_TEMP
            JNZ TEMP_CTRL3

            MOV DX, OFFSET MSG1           
            MOV AH, 09H
            INT 21H
            
            JMP TEMP_CTRL2      
                        
     DELAY: DEC CX
            JNZ DELAY
            RET      
CODE ENDS
     END START

AUTHOR: KARTHIKEYA SHARMA