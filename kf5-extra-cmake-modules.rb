require "formula"

class Kf5ExtraCmakeModules < Formula
  url "http://download.kde.org/stable/frameworks/5.32/extra-cmake-modules-5.32.0.tar.xz"
  sha256 "b1d87be86f36c20ec1f4ad7946f702fd1a7cab0e2ea2e81f4f9a2d937f9f0ac7"
  homepage "http://www.kde.org/"

  head 'git://anongit.kde.org/extra-cmake-modules'

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
