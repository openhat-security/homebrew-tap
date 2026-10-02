# Generated for hfpacks v0.2.1
cask "hfpacks" do
  version "0.2.1"

  on_macos do
    on_arm do
      sha256 "cd42e20ea154a1d6f193f32e0f344037193502add1b33839e4b01772056f873b"
      url "https://github.com/openhat-security/hfpacks/releases/download/v#{version}/hfpacks_#{version}_darwin_arm64"
      binary "hfpacks_0.2.1_darwin_arm64", target: "hfpacks"
    end
    on_intel do
      sha256 "2e263762ee3bd5104d806707b927a6fee0ada39a1080137737eb08963bf14560"
      url "https://github.com/openhat-security/hfpacks/releases/download/v#{version}/hfpacks_#{version}_darwin_amd64"
      binary "hfpacks_0.2.1_darwin_amd64", target: "hfpacks"
    end
  end
  on_linux do
    on_arm do
      sha256 "65d909057eee6bd8d9c4122f34203fdce1ec1c41d2130988dd9345566e9abed9"
      url "https://github.com/openhat-security/hfpacks/releases/download/v#{version}/hfpacks_#{version}_linux_arm64"
      binary "hfpacks_0.2.1_linux_arm64", target: "hfpacks"
    end
    on_intel do
      sha256 "81dcb690336adca15f67b48b287d790b5941e44c418daca5d823c622d944b45d"
      url "https://github.com/openhat-security/hfpacks/releases/download/v#{version}/hfpacks_#{version}_linux_amd64"
      binary "hfpacks_0.2.1_linux_amd64", target: "hfpacks"
    end
  end

  name "hfpacks"
  desc "Build Hugging Face Hub index packs for runhug"
  homepage "https://github.com/openhat-security/hfpacks"

  livecheck do
    skip "Auto-generated on release."
  end

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}"]
    end
  end
end
