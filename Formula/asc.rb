# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.8.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.8.2/asc_2.8.2_macOS_arm64'
      sha256 '25be68cc474b02c70e04266b5324806bb7bb7d170f6d81a3f85fddddd7a178d1'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.8.2/asc_2.8.2_macOS_amd64'
      sha256 'e6dc359ce576d722a5fd680f644fcdf421c14e6dc7b3bf65f2fdfd3cbf6c10d4'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.8.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.8.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
