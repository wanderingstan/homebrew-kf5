require "formula"

class Kf5Kdnssd < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kdnssd-5.34.0.tar.xz"
  sha256 "0029e90f01dc8a7e751d96a11ba6ce6ae541c8f4cac9eac8556d7a9e6a6c5520"

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
