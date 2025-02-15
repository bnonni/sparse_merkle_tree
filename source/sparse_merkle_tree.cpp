#include <string>

#include "sparse_merkle_tree/sparse_merkle_tree.hpp"

#include <fmt/core.h>

exported_class::exported_class()
    : m_name {fmt::format("{}", "sparse_merkle_tree")}
{
}

auto exported_class::name() const -> char const*
{
  return m_name.c_str();
}
