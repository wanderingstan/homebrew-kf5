require "formula"

class Kf5Knewstuff < Formula
  url "http://download.kde.org/stable/frameworks/5.36/knewstuff-5.36.0.tar.xz"
  sha256 "f17bc9cc0852c3a4433e1ffaeb88ad7af3611a9ec95409c391b39fa57e84da5d"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/knewstuff.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

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
