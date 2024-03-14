# Compile flags

set(CMAKE_CXX_FLAGS
  # Common
  -D_FORTIFY_SOURCE=3
  -Wformat=2
  -Wall
  -Wextra
  -pedantic
  -Wuninitialized
  -Wmissing-include-dirs
  -Wshadow
  -Wundef
  -Wunused
  -Winvalid-pch
  -ffunction-sections
  -fdata-sections
  # Clang common
  -Warc-repeated-use-of-weak
  -Wbitfield-enum-conversion
  -Wc++11-compat-pedantic
  -Wclass-varargs
  -Wconditional-uninitialized
  -Wthread-safety
  # Mistakes
  -Wconsumed
  -Wdirect-ivar-access
  -Wdisabled-macro-expansion
  -Wembedded-directive
  -Wexit-time-destructors
  -Wexpansion-to-defined
  -Wformat-pedantic
  -Widiomatic-parentheses
  -Winconsistent-missing-destructor-override
  -Winfinite-recursion
  -Wlocal-type-template-args
  -Wloop-analysis
  -Wmethod-signatures
  -Wmismatched-tags
  -Wmissing-braces
  -Wmissing-prototypes
  -Wmissing-variable-declarations
  -Wmost
  -Wmove
  -Wnonportable-system-include-path
  -Wnull-pointer-arithmetic
  -Wover-aligned
  -Woverriding-method-mismatch
  -Wpch-date-time
  -Wpragmas
  -Wreserved-id-macro
  -Wreserved-user-defined-literal
  -Wretained-language-linkage
  -Wsemicolon-before-method-body
  -Wsometimes-uninitialized
  -Wstring-conversion
  -Wsuper-class-method-mismatch
  -Wtautological-compare
  -Wundefined-reinterpret-cast
  -Wunreachable-code
  -Wunreachable-code-break
  -Wunreachable-code-loop-increment
  -Wunreachable-code-return
  -Wvector-conversion
  # Sanity
  -Wcomma
  -Wduplicate-enum
  -Wduplicate-method-arg
  -Wduplicate-method-match
  -Wdynamic-exception-spec
  -Wempty-translation-unit
  -Wexplicit-ownership-type
  -Wignored-qualifiers
  -Wimplicit
  -Wkeyword-macro
  -Wnewline-eof
  -Wredundant-parens
  -Wstatic-in-inline
  -Wstrict-prototypes
  -Wweak-template-vtables
  -Wweak-vtables
  -Wzero-length-array
  # Arrays
  -Warray-bounds-pointer-arithmetic
  #-Wextended-offsetof
  -Wflexible-array-extensions
  # Arithmetics
  -Wfloat-conversion
  -Wfloat-overflow-conversion
  -Wfloat-zero-conversion
  -Wshorten-64-to-32
  -Wsign-compare
  -Wsign-conversion
  # Advices
  -Wcomment
  -Wdocumentation
  -Wdocumentation-pedantic
  -Wglobal-constructors
  -Wgnu
  -Wheader-hygiene
  -Wunneeded-internal-declaration
  -Wunneeded-member-function
  -Wvla
  #-Wsuggest-final-types
  #-Wsuggest-final-methods
  -Wsuggest-override
  -Wshift-overflow
  -Wshift-negative-value
  -Wnull-dereference
  -Wunused-macros
  # Clang >= 6.0.0
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

set(CLANG_LINK_FLAGS
  -Wl,-z,noexecstack
  -Wl,-z,nodlopen
  -Wl,-z,defs
  -Wl,-z,relro
  -Wl,-z,now
  -Wl,--gc-sections
  -Wl,--as-needed
)
string(REPLACE ";" " " CLANG_LINK_FLAGS "${CLANG_LINK_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS    ${CLANG_LINK_FLAGS})
set(CMAKE_SHARED_LINKER_FLAGS ${CLANG_LINK_FLAGS})
set(CMAKE_MODULE_LINKER_FLAGS ${CLANG_LINK_FLAGS})

