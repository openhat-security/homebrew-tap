cask "phishkit" do
  version "0.1.1-alpha.9"

  on_arm do
    sha256 "4c2a524a8561193fb61b27549c463f862d3a4ce400e8e71d7c757315e05a3e14"

    url "https://github.com/openhat-security/phishkit/releases/download/v#{version}/phishkit_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "2aed66d570a514e385a4f94ee9cc1bf54d0b156bc76767ce325330e6d4fe3419"

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
