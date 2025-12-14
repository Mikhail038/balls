set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(NOT CMAKE_C_COMPILER)
  set(CMAKE_C_COMPILER clang)
endif()

include(FetchContent)
FetchContent_Declare(
  SDL2
  GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
  GIT_TAG        e11183ea6caa3ae4895f4bc54cad2bbb0e365417 # release 2.32.2
  FIND_PACKAGE_ARGS NAMES SDL2
)
# This will try calling find_package() first
FetchContent_MakeAvailable(SDL2)

# !!!ATTENTION!!!
# You have to get all the dependencies of SDL, see
# https://github.com/libsdl-org/SDL/blob/main/docs/README-linux.md#build-dependencies
# OTHERWISE SDL WILL SILENTLY RUN IN WINDOWLESS MODE

set(SOURCES start.c sim.c app.c)

add_executable(${PROJECT_NAME} ${SOURCES})

target_compile_options(${PROJECT_NAME} PRIVATE ${CMAKE_C_FLAGS} -Wall -Wextra)
target_link_libraries(${PROJECT_NAME} SDL2::SDL2)


# А custom command to generate textual LLVM IR for app.c
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/app.ll
    COMMAND ${CMAKE_C_COMPILER} -O1 -S -emit-llvm ${CMAKE_CURRENT_SOURCE_DIR}/app.c -o ${CMAKE_CURRENT_BINARY_DIR}/app.ll
    DEPENDS app.c
    COMMENT "Generating LLVM IR for app.c"
)
add_custom_target(GENERATE_LLVM_IR DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/app.ll)
