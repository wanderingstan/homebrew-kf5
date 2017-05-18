require "formula"

class Kf5Kcodecs < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kcodecs-5.34.0.tar.xz"
  sha256 "50ab884a0ec9ee535ea5354323645858fe9969f93af3e1503478024731d1a14c"

  head "git://anongit.kde.org/kcodecs.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
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
