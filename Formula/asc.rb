# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.6.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.6.0/asc_6.6.0_macOS_arm64'
      sha256 '75a03fa72b1af9ccc07620e75e67a3b5fb23924be5ef03d6d57705b7f1f2121b'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.6.0/asc_6.6.0_macOS_amd64'
      sha256 '88d7946f2d861d228c2982af0e2ffedd45521e5dee3bc831b8fb081fb95f87b5'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.6.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.6.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
