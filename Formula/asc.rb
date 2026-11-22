# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.1.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.1.0/asc_7.1.0_macOS_arm64'
      sha256 '83c27460e5f7924ebc8fedbb3448582ee698f3ac0f7c04b3836d3b3035f43bba'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.1.0/asc_7.1.0_macOS_amd64'
      sha256 '0e67e36a016988bd0d8b6b992c825314d45f135a7744e92fd9119a7f332d63f8'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.1.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.1.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
