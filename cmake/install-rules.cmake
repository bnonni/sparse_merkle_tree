if(PROJECT_IS_TOP_LEVEL)
  set(
      CMAKE_INSTALL_INCLUDEDIR "include/sparse_merkle_tree-${PROJECT_VERSION}"
      CACHE STRING ""
  )
  set_property(CACHE CMAKE_INSTALL_INCLUDEDIR PROPERTY TYPE PATH)
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
# should match the name of variable set in the install-config.cmake script
set(package sparse_merkle_tree)

install(
    DIRECTORY
    include/
    "${PROJECT_BINARY_DIR}/export/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT sparse_merkle_tree_Development
)

install(
    TARGETS sparse_merkle_tree_sparse_merkle_tree
    EXPORT sparse_merkle_treeTargets
    RUNTIME #
    COMPONENT sparse_merkle_tree_Runtime
    LIBRARY #
    COMPONENT sparse_merkle_tree_Runtime
    NAMELINK_COMPONENT sparse_merkle_tree_Development
    ARCHIVE #
    COMPONENT sparse_merkle_tree_Development
    INCLUDES #
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    sparse_merkle_tree_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/${package}"
    CACHE STRING "CMake package config location relative to the install prefix"
)
set_property(CACHE sparse_merkle_tree_INSTALL_CMAKEDIR PROPERTY TYPE PATH)
mark_as_advanced(sparse_merkle_tree_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${sparse_merkle_tree_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT sparse_merkle_tree_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${sparse_merkle_tree_INSTALL_CMAKEDIR}"
    COMPONENT sparse_merkle_tree_Development
)

install(
    EXPORT sparse_merkle_treeTargets
    NAMESPACE sparse_merkle_tree::
    DESTINATION "${sparse_merkle_tree_INSTALL_CMAKEDIR}"
    COMPONENT sparse_merkle_tree_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
