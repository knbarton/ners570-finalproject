program test_mod_centered_diff

use mod_centered_diff

implicit none
  real, dimension(3,3) :: input_array, test_array
  
  input_array(:,:) = 1.0 ! initial array
  
  input_array = diffx(input_array)
  
  test_array(:,:) = 0.0 ! what the output should be

  print *, "Testing mod_centered_diff..."
   
  !print *, test_array
  !print *,
  !print *, input_array
  print *, "Testing diffx..."

  if (all(input_array == test_array)) then
    print *, "Test passed"
  else
    print *, "Test failed"
  endif
 

endprogram test_mod_centered_diff
