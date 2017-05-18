require "formula"

class Kf5Kcmutils < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kcmutils-5.34.0.tar.xz"
  sha256 "1e12b79c13651e6086f315249d1be8cbe84fb996411eb50db0194b7c2ca7a2ac"

  head "git://anongit.kde.org/kcmutils.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-kxmlgui"
  depends_on "chigraph/kf5/kf5-kdeclarative"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "3d6b755249bdd0928c705aa9bab5de8ae94e3b249238652c8ec3edc08d20fe52" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
