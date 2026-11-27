cask "power-notch" do
  version "0.1.4"
  sha256 "8d1d00c255f52ef3c9fd28bf698fd6d5c39b5175f267ecd247381d30ac4d9c6d"
  url "https://github.com/Shaun-Z/power.notch/releases/download/v0.1.4/powerNotch.dmg"
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
