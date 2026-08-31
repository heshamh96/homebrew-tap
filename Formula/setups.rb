class Setups < Formula
  desc "Declarative package manager and setup versioning — the Setups CLI"
  homepage "https://setups.meta-thinking.net"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/meta-thinking/homebrew-tap/releases/download/setups-v#{version}/setups-cli-darwin-arm64.tar.gz"
      sha256 "7efe3f1e85841353a1478c3863e8dd0aaf3a736cd16c64aba92710045a1bb330"
    end
  end

  def install
    libexec.install "setups", "sync.config.json", "dataset.sqlite"
    bin.install_symlink libexec/"setups"
    generate_completions
  end

  def generate_completions
    (zsh_completion/"_setups").write Utils.safe_popen_read(libexec/"setups", "completions", "zsh")
    (bash_completion/"setups").write Utils.safe_popen_read(libexec/"setups", "completions", "bash")
  end

  def caveats
    <<~EOS
      Quick start:
        setups login                    # sign in (email code)
        setups brew install <app>       # install into your versioned setup
        setups ls --oneline             # your machine's setup history
        setups plan <id> / apply <id>   # preview and converge, atomically
      Backups need a Setups Disk attached: setups backup
      Tab completion is installed for zsh and bash automatically.
      The Setups desktop app (macOS) ships separately and can install
      this CLI itself — one product, one package.
    EOS
  end

  test do
    assert_match "setups", shell_output("#{bin}/setups 2>&1")
  end
end
