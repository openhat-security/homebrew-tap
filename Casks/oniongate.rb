cask "oniongate" do
  version "0.2.6-alpha.1"

  on_arm do
    sha256 "f11508a6faf03280f1de229e1a08b13a15bbbd899ccce9e7a1861e81862874e2"
    url "https://github.com/openhat-security/oniongate/releases/download/v#{version}/OnionGate_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "2aee5d38a0365d95e87f504a249687984bf5926019bc9bb186e6b09a09489c8a"
    url "https://github.com/openhat-security/oniongate/releases/download/v#{version}/OnionGate_#{version}_x64.dmg"
  end

  name "OnionGate"
  desc "Route individual apps through isolated Tor circuits; host and verify onion sites"
  homepage "https://github.com/openhat-security/oniongate"

  livecheck do
    skip "Auto-generated on release."
  end

  depends_on macos: :big_sur

  app "OnionGate.app"

  postflight do
    # Alpha builds are not notarized yet; clear the quarantine bit so Gatekeeper
    # does not block the first launch.
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}"]
  end

  zap trash: [
    "~/Library/Application Support/com.adamsiwiec.oniongate",
    "~/Library/Preferences/com.adamsiwiec.oniongate.plist",
    "~/Library/Saved Application State/com.adamsiwiec.oniongate.savedState",
  ]
end
