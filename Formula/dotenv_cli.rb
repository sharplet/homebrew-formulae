class DotenvCli < Formula
  desc "A CLI for rust-dotenv."
  homepage "https://github.com/sharplet/dotenv_cli"
  url "https://github.com/sharplet/dotenv_cli/archive/v0.1.0.tar.gz"
  sha256 "e4e7163fce16cffdb56dace6d3f50f8c276773a5084af5d6bfc10907b3805e84"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix
  end

  test do
     (testpath/".env").write('TEST="hello world"')
     assert_equal "hello world", shell_output("#{bin}/dotenv /bin/sh -c 'echo $TEST'").strip
  end
end
