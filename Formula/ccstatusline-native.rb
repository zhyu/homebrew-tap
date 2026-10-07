class CcstatuslineNative < Formula
  desc "Fast native renderer for ccstatusline configurations"
  homepage "https://github.com/zhyu/ccstatusline-native"
  url "https://github.com/zhyu/homebrew-tap/releases/download/ccstatusline-native-nightly-618090796/ccstatusline-native-macos-arm64.tar.gz"
  version "0.3.0-nightly.20261007083604.618090796"
  sha256 "4f9c27e4cd35551883e7607c64745686d5d0c30c4187168b96063418287f2b8b"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ccstatusline-native"
  end

  test do
    assert_match "ccstatusline-native", shell_output("#{bin}/ccstatusline-native --version")
  end
end
