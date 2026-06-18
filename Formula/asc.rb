# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.1.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.1.1/asc_2.1.1_macOS_arm64'
      sha256 '26dc4579e11d9058e744097b95c5c8b3539b5c72c1946412732e035a4f6eb417'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.1.1/asc_2.1.1_macOS_amd64'
      sha256 '4a5b2bde39571444a61b5e57e6724e73a76cee8c0e5cd5ee99708772fb54a443'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.1.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.1.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
