require "formula"

class Kf5ExtraCmakeModules < Formula
  url "http://download.kde.org/stable/frameworks/5.36/extra-cmake-modules-5.36.0.tar.xz"
  sha256 "6e120bb40411ef559583ef693c0c03a41df3bb40a932bf7444c97e04266d5daf"
  homepage "http://www.kde.org/"

  head "git://anongit.kde.org/extra-cmake-modules"

  depends_on "cmake" => :build

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    cellar :any_skip_relocation
    sha256 "d6d47f60838b5c6a604d6aa6fd916d56a0c468f2964f0a752474247cd016911d" => :sierra
  end

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
    prefix.install "install_manifest.txt"

    ### Hack - QStandardDirs only looks in $HOME/Library/Application Support/, but kf5 installs
    ### to share. Make a symlink
    ln_sf Dir["#{HOMEBREW_PREFIX}/share/kf5"], "#{Etc.getpwuid.dir}/Library/Application Support/"
    ln_sf Dir["#{HOMEBREW_PREFIX}/share/kxmlgui5"], "#{Etc.getpwuid.dir}/Library/Application Support/"
  end
end
