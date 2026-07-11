class CcstatuslineNative < Formula
  desc "Fast native renderer for ccstatusline configurations"
  homepage "https://github.com/zhyu/ccstatusline-native"
  url "https://github.com/zhyu/homebrew-tap/releases/download/ccstatusline-native-nightly-473214283/ccstatusline-native-macos-arm64.tar.gz"
  version "0.1.1-nightly.20260711044533.473214283"
  sha256 "477b1baffe0c88dc19c78ee0f97088b777d3da6e208793b1f684c2e822f78c1e"
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
