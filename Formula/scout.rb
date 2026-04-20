class Scout < Formula
  desc "terminal-native dual-pane file explorer"
  homepage "https://github.com/mirageglobe/scout"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mirageglobe/scout/releases/download/v#{version}/scout_#{version}_darwin_arm64.tar.gz"
      sha256 "TODO"
    end
    on_intel do
      url "https://github.com/mirageglobe/scout/releases/download/v#{version}/scout_#{version}_darwin_amd64.tar.gz"
      sha256 "TODO"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mirageglobe/scout/releases/download/v#{version}/scout_#{version}_linux_amd64.tar.gz"
      sha256 "TODO"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scout --version 2>&1", 1)
  end
end
