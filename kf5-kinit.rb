require "formula"

class Kf5Kinit < Formula
  url "http://download.kde.org/stable/frameworks/5.34/kinit-5.34.0.tar.xz"
  sha256 "a10e2c454b7242792178a7f739eae3b46914a3ce237fcdc7b9515d18e54c8220"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kinit.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-kio"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "45954b164085363bf957b5e700547d7a7366b4837bdaefc747e4496ca92fa447" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"

    mkdir_p "#{HOMEBREW_PREFIX}/lib/kde5/libexec"
    ln_sf "#{lib}/kde5/libexec/klauncher", "#{HOMEBREW_PREFIX}/lib/kde5/libexec/"

    prefix.install "install_manifest.txt"
  end
end
