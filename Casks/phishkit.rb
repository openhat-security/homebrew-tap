cask "phishkit" do
  version "0.1.1-alpha.8"

  on_arm do
    sha256 "52981784e21d3df583f87fae5ca4bfdaf567a538d4eea2286af7242e96e093fe"

    url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "26448a9968668e68ad8cab0382f07c6c9fd76959de1bd8c7c27d56c1778c11dd"

    url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit_#{version}_x64.dmg"
  end

  name "phishkit"
  desc "Authorized AiTM + awareness assessment desktop app, CLI included (alpha)"
  homepage "https://github.com/openhat-security/phishkit"

  livecheck do
    skip "Auto-generated on release."
  end

  depends_on cask: "openhat-security/tap/phishkit-cli"
  depends_on :macos

  app "phishkit.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/phishkit.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.phishkit.app",
    "~/Library/Caches/com.phishkit.app",
    "~/Library/Preferences/com.phishkit.app.plist",
    "~/Library/Saved Application State/com.phishkit.app.savedState",
  ]

  caveats <<~EOS
    phishkit installs the desktop app into Applications and the phishkit CLI
    (via the phishkit-cli cask). For the CLI on its own, install:
      brew install openhat-security/tap/phishkit-cli

    This is an alpha build for authorized security assessments only, and it is
    not notarized. macOS Gatekeeper may warn on first launch.
    See the authorized-use policy before running it.
  EOS
end
