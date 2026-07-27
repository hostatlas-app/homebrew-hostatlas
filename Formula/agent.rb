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
  version "1.0.80"
  license "Apache-2.0"

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://install.hostatlas.app/agent/v#{version}/hostatlas-agent-linux-arm64"
      sha256 "a3199c69d37eebc6340c6a6d054aa9f34fa9ce59eba137c1df83202c2174179d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://install.hostatlas.app/agent/v#{version}/hostatlas-agent-linux-amd64"
      sha256 "f2482992d0f68969ea97ac56df94f27b43e9784b813eed80c011494f67377de0"
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
