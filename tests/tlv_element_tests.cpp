#include "tlv/tlv_element.hpp"

#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include <limits>

namespace tlv
{
namespace testing
{
TEST(tlv_element_tests, construct_with_bool)
{
  bool expected = true;
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kBool);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<bool>(), expected);
}

TEST(tlv_element_tests, construct_with_char)
{
  char expected = 'A';
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kChar);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<char>(), expected);
}

TEST(tlv_element_tests, construct_with_int8)
{
  const auto expected = std::numeric_limits<std::int8_t>::min();
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kInt8);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<std::int8_t>(), expected);
}

TEST(tlv_element_tests, construct_with_int16)
{
  const auto expected = std::numeric_limits<std::int16_t>::min();
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kInt16);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<std::int16_t>(), expected);
}

TEST(tlv_element_tests, construct_with_int32)
{
  const auto expected = std::numeric_limits<std::int32_t>::min();
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kInt32);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<std::int32_t>(), expected);
}

TEST(tlv_element_tests, construct_with_int64)
{
  const auto expected = std::numeric_limits<std::int64_t>::min();
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kInt64);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<std::int64_t>(), expected);
}

TEST(tlv_element_tests, construct_with_uint8)
{
  const auto expected = std::numeric_limits<std::uint8_t>::max();
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kUint8);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<std::uint8_t>(), expected);
}

TEST(tlv_element_tests, construct_with_uint16)
{
  const auto expected = std::numeric_limits<std::uint16_t>::max();
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kUint16);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<std::uint16_t>(), expected);
}

TEST(tlv_element_tests, construct_with_uint32)
{
  const auto expected = std::numeric_limits<std::uint32_t>::max();
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kUint32);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<std::uint32_t>(), expected);
}

TEST(tlv_element_tests, construct_with_uint64)
{
  const auto expected = std::numeric_limits<std::uint64_t>::max();
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kUint64);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<std::uint64_t>(), expected);
}

TEST(tlv_element_tests, construct_with_float)
{
  float expected = 0.005f;
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kFloat);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<float>(), expected);
}

TEST(tlv_element_tests, construct_with_double)
{
  double expected = 0.005;
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kDouble);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<double>(), expected);
}

TEST(tlv_element_tests, construct_with_long_double)
{
  long double expected = 0.005L;
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kLongDouble);
  EXPECT_EQ(e.get_length(), sizeof(expected));
  EXPECT_EQ(e.as<long double>(), expected);
}

TEST(tlv_element_tests, construct_with_string)
{
  std::string expected = "asdasd";
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kString);
  EXPECT_EQ(e.get_length(), expected.size());
  EXPECT_EQ(e.as<std::string>(), expected);
}

TEST(tlv_element_tests, construct_with_binary)
{
  tlv_element::binary_stream expected = {0x01, 0x02, 0x03, 0x04};
  tlv_element e(expected);
  EXPECT_EQ(e.get_tag(), tlv_tag::kBinary);
  EXPECT_EQ(e.get_length(), expected.size());
  EXPECT_EQ(e.as<tlv_element::binary_stream>(), expected);
}
}  // namespace testing
}  // namespace tlv