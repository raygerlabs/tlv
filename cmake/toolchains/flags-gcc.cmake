# Compile flags

set(CMAKE_CXX_FLAGS
  # Common
  -D_FORTIFY_SOURCE=3
  -Wformat=2
  -Wall
  -Wextra
  -Werror
  -pedantic
  -Wuninitialized
  -Wmissing-include-dirs
  -Wshadow
  -Wundef
  -Wunused
  -Winvalid-pch
  -ffunction-sections
  -fdata-sections
  # Control flow
  -Winit-self
  -Wswitch-enum -Wswitch-default
  -Wformat=2
  # Arithmetics
  -Wdouble-promotion
  -Wfloat-equal
  -Wpointer-arith
  # Cast and conversion
  -Wstrict-overflow=5
  -Wcast-qual
  -Wcast-align
  -Wconversion
  -Wsign-conversion
  -Wpacked
  # Sanity
  -Wstrict-aliasing -fstrict-aliasing
  -Wredundant-decls
  -Wmissing-declarations
  -Wmissing-field-initializers
  # Security
  -Wwrite-strings
  -Wstack-protector -fstack-protector-strong -fstack-clash-protection -fcf-protection=full
  -Wpadded
  -Winline
  -Wdisabled-optimization
  # C specific
  #-Waggregate-return
  #-Wbad-function-cast
  #-Wc++-compat
  # C++ specific
  -Wzero-as-null-pointer-constant
  -Wctor-dtor-privacy
  -Wold-style-cast
  -Woverloaded-virtual
  # GNU specific
  -Wlogical-op
  -Wstack-usage=1024 -fstack-usage -Wframe-larger-than=1024
  -Wtrampolines
  -Wvector-operation-performance
  # GNU C++ specific
  -Wuseless-cast
  -Wnoexcept
  -Wstrict-null-sentinel
  # GNU >= 5.0.0
  -Wsuggest-final-types -Wsuggest-final-methods -Wsuggest-override
  # GNU >= 6.0.0
  -Wshift-overflow=2 -Wshift-negative-value
  -Wnull-dereference
  -Wduplicated-cond
  # GNU C++ >= 6.0.0
  -Wvirtual-inheritance -Wmultiple-inheritance
  #-Wtemplates
  # GNU >= 7.0.0
  -Wunused-macros
  -Wstringop-overflow=4
  -Wduplicated-branches
  -Walloc-zero
  -Walloca
  -Wimplicit-fallthrough
  -Wnon-virtual-dtor
  # GNU >= 8.0.0
  -Wcast-align=strict
  -Wstringop-truncation
  -Wextra-semi
)
set(CMAKE_CXX_FLAGS_DEBUG
  -D_DEBUG
  -DDEBUG
  -O0
  -g
)
set(CMAKE_CXX_FLAGS_RELEASE
  -D_RELEASE
  -DNDEBUG
  -O3
)
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO
  -D_RELWITHDEBINFO
  -DNDEBUG
  -O3
  -fno-omit-frame-pointer
)
set(CMAKE_CXX_FLAGS_ASAN
  -D_ASAN
  -DNDEBUG
  -O3
  -fno-omit-frame-pointer
  -fsanitize=address
)
set(CMAKE_CXX_FLAGS_TSAN
  -D_TSAN
  -DNDEBUG
  -O3
  -fno-omit-frame-pointer
  -fsanitize=thread
)
set(CMAKE_CXX_FLAGS_UBSAN
  -D_UBSAN
  -DNDEBUG
  -O3
  -fno-omit-frame-pointer
  -fsanitize=undefined
)
string(REPLACE ";" " " CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_ASAN "${CMAKE_CXX_FLAGS_ASAN}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_TSAN "${CMAKE_CXX_FLAGS_TSAN}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_UBSAN "${CMAKE_CXX_FLAGS_UBSAN}")

# Link flags

set(GCC_LINK_FLAGS
  -Wl,-z,noexecstack
  -Wl,-z,nodlopen
  -Wl,-z,defs
  -Wl,-z,relro
  -Wl,-z,now
  -Wl,--gc-sections
  -Wl,--as-needed
)
string(REPLACE ";" " " GCC_LINK_FLAGS "${GCC_LINK_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS    "${GCC_LINK_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS "${GCC_LINK_FLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS "${GCC_LINK_FLAGS}")

