include_guard()

set(CPACK_VERBATIM_VARIABLES ON)
set(CPACK_STRIP_FILES ON) # Remove debugging stuff

# Set tar.gz package creation by default
set(CPACK_GENERATOR "TGZ")
set(CPACK_SOURCE_GENERATOR "TGZ")
set(CPACK_PACKAGE_FILE_EXTENSION ".tar.gz")

if (WIN32) # Use zip for Windows
  set(CPACK_GENERATOR "ZIP")
  set(CPACK_SOURCE_GENERATOR "ZIP")
  set(CPACK_PACKAGE_FILE_EXTENSION ".zip")
endif(WIN32)

include(CPack)

