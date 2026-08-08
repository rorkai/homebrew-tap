# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.6.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.6.0/asc_3.6.0_macOS_arm64'
      sha256 '87888711c4754bc4568fe0a661cb6343214ac248df11d76309dd1427e61c46a5'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.6.0/asc_3.6.0_macOS_amd64'
      sha256 'a4dffa6272a1e13dbf1821a2ab6fc39d8fb4e568bbc48fd4917c5cd84e5f5b3b'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.6.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.6.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
