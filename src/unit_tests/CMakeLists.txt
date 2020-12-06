SET(UNIT_TEST_NAMES
    test_centered_diff
)

FOREACH(test ${UNIT_TEST_NAMES})
    ADD_SUBDIRECTORY(${test})
ENDFOREACH()

#clear these variables
UNSET(UNIT_TEST_NAMES)
UNSET(test)
