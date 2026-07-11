class CcstatuslineNative < Formula
  desc "Fast native renderer for ccstatusline configurations"
  homepage "https://github.com/zhyu/ccstatusline-native"
  url "https://github.com/zhyu/homebrew-tap/releases/download/ccstatusline-native-nightly-473555000/ccstatusline-native-macos-arm64.tar.gz"
  version "0.2.0-nightly.20260711142833.473555000"
  sha256 "d4ee55faffa5107e4d69a1e3378b8d75801717a92be24a3c1ab1deb8bcff1e66"
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
