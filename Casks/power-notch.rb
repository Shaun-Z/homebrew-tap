cask "power-notch" do
  version "0.1.2"
  sha256 "ad59f5d3cc777f6c26ed0adea0e3420fc157290c18fa3be2bdbdcae23e28185e"
  url "https://github.com/Shaun-Z/power.notch/releases/download/v0.1.2/powerNotch.dmg"
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
