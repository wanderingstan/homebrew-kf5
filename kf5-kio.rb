require "formula"

class Kf5Kio < Formula
  url "http://download.kde.org/stable/frameworks/5.34/kio-5.34.0.tar.xz"
  sha256 "6acb28de757a0d5eccb1e3e533a1ef22b5f5de92e96c3aba804ebdb44aa343c4"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kio.git'

  option "without-kiowidgets", "Builds only KIO core"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-karchive"
  depends_on "chigraph/kf5/kf5-kbookmarks" if not build.without? "kiowidgets"
  depends_on "chigraph/kf5/kf5-kjobwidgets" if not build.without? "kiowidgets"
  depends_on "chigraph/kf5/kf5-kwallet" if not build.without? "kiowidgets"
  depends_on "chigraph/kf5/kf5-solid"
  depends_on "chigraph/kf5/kf5-kservice"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "13334cf6bd9c7eafa7a5d72fa7770445b005a2ce1ffa9e03c7ae94d829d2810e" => :sierra
  end

  def install
    args = std_cmake_args
    args << "-DKIOCORE_ONLY=ON" if build.without? "kiowidgets"

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
