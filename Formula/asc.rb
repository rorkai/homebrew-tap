# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.6.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.6.0/asc_1.6.0_macOS_arm64'
      sha256 'a26f83b5805c60c0fe00a140b7c288aa3b141adf54f8dfbbbe21c43680d52849'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.6.0/asc_1.6.0_macOS_amd64'
      sha256 'd62a607eb7a96139c4276ea6cd5e30d947004e9066befb990a49f296133dcd6d'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.6.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.6.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
