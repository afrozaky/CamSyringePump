program convert
Real PI, theta, r
Integer n, i
PI = 4.0*ATAN(1.0)
n = 401
open(unit=12, file='thetaX.dat')
open(unit=13, file='output.txt')

do i=1,n
	read(12, *) theta, r
	write(13, *) theta*180.0/PI, r
enddo

close(12)
close(13)
end program