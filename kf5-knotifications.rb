require "formula"

class Kf5Knotifications < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/knotifications-5.34.0.tar.xz"
  sha256 "295e9325bc6ffe8c2aff1922fc7633b3e6f9d1fa90cf377635f9170bd487e58b"

  head "git://anongit.kde.org/knotifications.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  depends_on "chigraph/kf5/kf5-kiconthemes"
  depends_on "chigraph/kf5/kf5-kservice"
  depends_on "chigraph/kf5/kf5-phonon"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "cd08e0cb88536be1b378e1bd4a63b21ae8c989fd538736cbc8c0b8611b5db73b" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
