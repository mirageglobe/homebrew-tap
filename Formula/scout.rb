# typed: false
# frozen_string_literal: true

class Scout < Formula
  desc "terminal-native dual-pane file explorer"
  homepage "https://github.com/mirageglobe/scout"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mirageglobe/scout/releases/download/v0.7.0/scout_0.7.0_darwin_amd64.tar.gz"
      sha256 "bc999974d18b9908930e727f0ebb359729bae6c33f4ce69c9603704e9193de21"

      def install
        bin.install "scout"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/mirageglobe/scout/releases/download/v0.7.0/scout_0.7.0_darwin_arm64.tar.gz"
      sha256 "236cfa8f56ac572c2ff9c6652d4a9d6afb176f2453b2830adac39d29583e2450"

      def install
        bin.install "scout"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mirageglobe/scout/releases/download/v0.7.0/scout_0.7.0_linux_amd64.tar.gz"
      sha256 "8a9a47477e8ab718bee57d33adcd5f667732cf43eaa38525d4417260b9b25e5e"

      def install
        bin.install "scout"
      end
    end
  end

  test do
    system "#{bin}/scout", "--version"
  end
end
