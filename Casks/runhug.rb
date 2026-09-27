cask "runhug" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.7"
  sha256 arm:   "0d15d558c68d2e239d53617c049646b01a8b6402d11f9e4cfe2681916da825f9",
         intel: "4645972573fda42adb1965e49f94dbdac1c16cd5da43d9d6e5e46800502d4d69"

  url "https://github.com/openhat-security/runhug/releases/download/v#{version}/runhug_#{version}_darwin_#{arch}"
  name "runhug"
  desc "Find the best Hugging Face model. Deploy it in minutes. Run it for pennies"
  homepage "https://github.com/openhat-security/runhug"

  binary "runhug_#{version}_darwin_#{arch}", target: "runhug"

  # Clear quarantine if Gatekeeper blocks the unsigned binary:
  #   xattr -dr com.apple.quarantine $(brew --prefix)/bin/runhug
  caveats do
    unsigned_binary
  end

  zap trash: [
    "~/.config/runhug",
  ]
end
