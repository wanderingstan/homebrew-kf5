require "formula"

class Kf5Kglobalaccel < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kglobalaccel-5.36.0.tar.xz"
  sha256 "729562dcaa1fea9f18b57a39a680276d1fdfd1b3333d4308e6c5218b061775da"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kglobalaccel.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "chigraph/kf5/kf5-kconfig"
  depends_on "chigraph/kf5/kf5-kcoreaddons"
  depends_on "chigraph/kf5/kf5-kcrash"
  depends_on "chigraph/kf5/kf5-kdbusaddons"
  depends_on "chigraph/kf5/kf5-ki18n"
  depends_on "chigraph/kf5/kf5-kservice"
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "de2579ba8e01209152bd85d1dbc4b7e36763bced37564b64002125b57179c562" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
