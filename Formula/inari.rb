# typed: false
# frozen_string_literal: true

class Inari < Formula
  desc "security-first local AI orchestrator and terminal UI"
  homepage "https://github.com/mirageglobe/ai-inari"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mirageglobe/ai-inari/releases/download/v0.2.0/inari_0.2.0_darwin_amd64.tar.gz"
      sha256 "54825c18d66626e005a8a5e93efc663578729dc2e81ed3bdab40802a8d076f0b"

      def install
        bin.install "inari"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/mirageglobe/ai-inari/releases/download/v0.2.0/inari_0.2.0_darwin_arm64.tar.gz"
      sha256 "b80881e40ea8ebdf31b1702632df131c9418c796f69fa0cb35c064b493aed628"

      def install
        bin.install "inari"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mirageglobe/ai-inari/releases/download/v0.2.0/inari_0.2.0_linux_amd64.tar.gz"
      sha256 "e055f166d9e300df569625530a32553686968f0d62e3db282c3f339ee8d64539"

      def install
        bin.install "inari"
      end
    end
  end

  test do
    system "#{bin}/inari", "version"
  end
end
