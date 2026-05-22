# © 2026 HostAtlas Technologies LLC. All rights reserved.
# hello@hostatlas.app
#
# Install: brew tap hostatlas-app/hostatlas && brew install cli
# Or:      brew install hostatlas-app/hostatlas/cli

class Cli < Formula
  desc "HostAtlas CLI — manage your infrastructure from the terminal"
  homepage "https://hostatlas.app"
  version "1.5.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-arm64"
      sha256 "7e29e46872ebe7b606b51513894e1aebfd44a461c27c250cb4a354c7ad4b0a83"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-amd64"
      sha256 "abcb93cb67cc007f28583ef6936cd14c7a1caa280429bc979319f54de0c52f94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-arm64"
      sha256 "f7e16ff77ba0a0884dcaebc6a066bcd1a32e680dd0e9d7e5ae03d630b97c107e"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-amd64"
      sha256 "4034407e3d668f0cfee51558e40a5bbc5dcf9a9273b576c0c29b923f67e86ed8"
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
