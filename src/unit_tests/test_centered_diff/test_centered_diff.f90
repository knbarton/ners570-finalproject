PROGRAM test_centered_diff
#include "UnitTest.h"
USE UnitTest
USE IntrType            !Futility module defines .APPROXEQ.
USE mod_centered_diff

IMPLICIT NONE

CREATE_TEST('centered_diff')

REGISTER_SUBTEST('diffx',test_diffx)
REGISTER_SUBTEST('diffy',test_diffy)
REGISTER_SUBTEST('resetBCs',test_resetBCs)


FINALIZE_TEST()


CONTAINS

SUBROUTINE test_diffx()
 REAL :: x(1,1),x1(1,3),testdx(1,3)
 
 COMPONENT_TEST('Error checking')

 COMPONENT_TEST('Zero Derivative')
 x=0.0
 ASSERT(ALL(diffx(x) .APPROXEQ. 0.0),'failed x=0')

 COMPONENT_TEST('Nominal')
 x1(1,:)=(/1.0,0.0,1.0/)
 refdx(1,:)=(/0.5,0.5,0.5/)
 testdx=diffx(x1)
 ASSERT_APPROXEQ(refdx(1),testdx(1),'dx=0.5')
 ASSERT_APPROXEQ(refdx(2),testdx(2),'dx=0.5')
 ASSERT_APPROXEQ(refdx(3),testdx(3),'dx=0.5')

ENDSUBROUTINE test_diffx()

SUBROUTINE test_diffy()
ENDSUBROUTINE test_diffy()

SUBROUTINE test_resetBCs()
ENDSUBROUTINE test_resetBCs()

ENDPROGRAM test_centered_diff
