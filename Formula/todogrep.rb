class Todogrep < Formula
  desc "Find TODO and FIXME directives in the current directory."
  homepage "https://github.com/sharplet/todogrep"
  url "https://github.com/sharplet/todogrep/archive/v0.1.2.tar.gz"
  version "0.1.2"
  sha256 "3fd812f93e7ef7228fc3d55e5753e97e91e16dff75cf1eee03f7cf76890dbddd"

  def install
    bin.install "todogrep"
  end

  test do
    system "todogrep -i ^$"
  end
end
