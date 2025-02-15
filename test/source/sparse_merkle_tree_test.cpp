#include <string>

#include "sparse_merkle_tree/sparse_merkle_tree.hpp"

#include <catch2/catch_test_macros.hpp>

TEST_CASE("Name is sparse_merkle_tree", "[library]")
{
  auto const exported = exported_class {};
  REQUIRE(std::string("sparse_merkle_tree") == exported.name());
}
