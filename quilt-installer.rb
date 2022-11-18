class QuiltInstaller < Formula
  desc "Native installer for the Quilt loader"
  homepage "https://github.com/QuiltMC/quilt-native-installer"
  url "https://github.com/QuiltMC/quilt-native-installer/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "42d80580dc11e3a883b06633450f8121de704cb0ba24ac56d067f898473eddaa"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Southpaw1496/homebrew-quilt/releases/download/quilt-installer-0.1.1"
    sha256 cellar: :any_skip_relocation, monterey:     "5432fc00c67a9f2ceefc583991265e25c460107a927358df3a566e30adb6729c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "babebe15c4a4621291454cab96787f58709674b53d4d4e6a4e67f25155c70a3f"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", *std_cargo_args
    mv "#{bin}/quilt-installer", "#{bin}/quilt"
  end

  test do
    # The installer does not yet have any native CLI functions, so proper tests will be added once it does.
    system "true"
  end
end
