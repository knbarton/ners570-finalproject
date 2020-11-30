program tsunami

use mod_centered_diff
use mod_initialize
use mod_comp_next_step

implicit none

  integer :: n = 0
  integer, parameter :: im = 201, jm = 201 ! Max dimensions of h,u,v arrays
  integer, parameter :: num_time_steps = 5000, interval = 10

  real, parameter :: dt = 0.02
  real, parameter :: dx = 1, dy = 1
  real, parameter :: g = 9.8

  integer, parameter :: ic = im / 2 + 1
  integer, parameter :: jc = jm / 2 + 1
  real, parameter :: decay = 0.02

  real, dimension(im,jm) :: h, hm, u, v, next_u, next_h, next_v

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
  ! Create output directory, if none exists
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
  ! Forward Euler time stepping and centered-difference spatial derivatives
  !     u(n+1) = u(n) - RHS*dt

  do n = 1,num_time_steps
    ! Compute values at next time step
    call compute_next_u(im, jm, u, v, g, h, dx, dy, dt, u)
    call compute_next_v(im, jm, u, v, g, h, dx, dy, dt, v)
    call compute_next_h(im, jm, u, v, h, hm, dx, dy, dt,h)
    ! Assign next time step to u,v,h
!    u = next_u
!    v = next_v
!    h = next_h
    ! Reset periodic boundary conditions
    call resetBCs(u)
    call resetBCs(v)
    call resetBCs(h)
    
    ! Every 'interval' time steps, output current state
    if (mod(n,interval).eq.0) then
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
