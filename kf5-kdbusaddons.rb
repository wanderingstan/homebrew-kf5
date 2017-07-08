require "formula"

class Kf5Kdbusaddons < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kdbusaddons-5.36.0.tar.xz"
  sha256 "8433cfb3ccb67b1364ad5594a278ec5a920b8e10fb43b7b615acaa7fdb5f4e04"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kdbusaddons.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "shared-mime-info"
  depends_on "d-bus"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "af70b7fd6c3ab52a625105fbee1ffdf4279954d1c0044042bea04d70896e77a8" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
