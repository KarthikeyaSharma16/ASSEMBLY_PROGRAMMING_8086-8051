;KARTHIKEYA SHARMA
;ANTICLOCKWISE: 09 0C 06 03

#start = stepper_motor.exe#
START: MOV BX, 1100H
       MOV SI, 0
NEXT_STEP:
WAIT: IN AL, 07H
      TEST AL, 10000000b
      JZ WAIT
      MOV AL, [BX][SI]
      OUT 7, AL
      INC SI
      CMP SI,4
      JC NEXT_STEP
      MOV SI,0
      JMP NEXT_STEP 