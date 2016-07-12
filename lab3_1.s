@ ARM Assembly - exercise 6
@ 
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
@int mypow(int x, int n){
@	int pow=1;
@	while(n>0){ //while n is not equal to zero loop continues
@		pow=pow*x; //initialy pow is 1 so 1 in to x is x then pow is x
@		n--;	//likewise x*x*.... can be obtain
@	}
@	return pow;
@}
mypow: mov r2,#1
	  
loop:  cmp r1,#0
	   ble outside
	   mul r2,r0,r2
	   sub r1,r1,#1
	   b loop

outside: mov r0,r2
	  
	     mov pc,lr 





@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value x
	mov r5, #3 	@the value n
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl mypow
	mov r6,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "%d^%d is %d\n"

