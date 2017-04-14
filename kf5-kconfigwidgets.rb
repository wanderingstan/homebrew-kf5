require "formula"

class Kf5Kconfigwidgets < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kconfigwidgets-5.32.0.tar.xz"
  sha256 "837f020c1b15f0d3bc9be5923983ed00f6d6b298186b8d127089ee6be65000b3"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kconfigwidgets.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kdoctools" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-kauth"
  depends_on "chigraph/kf5/kf5-kcoreaddons"
  depends_on "chigraph/kf5/kf5-kcodecs"
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-kguiaddons"
  depends_on "chigraph/kf5/kf5-kwidgetsaddons"
  depends_on "chigraph/kf5/kf5-ki18n"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "08d481343d8b2a71ccfba78dcfc806ce8624f87e7ad63805310157473ccf52e4" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
