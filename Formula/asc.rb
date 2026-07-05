# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.5.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.5.1/asc_2.5.1_macOS_arm64'
      sha256 '0c9bcb7331de26accc2ac2eaacb52ba0a30dc661c139768951252e6d0762c47b'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.5.1/asc_2.5.1_macOS_amd64'
      sha256 '7d4133b6c83215d2293171781b8524a6e5a30f59d5f0c6c0d44b9b016a78e357'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.5.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.5.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
