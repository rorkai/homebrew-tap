# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.8.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.8.1/asc_2.8.1_macOS_arm64'
      sha256 '6eff74fe0e809450dd42134d6eab2ab400c1d119e1d8cb0a9c841ff95afa8559'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.8.1/asc_2.8.1_macOS_amd64'
      sha256 'ef655bb21083692d106e0aeb4b1c590fc964ecaf201989f54109d20ce23d3a67'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.8.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.8.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end
