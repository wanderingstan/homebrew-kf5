require "formula"

class Kf5Kded < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kded-5.32.0.tar.xz"
  sha256 "064359f27e0c98ba28425a4a5827a800bd3dc2a32626d7fbf606f1c9f1d6b55e"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kded.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "haraldf/kf5/kf5-kinit"
  depends_on "qt5"
  depends_on "gettext" => :build

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "21f925771c1d1af8f4e740c6020262014bfd2a804771f7daa437cf6ac2b0d4e1" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
