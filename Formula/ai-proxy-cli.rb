class AiProxyCli < Formula
  desc "Headless AI-Proxy: your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"
  version "0.3.5"

  on_macos do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-arm64.tar.gz"
      sha256 "8bbb5d115fb5941a4fead48d2ac4c1a1c2c416665efc70c9ea48c433041ca121"
    end
    on_intel do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-amd64.tar.gz"
      sha256 "409ad01b41fe107233e90ca2ff6a6a483584c878f23f95bf884c4e760f7e8286"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-linux-arm64.tar.gz"
      sha256 "6b2da4f031135385cfe9671e45632f62dd982c927a18245b91d6b97f0c74088f"
    end
    on_intel do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-linux-amd64.tar.gz"
      sha256 "9935964a6c6d2f6c43d4a5be17c272f687480741b1b3ab25364702989d6014d9"
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
