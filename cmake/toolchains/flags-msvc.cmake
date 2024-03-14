# Compile flags

set(CMAKE_CXX_FLAGS
  /sdl
  /guard:cf
  /utf-8
  /diagnostics:caret
  /w14165
  /w44242
  /w44254
  /w44263
  /w34265
  /w34287
  /w44296
  /w44365
  /w44388
  /w44464
  /w14545
  /w14546 
  /w14547
  /w14549
  /w14555
  /w34619
  /w34640
  /w24826
  /w14905
  /w14906
  /w14928
  /w45038
  /W4
  /permissive-
  /volatile:iso
  /Zc:inline
  /Zc:preprocessor
  /Zc:enumTypes
  /Zc:lambda
  /Zc:__cplusplus
  /Zc:externConstexpr
  /Zc:throwingNew
  /EHsc
)
set(CMAKE_CXX_FLAGS_DEBUG
  /D_DEBUG
  /DDEBUG
  /Od
  /Zi
)
set(CMAKE_CXX_FLAGS_RELEASE
  /D_RELEASE
  /DNDEBUG
  /Ox
)
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO
  /D_RELWITHDEBINFO
  /DNDEBUG
  /Ox
  /Oy-
  /Zi
)
set(CMAKE_CXX_FLAGS_ASAN
  /D_ASAN
  /DNDEBUG
  /Ox
  /Oy-
  /fsanitize=address
)
string(REPLACE ";" " " CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_ASAN "${CMAKE_CXX_FLAGS_ASAN}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_TSAN "${CMAKE_CXX_FLAGS_TSAN}")
string(REPLACE ";" " " CMAKE_CXX_FLAGS_UBSAN "${CMAKE_CXX_FLAGS_UBSAN}")

# Link flags

set(MSVC_LINK_FLAGS_DEBUG
  /INCREMENTAL:YES
  /DEBUG
)
set(MSVC_LINK_FLAGS_RELEASE
  /INCREMENTAL:NO
  /OPT:REF
  /OPT:ICF=2
)
set(MSVC_LINK_FLAGS_RELWITHDEBINFO
  /INCREMENTAL:NO
  /DEBUG
  /OPT:REF
  /OPT:ICF=2
)
set(MSVC_LINK_FLAGS_ASAN
  /INCREMENTAL:NO
  /DEBUG
  /OPT:REF
  /OPT:ICF=2
)
string(REPLACE ";" " " MSVC_LINK_FLAGS_DEBUG "${MSVC_LINK_FLAGS_DEBUG}")
string(REPLACE ";" " " MSVC_LINK_FLAGS_RELEASE "${MSVC_LINK_FLAGS_RELEASE}")
string(REPLACE ";" " " MSVC_LINK_FLAGS_RELWITHDEBINFO "${MSVC_LINK_FLAGS_RELWITHDEBINFO}")
string(REPLACE ";" " " MSVC_LINK_FLAGS_ASAN "${MSVC_LINK_FLAGS_ASAN}")

set(CMAKE_EXE_LINKER_FLAGS_DEBUG ${MSVC_LINK_FLAGS_DEBUG})
set(CMAKE_SHARED_LINKER_FLAGS_DEBUG ${MSVC_LINK_FLAGS_DEBUG})
set(CMAKE_MODULE_LINKER_FLAGS_DEBUG ${MSVC_LINK_FLAGS_DEBUG})
set(CMAKE_EXE_LINKER_FLAGS_RELEASE ${MSVC_LINK_FLAGS_RELEASE})
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE ${MSVC_LINK_FLAGS_RELEASE})
set(CMAKE_MODULE_LINKER_FLAGS_RELEASE ${MSVC_LINK_FLAGS_RELEASE})
set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO ${MSVC_LINK_FLAGS_RELWITHDEBINFO})
set(CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO ${MSVC_LINK_FLAGS_RELWITHDEBINFO})
set(CMAKE_MODULE_LINKER_FLAGS_RELWITHDEBINFO ${MSVC_LINK_FLAGS_RELWITHDEBINFO})
set(CMAKE_EXE_LINKER_FLAGS_ASAN ${MSVC_LINK_FLAGS_ASAN})
set(CMAKE_SHARED_LINKER_FLAGS_ASAN ${MSVC_LINK_FLAGS_ASAN})
set(CMAKE_MODULE_LINKER_FLAGS_ASAN ${MSVC_LINK_FLAGS_ASAN})
