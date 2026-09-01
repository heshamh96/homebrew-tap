cask "setups" do
  version "0.2.4"

  on_arm do
    sha256 "3bed143291faebf794728b190e68a5a8fb9a664b7ac16b645ade79a381d82c74"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/setups-v#{version}/Setups_#{version}_aarch64.app.tar.gz"
  end

  name "Setups"
  desc "Your whole setup, saved — backup, timeline, and apply for your machine"
  homepage "https://setups.meta-thinking.net"

  app "Setups.app"

  zap trash: [
    "~/Library/Application Support/net.meta-thinking.setups",
    "~/.setups",
  ]

  caveats <<~EOS
    Setups is ad-hoc signed (Apple notarization is in progress), so the FIRST
    launch needs a one-time approval — run:

      xattr -dr com.apple.quarantine "/Applications/Setups.app"

    or open the app once (it will be blocked), then
    System Settings -> Privacy & Security -> "Open Anyway".

    The powerful optional CLI lives inside the app:
      Settings -> Install CLI  (tab completion included)
  EOS
end
