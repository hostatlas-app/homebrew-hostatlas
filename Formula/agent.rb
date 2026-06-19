# © 2026 HostAtlas Technologies LLC. Apache-2.0 licensed.
# hello@hostatlas.app
#
# Install: brew tap hostatlas-app/hostatlas && brew install agent
# Or:      brew install hostatlas-app/hostatlas/agent
#
# After install, enroll with the server key from the Add Server page:
#   sudo hostatlas-agent enrol --key=HOSTATLAS_SERVER_KEY
#
# Linux-only — the agent is server-side software. macOS users typically
# install the HostAtlas CLI (`brew install hostatlas-app/hostatlas/cli`)
# instead and connect to remote hosts.

class Agent < Formula
  desc "HostAtlas agent — on-host telemetry, auto-recovery, SSH gating"
  homepage "https://hostatlas.app"
  version "1.0.78"
  license "Apache-2.0"

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://install.hostatlas.app/agent/v#{version}/hostatlas-agent-linux-arm64"
      sha256 "8a167a7018fccdb6385dff7837149050cc9bdb44c138c1d85e2e0734895190a8"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://install.hostatlas.app/agent/v#{version}/hostatlas-agent-linux-amd64"
      sha256 "6006d218ba4aa23649604147e72a579704a3e2655f3fe80e4fbaebed0242241a"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "hostatlas-agent"
  end

  test do
    assert_match "hostatlas-agent", shell_output("#{bin}/hostatlas-agent --version")
  end

  def caveats
    <<~EOS
      After installation, enroll the agent with a server key from the
      "Add Server" page in your HostAtlas console:

        sudo hostatlas-agent enrol --key=HOSTATLAS_SERVER_KEY

      The agent runs as a systemd service. On a non-systemd host, start
      it manually with `hostatlas-agent run`.
    EOS
  end
end
