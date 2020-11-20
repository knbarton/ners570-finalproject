program tsunami

use mod_centered_diff
use mod_initialize

implicit none

integer :: n
integer, parameter :: im = 201, jm = 201 ! Max dimensions of h,u,v arrays
integer, parameter :: num_time_steps = 1000

real, parameter :: dt = 0.02
real, parameter :: dx = 1, dy = 1
real, parameter :: g = 9.8

integer, parameter :: ic = im / 2 + 1
integer, parameter :: jc = jm / 2 + 1
real, parameter :: decay = 0.02

real, dimension(im,jm) :: h, hm, u, v

real :: hmin, hmax, hmean

integer :: i,j
character(len=8) :: file_name

h(:,:) = 0.0
hm(:,:) = 10.
u(:,:) = 0.0
v(:,:) = 0.0

call init_gaussian(h,decay,ic,jc)

! Output initial_height to file for visualization
call system("mkdir output")
open(2, file="output/initial_height.out")
do i = 1,im
  write(2,*) h(i,:)
enddo
close(2)

! Perform time stepping
  !     du/dt + u du/dx + v du/dy + g dh/dx = 0
  !     dv/dt + u dv/dx + v dv/dy + g dh/dy = 0
  !     dh/dt + d(hu)/dx + d(hv)/dy = 0
! Uses Forward Euler time stepping and centered-difference spatial derivatives
! u(n+1) = u(n) - RHS*dt

do n = 1,num_time_steps
  ! compute u at next time step
  u = u - (u * diffx(u) / dx + v * diffy(u) / dy &
    + g * diffx(h) / dx) * dt
  ! compute v at next time step
  v = v - (u * diffx(v) / dx + v * diffy(v) / dy &
    + g * diffy(h) / dy) * dt
  ! compute h at next time step
  h = h - (diffx(u * (hm + h)) / dx &
         + diffy(v * (hm + h)) / dy) * dt        
  call resetBCs(u)
  call resetBCs(v)
  call resetBCs(h)
enddo

open(2, file='output/final_height.out')
do i = 1,im
  write(2,*) h(i,:)
enddo

end program tsunami
