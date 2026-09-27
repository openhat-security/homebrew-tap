cask "runhug" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.8"
  sha256 arm:   "831a262e3e9f3f8c99141012ac53fbcb0598ec1cd52657610b458e51b5d714d4",
         intel: "5a35f1acb7ef76c84a234565a002ad8cde1d1cfbc4742745e3c80890a125acee"

  url "https://github.com/openhat-security/runhug/releases/download/v#{version}/runhug_#{version}_darwin_#{arch}"
  name "runhug"
  desc "Find the best Hugging Face model. Deploy it in minutes. Run it for pennies"
  homepage "https://github.com/openhat-security/runhug"

  binary "runhug_#{version}_darwin_#{arch}", target: "runhug"

  zap trash: [
    "~/.config/runhug",
  ]
end
