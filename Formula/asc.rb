# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.9.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.9.2/asc_5.9.2_macOS_arm64'
      sha256 '6d5064e6ce1bb0c3e3afe35df9b9d69c303bd30bf590bc9148f5d98dc846ab60'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.9.2/asc_5.9.2_macOS_amd64'
      sha256 '635b9156014defd11e9662adcf83ea2596c8030095977decb90b0e6adc8fdf37'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.9.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.9.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
