# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\Tool_List_Window_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\Tool_List_Window_autogen.dir\\ParseCache.txt"
  "Tool_List_Window_autogen"
  )
endif()
