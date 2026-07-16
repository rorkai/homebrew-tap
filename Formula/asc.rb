# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.0.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.0.0/asc_3.0.0_macOS_arm64'
      sha256 'cb4f165f4a388fc79dac9fd4ad206c7b2899b0fc9166403934dfad83e4c9bd9d'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.0.0/asc_3.0.0_macOS_amd64'
      sha256 '1112eee3c6c8f6494fbc68ed845ece3c61c95a2b8a1ec06c7aa6295e00f8dbf5'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.0.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.0.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
