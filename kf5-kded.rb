require "formula"

class Kf5Kded < Formula
  url "http://download.kde.org/stable/frameworks/5.37/kded-5.37.0.tar.xz"
  sha256 "fea1c5e9fb1444be0988455c1e51fb2a8cc846db522297108a0b2c2c3a2e5a98"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kded.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kinit"
  depends_on "qt"
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
