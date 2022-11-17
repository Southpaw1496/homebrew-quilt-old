class QuiltInstaller < Formula
  desc "Native installer for the Quilt loader"
  homepage "https://github.com/QuiltMC/quilt-native-installer"
  url "https://github.com/QuiltMC/quilt-native-installer/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "42d80580dc11e3a883b06633450f8121de704cb0ba24ac56d067f898473eddaa"
  license "Apache-2.0"

  depends_on "openssl" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    mv "#{bin}/quilt-installer", "#{bin}/quilt"
  end

  test do
    # The installer does not yet have any native CLI functions, so proper tests will be added once it does.
    system "true"
  end
end
