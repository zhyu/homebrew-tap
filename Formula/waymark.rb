class Waymark < Formula
  desc "Zsh-first CLI for file and directory frecency tracking"
  homepage "https://github.com/zhyu/waymark"
  url "https://github.com/zhyu/waymark/releases/download/nightly/waymark-macos-arm64.tar.gz"
  version "0.1.0-nightly.20260618104841.1"
  sha256 "66e27970c0dfddcb9a7319b42f1c3bc05415e6667e48e7cff3ef4957241f0be1"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "waymark"
  end

  test do
    assert_match "waymark", shell_output("#{bin}/waymark init zsh")
  end
end
