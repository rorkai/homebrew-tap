# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.14.3'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.14.3/asc_5.14.3_macOS_arm64'
      sha256 '8445a2110c4472e926bac69cf90ebcec91a28e4eb142b6d2c81fc4addb16aaae'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.14.3/asc_5.14.3_macOS_amd64'
      sha256 '82d5ce6c0ad63a9eacf56d618a4d3a0f9d6a10ae684a5b58cc2b89760f22311c'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.14.3_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.14.3_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
