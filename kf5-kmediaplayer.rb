require "formula"

class Kf5Kmediaplayer < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/portingAids/kmediaplayer-5.34.0.tar.xz"
  sha256 "06cd8108f12a367a296896e8365327170721dad5f970a215e4bb69831c3e08d7"

  head "git://anongit.kde.org/attica.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kparts"
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "87707ba91f7fc9c224ae1eb5347c3c67010384708bce7b337345c5b31f9dda36" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
