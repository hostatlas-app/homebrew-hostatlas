# © 2026 HostAtlas Technologies LLC. All rights reserved.
# hello@hostatlas.app
#
# Install: brew tap hostatlas-app/hostatlas && brew install cli
# Or:      brew install hostatlas-app/hostatlas/cli

class Cli < Formula
  desc "HostAtlas CLI — manage your infrastructure from the terminal"
  homepage "https://hostatlas.app"
  version "1.6.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-arm64"
      sha256 "7d981f7106312e508c7abaaf0cc8c1a283659cf0205225dec48b707527cad2ea"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-darwin-amd64"
      sha256 "eb714580e7fce62a6f0f48a6d27be884f5bff5b99b635b65360c80e9e42014a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-arm64"
      sha256 "7d7958c426548ad7b7342e4fd6f75da8f263da826267aa50279e6fc559bb4435"
    else
      url "https://install.hostatlas.app/cli/v#{version}/hostatlas-linux-amd64"
      sha256 "26f1818aa9ace5ae1a8fe7f0bf02fe292357586330720575052b363acfc3cbf7"
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
