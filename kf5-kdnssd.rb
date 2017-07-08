require "formula"

class Kf5Kdnssd < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kdnssd-5.36.0.tar.xz"
  sha256 "57504b89b327e0c4439c1be8037e13aba588155d5201adb3e81a1b52f8e28e1e"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/attica.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "496efce5087e3df6520aaa9d953874c2f227a85d59db69325b6e2e05bd974bd5" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
