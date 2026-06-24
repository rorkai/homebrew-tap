# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.3.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.3.0/asc_2.3.0_macOS_arm64'
      sha256 'f88d6e776b49e1e1f53507398c97b3e9bcff15cd1fe58ca30af3c318edd5d43a'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.3.0/asc_2.3.0_macOS_amd64'
      sha256 '7d767fc3e524b0bbfd8d5bac83134a73e077774fdf4eb14e9bf39e6ff7a2a88f'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.3.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.3.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
