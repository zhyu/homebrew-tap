class Waymark < Formula
  desc "Zsh-first CLI for file and directory frecency tracking"
  homepage "https://github.com/zhyu/waymark"
  url "https://github.com/zhyu/waymark/releases/download/nightly/waymark-macos-arm64.tar.gz"
  version "0.1.0-nightly-dfdba09"
  sha256 "43a6f7996e71a9b41dd4e317b135025f50c5977abcd3473e6bdcdd3e3e986849"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "waymark"
  end

  test do
    assert_match "waymark", shell_output("#{bin}/waymark init zsh")
  end
end
