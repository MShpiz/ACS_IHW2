.include "macrolib.s"
.global user_input_integral
.text
user_input_integral:
	push(ra)
	
	# prompt for begining of program
	print_str("function y = a + b*x^3 is going to be inegrated \n")
	
	#getting a and b from user
	print_str("enter a:")
	read_double(fa0)
	fpush(fa0)	# pushing to stack because print macros uses a0 register
	print_str("enter b:")
	read_double(fa1)
	
	#getting interval of integration from user
	print_str("enter the interval of inegration \n")
	print_str("enter starting point: ")
	read_double(fa2)
	print_str("enter ending point: ")
	read_double(fa3)
	fpop(fa0)	# getting a from stack
	
	# returns a - a0
	# returns b t - a1
	# returns begining of interval - a2
	# returns end of interval - a3
	
	pop(ra)
	ret