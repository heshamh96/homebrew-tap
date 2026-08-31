cask "setups" do
  version "0.1.0"

  on_arm do
    sha256 "cc26dd4b926e6b10252e0dd402b8a29295dd3a89719211a605fbfdd51f974926"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/setups-v#{version}/Setups_#{version}_aarch64.app.tar.gz"
  end

  name "Setups"
  desc "Your machine as a portable, versioned setup — backup, apply, and manage apps declaratively"
  homepage "https://setups.meta-thinking.net"

  app "Setups.app"

  zap trash: [
    "~/Library/Application Support/net.meta-thinking.setups",
    "~/.setups",
  ]

  caveats <<~EOS
    Setups is ad-hoc signed (not yet notarized by Apple), so the FIRST launch
    needs a one-time approval:

      EASIEST — skip the quarantine flag at install time:
        brew reinstall --cask --no-quarantine setups

      OR after a normal install:
        macOS 15 (Sequoia)+: open the app once (it will be blocked), then
          System Settings -> Privacy & Security -> "Open Anyway", or run:
        xattr -dr com.apple.quarantine "/Applications/Setups.app"

    The companion CLI: brew install meta-thinking/tap/setups-cli
    Your machine's setup history lives in ~/.setups — versioned, revertible.
  EOS
end
