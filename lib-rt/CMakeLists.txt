cmake_minimum_required(VERSION 3.0)
project(lib-rt)

include(GoogleTest)
find_package (Python3 COMPONENTS Development)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
file(GLOB_RECURSE LIB-RT_SOURCES "${SOURCE_DIRECTORY}/*.cc" "${SOURCE_DIRECTORY}/*.h")
add_executable(lib-rt ${LIB-RT_SOURCES})
target_include_directories(lib-rt
                            PUBLIC 
                                ${SOURCE_DIRECTORY}../external/googletest/googletest
                                ${SOURCE_DIRECTORY}../external/googletest/googletest/include
                                ${Python3_INCLUDE_DIRS}
)
gtest_discover_tests(lib-rt "--gtest_print_time=0")
