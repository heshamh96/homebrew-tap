cask "ai-proxy" do
  version "0.3.3"

  on_arm do
    sha256 "dd4e69b3ddc7f7dac5ae6dc62574b4d73a56213943d5f6bbe060f5e03119a7ca"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_aarch64.app.tar.gz"
  end
  on_intel do
    sha256 "6d8e99288d023b2fe45affaa6d4b38dcac725e104ff1e8ba637c504e306248fd"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_x64.app.tar.gz"
  end

  name "AI-Proxy"
  desc "The automations gateway — your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"

  app "AI-Proxy.app"

  zap trash: [
    "~/Library/Application Support/AI-Proxy",
    "~/Library/Application Support/com.metathinking.ai-proxy.desktop",
  ]

  caveats <<~EOS
    AI-Proxy is ad-hoc signed (not yet notarized by Apple), so the FIRST launch
    needs a one-time approval:

      EASIEST — skip the quarantine flag at install time:
        brew reinstall --cask --no-quarantine ai-proxy

      OR after a normal install:
        macOS 15 (Sequoia)+: open the app once (it will be blocked), then
          System Settings -> Privacy & Security -> "Open Anyway", or run:
        xattr -dr com.apple.quarantine "/Applications/AI-Proxy.app"

    From 0.3.2 the app checks for updates and can install them in one click.

    Everything is free — sign in once to unlock one-click client configs.
    Plans: https://aiproxy.meta-thinking.net/pricing
    Docs: https://aiproxy.meta-thinking.net/docs
  EOS
end
