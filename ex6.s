@ ARM Assembly - exercise 6
@ E/13/397  D.L Wickramanayake
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	
fact: mov r1,#1  @fac=1
	  
loop: cmp r0,#0  @while(number>0)
	  ble exit	@if number<=0 loop exit
	  mul r1,r0,r1  @fac=fac*number
	  sub r0,r0,#1 @number--;
	  b loop  @continue the loop

@when exiting fac is copied to r0 
@return value is copied to program counter 	 
exit:  mov r0,r1
	  mov pc,lr 
	  

@ ---------------------	

.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the fact function
	mov r0, r4 	@the arg1 load
	bl fact
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
format: .asciz "Factorial of %d is %d\n"

