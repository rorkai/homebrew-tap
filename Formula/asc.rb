# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.4.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.4.0/asc_3.4.0_macOS_arm64'
      sha256 'ff6594109f8c86c7aa7230b85ef0001fefa3c0a53dfd11b0dbd316cd6499b3da'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.4.0/asc_3.4.0_macOS_amd64'
      sha256 '498bf2abd238249f26b3bca405d0041f6d34b3bed08143c7d321c5ffb86b48a1'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.4.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.4.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
