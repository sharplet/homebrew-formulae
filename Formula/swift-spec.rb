class SwiftSpec < Formula
  desc "Like swift-test, but with output formatted by xcpretty."
  homepage "https://github.com/sharplet/swift-spec"
  url "https://github.com/sharplet/swift-spec/releases/download/0.1/swift-spec-0.1.tar.gz"
  sha256 "8dc61d28d3b693f1073c9bacce2953ad59188ced0e3f9b8620b9fbb8251afed9"

  head do
    url "https://github.com/sharplet/swift-spec.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    ENV["GEM_HOME"] = prefix/"gems"
    system "gem", "install", "--no-wrappers", "xcpretty"
    ENV["XCPRETTY"] = prefix/"gems/bin/xcpretty"

    if build.head?
      system "./autogen.sh"
    end

    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "swift", "package", "--disable-sandbox", "init"
    system "swift", "spec", "--disable-sandbox"
  end
end
