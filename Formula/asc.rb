# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.4.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.4.0/asc_2.4.0_macOS_arm64'
      sha256 '39319b81d8cb2c7dfae39ac9c00aa50795c9f062b9d101aa67c5cb1e1d0422ff'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.4.0/asc_2.4.0_macOS_amd64'
      sha256 '42a8167bd2e92f7cf366db3e0ebd0b4a723fc29b315a8e4ac7bac342137c1580'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.4.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.4.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
