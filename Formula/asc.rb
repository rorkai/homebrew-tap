# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.9.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.9.1/asc_5.9.1_macOS_arm64'
      sha256 '98ccbcc0533e071377019e1490cd02a81ec676ee5de389c3a5ffb469fa9819d6'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.9.1/asc_5.9.1_macOS_amd64'
      sha256 '25633f0e73fb3f8fd90010589bfb32be23bd6c5c06c8279f47db6281f04e0fed'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.9.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.9.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
