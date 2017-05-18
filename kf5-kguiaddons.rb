require "formula"

class Kf5Kguiaddons < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kguiaddons-5.34.0.tar.xz"
  sha256 "1dbf389b86fb9978999d0d0486844e3a0bba91991baaba4c05b03629fce6b4da"

  head "git://anongit.kde.org/kguiaddons.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "ab77aea5133cd0caf3cc94e48f56fffd8696388a27c96fe39e5f5a887056d483" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
