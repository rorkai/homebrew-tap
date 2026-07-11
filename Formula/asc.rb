# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.8.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.8.1/asc_2.8.1_macOS_arm64'
      sha256 '9b315c118ccb74c9eb8d13fd34968cdacf7d54448ce370aedad09ddfee739e3c'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.8.1/asc_2.8.1_macOS_amd64'
      sha256 'bf526e4d9d60f9f74fc035f34dd9659426d79942eaab964b0ac6f72e30bb5a18'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.8.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.8.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
