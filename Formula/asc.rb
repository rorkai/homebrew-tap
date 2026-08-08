# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.6.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.6.0/asc_3.6.0_macOS_arm64'
      sha256 'abad1e40c5b2c3d92241399e201f5c2e0cae8a8cc3503aa894c0418f64c3f904'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.6.0/asc_3.6.0_macOS_amd64'
      sha256 '2b5a1b2d4e0767e9dcad762d3978e5c682c702d7bafd20cf92a3522a848687fc'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.6.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.6.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
