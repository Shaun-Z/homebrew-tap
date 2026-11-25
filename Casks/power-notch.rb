cask "power-notch" do
  version "0.1.1"
  sha256 "1b09785267f40cb077525bd923911382e19a81ac3e98ed30b210181b86af2bc5"
  url "https://github.com/Shaun-Z/power.notch/releases/download/v0.1.1/powerNotch.dmg"
  name "powerNotch"
  desc "powerNotch That Rocks"
  homepage "https://github.com/Shaun-Z/power.notch"
  livecheck do
    url :url
    strategy :github_latest
  end
  auto_updates true
  depends_on macos: :sequoia
  app "powerNotch.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/powerNotch.app"],
        must_succeed: false
  end

  uninstall quit: "com.powernotch.app"

  zap trash: [
    "~/Library/Application Scripts/com.powernotch.app/",
    "~/Library/Containers/com.powernotch.app/",
  ]
end
