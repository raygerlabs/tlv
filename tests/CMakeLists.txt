add_executable(unit_tests)
target_sources(unit_tests
PRIVATE
  tlv_element_tests.cpp
)

target_include_directories(unit_tests
PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_BINARY_DIR}
)
target_link_libraries(unit_tests tlv)

find_package(GTest CONFIG REQUIRED)
target_link_libraries(unit_tests GTest::gtest GTest::gtest_main GTest::gmock GTest::gmock_main)

include(CTest)
include(GoogleTest)
gtest_discover_tests(unit_tests)

