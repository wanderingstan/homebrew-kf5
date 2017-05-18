require "formula"

class Kf5Kitemmodels < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kitemmodels-5.34.0.tar.xz"
  sha256 "05a72132df6001069273cc1425d65e890edf8112ac88cd2c6b61f5a3ee0d38d2"

  head "git://anongit.kde.org/kitemmodels.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "a754a10503d89ee55a454d109a469e8082c5902c8ef64adf03adc14026a2792b" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
