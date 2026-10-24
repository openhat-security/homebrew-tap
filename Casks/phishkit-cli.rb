cask "phishkit-cli" do
  version "0.1.1-alpha.4"

  on_macos do
    on_arm do
      sha256 "7a32d641c3facc9494c09a1ca5f567439599e997610617dcefea732b9abdc01d"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-aarch64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
    on_intel do
      sha256 "4cb86b750b25017bf6bf875a5f332a86f4e000427124074f5286baf31f939fe6"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-x86_64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
  end
  on_linux do
    on_intel do
      sha256 "6c2bbc5ca3a1f949b4efc1ce046d46732f79fb3fbe333af8f122b8bef93998ee"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      binary "phishkit-#{version}-x86_64-unknown-linux-gnu/phishkit", target: "phishkit"
      binary "phishkit-#{version}-x86_64-unknown-linux-gnu/phishkit_ctl", target: "phishkit_ctl"
    end
  end

  name "phishkit CLI"
  desc "Authorized AiTM + awareness assessment command-line tools (alpha)"
  homepage "https://github.com/openhat-security/phishkit"

  livecheck do
    skip "Auto-generated on release."
  end

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path.to_s]
    end
  end

  caveats <<~EOS
    phishkit-cli installs only the phishkit and phishkit_ctl command-line tools.
    For the desktop app plus the CLI, install the phishkit cask instead:
      brew install --cask openhat-security/tap/phishkit

    This is an alpha build for authorized security assessments only.
    See the authorized-use policy bundled with the archive before running it.
  EOS
end
