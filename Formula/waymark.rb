class Waymark < Formula
  desc "Zsh-first CLI for file and directory frecency tracking"
  homepage "https://github.com/zhyu/waymark"
  url "https://github.com/zhyu/waymark/releases/download/nightly/waymark-macos-arm64.tar.gz"
  version "0.1.0-nightly.20260619035837.1"
  sha256 "72c1f4d72a5e9700f12da891db9925c78b7056d334cf594044506caec7cb8cca"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "waymark"
  end

  test do
    assert_match "waymark", shell_output("#{bin}/waymark init zsh")
  end
end
