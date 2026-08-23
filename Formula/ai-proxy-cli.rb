class AiProxyCli < Formula
  desc "Headless AI-Proxy: your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-arm64.tar.gz"
      sha256 "378cd012f592bb9d92a5162bff9d9ccc8d9c95fae07233c9c01d33232e467162"
    end
    on_intel do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-amd64.tar.gz"
      sha256 "8407c73e17678355594ed4ce1bbaeea15f672749e4eaee1109e770fd88d2e689"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-linux-arm64.tar.gz"
      sha256 "84bbfc218ed5b08513ed6c74e300ea52173c5b39f27af074e62ddde3bc46c816"
    end
    on_intel do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-linux-amd64.tar.gz"
      sha256 "95aab6a6d85d03c6de22a977c24727765308e85ead0c64069946f334da285636"
    end
  end

  def install
    libexec.install "ai-proxy-server", "aiproxy-adapter", "ai-proxy"
    bin.install_symlink libexec/"ai-proxy"
  end

  def caveats
    <<~EOS
      Quick start:
        ai-proxy login gemini     # free Gemini via OAuth
        ai-proxy start            # gateway on :8317
        ai-proxy service-install  # macOS: auto-start + auto-restart (launchd)
      Health probe (no key, no tokens): curl -s http://localhost:8317/health
      Everything is free — sign in at aiproxy.meta-thinking.net for client quick-configs.
        export AIPROXY_LICENSE_KEY=ap_sk_...   # links this machine to your account
      Docs: https://aiproxy.meta-thinking.net/docs
    EOS
  end

  test do
    assert_match "stopped", shell_output("#{bin}/ai-proxy status")
  end
end
