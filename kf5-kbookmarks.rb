require "formula"

class Kf5Kbookmarks < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kbookmarks-5.36.0.tar.xz"
  sha256 "59339ef15f2740665fded42638d197ac9638f763191c30054d1870e4695ce684"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kbookmarks.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kxmlgui"
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "d13239b9083db21c6cb648ac514fe4d118e34a844046d90f3410013259a1f684" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
