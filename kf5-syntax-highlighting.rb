require "formula"

class Kf5SyntaxHighlighting < Formula
  url "http://download.kde.org/stable/frameworks/5.32/syntax-highlighting-5.32.0.tar.xz"
  sha256 "a31f5f66b642ffdb2839c6278428961839b2d13a2ca80561e5eff13a4a3f35b5"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/syntax-highlighting.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
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
