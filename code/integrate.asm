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
	
	fsub.d	ft1, fs3, fs2
	fcvt.d.w	ft2, zero
	fle.d	t0, ft1, ft2		# t0 shows wheter the starting point of integration is less than ending
	beqz	t0, integrationProcess
	
	fmv.d	ft6,fs2			# change start and end if start is greater than end
	fmv.d	fs2,fs3
	fmv.d	fs3,ft6
	
	integrationProcess:
	fld	ft6, precision_pos, t1
	fld	ft4, precision_neg, t1
	flt.d	t1, fs1, ft6
	fgt.d	t2, fs1, ft4	
	and	t1, t1, t2
	
	beqz	t1, rectangle_method		# if b is close to zero the area is equal length of interval*a
					# else calculate the area the normal way 
	fsub.d	ft1, fs3, fs2
	fmul.d	ft0, fs0, ft1		# put the result in ft0
	j	finish_integrate
	
	rectangle_method:
	fcvt.d.w	ft0, zero 	# result of integration
	fsub.d	ft1, fs3, fs2		# current step
	stepLoop:
		li	t2, 2
		fcvt.d.w	ft5, t2
		fdiv.d	ft1, ft1, ft5		# make step twice less
		fmv.d	ft2, fs2		# current position
		fcvt.d.w	ft6, zero 	# result of integration with current step
		
		loop:
			
			fmul.d	ft3, ft2, ft2		# calculating height of rectangle in current position
			fmul.d	ft3, ft3, ft2
			
			fmul.d	ft3, ft3, fs1
			fadd.d	ft3, ft3, fs0
			
			#fmadd.d ft3, ft3, fs1, fs0	# works wierdly with negative numbers
			
			
			fadd.d	ft6, ft6, ft3		# adding it to the result
			
			fadd.d	ft2, ft2, ft1		# moving to next position
			fge.d	t2, ft2, fs3
			beqz	t2, loop
			
		fmul.d	ft6, ft6, ft1		
		fsub.d	ft5, ft0, ft6			# if difference between current result and previous result
		
		fld	ft3,  precision_pos, t1		# is less than precision, end cycle
		fld	ft4,  precision_neg, t1		# else set result to ft0 and continue the cycle with smaller step
		fle.d	t3, ft5, ft3
		fge.d	t4, ft5, ft4
		and	t2, t3, t4
		fmv.d	ft0, ft6
		bnez	t2, finish_integrate
		j	stepLoop		
	
	finish_integrate:
	beqz	t0, end_func			# if initial start was greater than end 
						# result of integration should be nagetive
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
