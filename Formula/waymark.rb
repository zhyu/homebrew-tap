class Waymark < Formula
  desc "Zsh-first CLI for file and directory frecency tracking"
  homepage "https://github.com/zhyu/waymark"
  url "https://github.com/zhyu/homebrew-tap/releases/download/waymark-nightly-473507457/waymark-macos-arm64.tar.gz"
  version "0.1.0-nightly.20260711130844.473507457"
  sha256 "0ce23228d30f9a4c6126740e35037222d89c1c201870452b1e33c7f4ccbbf817"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "waymark"
  end

  test do
    assert_match "waymark", shell_output("#{bin}/waymark init zsh")
  end
end
