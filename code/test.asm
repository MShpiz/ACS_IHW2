.include "macrolib.s"

.data
test_1_par_a:	.double		10.0
test_1_par_b:	.double		10.0
test_1_interval_start:	.double	0.0
test_1_interval_end:	.double	0.0

test_2_par_a:	.double		0.0
test_2_par_b:	.double		0.0
test_2_interval_start:	.double	0.0
test_2_interval_end:	.double	1.0

test_3_par_a:	.double		10.0
test_3_par_b:	.double		0.0
test_3_interval_start:	.double	1.0
test_3_interval_end:	.double 0.0

test_4_par_a:	.double		1.0
test_4_par_b:	.double		1.0
test_4_interval_start:	.double	0.0
test_4_interval_end:	.double	1.0

test_5_par_a:	.double		1.0
test_5_par_b:	.double		1.0
test_5_interval_start:	.double	-1.0
test_5_interval_end:	.double	1.0

test:
print_str("test 1\n")
fld	fa0, test_1_par_a, t0
fld	fa1, test_1_par_b, t0
fld	fa2, test_1_interval_start, t0
fld	fa3, test_1_interval_end, t0
jal onetest

print_str("test 2\n")
fld	fa0, test_2_par_a, t0
fld	fa1, test_2_par_b, t0
fld	fa2, test_2_interval_start, t0
fld	fa3, test_2_interval_end, t0
jal onetest

print_str("test 3\n")
fld	fa0, test_3_par_a, t0
fld	fa1, test_3_par_b, t0
fld	fa2, test_3_interval_start, t0
fld	fa3, test_3_interval_end, t0
jal onetest

fld	fa0, test_4_par_a, t0
fld	fa1, test_4_par_b, t0
fld	fa2, test_4_interval_start, t0
fld	fa3, test_4_interval_end, t0
jal onetest

fld	fa0, test_5_par_a, t0
fld	fa1, test_5_par_b, t0
fld	fa2, test_5_interval_start, t0
fld	fa3, test_5_interval_end, t0
jal onetest

exit

onetest:
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
jal integrate
print_str("Result: ")
print_double(fa0)
print_str("\n")
pop(ra)
ret