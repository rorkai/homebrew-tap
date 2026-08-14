# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.3.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.3.0/asc_4.3.0_macOS_arm64'
      sha256 'bd78419787debbd37ace60a0c1cf791e27145a113c5d2d07d23f752816a05e95'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.3.0/asc_4.3.0_macOS_amd64'
      sha256 'c850753334ad5080996807d52e24756bce35c914c61865e1df1991fe94ffb52a'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.3.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.3.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
