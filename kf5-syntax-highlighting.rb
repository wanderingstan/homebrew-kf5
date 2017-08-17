require "formula"

class Kf5SyntaxHighlighting < Formula
  url "http://download.kde.org/stable/frameworks/5.37/syntax-highlighting-5.37.0.tar.xz"
  sha256 "e2d075482bc5409646db40374c6caa0b055276e1a5cd8e30065e9f4fd0baa6d0"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/syntax-highlighting.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

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
