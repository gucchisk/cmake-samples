cmake_minimum_required(VERSION 3.10)

configure_file(abseil.CMakeLists.txt.in
  abseil-download/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/abseil-download)
execute_process(COMMAND ${CMAKE_COMMAND} --build .
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/abseil-download)

add_subdirectory(${CMAKE_BINARY_DIR}/abseil-src
  ${CMAKE_BINARY_DIR}/abseil-bin
  EXCLUDE_FROM_ALL)
