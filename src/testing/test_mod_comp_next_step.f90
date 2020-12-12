program test_mod_comp_next_step

use mod_centered_diff
use mod_comp_next_step

implicit none
  real, dimension(3,3) :: test_array, input_array_u, input_array_v, input_array_h, output_array
  integer :: im, jm
  real :: g, dx, dy, dt
  im = 3 
  jm = 3
  g = 10.0
  dx = 1.0
  dy = 1.0
  dt = 1.0
 
  print *, "Testing mod_comp_next_step..."

  print *, "Testing compute_next_u..."
 ! input_array_u = reshape( (/1.0,1.0,1.0, 2.0,2.0,2.0, 3.0,3.0,3.0/), (/3,3/) )
 ! input_array_v = reshape( (/1.0,1.0,1.0, 2.0,2.0,2.0, 3.0,3.0,3.0/), (/3,3/) )
 ! input_array_h = reshape( (/1.0,1.0,1.0, 2.0,2.0,2.0, 3.0,3.0,3.0/), (/3,3/) )
 ! test_array = reshape( (/1.0,1.0,1.0, 2.0,2.0,2.0, 3.0,3.0,3.0/) , (/3,3/) )
  input_array_u(:,:) = 1.0
  input_array_v(:,:) = 1.0
  input_array_h(:,:) = 1.0
  test_array(:,:) = 1.0
  
  call compute_next_u(im, jm, input_array_u, input_array_v, g, input_array_h, dx, dy, dt, output_array)

  if (all(test_array == output_array)) then
    print *, "Test passed"
  else
    print *, "Test failed"
  endif

endprogram test_mod_comp_next_step
