# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.10.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.10.0/asc_5.10.0_macOS_arm64'
      sha256 '65ec014b988fb9d2160cdbe60792a1470a7cba9572bccb240a0fcd81ae93ad1a'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.10.0/asc_5.10.0_macOS_amd64'
      sha256 '62eaf0c19ef45c4376ac84069201691e76cdcfc5de9be72040f1626c4adb5aa7'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.10.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.10.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
