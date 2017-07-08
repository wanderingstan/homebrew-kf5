require "formula"

class Kf5Kwidgetsaddons < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kwidgetsaddons-5.36.0.tar.xz"
  sha256 "bc9a62d24f6bdd0e8830481f915744cf640660c99ecb54cbeea73de5b218a20b"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kwidgetsaddons.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "e9b63e2d27537a608ba60c05244cda572c8b3c9557340a9e5996b9c7189a0a41" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
