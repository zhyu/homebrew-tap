class Roused < Formula
  desc "Activation reverse proxy for macOS LaunchAgents"
  homepage "https://github.com/zhyu/roused"
  url "https://github.com/zhyu/homebrew-tap/releases/download/roused-nightly-482384431/roused-macos-arm64.tar.gz"
  version "0.1.0-nightly.20260719124158.482384431"
  sha256 "749b58d1a16342a366c034dce8cb654b3ebbb32d02080450f801a88fd9e69a4c"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "roused"

    generated_config = buildpath/"roused.toml"
    system bin/"roused", "init-config", generated_config
    pkgetc.install generated_config

    log_dir = var/"log/roused"
    log_dir.mkpath
    system bin/"roused", "init-gateway-plist",
           "--label", plist_name,
           "--config", pkgetc/"roused.toml",
           "--output", prefix/"#{plist_name}.plist",
           "--log-dir", log_dir,
           "--program", opt_bin/"roused"
  end

  def caveats
    <<~EOS
      Edit the starter configuration before starting Roused:
        #{pkgetc}/roused.toml

      Validate it and start the current-user service with:
        roused check-config #{pkgetc}/roused.toml
        brew services start roused

      Roused also validates this file when formula upgrades regenerate the plist,
      so an invalid configuration will block an upgrade until it is corrected.

      Do not use sudo; Roused only supports current-user LaunchAgents.

      Logs are written under:
        #{var}/log/roused
    EOS
  end

  service do
    name macos: "homebrew.mxcl.roused"
  end

  test do
    assert_match(/^roused \d+\.\d+\.\d+$/, shell_output("#{bin}/roused --version").strip)

    generated_config = testpath/"roused.toml"
    system bin/"roused", "init-config", generated_config
    system bin/"roused", "check-config", generated_config

    service_file = prefix/"#{plist_name}.plist"
    system "/usr/bin/plutil", "-lint", service_file
    assert_match "<string>#{plist_name}</string>", service_file.read
    assert_match "<string>#{opt_bin}/roused</string>", service_file.read
    assert_match "<string>#{pkgetc}/roused.toml</string>", service_file.read
  end
end
