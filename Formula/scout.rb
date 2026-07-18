# typed: false
# frozen_string_literal: true

class Scout < Formula
  desc "terminal-native dual-pane file explorer"
  homepage "https://github.com/mirageglobe/scout"
  version "0.9.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mirageglobe/scout/releases/download/v0.9.0/scout_0.9.0_darwin_amd64.tar.gz"
      sha256 "0fb4c193ca661ba3878be2f9577759459e66faa1094062aa4da63b39c224f03f"

      def install
        bin.install "scout"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/mirageglobe/scout/releases/download/v0.9.0/scout_0.9.0_darwin_arm64.tar.gz"
      sha256 "8db5731ea7febcd1e6d519a5d98f7b72ef9869fd7eff881140b6e1842f2d37e2"

      def install
        bin.install "scout"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mirageglobe/scout/releases/download/v0.9.0/scout_0.9.0_linux_amd64.tar.gz"
      sha256 "0e7be57991d26df2d619d6ea20764acfd7fb4627955fad35be1b613afaec7b83"

      def install
        bin.install "scout"
      end
    end
  end

  test do
    system "#{bin}/scout", "--version"
  end
end
