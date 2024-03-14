import os

from conan import ConanFile
from conan.tools.cmake import CMake, CMakeDeps, CMakeToolchain, cmake_layout
from conan.tools.files import copy, load, rmdir

class MainRecipe(ConanFile):
  name = "tlv"
  version = "1.0.0"
  settings = "os", "arch", "compiler", "build_type"

  def export_sources(self):
    copy(self, "cmake", self.recipe_folder, self.export_sources_folder)
    copy(self, "src", self.recipe_folder, self.export_sources_folder)
    copy(self, "include", self.recipe_folder, self.export_sources_folder)
    copy(self, "resources", self.recipe_folder, self.export_sources_folder)
    copy(self, "tests", self.recipe_folder, self.export_sources_folder)
    copy(self, "CMakeLists.txt", self.recipe_folder, self.export_sources_folder)

  def requirements(self):
    self.test_requires("gtest/[>=1.14]")

  def layout(self):
    cmake_layout(self)
    self.folders.generators = f"{self.recipe_folder}/build/generators"

  def generate(self):
    deps = CMakeDeps(self)
    deps.generate()

  def configure_cmake(self):
    cmake = CMake(self)
    cmake.configure()
    return cmake

  def build(self):
    cmake = self.configure_cmake()
    cmake.build()
    cmake.ctest(cli_args=["--output-on-failure"])

  def package(self):
    cmake = self.configure_cmake()
    cmake.install()
 
