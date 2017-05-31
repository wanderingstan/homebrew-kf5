require "formula"

class Kf5SyntaxHighlighting < Formula
  url "http://download.kde.org/stable/frameworks/5.34/syntax-highlighting-5.34.0.tar.xz"
  sha256 "884b266cfcec466d7f86053c7bcefccf27b256651ad123656939c9bfe9e2ce67"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/syntax-highlighting.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "2747b924a61ed08d6faa03bf3d53e5c1e61c6cbd03132eb7926939e41f2a0912" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
