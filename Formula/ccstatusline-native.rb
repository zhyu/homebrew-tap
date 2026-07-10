class CcstatuslineNative < Formula
  desc "Fast native renderer for ccstatusline configurations"
  homepage "https://github.com/zhyu/ccstatusline-native"
  url "https://github.com/zhyu/homebrew-tap/releases/download/ccstatusline-native-nightly-472784550/ccstatusline-native-macos-arm64.tar.gz"
  version "0.1.0-nightly.20260710184849.472784550"
  sha256 "ae81bb4d01540b42ed1612081df39547c2c153e929c3dbdd9d43c21186ac9777"
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
