require "formula"

class Kf5Kitemviews < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kitemviews-5.34.0.tar.xz"
  sha256 "13e76534a2952887f2e02612b0ee86220b035262abbbf582fce1101d17638a14"

  head "git://anongit.kde.org/kitemviews.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "8e1af808f05da4de639fa945576e57f688ca336b8bce8510d63554bde296d4c4" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
