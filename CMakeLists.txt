cmake_minimum_required(VERSION 3.28)
project(balls C)

# !!!ATTENTION!!!
# Cmake will install SDL2 as a dependency if not found in the system, but
# in that case you have to manually get all the dependencies of SDL, related to
# window management (X, wayland, etc.)
#
# See https://github.com/libsdl-org/SDL/blob/main/docs/README-linux.md#build-dependencies
#
# OTHERWISE SDL CAN SILENTLY RUN IN WINDOWLESS MODE OR NOT SUPPORT INTERACTIVE INPUT/AUDIO

add_subdirectory(src)
