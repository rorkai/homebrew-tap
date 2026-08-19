# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.6.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.6.0/asc_4.6.0_macOS_arm64'
      sha256 '91c57dd01c5c7c10d3fcf894268ae8202ebf1b005aca3bde29637ec9eb7bd656'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.6.0/asc_4.6.0_macOS_amd64'
      sha256 '0eb9544221fa8615232415a89e3084483c12556bb86066cba304af80343cc905'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.6.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.6.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
