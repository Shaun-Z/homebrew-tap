cask "power-notch@rc" do
  version "0.1.3"
  sha256 "c0f5dff396ce64647bbdc785e5411b96dfc7280ac29b7d140fedf1f8da5ca88f"
  url "https://github.com/Shaun-Z/power.notch/releases/download/v0.1.3/powerNotch.dmg"
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
