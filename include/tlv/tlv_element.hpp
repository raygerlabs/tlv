#ifndef M_TLV_ELEMENT_HPP
#define M_TLV_ELEMENT_HPP

#include <cstdint>
#include <cstring>
#include <stdexcept>
#include <type_traits>
#include <vector>

namespace tlv
{
enum class tlv_tag : std::uint16_t
{
  kBool,
  kChar,
  kInt8,
  kInt16,
  kInt32,
  kInt64,
  kUint8,
  kUint16,
  kUint32,
  kUint64,
  kFloat,
  kDouble,
  kLongDouble,
  kString,
  kBinary
};

class tlv_element
{
public:
  // type aliases
  using binary_data = std::uint8_t;
  using binary_pointer = std::uint8_t*;
  using const_binary_pointer = const std::uint8_t*;
  using binary_stream = std::vector<std::uint8_t>;
  using void_pointer = void*;
  using const_void_pointer = const void*;
  using tag_type = tlv_tag;
  using length_type = std::uint16_t;

private:
  // fields
  binary_stream m_value;
  tag_type m_tag;
  length_type m_length;
  char __m_unused[4];

  tlv_element(tag_type tag, length_type length, const_void_pointer value);

public:
  // copy / move
  tlv_element(tlv_element&&) noexcept = default;  // move-only
  tlv_element& operator=(tlv_element&&) noexcept = default;
  tlv_element(const tlv_element&) = delete;  // disable copying
  tlv_element& operator=(const tlv_element&) = delete;

  // accessors
  tag_type get_tag() const noexcept;
  length_type get_length() const noexcept;
  binary_pointer get_value() noexcept;
  const_binary_pointer get_value() const noexcept;

  // encode
  explicit tlv_element(bool value);
  explicit tlv_element(char value);
  explicit tlv_element(std::int8_t value);
  explicit tlv_element(std::int16_t value);
  explicit tlv_element(std::int32_t value);
  explicit tlv_element(std::int64_t);
  explicit tlv_element(std::uint8_t value);
  explicit tlv_element(std::uint16_t value);
  explicit tlv_element(std::uint32_t value);
  explicit tlv_element(std::uint64_t value);
  explicit tlv_element(float value);
  explicit tlv_element(double value);
  explicit tlv_element(long double value);
  explicit tlv_element(const std::string& value);
  explicit tlv_element(const binary_stream& value);

  // decode
  template<class T>
  T as() const noexcept;
};

inline tlv_element::tlv_element(tag_type tag, length_type length, const_void_pointer value)
    : m_value(sizeof(tag) + sizeof(length) + length)
    , m_tag(tag)
    , m_length(length)
{
  std::memcpy(&m_value[0], &m_tag, sizeof(m_tag));
  std::memcpy(&m_value[0] + sizeof(m_tag), &m_length, sizeof(m_length));
  std::memcpy(&m_value[0] + sizeof(m_tag) + sizeof(m_length), value, m_length);
}

inline tlv_element::tlv_element(bool value)
    : tlv_element(tlv_tag::kBool, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(char value)
    : tlv_element(tlv_tag::kChar, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(std::int8_t value)
    : tlv_element(tlv_tag::kInt8, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(std::int16_t value)
    : tlv_element(tlv_tag::kInt16, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(std::int32_t value)
    : tlv_element(tlv_tag::kInt32, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(std::int64_t value)
    : tlv_element(tlv_tag::kInt64, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(std::uint8_t value)
    : tlv_element(tlv_tag::kUint8, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(std::uint16_t value)
    : tlv_element(tlv_tag::kUint16, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(std::uint32_t value)
    : tlv_element(tlv_tag::kUint32, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(std::uint64_t value)
    : tlv_element(tlv_tag::kUint64, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(float value)
    : tlv_element(tlv_tag::kFloat, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(double value)
    : tlv_element(tlv_tag::kDouble, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(long double value)
    : tlv_element(tlv_tag::kLongDouble, sizeof(value), &value)
{
}

inline tlv_element::tlv_element(const std::string& value)
    : tlv_element(tlv_tag::kString, static_cast<std::uint16_t>(value.size()), &value[0])
{
}

inline tlv_element::tlv_element(const binary_stream& value)
    : tlv_element(tlv_tag::kBinary, static_cast<std::uint16_t>(value.size()), &value[0])
{
}

template<class T>
inline T tlv_element::as() const noexcept
{
  T result;
  if constexpr (std::is_trivially_constructible_v<T>)
  {
    std::memcpy(&result, &m_value[sizeof(m_tag) + sizeof(m_length)], sizeof(result));
  }
  else
  {
    result = T(std::begin(m_value) + sizeof(m_tag) + sizeof(m_length), std::end(m_value));
  }
  return result;
}

inline typename tlv_element::tag_type tlv_element::get_tag() const noexcept
{
  return m_tag;
}

inline typename tlv_element::length_type tlv_element::get_length() const noexcept
{
  return m_length;
}

inline typename tlv_element::binary_pointer tlv_element::get_value() noexcept
{
  return m_value.data();
}

inline typename tlv_element::const_binary_pointer tlv_element::get_value() const noexcept
{
  return m_value.data();
}

}  // namespace tlv

#endif  // M_TLV_ELEMENT_HPP
