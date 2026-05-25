# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.5.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.2/asc_1.5.2_macOS_arm64'
      sha256 '69c2f8a5c3043c53005d56015e0e9c79939c8199f445ba8ed536ec7aa578f6a7'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.5.2/asc_1.5.2_macOS_amd64'
      sha256 'e82a0cd6c71298c18536a0fde1e29e52765ef7413ab6145105a66dc30768ecd2'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.5.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.5.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
