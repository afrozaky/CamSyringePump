program calcDisc
Implicit none
Real theta, t, t1, t2, t3, t4, t5, x, f, PI, RPM, theta1, theta2, theta3, theta4, theta5, n, tau, maxx, radius, area, x0
PI = 4.0*ATAN(1.0)
!theta in radians
!tau = time step
tau = .001
theta = 0.0
x0 = 2.54
x = x0
f = 16.42
RPM = 150.0
radius = 1.3/2.0
area = pi*radius**2.0*2.54**2.0
maxx = 0.0
t = 0.0

theta1 = 20.0
theta1 = theta1*PI/180.0
t1 = 30.0*theta1/PI/RPM
theta2 = PI - theta1
t2 = 30.0*theta2/PI/RPM
theta3 = PI + theta1
t3 = 30.0*theta3/PI/RPM
theta4 = 2.0*PI - theta1
t4 = 30.0*theta4/PI/RPM
theta5 = 2.0*PI
t5 = 30.0*theta5/PI/RPM


open(unit=20, file='thetaX.dat')
open(unit=30, file='timeV.dat')
open(unit=40, file='timeX.dat')
open(unit=50, file='timeFlow.dat')

do while(theta <= theta1)
	t = t + tau
	x = x + f/t1*t*tau
	theta = 2.0*PI*RPM/60.0 * t
	write(20, *) theta, x
	write(40, *) t, x
	write(30, *) t, f/t1*t
	write(50, *) t, f/t1*t*area
	if(x > maxx) THEN
		maxx = x
	end if
end do


do while(theta <= theta2)
	t = t + tau
	x = x + f*tau 
	theta = 2.0*PI*RPM/60.0 * t
	write(20, *) theta, x
	write(40, *) t, x
	write(30, *) t, f
	write(50, *) t, f*area
	if(x > maxx) THEN
		maxx = x
	end if
end do

do while(theta <= theta3)
	t = t + tau
	x = x - 2*f/(t3-t2)*(t-t2)*tau + f*tau
	theta = 2.0*PI*RPM/60.0 * t
	write(20, *) theta, x
	write(40, *) t, x
	write(30, *) t, -2*f/(t3-t2)*(t-t2)+f
	write(50, *) t, (-2*f/(t3-t2)*(t-t2)+f)*area
	if(x > maxx) THEN
		maxx = x
	end if
end do


do while(theta <= theta4)
	t = t + tau
	x = x - f*tau
	theta = 2.0*PI*RPM/60.0 * t
	write(20, *) theta, x
	write(40, *) t, x
	write(30, *) t, -f
	write(50, *) t, -f*area
	if(x > maxx) THEN
		maxx = x
	end if
end do


do while(theta <= theta5)
	t = t + tau
	x = x + f/(t5-t4)*(t-t4)*tau - f*tau
	theta = 2.0*PI*RPM/60.0 * t
	write(20, *) theta, x
	write(40, *) t, x
	write(30, *) t, f/(t5-t4)*(t-t4) - f
	write(50, *) t, (f/(t5-t4)*(t-t4) - f)*area
	if(x > maxx) THEN
		maxx = x
	end if
end do

write(*,*) maxx - x0
close(20)
close(30)
close(40)
close(50)
end Program