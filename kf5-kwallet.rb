require "formula"

class Kf5Kwallet < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kwallet-5.34.0.tar.xz"
  sha256 "e537d561b536802bd0d881638a6068d8383d1f2497e9ad85c5c596aa746be323"

  head "git://anongit.kde.org/kwallet.git"

  depends_on "libgcrypt"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-knotifications"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "3e15a7c8c730cf4efab7b461d68061ccd0258dac2182c32169693dc0f8a70bc9" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
