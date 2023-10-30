.include "macrolib.s"
.global print_result
.text
print_result:
	push(ra)
	
	print_str("Result: ")
	print_double(fa0)	
	print_str("\n")
	
	pop(ra)
	ret