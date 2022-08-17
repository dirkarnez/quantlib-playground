cmake_minimum_required(VERSION 3.14)

project(quantlib-boilerplate)

set(Boost_NO_SYSTEM_PATHS TRUE)
set(Boost_USE_STATIC_LIBS TRUE)

find_package(Boost 1.78.0 EXACT REQUIRED PATHS ${BOOST_ROOT})
find_package(QuantLib 1.27.0 EXACT REQUIRED PATHS ${QUANTLIB_ROOT})

# Offical QuantLib cmake is not relocatable, therefore overwrite its variable manually
set_target_properties(QuantLib::QuantLib PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${QUANTLIB_ROOT}/include;${Boost_INCLUDE_DIRS}"
  INTERFACE_SYSTEM_INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIRS}
)

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME}
    "src/main.cpp"
)

target_link_libraries(${PROJECT_NAME} QuantLib::QuantLib)