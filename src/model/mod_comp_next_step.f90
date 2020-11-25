module mod_comp_next_step
! contains subroutines for computing the next time step for v, u, and h

use mod_centered_diff

implicit none

private
public :: compute_next_u, compute_next_v, compute_next_h

contains

  subroutine compute_next_u (im, jm, u, v, g, h, dx, dy, dt, next_u)
    ! Computes the values of maxtrix u at the next time step
    integer, intent(in) :: im, jm ! dimension sizes
    real, intent(in) :: g, dx, dy, dt ! gravity, x step, y step, t step
    real, dimension(im,jm), intent(in) :: u, v, h ! u = current u
    real, dimension(im,jm), intent(out) :: next_u ! next_u = next iteration of u
    
    next_u = u - (u * diffx(u) / dx + v * diffy(u) / dy &
             + g * diffx(h) / dx) * dt
  
  end subroutine compute_next_u

  subroutine compute_next_v (im, jm, u, v, g, h, dx, dy, dt, next_v)
    ! computes the values of matrix v at the next time step
    integer, intent(in) :: im, jm ! dimension sizes
    real, intent(in) :: g, dx, dy, dt ! gravity, x step, y step, t step
    real, dimension(im,jm), intent(in) :: u, v, h ! v = initial (current) v
    real, dimension(im,jm), intent(out) :: next_v ! next_v iteration of v
    
    next_v = v - (u * diffx(v) / dx + v * diffy(v) / dy &
        + g * diffy(h) / dy) * dt

  end subroutine compute_next_v

  subroutine compute_next_h (im, jm, u, v, h, hm, dx, dy, dt, next_h)
    ! computes the values of matrix h at the next time step
    integer, intent(in) :: im, jm ! dimension sizes
    real, intent(in) :: dx, dy, dt ! gravity, x step, y step, t step
    real, dimension(im,jm), intent(in) :: u, v, h, hm ! h = initial (current) h
    real, dimension(im,jm), intent(out) :: next_h ! next_h iteration of h
    
    next_h = h - (diffx(u * (hm + h)) / dx &
         + diffy(v * (hm + h)) / dy) * dt

  end subroutine compute_next_h

end module mod_comp_next_step
