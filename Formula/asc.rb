# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.5.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.5.1/asc_3.5.1_macOS_arm64'
      sha256 'b79a70776d446c332e1e0b15f54379e64b65c84acd00cdecbc201e5ae971811d'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.5.1/asc_3.5.1_macOS_amd64'
      sha256 'e2de6d3c206f23de116519bc6fe702fe10d2c1d6130a324d822b33ae17e87e73'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.5.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.5.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
