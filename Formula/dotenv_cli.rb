class DotenvCli < Formula
  desc "A CLI for rust-dotenv."
  homepage "https://github.com/sharplet/dotenv_cli"
  url "https://github.com/sharplet/dotenv_cli/archive/v0.2.1.tar.gz"
  sha256 "abfd8d0f525a2839c6195c385eb253c7d7f60b6b5640f136d72e8bcaf2f49e46"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix
  end

  test do
     (testpath/".env").write('TEST="hello world"')
     assert_equal "hello world", shell_output("#{bin}/dotenv /bin/sh -c 'echo $TEST'").strip
  end
end
