require "formula"

class Kf5Kcodecs < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kcodecs-5.32.0.tar.xz"
  sha256 "a3084f995808312be1cb8f63b91766e06c63b9c6d2f8a62426d5a228ca9dcb7b"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kcodecs.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "0ecc36c9c5a270326556d666b359c90813cdc52d5387656e0b58623f1f84b7d6" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
