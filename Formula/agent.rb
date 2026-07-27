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
  version "1.0.84"
  license "Apache-2.0"

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://install.hostatlas.app/agent/v#{version}/hostatlas-agent-linux-arm64"
      sha256 "041a70017447cc429077f93d957147008210ee903738993a924d9ccfaa5d1d4d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://install.hostatlas.app/agent/v#{version}/hostatlas-agent-linux-amd64"
      sha256 "53e3665dfa6f3c06640569bdc72931f6c2f6bc9dc59d4a0dbb6590fab05b494b"
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
