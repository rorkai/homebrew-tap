# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.2.4'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.4/asc_1.2.4_macOS_arm64'
      sha256 '49235b3b0cfe8323cc17cd2a0b306585a34369d1e2e348b17292f4fc8b43ad8c'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.4/asc_1.2.4_macOS_amd64'
      sha256 'ff84de3f70d1b71ed7ea5052e1b0ad0b428120b90b27ae3ef005928fbdeb9c39'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.2.4_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.2.4_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
