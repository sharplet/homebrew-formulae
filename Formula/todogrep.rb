class Todogrep < Formula
  desc "Find TODO and FIXME directives in the current directory."
  homepage "https://github.com/sharplet/todogrep"
  url "https://github.com/sharplet/todogrep/archive/v0.1.tar.gz"
  version "0.1"
  sha256 "b3308fcdc5d03131c7c027272820c95346891ad5b48303ab2e9acd486c5bf6c3"

  def install
    bin.install "todogrep"
  end

  test do
    system "todogrep -i ^$"
  end
end
