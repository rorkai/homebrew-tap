# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.6.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.6.0/asc_5.6.0_macOS_arm64'
      sha256 '2bdbdb54bfb13c61b6612e8530f1bce909c9fbb185359ee290657209b8e569b0'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.6.0/asc_5.6.0_macOS_amd64'
      sha256 '88e6a0e4db07e02179f1dc2995f4b22badcb3193943d0133513bb0e1f3a96fba'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.6.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.6.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
