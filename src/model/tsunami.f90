program tsunami

use mod_centered_diff
use mod_initialize

implicit none

  integer :: n = 0
  integer, parameter :: im = 201, jm = 201 ! Max dimensions of h,u,v arrays
  integer, parameter :: num_time_steps = 2000

  real, parameter :: dt = 0.02
  real, parameter :: dx = 1, dy = 1
  real, parameter :: g = 9.8

  integer, parameter :: ic = im / 2 + 1
  integer, parameter :: jc = jm / 2 + 1
  real, parameter :: decay = 0.02

  real, dimension(im,jm) :: h, hm, u, v

  real :: hmin, hmax, hmean
  integer :: i,j

  ! File I/O
  integer :: m
  integer :: fu
  character(len=10) :: file_id
  character(len=50) :: file_name

  h(:,:) = 0.0
  hm(:,:) = 10.
  u(:,:) = 0.0
  v(:,:) = 0.0

  call init_gaussian(h,decay,ic,jc)

  ! Output initial_height to file for visualization
  !call SYSTEM("mkdir output")
  call execute_command_line('mkdir output')
  ! Write the integer into a string:
  write(file_id, '(i0)') n
  ! Construct the filename:
  file_name = 'output/' // trim(adjustl(file_id)) // '.out'
  ! Open the file with this name
  open(7, file = trim(file_name))
  do i = 1,im
    write(7,*) h(i,:)
  enddo
  close(7)

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

    if (mod(n,20).eq.0) then
       write(file_id, '(i0)') n
       file_name = 'output/' // trim(adjustl(file_id)) // '.out'
       open(2, file = trim(file_name))
       do i = 1,im
         write(2,*) h(i,:)
       enddo
       close(2)
    endif
  enddo

end program tsunami
