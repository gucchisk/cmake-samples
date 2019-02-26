set(go_name go)
find_program(GO
  NAMES ${go_name}
  PATHS ${go_path}
  DOC "golang compiler"
  )
message(${GO})

if(GO)
  execute_process(COMMAND ${GO} version
    OUTPUT_VARIABLE go_version
    ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE)
  if (go_version MATCHES "^go version go([0-9.]+) ")
    set(GO_VERSION_STRING ${CMAKE_MATCH_1})
  endif()
endif()

message("version: ${GO_VERSION_STRING}")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Go
  REQUIRED_VARS GO
  VERSION_VAR GO_VERSION_STRING
  )

if(Go_FOUND)
  message("Go Found: ${Go_INCLUDE_DIR}")
endif()
   
