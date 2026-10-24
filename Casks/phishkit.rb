cask "phishkit" do
  version "0.1.1-alpha.4"

  on_arm do
    sha256 "9a699ff585f1049adfc81904e100c9a968afa76264204fe0aa4529fe08f75f99"

    url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "890a2ab63cef713437946c91a09e9f50b8d71dfb44d0f44798e11a1c15e450e3"

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

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/phishkit.app"]
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
