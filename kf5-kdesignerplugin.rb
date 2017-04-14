require "formula"

class Kf5Kdesignerplugin < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kdesignerplugin-5.32.0.tar.xz"
  sha256 "cec24dc289636e12eff8d24e2d3d9600b87c79af5645d1a9a9c34f8b3a9257c1"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kdesignerplugin.git'

  depends_on "cmake" => :build
  depends_on "gettext" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
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
