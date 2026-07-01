# © 2026 HostAtlas Technologies LLC. All rights reserved.
# hello@hostatlas.app
#
# Install: brew tap hostatlas-app/hostatlas && brew install cli
# Or:      brew install hostatlas-app/hostatlas/cli

class Cli < Formula
  desc "HostAtlas CLI — manage your infrastructure from the terminal"
  homepage "https://hostatlas.app"
  version "1.6.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-arm64"
      sha256 "6a2024cc1908a76dceeaba478a5090c6616507b474549bcf1efb99a6bd4d1a5f"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-amd64"
      sha256 "501ae1f4fda320190933f74b57a987323222a7e49419cc974ad94cae23d7a5fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-arm64"
      sha256 "20b05dd8ac5557be6849e6b220f0d601bf217d4c683f9e372c4729ef36484a52"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-amd64"
      sha256 "f1a2c26f524a9e8d7bb606485c839eead6180bee54e7c739f59aa7fb5f5923d7"
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
