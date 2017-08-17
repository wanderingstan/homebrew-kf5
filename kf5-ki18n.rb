require "formula"

class Kf5Ki18n < Formula
  url "http://download.kde.org/stable/frameworks/5.37/ki18n-5.37.0.tar.xz"
  sha256 "4d94f4f676161507149886c6f9c4a16a17556bcb4b9c24b4549a53b82ef13ab0"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/ki18n.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "gettext" => :build
  depends_on "qt"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "25c2397cb13e0ea657ceb8d57e070813a4d0f3d11558b442d9a30c1f997a3c74" => :sierra'
  end

  def install
    args = std_cmake_args

    args << "-DCMAKE_SHARED_LINKER_FLAGS=-lintl" # cmake thinks libintl is part of libc
    args << "-DCMAKE_EXE_LINKER_FLAGS=-lintl"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
