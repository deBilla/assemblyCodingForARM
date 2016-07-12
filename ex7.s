@ ARM Assembly - exercise 6
@ 
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	

@getting space in the stack
Fibonacci:  
			sub sp,sp,#12
			str r1,[sp,#8]
			str lr,[sp,#4]
			str r0,[sp,#0]
		   
			cmp r0,#1
	        bgt recurPart @if number>0 then it goes to recurPart
		   
			mov r0,#1
			add sp,sp,#12  @pop 3 items in the stack
			mov pc,lr  @return to caller

recurPart:  sub r0,r0,#1  @decrement r0 once
		    bl Fibonacci  @recursive call
		    mov r1,r0
		    ldr r0,[sp,#0]
		   
			ldr r1,[sp,#8] 
		    
		
			sub r0,r0,#1
		    bl Fibonacci  @recursive call
			
			ldr r0,[sp,#0]
			ldr lr,[sp,#4]
			ldr r1,[sp,#8] 
		   
			add sp,sp,#12   @pop 3 items from stack
		   
			add r0,r1,r0  @add to get result
			mov pc,lr  @return
		   
		   
@ ---------------------
	
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the Fibonacci function
	mov r0, r4 	@the arg1 load
	bl Fibonacci
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "F_%d is %d\n"

