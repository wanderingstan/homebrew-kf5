require "formula"

class Kf5Kunitconversion < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kunitconversion-5.34.0.tar.xz"
  sha256 "553378be1e5a4460b8c15b57511c99df85fbf06c351c88a3fb792bb7a8039d6c"

  head "git://anongit.kde.org/kunitconversion.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "gettext" => :build
  depends_on "chigraph/kf5/kf5-ki18n"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "35a3d6501e188bcb38d7fae6658c65e194a4293634eff8f6c8963cca5e6a55b2" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
