cask "phishkit-cli" do
  version "0.1.1-alpha.10"

  on_macos do
    on_arm do
      sha256 "059130eeffa6d75e2c520bbc8b45555e3f1b27dca3498a4b3a47db3e850ff2c3"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-aarch64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
    on_intel do
      sha256 "1c598ad9e496ee5794ebd0fff57d387ab8a7b07c58ae78672e6536174c0e6439"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-x86_64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
  end
  on_linux do
    on_intel do
      sha256 "4fb219c5c1f1a5cce966f2b99049046b125333bf5a8cf87e8aff7e5373defe3f"
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
