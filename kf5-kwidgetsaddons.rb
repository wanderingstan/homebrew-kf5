require "formula"

class Kf5Kwidgetsaddons < Formula
  url "http://download.kde.org/stable/frameworks/5.37/kwidgetsaddons-5.37.0.tar.xz"
  sha256 "a4c54b371a6fc748108f3e2ce2f40d422e8ef03210b243a3d091c090cf19b3ca"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kwidgetsaddons.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "e9b63e2d27537a608ba60c05244cda572c8b3c9557340a9e5996b9c7189a0a41" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
