program test_mod_centered_diff

use mod_centered_diff

implicit none
  real, dimension(3,3) :: input_array, test_array
  
  print *, "Testing mod_centered_diff..." 
  !!! Testing diffx function of mod_centered_diff !!!
  input_array(:,:) = 1.0 ! initial array
  
  input_array = diffx(input_array) ! setting input_array to the output of diffx
  
  test_array(:,:) = 0.0 ! what the output should be
   
  print *, "Testing diffx..."

  if (all(input_array == test_array)) then
    print *, "Test passed"
  else
    print *, "Test failed"
  endif
  
  !!! Testing diffy function of mod_centered_diff !!!
  input_array(:,:) = 1.0 ! initial array

  input_array = diffy(input_array)

  test_array(:,:) = 0.0 ! what the output should be 
  
  print *, "Testing diffy..."

  if (all(input_array == test_array)) then
    print *, "Test passed"
  else
    print *, "Test failed"
  endif
  
  !!! Testing resetBCs subroutine !!!
  input_array(:,:) = 1.0 ! initial array

  call resetBCs(input_array)

  test_array(:,:) = 1.0 ! what the output should be
  print *, "Testing resetBCs..."

  if (all(input_array == test_array)) then
    print *, "Test 1 passed"
  else
    print *, "Test 1 failed"
  endif
  
  input_array = reshape( (/1.0,1.0,1.0, 2.0,2.0,2.0, 3.0,3.0,3.0/), (/3,3/) )

  call resetBCs(input_array)

  test_array(:,:) = 2.0
  if (all(input_array == test_array)) then
    print *, "Test 2 passed"
  else
    print *, "Test 2 failed"
  endif
  

endprogram test_mod_centered_diff
