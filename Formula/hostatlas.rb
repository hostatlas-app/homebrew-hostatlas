# © Akyros Labs LLC. All rights reserved.
# hello@akyroslabs.com
#
# Install: brew tap akyroslabs/hostatlas && brew install hostatlas
# Or:      brew install akyroslabs/hostatlas/hostatlas

class Hostatlas < Formula
  desc "Infrastructure monitoring CLI for HostAtlas"
  homepage "https://hostatlas.app"
  version "1.2.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-arm64"
      sha256 "" # Updated by CI on release
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-amd64"
      sha256 "" # Updated by CI on release
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-arm64"
      sha256 "" # Updated by CI on release
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-amd64"
      sha256 "" # Updated by CI on release
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
