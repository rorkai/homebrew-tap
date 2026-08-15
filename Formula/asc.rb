# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.4.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.1/asc_4.4.1_macOS_arm64'
      sha256 'b17d02ffe17586636e43aae0c93d4c93106f01795159fed6d4365c32bd03424c'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.1/asc_4.4.1_macOS_amd64'
      sha256 'cbbd43162187dd2215b132fc638b1d1eda344ba57d2e0700ea4bad1a40a3de9e'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.4.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.4.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
