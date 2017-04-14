require "formula"

class Kf5Sonnet < Formula
  url "http://download.kde.org/stable/frameworks/5.32/sonnet-5.32.0.tar.xz"
  sha256 "d11f917327fbe31a1a9666c560b4c4b49e6b38a3d104afe97daefcb110d9529f"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/sonnet.git'

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
