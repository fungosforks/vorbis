find_path(OGG_INCLUDE_DIR ogg.h 
	PATHS
		${CMAKE_INSTALL_PREFIX}/include/ogg
		/usr/include/ogg
		/usr/local/include/ogg)

find_library(OGG_LIBRARY 
	NAMES ogg
	PATH 
		${CMAKE_INSTALL_PREFIX}/lib
		/usr/lib 
		/usr/local/lib)

if (OGG_INCLUDE_DIR AND OGG_LIBRARY)
	set(OGG_FOUND true)
	set(OGG_INCLUDE_DIR "${OGG_INCLUDE_DIR}/..")
endif()

if (OGG_FOUND)
	if (NOT Ogg_FIND_QUIETLY)
		message(STATUS "Ogg Found: ${OGG_LIBRARY}")
	endif()
else()
	if (Ogg_FIND_REQUIRED)
		message(FATAL_ERROR "Could not find Ogg")
	endif()
endif()
