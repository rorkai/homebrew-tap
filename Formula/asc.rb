# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.5.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.0/asc_1.5.0_macOS_arm64'
      sha256 '0e6057dee2eb021b03d693198075ce5773d42817f12570c3701e17f2c2243ac5'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.0/asc_1.5.0_macOS_amd64'
      sha256 '06d191b136106475b56e24520c4d066de1a2c5db1d35d9ab2c8bbb3be1b8b0b7'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.5.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.5.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
