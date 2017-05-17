require "formula"

class Kf5Ktexteditor < Formula
  url "http://download.kde.org/stable/frameworks/5.34/ktexteditor-5.34.0.tar.xz"
  sha256 "bcf714ea30c249e9d52eda5f089a5321b6ed283453cf81950319b7e7b8064aa0"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/ktexteditor.git'

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "chigraph/kf5/kf5-kparts"
  depends_on "chigraph/kf5/kf5-syntax-highlighting"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "9c23e4c0c6d1b368d14791b0158e0852608bcd87afd468f920fe52cc627b5d2e" => :sierra
  end

  def install
    ln_sf Dir["#{HOMEBREW_PREFIX}/share/kservicetypes5"], "#{Etc.getpwuid.dir}/Library/Application Support/"
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
