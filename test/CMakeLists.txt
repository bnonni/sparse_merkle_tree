cmake_minimum_required(VERSION 3.14)

project(sparse_merkle_treeTests LANGUAGES CXX)

# Load Conan dependencies
include(${CMAKE_BINARY_DIR}/conan/conan_toolchain.cmake)

include(../cmake/project-is-top-level.cmake)
include(../cmake/folders.cmake)

# ---- Dependencies ----

if(PROJECT_IS_TOP_LEVEL)
  find_package(sparse_merkle_tree REQUIRED)
  enable_testing()
endif()

# Find Conan-installed dependencies
find_package(Catch2 REQUIRED)
find_package(fmt REQUIRED)

include(Catch)

# ---- Ensure the Library is Built ----

if(NOT TARGET sparse_merkle_tree::sparse_merkle_tree)
  add_subdirectory(../src ${CMAKE_BINARY_DIR}/sparse_merkle_tree)
endif()

# ---- Tests ----

add_executable(sparse_merkle_tree_test source/sparse_merkle_tree_test.cpp)

target_link_libraries(
    sparse_merkle_tree_test PRIVATE
    sparse_merkle_tree::sparse_merkle_tree
    Catch2::Catch2WithMain
    fmt::fmt
)

target_compile_features(sparse_merkle_tree_test PRIVATE cxx_std_20)

catch_discover_tests(sparse_merkle_tree_test)

# ---- End-of-file commands ----

add_folders(Test)
