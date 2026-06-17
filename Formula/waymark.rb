class Waymark < Formula
  desc "Zsh-first CLI for file and directory frecency tracking"
  homepage "https://github.com/zhyu/waymark"
  url "https://github.com/zhyu/waymark/releases/download/nightly/waymark-macos-arm64.tar.gz"
  version "0.1.0-nightly-5dbfabb"
  sha256 "76cfc0521f331a19a7180cc9af95125bd9ea02b81eb17c8b592d0d3155baa2ee"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "waymark"
  end

  test do
    assert_match "waymark", shell_output("#{bin}/waymark init zsh")
  end
end
