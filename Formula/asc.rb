# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.12.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.12.0/asc_5.12.0_macOS_arm64'
      sha256 '7ed0f62461a7f351e95358839823a732f5f8d846a7758c303756200ea23553fb'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.12.0/asc_5.12.0_macOS_amd64'
      sha256 '7d7178a670411abbe2d03c3a8dad9c3fc8f09b76d46d5b8b5d0996ec4186f85a'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.12.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.12.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
