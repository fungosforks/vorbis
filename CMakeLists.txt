cmake_minimum_required(VERSION 2.8)

project(vorbis C) 

#
# Config
#

set(vorbis_VERSION 1.3.4)

#
# Internal
#
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}")
find_package(OGG)

#
# Build Library
#

include_directories("include")
include_directories("lib")
include_directories("${OGG_INCLUDE_DIR}")
file(GLOB_RECURSE vorbis_HEADERS lib/*.h)
file(GLOB_RECURSE vorbis_INSTALL_HEADERS include/vorbis/*.h)
file(GLOB_RECURSE vorbis_SOURCES lib/*.c ${vorbis_HEADERS})
add_library(vorbis ${vorbis_SOURCES})

#
# Install
#
install(TARGETS ${PROJECT_NAME} 
		DESTINATION ${CMAKE_INSTALL_PREFIX}/lib 
		COMPONENT ${PROJECT_NAME}
)

install(FILES ${vorbis_INSTALL_HEADERS} 
		DESTINATION ${CMAKE_INSTALL_PREFIX}/include/${PROJECT_NAME}
)
