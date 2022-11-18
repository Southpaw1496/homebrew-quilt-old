class QuiltNativeInstaller < Formula
  desc "Native installer for the Quilt loader"
  homepage "https://github.com/QuiltMC/quilt-native-installer"
  url "https://github.com/QuiltMC/quilt-native-installer/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "42d80580dc11e3a883b06633450f8121de704cb0ba24ac56d067f898473eddaa"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Southpaw1496/homebrew-quilt/releases/download/quilt-native-installer-0.1.1"
    sha256 cellar: :any_skip_relocation, monterey:     "dcbfe368c269765c403390f61a503d4e7c9d04ca4ec735f8c3ef4394745d26fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ff8ea62a83959dbf8785eeea73e701ef61683a121e7a517fa2aa5d1f495b6543"
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
