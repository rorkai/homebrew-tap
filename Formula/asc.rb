# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.0.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.0.0/asc_4.0.0_macOS_arm64'
      sha256 '1277a7556786316c8a837646b5901305b5e222a4f76b7f827708bb7b8870c774'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.0.0/asc_4.0.0_macOS_amd64'
      sha256 '3f6df789764d5e9012ed2235128e73a8f87f1f6d512a89a5332c826778d2b95f'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.0.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.0.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
