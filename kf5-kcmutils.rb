require "formula"

class Kf5Kcmutils < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kcmutils-5.32.0.tar.xz"
  sha256 "a9666c3c944703355465bfaf9ee7ed8599a099935a2a91eaca6e09c1f88129d7"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kcmutils.git'

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
