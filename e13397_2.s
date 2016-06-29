@ ARM Assembly - lab 2
@ e13397  Dimuthu Wickaramanayake
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	@ load values
	@ a,b,i,j in r0,r1,r2,r3 respectively
	mov r0, #10
	mov r1, #5
	mov r2, #7
	mov r3, #-8

	
	@ Write YOUR CODE HERE
	
	@	Sum = 0;
	@	for (i=0;i<10;i++){
	@			for(j=5;j<15;j++){
	@				if(i+j<10) sum+=i*2
	@				else sum+=(i&j);	
	@			}	
	@	} 
	@ Put final sum to r5


	@ ---------------------
@initializing the vartiable sum and i
	
	mov r5,#0
	mov r2,#0
	
@Althogh this is a for loop using while loop implementation is easy
	
loop1: cmp r2,#10
	   bge exit  @ if the condition fail go to exit
	   
	   mov r3,#5   @Initializing the j is done is here
	   b loop2  @move to the inner for loop
	 
loop2: cmp r3,#15	  
	   bge exit1  @ if the condition fail go to exit1
	  
	   add r4,r2,r3
	   cmp r4,#10   @if condition implementation
	   bge Else  @if the condition fail go to else
	   add r5,r5,r2,lsl #1  
	   add r3,r3,#1  @increment j and go to the begining of the loop
	   b loop2
	   
@declaring else	   
Else: 
	   and r6,r2,r3  
	   add r5,r5,r6   
	   add r3,r3,#1 @increment j and go to the begining of the loop
	   b loop2

	  
exit1:	
		add r2,r2,#1   	
	    b loop1
	
exit:	
	   
	
	@ ---------------------
	
	
	@ load aguments and print
	ldr r0, =format
	mov r1, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "The Answer is %d (Expect 300 if correct)\n"

