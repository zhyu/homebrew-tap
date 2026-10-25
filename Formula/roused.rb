class Roused < Formula
  SERVICE_LABEL = "io.github.zhyu.roused".freeze

  desc "Activation reverse proxy for macOS LaunchAgents"
  homepage "https://github.com/zhyu/roused"
  url "https://github.com/zhyu/homebrew-tap/releases/download/roused-nightly-674128969/roused-macos-arm64.tar.gz"
  version "0.1.0-nightly.20261025045328.674128969"
  sha256 "af8bd816a6ee98d841b6c3c647585bbb2e14184189d12507b47653eca64d3bda"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "roused"

    generated_config = buildpath/"roused.toml"
    system bin/"roused", "init-config", generated_config
    # Preserve an operator-edited configuration across upgrades.
    pkgetc.install generated_config unless (pkgetc/"roused.toml").exist?

    log_dir = var/"log/roused"
    log_dir.mkpath
    system bin/"roused", "init-gateway-plist",
           "--label", SERVICE_LABEL,
           "--config", pkgetc/"roused.toml",
           "--output", prefix/"#{SERVICE_LABEL}.plist",
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

      The existing configuration is preserved across upgrades. Roused validates
      it when an upgrade regenerates the plist, so an invalid configuration
      will block an upgrade until it is corrected.

      Do not use sudo; Roused only supports current-user LaunchAgents.

      Logs are written under:
        #{var}/log/roused
    EOS
  end

  service do
    name macos: SERVICE_LABEL
  end

  test do
    assert_match(/^roused \d+\.\d+\.\d+$/, shell_output("#{bin}/roused --version").strip)

    generated_config = testpath/"roused.toml"
    system bin/"roused", "init-config", generated_config
    system bin/"roused", "check-config", generated_config

    service_file = prefix/"#{SERVICE_LABEL}.plist"
    system "/usr/bin/plutil", "-lint", service_file
    assert_match "<string>#{SERVICE_LABEL}</string>", service_file.read
    assert_match "<string>#{opt_bin}/roused</string>", service_file.read
    assert_match "<string>#{pkgetc}/roused.toml</string>", service_file.read
  end
end
