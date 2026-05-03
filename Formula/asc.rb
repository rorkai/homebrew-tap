# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.2.8'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.8/asc_1.2.8_macOS_arm64'
      sha256 'e4e78cee52a1ee6bed8e83697a000de65be2c3f0bcb5fedae07443a03c08814a'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.8/asc_1.2.8_macOS_amd64'
      sha256 'dc1d80022bec87c6f904160c9787093a2f50f9d48be875ad7c1b8916e9ee73b3'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.2.8_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.2.8_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
