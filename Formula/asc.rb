# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.7.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.7.0/asc_2.7.0_macOS_arm64'
      sha256 '2bef90d4cfa2e81425582a349b401d99d0bb3d351f57eaf07302c4c05259a47f'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.7.0/asc_2.7.0_macOS_amd64'
      sha256 'b0aad2318620b3eb7bd07d934ef6f541915bf290cf32186ed4cb79c0b0479840'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.7.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.7.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
