require "formula"

class Kf5Kjobwidgets < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kjobwidgets-5.34.0.tar.xz"
  sha256 "eefedadad329c1858604af076bc56748f2c7417c52d080c5aa8724b783393d53"

  head "git://anongit.kde.org/kjobwidgets.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kcoreaddons"
  depends_on "chigraph/kf5/kf5-kwidgetsaddons"
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "8983acedb15abab5195e8007d348b3eafde10d198cb0eb99738c1955779d52f3" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
