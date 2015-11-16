class Todogrep < Formula
  desc "Find TODO and FIXME directives in the current directory."
  homepage "https://github.com/sharplet/todogrep"
  url "https://github.com/sharplet/todogrep/archive/v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "b14f5b82f8b2ef3761f4d7d359c4787f4464f808d512b2344cc5b5706141321f"

  def install
    bin.install "todogrep"
  end

  test do
    system "todogrep -i ^$"
  end
end
