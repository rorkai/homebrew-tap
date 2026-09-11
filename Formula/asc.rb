# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.2.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.2.1/asc_5.2.1_macOS_arm64'
      sha256 'c407df3a2505637a869cbd0833d68311696aa260e1771c0ff770971f4267ec7f'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.2.1/asc_5.2.1_macOS_amd64'
      sha256 'f049eed9ed86c60fe6291102c2e02f43dbfc01aea8fcf00b490932c50d3cadc2'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.2.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.2.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
