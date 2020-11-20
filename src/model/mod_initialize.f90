module mod_initialize
! Initialize the function
! Include support for different initial conditions?

implicit none

private
public :: init_gaussian

contains

  subroutine init_gaussian(array, decay, ic, jc)
    ! Initialize a Gaussian on given array with decay constant
    ! 'decay' and the Gaussian center located at (ic,jc)
    ! The height is set to 1
    real, intent(in out) :: array(:,:) 
    real, intent(in) :: decay
    integer, intent(in) :: ic, jc
    integer :: imax, jmax, i, j
    imax = size(array,dim=1)
    jmax = size(array,dim=2)
    do i=1,imax
      do j=1,jmax
         array(i,j) = exp(-decay * ((i - ic)**2 + (j - jc)**2))
      enddo
    enddo
  end subroutine init_gaussian

end module mod_initialize
