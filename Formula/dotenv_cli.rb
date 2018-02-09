class DotenvCli < Formula
  desc "A CLI for rust-dotenv."
  homepage "https://github.com/sharplet/dotenv_cli"
  url "https://github.com/sharplet/dotenv_cli/archive/v0.2.0.tar.gz"
  sha256 "ec9ca9f953faadd17b7635a42555a22dec68eca19dd6ee0cbfa964494baa3c19"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix
  end

  test do
     (testpath/".env").write('TEST="hello world"')
     assert_equal "hello world", shell_output("#{bin}/dotenv /bin/sh -c 'echo $TEST'").strip
  end
end
