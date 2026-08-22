# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.8.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.8.0/asc_4.8.0_macOS_arm64'
      sha256 '1bda05cd83973fa44eff505d0b44b99dc9543ee6e268181cb78d874e4747653a'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.8.0/asc_4.8.0_macOS_amd64'
      sha256 '218bddde7b3d6bec8720a62f970e25f74a4a835e342058c494d59eb4e518cce7'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.8.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.8.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
