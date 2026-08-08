# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.6.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.6.1/asc_3.6.1_macOS_arm64'
      sha256 '2ff4ebc1fb45dbaf2b072ebf097a5b0d423abc7357eb70db3e53659ccc546160'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.6.1/asc_3.6.1_macOS_amd64'
      sha256 '6c3eec4c4b33d2482ed4fbb2796efa50cf6a5b3e0fe471a3eedd4d37d0456e87'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.6.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.6.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
