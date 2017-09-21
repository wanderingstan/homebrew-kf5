require "formula"

class Kf5Kcmutils < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kcmutils-5.36.0.tar.xz"
  sha256 "df21667f6dae44707d13e51780ffe157fd0a29d4b946b14876a2a96633b32e66"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kcmutils.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"
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
