class CcstatuslineNative < Formula
  desc "Fast native renderer for ccstatusline configurations"
  homepage "https://github.com/zhyu/ccstatusline-native"
  url "https://github.com/zhyu/homebrew-tap/releases/download/ccstatusline-native-nightly-473348653/ccstatusline-native-macos-arm64.tar.gz"
  version "0.1.2-nightly.20260711081829.473348653"
  sha256 "de8459c93bdbc50c5a148955cee0ccdb04c00ac03fc12ca3f2997c32e89061c5"
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
