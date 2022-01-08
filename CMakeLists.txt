cmake_minimum_required(VERSION 3.14)

project(quantlib-boilerplate)

find_package(boost REQUIRED PATHS "P:/Downloads/cpp-libraries/boost/lib/cmake/Boost-1.78.0")

set(quantlib_ROOT "P:/Downloads/cpp-libraries/QuantLib-v1.24/build/QuantLib")

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

include_directories(${Boost_INCLUDE_DIRS} "${quantlib_ROOT}/include")

add_executable(${PROJECT_NAME}
    "src/main.cpp"
)

target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES} "${quantlib_ROOT}/lib/libQuantLib.a")