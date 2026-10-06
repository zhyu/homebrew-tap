class CcstatuslineNative < Formula
  desc "Fast native renderer for ccstatusline configurations"
  homepage "https://github.com/zhyu/ccstatusline-native"
  url "https://github.com/zhyu/homebrew-tap/releases/download/ccstatusline-native-nightly-616262737/ccstatusline-native-macos-arm64.tar.gz"
  version "0.2.0-nightly.20261006180446.616262737"
  sha256 "c1690a9931673783801080003a2435bc2a2f1f07feae666f35bbdbbb14aea462"
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
