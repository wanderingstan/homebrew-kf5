require "formula"

class Kf5Kdeclarative < Formula
  homepage "http://www.kde.org/"
  url "http://download.kde.org/stable/frameworks/5.34/kdeclarative-5.34.0.tar.xz"
  sha256 "e29faa82dd82434add4aa6c3d57f11c892e5a21905cd46d3e7fb8761ae18d2d5"

  head "git://anongit.kde.org/kdeclarative.git"

  depends_on "cmake" => :build
  depends_on "chigraph/kf5/kf5-extra-cmake-modules" => :build
  depends_on "qt5"
  depends_on "libepoxy"
  depends_on "chigraph/kf5/kf5-kio"
  depends_on "chigraph/kf5/kf5-kpackage"

  patch :DATA

  bottle do
    root_url "https://dl.chigraph.io/dependencies/darwin/brew"
    sha256 "bf19f916dc47fdffb05dd258d0a0bf5c1186d7f8d1dc7c1085ebb16343e156ea" => :sierra
  end

  def install
    args = std_cmake_args

    system "cmake", ".", *args
    system "make", "install"
    prefix.install "install_manifest.txt"
  end
end

__END__
diff --git a/src/qmlcontrols/kquickcontrolsaddons/plotter.cpp b/src/qmlcontrols/kquickcontrolsaddons
index 67ce63a..22934ad 100644
--- a/src/qmlcontrols/kquickcontrolsaddons/plotter.cpp
+++ b/src/qmlcontrols/kquickcontrolsaddons/plotter.cpp
@@ -47,6 +47,8 @@
 
 #include <QuickAddons/ManagedTextureNode>
 
+#include <cmath>
+
 //completely arbitrary
 static int s_defaultSampleSize = 40;

