require "formula"

class Kf5Kxmlgui < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kxmlgui-5.36.0.tar.xz"
  sha256 "e77b3f59d393d3610ecae83d89f6692bd144d899fb9c6559139b7cb6b8da0e31"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kxmlgui.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kglobalaccel"
  depends_on "chigraph/kf5/kf5-ktextwidgets"
  depends_on "chigraph/kf5/kf5-attica"
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "5d7859be26c979e1d19a0da3b9b935d8a9ab148f4b664adc3ee3b55945f65f3e" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
