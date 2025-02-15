set(sparse_merkle_tree_FOUND YES)

include(CMakeFindDependencyMacro)
find_dependency(fmt)

if(sparse_merkle_tree_FOUND)
  include("${CMAKE_CURRENT_LIST_DIR}/sparse_merkle_treeTargets.cmake")
endif()
