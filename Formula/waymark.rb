class Waymark < Formula
  desc "Zsh-first CLI for file and directory frecency tracking"
  homepage "https://github.com/zhyu/waymark"
  url "https://github.com/zhyu/waymark/releases/download/nightly/waymark-macos-arm64.tar.gz"
  version "0.1.0-nightly-e5db17b"
  sha256 "25ac5f93c01293625ba52fb3de32f2c9f53be19da2596c8b2205f45f4eb3ed58"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "waymark"
  end

  test do
    assert_match "waymark", shell_output("#{bin}/waymark init zsh")
  end
end
