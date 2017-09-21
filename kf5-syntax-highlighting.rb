require "formula"

class Kf5SyntaxHighlighting < Formula
  url "http://download.kde.org/stable/frameworks/5.36/syntax-highlighting-5.36.0.tar.xz"
  sha256 "925a8845cd3a1d1720753aaba80f364d59612d45a71de089531d5e8dfa94fdc5"
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
