# typed: false
# frozen_string_literal: true

class Scout < Formula
  desc "terminal-native dual-pane file explorer"
  homepage "https://github.com/mirageglobe/scout"
  version "0.8.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/mirageglobe/scout/releases/download/v0.8.0/scout_0.8.0_darwin_amd64.tar.gz"
      sha256 "d25db46fa8123b483bf4df7f3fdb4a246459e5c99383fb73d28acc981f33867c"

      def install
        bin.install "scout"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/mirageglobe/scout/releases/download/v0.8.0/scout_0.8.0_darwin_arm64.tar.gz"
      sha256 "aec59b8d0d18be569c904721899984c361f9b5e1127dc6b1db78c8a24697e041"

      def install
        bin.install "scout"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/mirageglobe/scout/releases/download/v0.8.0/scout_0.8.0_linux_amd64.tar.gz"
      sha256 "4a8e2dc536907c9d4f2652c63abaa55bc368277d52bb2f0465bfb467ec52afdf"

      def install
        bin.install "scout"
      end
    end
  end

  test do
    system "#{bin}/scout", "--version"
  end
end
