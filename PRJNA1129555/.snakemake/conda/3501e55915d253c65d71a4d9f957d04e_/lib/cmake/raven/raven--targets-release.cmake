#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ravenraven" for configuration "Release"
set_property(TARGET ravenraven APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ravenraven PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libraven.a"
  )

list(APPEND _cmake_import_check_targets ravenraven )
list(APPEND _cmake_import_check_files_for_ravenraven "${_IMPORT_PREFIX}/lib/libraven.a" )

# Import target "ravenracon" for configuration "Release"
set_property(TARGET ravenracon APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ravenracon PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libracon.a"
  )

list(APPEND _cmake_import_check_targets ravenracon )
list(APPEND _cmake_import_check_files_for_ravenracon "${_IMPORT_PREFIX}/lib/libracon.a" )

# Import target "ravenram" for configuration "Release"
set_property(TARGET ravenram APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ravenram PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libram.a"
  )

list(APPEND _cmake_import_check_targets ravenram )
list(APPEND _cmake_import_check_files_for_ravenram "${_IMPORT_PREFIX}/lib/libram.a" )

# Import target "ravenspoa" for configuration "Release"
set_property(TARGET ravenspoa APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ravenspoa PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libspoa.a"
  )

list(APPEND _cmake_import_check_targets ravenspoa )
list(APPEND _cmake_import_check_files_for_ravenspoa "${_IMPORT_PREFIX}/lib/libspoa.a" )

# Import target "ravenraven_exe" for configuration "Release"
set_property(TARGET ravenraven_exe APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ravenraven_exe PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/raven"
  )

list(APPEND _cmake_import_check_targets ravenraven_exe )
list(APPEND _cmake_import_check_files_for_ravenraven_exe "${_IMPORT_PREFIX}/bin/raven" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
