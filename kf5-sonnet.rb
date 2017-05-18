require "formula"

class Kf5Sonnet < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/sonnet-5.34.0.tar.xz"
  sha256 "7aa7342dddc351ee7c46a874498cb89fd96679a5b095d9f16cbe9c9511ccfd19"

  head "git://anongit.kde.org/sonnet.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "3a760e8fa8190336e728c836e33ddbc54909b24b9631397eec66fbddee0e4902" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
