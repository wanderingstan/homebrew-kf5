require "formula"

class Kf5Knewstuff < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/knewstuff-5.34.0.tar.xz"
  sha256 "02ad34252a5205824cbee79752593e09adfd8b3992cca712fd4da4cca91fa5a5"

  head "git://anongit.kde.org/knewstuff.git"

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
