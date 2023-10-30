.include "macrolib.s"
.global print_equation
.text
print_equation:
	push(ra)
	
	print_str("y = (")
	print_double(fa0)
	print_str(") + (")
	print_double(fa1)
	print_str(")*x^3\n")
	print_str("on interval [")
	print_double(fa2)
	print_str("; ")
	print_double(fa3)
	print_str("] \n")
	
	pop(ra)
	ret