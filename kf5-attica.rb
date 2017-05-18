require "formula"

class Kf5Attica < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/attica-5.34.0.tar.xz"
  sha256 "a374328eaf4b8b767b7a6ae67a7384164e6cb2a14d5bcaf9b7e67d7eabae0f51"

  head "git://anongit.kde.org/attica.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "4f23c1758225bfddff0c7ef4b86384155250a974fe2e623d6c122f619cef6a31" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
