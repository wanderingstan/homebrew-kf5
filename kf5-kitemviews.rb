require "formula"

class Kf5Kitemviews < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kitemviews-5.32.0.tar.xz"
  sha256 "9aeba02913cbe8c76171721fdfb14c9d5d783a2d4114daaa7f6b93d8b87a3fc0"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kitemviews.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "8e1af808f05da4de639fa945576e57f688ca336b8bce8510d63554bde296d4c4" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
