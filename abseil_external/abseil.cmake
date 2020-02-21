cmake_minimum_required(VERSION 3.10)

configure_file(abseil.CMakeLists.txt.in
  abseil-download/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/abseil-download)
execute_process(COMMAND ${CMAKE_COMMAND} --build . --target abseil-download
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/abseil-download)

# execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
#   WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/abseil-src)
# execute_process(COMMAND ${CMAKE_COMMAND} --build . --target strings
#   WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/abseil-src)

list(LENGTH ABSEIL_LINK_LIST link_list_length)

if (link_list_length GREATER 0)
  add_subdirectory(${CMAKE_BINARY_DIR}/abseil-src)
endif()

include_directories(${CMAKE_BINARY_DIR}/abseil-src)
