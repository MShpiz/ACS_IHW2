# variant 31
.include "macrolib.s"
.data

par_a:	.double
par_b:	.double	
interval_start:	.double
interval_end:	.double

.text
.global	main
main:
# prompt for begining of program
print_str("function y = a + b*x^3 is going to be inegrated \n")

#getting a and b from user
print_str("enter a:")
read_double(ft1)
print_str("enter b:")
read_double(ft2)

#getting interval of integration from user
print_str("enter the interval of inegration \n")
print_str("enter starting point: ")
read_double(ft3)
print_str("enter ending point: ")
read_double(ft4)

fsd	ft1, par_a, t0
fsd	ft2, par_b, t0
fsd	ft3, interval_start, t0
fsd	ft4, interval_end, t0

fmv.d	fa0, ft1		# passing a as an argument
fmv.d	fa1, ft2		# passing b as an argument
fmv.d	fa2, ft3			# passing begining of interval as an argument
fmv.d	fa3, ft4			# passing end of interval as an argument

jal print_equation

fld	ft1, par_a, t0		# passing a as an argument
fld	ft2, par_b, t0		# passing b as an argument
fld	ft3, interval_start, t0	# passing begining of interval as an argument
fld	ft4, interval_end, t0	# passing end of interval as an argument

jal integrate			# result of integration returns in a0

jal print_result	# passing result of integration by a0
exit
