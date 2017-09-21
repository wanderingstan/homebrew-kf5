require "formula"

class Kf5Kitemmodels < Formula
  url "http://download.kde.org/stable/frameworks/5.36/kitemmodels-5.36.0.tar.xz"
  sha256 "2a05bc2f807b725de0515dbc12f031b00026e97d0901a8d05f475ad9b2926b23"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/kitemmodels.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

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
