require "formula"

class Kf5Frameworkintegration < Formula
  url "http://download.kde.org/stable/frameworks/5.32/frameworkintegration-5.32.0.tar.xz"
  sha256 "8a5ff514aaa73c4fbf616be45be9be9a2699d80c3409ccc749c8d07709635a08"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/frameworkintegration.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-kio"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "c6d34cbe53b0721ffb6611fa718372bf87f6a42e9a845615eefd3203f69dbd10" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
  end
end
