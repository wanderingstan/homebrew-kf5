require "formula"

class Kf5Kcrash < Formula
  url "http://download.kde.org/stable/frameworks/5.34/kcrash-5.34.0.tar.xz"
  sha256 "e3cee5a562070728e5b7ad82e3924ef80151756abb206c85810f2fd88e5750b3"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kcrash.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  depends_on "chigraph/kf5/kf5-kwindowsystem"
  depends_on "chigraph/kf5/kf5-kcoreaddons"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "a456181fa709bd9ac8802c7cd461bfeac0cd90e15d8dd4e73ad51f7fbc67dad4" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
