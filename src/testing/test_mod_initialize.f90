program test_mod_initialize

use mod_initialize

implicit none
  logical :: success
  real, dimension(2,2) :: test_array, input_array
  integer :: ic, jc
  real :: decay, convrg
  
  test_array = reshape( (/1.0, exp(-1.0), exp(-1.0), exp(-2.0)/), (/2,2/)) 
  ! what the output of array should be
  
  input_array(:,:) = 0.0
  ic = 1
  jc = 1
  decay = 1.0
  
  call init_gaussian(input_array,decay,ic,jc)
  
  
  if (all(input_array == test_array)) then
    print *, "Test passed"
  else
    print *, "Test failed"
  endif
  !write(*,*) test_array
  !write(*,*) input_array

endprogram test_mod_initialize
