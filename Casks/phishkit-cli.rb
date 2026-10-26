cask "phishkit-cli" do
  version "0.1.1-alpha.8"

  on_macos do
    on_arm do
      sha256 "44d70efb3f42be2f6f06a7e88863fc7aabfd782f80f6675bcd3468e094c2a847"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-aarch64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
    on_intel do
      sha256 "2b70b3079ffd0af679c69b5415f592fe3a7e93f715216163dc4b324e8c2b2030"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-x86_64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
  end
  on_linux do
    on_intel do
      sha256 "93f8b1e55e8658126e99111cf44d7965390564b64dfb0314b269070eb9bf3787"
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

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}"]
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
