cask "phishkit-cli" do
  version "0.1.1-alpha.9"

  on_macos do
    on_arm do
      sha256 "a2a715c441c7a9042b1aba7998a9f20cc693d0605a4b70813a13bba079235d69"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-aarch64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
    on_intel do
      sha256 "576c00670a7ac5483024991990eb668c7b0eaf618b0821cbbfda9a028bc91c19"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-x86_64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
  end
  on_linux do
    on_intel do
      sha256 "37ad780b13ca3f35a5ac6a6c7c90a4060550572cd5bdd4cae19946a127652ba8"
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
