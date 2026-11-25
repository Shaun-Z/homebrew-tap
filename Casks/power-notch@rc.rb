cask "power-notch@rc" do
  version "0.1.0"
  sha256 "f76f0a5e166c08920155403906914d9c52a656c9e9ef3e5769be232715767c3d"
  url "https://github.com/Shaun-Z/power.notch/releases/download/v0.1.0/powerNotch.dmg"
  name "powerNotch RC"
  desc "powerNotch That Rocks (Release Candidate)"
  homepage "https://github.com/Shaun-Z/power.notch"
  livecheck do
    url :url
    strategy :github_latest
  end
  auto_updates true
  depends_on macos: :sequoia
  app "powerNotch.app"

  uninstall quit: "com.powernotch.app"

  zap trash: [
    "~/Library/Application Scripts/com.powernotch.app/",
    "~/Library/Containers/com.powernotch.app/",
  ]
end
