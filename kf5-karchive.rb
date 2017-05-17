require "formula"

class Kf5Karchive < Formula
  url "http://download.kde.org/stable/frameworks/5.34/karchive-5.34.0.tar.xz"
  sha256 "bcef3ba94707ee2c1e93a41340a1758f8f04549c43af0479dcf68bacdad4123d"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/karchive.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "http://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "ab256271f55e21430512e07965046b17d852c88a8886d5177c067c08629a7393" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
