require "formula"

class Kf5Kpackage < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kpackage-5.36.0.tar.xz"
  sha256 "0887882000eeef5c12bb613672075187b1f031e8d87dbaecdadc02c9112a8a2f"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kpackage.git"

  depends_on "cmake" => :build
  depends_on "gettext" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kcoreaddons"
  depends_on "qt"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "7a8f7029508afb3add7dd104aaa67287a2476c4afa62eed70dd68828b20282f8" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
