cask "phishkit-cli" do
  version "0.1.1-alpha.6"

  on_macos do
    on_arm do
      sha256 "338e9e081c9933bf9d93e6f0a882bbcf1ad558e6ed6c0ef458307c09396d46b9"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-aarch64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-aarch64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
    on_intel do
      sha256 "3e9a14a1829512eede59e12a0ae0a8756fc1eb34d2149b60b991754856e1afe8"
      url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit-#{version}-x86_64-apple-darwin.tar.gz"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit", target: "phishkit"
      binary "phishkit-#{version}-x86_64-apple-darwin/phishkit_ctl", target: "phishkit_ctl"
    end
  end
  on_linux do
    on_intel do
      sha256 "33edd04eee7891138e5c28d048bb122502bdf4fe2bfd6bf01d5fac411959ebeb"
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
