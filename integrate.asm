.include "macrolib.s"

.global	integrate
integrate:
.data
precision_pos:	.double 0.0001
precision_neg:	.double -0.0001
.text
	push(ra)
	# moving arguments to s registers as they are not going to be changed in the future of this function
	fpush(fs0)
	fpush(fs1)
	fpush(fs2)
	fpush(fs3)
	fmv.d 	fs0, fa0		# a	
	fmv.d 	fs1, fa1		# b
	fmv.d 	fs2, fa2		# start
	fmv.d 	fs3, fa3		# end
	
	fcvt.d.w	ft0, zero 	# result of integration
	
	fsub.d	ft1, fs3, fs2
	fcvt.d.w	ft2, zero
	fle.d	t0, ft1, ft2		# t0 shows wheter the starting point of integration is less than ending
	beqz	t0, integrationProcess
	
	fmv.d	ft6,fs2			# change start and end if start is greater than end
	fmv.d	fs2,fs3
	fmv.d	fs3,ft6
	
	integrationProcess:
	flw	ft3,  precision_pos, t1
	flw	ft4,  precision_neg, t1
	fle.d	t1, fs1, ft3
	fge.d	t2, fs1, ft4		
	and	t1, t1, t2
	bnez	t1, loop		# if b is close to zero the area is equal length of interval*a
					# else calculate the area the normal way 
	fsub.d	ft1, fs3, fs2
	fmul.d	ft0, fs0, ft1
	j	finish_integrate
	loop:
	
	
	finish_integrate:
	beqz	t0, end_func			# if initial start was greater than end result of
						# integration should be nagetive
	li	t1, -1
	fcvt.d.w	ft1, t1
	fmul.d		ft0, ft0, ft1
	end_func:
	fmv.d	fa0, ft0			# returning the result of integration
	fpop(fs3)
	fpop(fs2)
	fpop(fs1)
	fpop(fs0)
	pop(ra)
	ret