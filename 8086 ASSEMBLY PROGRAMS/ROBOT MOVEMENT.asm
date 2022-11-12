;KARTHIKEYA SHARMA
                  
;Analyzing the movements of a virtual robot.
;Write a program to move a robot in an environment and switch on a light when it comes across a bulb 
;which is OFF. Analyze the changes in movement when the initial position of the robot is changed                  


#start=robot.exe#

name "robot"

#make_bin#
#cs = 500#
#ds = 500#
#ss = 500#
#sp = ffff#
#ip = 0#
r_port equ 9
eternal_loop: call wait_robot
mov al, 4
out r_port, al

call wait_exam

in al, r_port + 1
cmp al, 0
je cont  
cmp al, 255  
je cont 
cmp al, 7
jne lamp_off 
call switch_off_lamp 
jmp  cont

lamp_off: nop
call switch_on_lamp

cont: call random_turn
      call wait_robot
      mov al, 1
      out r_port, al
      call wait_robot
      mov al, 1
      out r_port, al
      jmp eternal_loop 
      
      wait_robot proc
        busy: in al, r_port+2
        test al, 00000010b
        jnz busy 
        ret
      wait_robot endp
      
      wait_exam proc
busy2: in al, r_port+2
       test al, 00000001b
       jz busy2 
       ret    
      wait_exam endp
      
      switch_off_lamp proc
        mov al, 6
        out r_port, al
        ret
        switch_off_lamp endp
      
      switch_on_lamp proc
        mov al, 5
        out r_port, al
        ret
      switch_on_lamp endp
      
      random_turn proc
        mov ah, 0
        int 1ah
        xor dh, dl
        xor ch, cl
        xor ch, dh
        test ch, 2
        jz no_turn
        test ch, 1
        jnz turn_right
        mov al, 2
        out r_port, al
        ret           
turn_right: mov al, 3
            out r_port, al
no_turn: ret
      random_turn endp