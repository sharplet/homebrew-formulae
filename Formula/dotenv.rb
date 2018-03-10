class Dotenv < Formula
  desc "A `dotenv` implementation for Rust."
  homepage "https://github.com/purpliminal/rust-dotenv"
  depends_on "rust" => :build

  devel do
    url "https://github.com/sharplet/rust-dotenv.git", branch: "dotenv-cli"
  end

  head "https://github.com/purpliminal/rust-dotenv.git"

  def install
    system "cargo", "install", "--features", "cli", "--root", prefix
  end

  test do
     (testpath/".env").write('TEST="hello world"')
     assert_equal "hello world", shell_output("#{bin}/dotenv /bin/sh -c 'echo $TEST'").strip
  end
end
