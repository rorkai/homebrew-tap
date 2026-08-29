# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.11.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.11.0/asc_4.11.0_macOS_arm64'
      sha256 'b928a12dec6be975271a2d374ba811717447a211089c6c89d3318d32c61c8202'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.11.0/asc_4.11.0_macOS_amd64'
      sha256 '276b0ca833041294983fa2506e428b2a5ad29915a141b709251ea90e4a4ef3b4'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.11.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.11.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
