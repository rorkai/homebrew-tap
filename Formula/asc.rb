# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.7.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.7.0/asc_2.7.0_macOS_arm64'
      sha256 '3fb48be2a75cae1cb972ce07919ce1cebcb7197d589500fa74f74b807bcf002f'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.7.0/asc_2.7.0_macOS_amd64'
      sha256 '274f15e7fcbdcc938a0320186b042d4cc671a7556596b3d29bc6485f19af6ed1'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.7.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.7.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
