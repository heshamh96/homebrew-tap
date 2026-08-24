cask "ai-proxy" do
  version "0.3.5"

  on_arm do
    sha256 "7800500fcdeb433e37cb4a4ed99d1270203196df9d00c95ae314f010e9aadeeb"
    url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/AI-Proxy_#{version}_aarch64.app.tar.gz"
  end
  on_intel do
    sha256 "a4390b66995af467ca2eed420f979bcbb32fc15e3d710eb91f0d15b32597b60a"
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

    From 0.3.5 image and video models work through your agents, and generated
    media is kept in ~/.ai-proxy/generated-content (emptied from the Server tab).

    Everything is free — sign in once to unlock one-click client configs.
    Plans: https://aiproxy.meta-thinking.net/pricing
    Docs: https://aiproxy.meta-thinking.net/docs
  EOS
end
