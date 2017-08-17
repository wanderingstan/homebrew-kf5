require "formula"

class Kf5Knotifications < Formula
  url "http://download.kde.org/stable/frameworks/5.37/knotifications-5.37.0.tar.xz"
  sha256 "66cdfddaa31f773a538d429026d0117e60f8a0a7f2a90c861f95d84395347b3f"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/knotifications.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt"

  depends_on "chigraph/kf5/kf5-kiconthemes"
  depends_on "chigraph/kf5/kf5-kservice"
  depends_on "chigraph/kf5/kf5-phonon"

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
