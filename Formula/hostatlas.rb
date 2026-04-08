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
      sha256 "2564bbdfb4b79df9b77dfb994e06097f6ec1b4885b99a4d213d9e34ce15b67f8"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-amd64"
      sha256 "82945a74ed79351237cb2086e13578b478dc3dcb7d5ca5d0fcdc2fc662fc14c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-arm64"
      sha256 "2655abb8fdfa3de758d3ce26cb37ab914e77e033eecf9f4adc835b8e413e8f2e"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-amd64"
      sha256 "d2df8caca8e3feb746c658043a4fc06543ab6c1988a7380655bb06ab2d84f825"
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
