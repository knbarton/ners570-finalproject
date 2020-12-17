module mod_centered_diff
! Performs the centered difference formula
! Add openMP parallelism to this?

use omp_lib

implicit none

private
public :: diffx, diffy, resetBCs

contains

  function diffx(x) result(dx)
    ! Centered finite difference
    real, intent(in) :: x(:,:) 
    real :: dx(size(x,dim=1),size(x,dim=2))
    integer :: i, im, j, jm
    im = size(x,dim=1)
    jm = size(x,dim=2)
    dx = 0
!    print *, 'diffx'
    !$omp paralleldo private(i,j) 
    do j=2,jm-1
       do i=2,jm-1
          dx(i,j) = 0.5*( x(i+1,j) - x(i-1,j)  )
       enddo
    enddo
    !$omp end paralleldo 
  end function diffx

  function diffy(x) result(dx)
    ! Centered finit difference
    real, intent(in) :: x(:,:) 
    real :: dx(size(x, dim=1), size(x, dim=2))
    integer :: j, jm, i, im
    im = size(x,dim=1)
    jm = size(x,dim=2)
    dx = 0
!    print *, 'diffy'
    !$omp paralleldo private(i,j)
    do j=2,jm-1
           do i=2,jm-1
              dx(i,j) = 0.5*( x(i,j+1) - x(i,j-1)  )
           enddo
    enddo
    !$omp end paralleldo 
  end function diffy

  subroutine resetBCs(a)
   ! Resets the periodic boundary conditions after time stepping
    real, intent(in out) :: a(:,:)
    integer :: i,im,j,jm
    im = size(a, dim=1)
    jm = size(a, dim=2)
!    print *, 'reset'
    !$omp paralleldo private(i)
       do i=1,im
          a(i,1) = a(i,jm-1)
          a(i,jm) = a(i,2)
       enddo
    !$omp end paralleldo
    !$omp paralleldo private(j)
       do j=1,jm
          a(1,j) = a(im-1,j)
          a(im,j) = a(2,j)
       enddo
    !$omp end paralleldo
  end subroutine resetBCs

end module mod_centered_diff


