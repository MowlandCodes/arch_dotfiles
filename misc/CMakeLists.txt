cmake_minimum_required(VERSION 3.15)

# Nama project, versi dan bahasa
project(testing VERSION 1.0 LANGUAGES C CXX)


set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Source code files
# Basically, semua file C/C++ di src/ dan di includes/
file(GLOB_RECURSE SOURCE_FILES 
    "src/*.cpp"
    "src/*.c"
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE ${PROJECT_SOURCE_DIR}/includes)

# --- LINKING LIBRARIES ---
# Di sini lu nambahin library external.
# Ini bagian paling penting buat lu yang katanya mau "future-proof".

# CONTOH 1: Linking library bawaan sistem (misal: pthreads di Linux)
# Cukupilangin komen di bawah kalo lu butuh.
# target_link_libraries(${PROJECT_NAME} PRIVATE pthread)

# CONTOH 2: Linking library dari folder /libs (misal: libmath.a)
# CMake bakal nyari library namanya 'math' (jadi libmath.a atau math.lib) di folder libs.
# target_link_directories(${PROJECT_NAME} PRIVATE ${PROJECT_SOURCE_DIR}/libs)
# target_link_libraries(${PROJECT_NAME} PRIVATE math)

# CONTOH 3: Kalo library-nya berupa source code juga (misal: pake git submodule)
# Dan di dalemnya ada CMakeLists.txt sendiri, lu tinggal pake ini:
# add_subdirectory(libs/nama_library_keren)
# target_link_libraries(${PROJECT_NAME} PRIVATE nama_target_library_keren)

message(STATUS "PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
message(STATUS "EXECUTABLE_OUTPUT_PATH: ${EXECUTABLE_OUTPUT_PATH}")
