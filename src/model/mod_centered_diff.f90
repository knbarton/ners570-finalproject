module mod_centered_diff
! Performs the centered difference formula
! Add openMP parallelism to this?

implicit none

private
public :: diffx, diffy, resetBCs

contains

  function diffx(x) result(dx)
    ! Centered finite difference
    real, intent(in) :: x(:,:) 
    real :: dx(size(x,dim=1),size(x,dim=2))
    integer :: i, im
    im = size(x,dim=1)
    dx = 0
    dx(2:im-1,:) = 0.5 * (x(3:im,:) - x(1:im-2,:))
  end function diffx

  function diffy(x) result(dx)
    ! Centered finit difference
    real, intent(in) :: x(:,:) 
    real :: dx(size(x, dim=1), size(x, dim=2))
    integer :: j, jm
    jm = size(x,dim=2)
    dx = 0
    dx(:,2:jm-1) = 0.5 * (x(:,3:jm) - x(:,1:jm-2))
  end function diffy

  subroutine resetBCs(a)
   ! Resets the periodic boundary conditions after time stepping
    real, intent(in out) :: a(:,:)
    integer :: i,im,j,jm
    im = size(a, dim=1)
    jm = size(a, dim=2)
    a(:,1) = a(:,jm-1)
    a(:,jm) = a(:,2)
    a(1,:) = a(im-1,:)
    a(im,:) = a(2,:)
  end subroutine resetBCs

end module mod_centered_diff


