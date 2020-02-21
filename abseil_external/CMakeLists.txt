cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 11)

set(ABSEIL_LINK_LIST absl::memory)
if (${ABSEIL_UPPER})
  list(APPEND ABSEIL_LINK_LIST absl::strings)
  add_compile_definitions(ABSEIL_UPPER)
endif()

include(abseil.cmake)

add_executable(main main.cc)
target_link_libraries(main ${ABSEIL_LINK_LIST})
