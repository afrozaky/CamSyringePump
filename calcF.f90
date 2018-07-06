Program verletHarmonic
Implicit None
Real(8), allocatable, Dimension(:) :: a, v, x, t, ke, pe, te
Real(8) theta, t, t1, t2, t3, t4, t5, x, f, PI, RPM, theta1, theta2, theta3, theta4, theta5, n, tau, lowf, upf, tol
integer i, n
upB = 10.d0
lowB = 0.d0
b = 5.d0
tau = 0.01d0
tol = 1.0d-3

open(unit=20, file='fcon.dat')
write(20,*) "#f-values		x-displacement"


do while (dabs(x-2.9d0) .GE. tol)

	if (te(n-1)-.01d0 > tol) then
		lowf = b
		b = (lowB+upB)/2.0d0
	else
		upB = b
		b = (lowB+upB)/2.0d0
	end if
	write(20, *) b, te(n-1)
end do

end program verletHarmonic