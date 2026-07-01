# © 2026 HostAtlas Technologies LLC. All rights reserved.
# hello@hostatlas.app
#
# Install: brew tap hostatlas-app/hostatlas && brew install cli
# Or:      brew install hostatlas-app/hostatlas/cli

class Cli < Formula
  desc "HostAtlas CLI — manage your infrastructure from the terminal"
  homepage "https://hostatlas.app"
  version "1.6.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-arm64"
      sha256 "1a5030e147451fcddb60da543269b205aa04be998d879db5af4b30c22fc3458d"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-amd64"
      sha256 "a8cc27335ca7e165a17dca5fa877d308a02b09e8831acb16ac560ace9f9ebf93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-arm64"
      sha256 "42f7fde696b0f846ce84dd51d0b29487958a17e8d96a4f4203f6b7a898884496"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-amd64"
      sha256 "97027681d896823c0f7cc0041ddf90a3eac125caf0266c7c775f6f1f6d38e06c"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "hostatlas"
  end

  test do
    assert_match "hostatlas", shell_output("#{bin}/hostatlas --version")
  end
end
