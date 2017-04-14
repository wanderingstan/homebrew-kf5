require "formula"

class Kf5Knotifications < Formula
  url "http://download.kde.org/stable/frameworks/5.32/knotifications-5.32.0.tar.xz"
  sha256 "9e0caf8599093e7c23bf0baa5f95d776f864a85f4d419bf14dc45fc1503d5719"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/knotifications.git'

  depends_on "cmake" => :build
  depends_on "haraldf/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"

  depends_on "haraldf/kf5/kf5-kiconthemes"
  depends_on "haraldf/kf5/kf5-kservice"
  depends_on "haraldf/kf5/kf5-phonon"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "cd08e0cb88536be1b378e1bd4a63b21ae8c989fd538736cbc8c0b8611b5db73b" => :sierra
  end

  def install
    args = std_cmake_args


    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end
