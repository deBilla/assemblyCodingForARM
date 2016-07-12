@ ARM Assembly - exercise 6
@ 
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------
@here the code is written in a way that is actually not recurring
@but it is recurring
@int gcd(int a, int b){
@	if(b!=0) {
@		while(a>=b)  a=a-b;
		
@		 return gcd(b,a);

@}
@	else return a;
@}
gcd: cmp r1,#0
	 mov r12,r1
	 bne loop
	 mov pc,lr
	 
loop: cmp r0,r1
	  blt exit
	  sub r0,r0,r1
	  b loop
exit: mov r1,r0
	  mov r0,r12
	   b gcd
	   

@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #64 	@the value a
	mov r5, #24 	@the value b
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl gcd
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
format: .asciz "gcd(%d,%d) = %d\n"

