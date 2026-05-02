# typed: false
# frozen_string_literal: true

class Scout < Formula
  desc "terminal-native dual-pane file explorer"
  homepage "https://github.com/mirageglobe/scout"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mirageglobe/scout/releases/download/v0.6.0/scout-darwin-amd64"
      sha256 "707373f8bf8a38154967562c30f1558264e07ecbb65086bf4d5b924f0b545275"

      def install
        bin.install "scout-darwin-amd64" => "scout"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/mirageglobe/scout/releases/download/v0.6.0/scout-darwin-arm64"
      sha256 "637ac113bbb700553e9893d2fd364d64f7726620c89b41358f75e0f8342ec644"

      def install
        bin.install "scout-darwin-arm64" => "scout"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mirageglobe/scout/releases/download/v0.6.0/scout-linux-amd64"
      sha256 "53be44c3873fdc3431ce43634b9b09e5dac4d9eb2ea5290b57b05abfb0302bfb"

      def install
        bin.install "scout-linux-amd64" => "scout"
      end
    end
  end

  test do
    system "#{bin}/scout", "--version"
  end
end
