class DieselCli < Formula
  desc "A safe, extensible ORM and Query Builder for Rust"
  homepage "http://diesel.rs"
  url "https://github.com/diesel-rs/diesel/archive/v1.1.1.tar.gz"
  sha256 "b0f29d67c7251003eef3af515052bdc0dea3c72b08830a6ff1fc4b8b7b6b13a6"
  depends_on "rust" => :build

  FEATURES = {
    "postgres" => "Compile without support for PostgreSQL",
    "mysql" => "Compile without support for MySQL",
    "sqlite" => "Compile without support for SQLite",
  }.freeze

  FEATURES.each do |feature, description|
    option "without-#{feature}", description

    if build.with? feature
      depends_on feature
    end
  end

  def install
    enabled, disabled = FEATURES.keys.partition { |feature|
      build.with?(feature)
    }

    if disabled.empty?
      args = []
    else
      args = ["--no-default-features", "--features", enabled.join(" ")]
    end

    system "cargo", "install", "--path", "diesel_cli", "--root", prefix, *args
  end

  test do
    mkdir "migrations"
    system "#{bin}/diesel", "migration", "generate", "create_posts"
    Dir["migrations/*"].count > 0
  end
end
