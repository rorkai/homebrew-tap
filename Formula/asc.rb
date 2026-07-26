# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.1.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.1.2/asc_3.1.2_macOS_arm64'
      sha256 '7ceb1f660122cfe8d1e96aed65cdd86e3740c77f8181edd772c9e7176a5cda6a'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.1.2/asc_3.1.2_macOS_amd64'
      sha256 '2eef888f7e99067f4819d6739cbe14979952b0f88c828846ac4b7abb750fe3e5'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.1.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.1.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
