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
  version "1.0.82"
  license "Apache-2.0"

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://install.hostatlas.app/agent/v#{version}/hostatlas-agent-linux-arm64"
      sha256 "c8a2c4f7c7f39484cc9105f5e9f73c8a0860d4296b9a8597aeedd558d2785a4f"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://install.hostatlas.app/agent/v#{version}/hostatlas-agent-linux-amd64"
      sha256 "fc00ae4af0fb0eee5c48db283e1d9c4b5551b1f643d394ba05dda4f00f209db1"
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
