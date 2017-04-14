require "formula"

class Kf5Kauth < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kauth-5.32.0.tar.xz"
  sha256 "b8326b4ca3a43169f70c08186bd1230777c1caa5857e7e5770d6f0644dc06d02"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kauth.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-kcoreaddons"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "1354a33a896478f2be277b6e36f2e76f7e2e0c6c7c481013eeed582bea5c92ff" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"

    mkdir_p "#{HOMEBREW_PREFIX}/lib/kde5/libexec"
    ln_sf "#{lib}/kde5/libexec/kauth-policy-gen.app", "#{HOMEBREW_PREFIX}/lib/kde5/libexec/"
  end
end
