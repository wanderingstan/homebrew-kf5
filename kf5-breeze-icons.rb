require "formula"

class Kf5BreezeIcons < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.32/breeze-icons-5.32.0.tar.xz"
  sha256 "23a3a0b7f25736f1b5169d958de11b9fe2ad1e9e649e08bd283b81f9a19aa1d8"

  head "git://anongit.kde.org/breeze-icons.git"

  depends_on "cmake" => :build
  depends_on "qt5"

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "486ec2f7d8926e98e78d79d4ce1e81805fb9920ecd15b2a9a4c390a1c3a15656" => :sierra
  end

  def install
    args = std_cmake_args
    args << "-DBINARY_ICONS_RESOURCE=TRUE"
    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
    ln_sf Dir["#{HOMEBREW_PREFIX}/share/icons"], "#{Etc.getpwuid.dir}/Library/Application Support/"
  end

  def caveats; <<-EOS.undent
      A symlink "#{ENV["HOME"]}/Library/Application Support/icons" was created
      So that KF5 can find the breeze themes.

      This symlink can be removed when this formula is uninstalled.
  EOS
  end
end
