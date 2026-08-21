class AiProxyCli < Formula
  desc "Headless AI-Proxy: your AI subscriptions as one OpenAI-compatible endpoint"
  homepage "https://aiproxy.meta-thinking.net"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-arm64.tar.gz"
      sha256 "a7d337cfd5a45729f24d0cc7641836fb843f3e87c296324693686b4c98d71387"
    end
    on_intel do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-darwin-amd64.tar.gz"
      sha256 "8ccf1a650b08462e5d74bc7d6ef8be690dca319155d3ab8975b1e5c59bcf7adc"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-linux-arm64.tar.gz"
      sha256 "16215a552e96eda56f00ccec7400eff4a0fd3a5c87562257cf9285f224f6c982"
    end
    on_intel do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/desktop-v#{version}/ai-proxy-cli-linux-amd64.tar.gz"
      sha256 "6d6087aa4e62f723183c0e95adafe31fe39455a844ee11d6e8148b0789125b5f"
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
