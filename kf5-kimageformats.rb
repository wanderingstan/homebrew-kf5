require "formula"

class Kf5Kimageformats < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kimageformats-5.34.0.tar.xz"
  sha256 "5c466ba11a7fcb393c79b5918c07832a07d302ae374c3b08c74d4c4c19793661"

  head "git://anongit.kde.org/kimageformats.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "openexr"
  depends_on "jasper"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "8e5855ec050279a515aacf3e50e74f8dbd0995983f870a737fc092286008c3f4" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
