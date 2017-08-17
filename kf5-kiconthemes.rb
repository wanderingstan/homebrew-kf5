require "formula"

class Kf5Kiconthemes < Formula
  url "http://download.kde.org/stable/frameworks/5.37/kiconthemes-5.37.0.tar.xz"
  sha256 "b83bc856947134d4c7a97a6bf8f61045269fb614d6f7d482b344a8beb57bf5c8"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kiconthemes.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kconfigwidgets"
  depends_on "chigraph/kf5/kf5-kitemviews"
  depends_on "qt"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "345b8211db42bee32c11d2a177584b9b9accc30c517be1fb8669ed8a80602555" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
