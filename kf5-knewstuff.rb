require "formula"

class Kf5Knewstuff < Formula
  url "http://download.kde.org/stable/frameworks/5.32/knewstuff-5.32.0.tar.xz"
  sha256 "d70d2aa151f8525168fbf8276463cc084d0206790b34d1dabb505ace936f74c4"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/knewstuff.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  depends_on "chigraph/kf5/kf5-kio"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "9579e0d3e99276bcad39a63247fa1cb943dc0bdbf51b3b03942c784e7eec9a5a" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
