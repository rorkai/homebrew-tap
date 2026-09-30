# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.8.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.8.1/asc_5.8.1_macOS_arm64'
      sha256 'ba5a26976bf7da4f0b7f175186274ec6c5d4885378cb2f8690a033f6c390008f'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.8.1/asc_5.8.1_macOS_amd64'
      sha256 'b9b52fc964242d762fe9874c28391c126513ace038e5e803f848da1f0256d303'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.8.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.8.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
