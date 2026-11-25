cask "power-notch@rc" do
  version "0.1.1"
  sha256 "1b09785267f40cb077525bd923911382e19a81ac3e98ed30b210181b86af2bc5"
  url "https://github.com/Shaun-Z/power.notch/releases/download/v0.1.1/powerNotch.dmg"
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
