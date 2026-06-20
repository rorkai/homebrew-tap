# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.2.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.2.0/asc_2.2.0_macOS_arm64'
      sha256 '1e524218b0cc4275532bce01c00b9aa95b2e3f255d434163c2b4ae82ccf59166'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.2.0/asc_2.2.0_macOS_amd64'
      sha256 '5bff260499214b359e2881f1e65cb665f89ef5f79bf8fafb3fb8a2d3effb2adf'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.2.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.2.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
