require "formula"

class Kf5Kitemmodels < Formula
  url "http://download.kde.org/stable/frameworks/5.32/kitemmodels-5.32.0.tar.xz"
  sha256 "71fe0a5c2ad9f0f89dfbc2e9ccbc2223b7fa2723166de6f510f8f6d8e469b453"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/kitemmodels.git'

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
