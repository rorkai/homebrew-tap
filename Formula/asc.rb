# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.2.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.2.0/asc_5.2.0_macOS_arm64'
      sha256 '76c214f76184c8beff12602090e7d052c46e53d9fe122bce3e10f612e9942aa5'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.2.0/asc_5.2.0_macOS_amd64'
      sha256 '5d7676ef4f4d2efe2a0de3963164771a00ceebcd84cfb6630020378beca89561'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.2.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.2.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
