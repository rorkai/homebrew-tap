# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.2.6'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.6/asc_1.2.6_macOS_arm64'
      sha256 '7a2b7dd176662d7bd6e767db108aed7ed3d31ceb7b4cfd2dbd4962f0b0b82950'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.6/asc_1.2.6_macOS_amd64'
      sha256 '975b08e1d3863a4668c1c5fb5d97c26d82ec858315e1857cf22dfbe2ea3a371e'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.2.6_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.2.6_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
