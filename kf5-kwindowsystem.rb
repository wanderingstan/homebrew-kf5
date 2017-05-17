require "formula"

class Kf5Kwindowsystem < Formula
  url "http://download.kde.org/stable/frameworks/5.34/kwindowsystem-5.34.0.tar.xz"
  sha256 "035190f599d7ff5718b2254dd9cb4100a22f69cd1e8bdb60dd2970e8d4e9e2ea"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kwindowsystem.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "9590089f8a53afa214143d62fc013ba0c15d64799e1ec5104cfc2bdc3c35f246" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
