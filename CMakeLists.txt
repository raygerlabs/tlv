cmake_minimum_required(VERSION 3.23)

project(tlv VERSION 1.0.0 LANGUAGES CXX)


include(${CMAKE_SOURCE_DIR}/cmake/Init.cmake)

add_subdirectory(src)

enable_testing()
add_subdirectory(tests)
