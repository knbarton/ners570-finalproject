module mod_comp_next_step
! contains subroutines for computing the next time step for v, u, and h

use mod_centered_diff

implicit none

private
public :: compute_next_u!, compute_next_v, compute_next_h

contains

  subroutine compute_next_u (im, jm, in_u, v, g, h, dx, dy, dt, next_u)
    
    integer, intent(in) :: im, jm ! dimension sizes
    real, intent(in) :: g, dx, dy, dt ! gravity, x step, y step, t step
    real, dimension(im,jm), intent(in) :: in_u, v, h
    real, dimension(im,jm), intent(out) :: next_u
    
    next_u = in_u - (in_u * diffx(in_u) / dx + v * diffy(in_u) / dy &
             + g * diffx(h) / dx) * dt
  
  end subroutine compute_next_u

end module mod_comp_next_step
