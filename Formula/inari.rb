# typed: false
# frozen_string_literal: true

class Inari < Formula
  desc "security-first local AI orchestrator and terminal UI"
  homepage "https://github.com/mirageglobe/inari"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mirageglobe/inari/releases/download/v0.3.0/inari_0.3.0_darwin_amd64.tar.gz"
      sha256 "dcbe6e05feade682436c53605b15025647c50f12c768a3d245995bfbf312f8bc"

      def install
        bin.install "inari"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/mirageglobe/inari/releases/download/v0.3.0/inari_0.3.0_darwin_arm64.tar.gz"
      sha256 "e1fcf784ef4dd673d01da4568a3c242248f94604a80e09b5670066d6f0bbefb2"

      def install
        bin.install "inari"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mirageglobe/inari/releases/download/v0.3.0/inari_0.3.0_linux_amd64.tar.gz"
      sha256 "27545d8deae5fcfa18d61d832fb82369c87906caeafde84ea267a6836d83a96a"

      def install
        bin.install "inari"
      end
    end
  end

  test do
    system "#{bin}/inari", "version"
  end
end
