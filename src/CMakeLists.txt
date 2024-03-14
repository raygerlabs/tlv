# Object lib
add_library(tlv)

target_sources(tlv
PUBLIC
  ${CMAKE_SOURCE_DIR}/include/tlv/tlv_element.hpp

PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/tlv_element.cpp
)

target_include_directories(tlv
PUBLIC
  $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
)

install(TARGETS tlv)
