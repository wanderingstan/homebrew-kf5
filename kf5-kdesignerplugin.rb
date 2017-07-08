require "formula"

class Kf5Kdesignerplugin < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kdesignerplugin-5.36.0.tar.xz"
  sha256 "1ba67344b46e1cb0809975f84c667019158e69ae1b884ab3a995ca1d8d434acf"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kdesignerplugin.git"

  depends_on "cmake" => :build
  depends_on "gettext" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kcoreaddons"
  depends_on "chigraph/kf5/kf5-kdoctools" => :build
  #  depends_on "chigraph/kf5/kf5-kdewebkit"
  depends_on "chigraph/kf5/kf5-kplotting"
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "d212b7c9e6d674c600674f30d9afff5cc4d0b582f0238b24ec53c8aca0909007" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
