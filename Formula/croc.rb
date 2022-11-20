class Croc < Formula
  desc "Securely send things from one computer to another"
  homepage "https://github.com/schollz/croc"
  url "https://github.com/schollz/croc/archive/v9.6.1.tar.gz"
  sha256 "a7f0db2b52e44358beb2782412c955f2d5a63da72832b83de48739b1431cb19c"
  license "MIT"
  # head "https://github.com/schollz/croc.git", branch: "master"

  bottle do
    root_url "https://github.com/Southpaw1496/homebrew-quilt/releases/download/croc-9.6.1"
    sha256 cellar: :any_skip_relocation, monterey:     "455545a0c40532bcdc715d0ed0d621476ce2bdba05774957e28d152f5fc8c6d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "60803458c5ff82218cf4b34954b2fb9d6547e7d0797b088809dc6fd2cfe79456"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    port=free_port

    fork do
      exec bin/"croc", "relay", "--ports=#{port}"
    end
    sleep 1

    fork do
      exec bin/"croc", "--relay=localhost:#{port}", "send", "--code=homebrew-test", "--text=mytext"
    end
    sleep 1

    assert_match shell_output("#{bin}/croc --relay=localhost:#{port} --overwrite --yes homebrew-test").chomp, "mytext"
  end
end
