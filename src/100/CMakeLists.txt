file(GLOB PROGRAM_SOURCES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/*.s")



foreach(FILE_SRC IN LISTS PROGRAM_SOURCES)
	message("${FILE_SRC}")
	get_filename_component(FILE_NAME ${FILE_SRC} NAME_WE)
	add_executable(${FILE_NAME} ${FILE_SRC})
	target_link_libraries(${FILE_NAME} utils)
	message("${FILE_NAME}")
endforeach()